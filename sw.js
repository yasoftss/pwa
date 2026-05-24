const CACHE_NAME = 'sisep-campo-v1';
const urlsToCache = [
  '/',                      // tu HTML principal
  '/sisep.html',            // mismo archivo
  '/manifest.json',
  '/sw.js',
  // Fuentes de Google (CDN)
  'https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Source+Sans+3:wght@400;600&display=swap'
];

// Instalación: guarda los recursos estáticos
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => cache.addAll(urlsToCache))
  );
  self.skipWaiting();
});

// Activación: limpia versiones antiguas
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys => {
      return Promise.all(
        keys.filter(key => key !== CACHE_NAME).map(key => caches.delete(key))
      );
    })
  );
  self.clients.claim();
});

// Estrategia: Cache First con fallback a red y offline
self.addEventListener('fetch', event => {
  const request = event.request;
  const url = new URL(request.url);

  // Evita cachear peticiones a APIs externas no necesarias (si usas alguna)
  if (url.pathname.startsWith('/api/')) {
    event.respondWith(fetch(request));
    return;
  }

  // Para recursos externos a Google Fonts, también cacheamos
  if (url.origin === 'https://fonts.googleapis.com' || url.origin === 'https://fonts.gstatic.com') {
    event.respondWith(
      caches.open(CACHE_NAME).then(cache => {
        return cache.match(request).then(response => {
          return response || fetch(request).then(fetchRes => {
            cache.put(request, fetchRes.clone());
            return fetchRes;
          });
        });
      })
    );
    return;
  }

  // Para el resto: Cache First
  event.respondWith(
    caches.match(request).then(response => {
      if (response) return response;
      return fetch(request).then(fetchRes => {
        if (!fetchRes || fetchRes.status !== 200) return fetchRes;
        // Clona y guarda en cache
        const responseToCache = fetchRes.clone();
        caches.open(CACHE_NAME).then(cache => {
          cache.put(request, responseToCache);
        });
        return fetchRes;
      });
    }).catch(() => {
      // Fallback para cuando no hay red ni cache
      return caches.match('/index.html');
    })
  );
});