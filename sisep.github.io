<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="theme-color" content="#0a1628">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="SISEP Campo">
<title>SISEP Campo</title>
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=Source+Sans+3:wght@400;600&display=swap" rel="stylesheet">
<style>
:root{
  --nv:#0a1628;--nv2:#0f1f3d;--nv3:#162447;
  --ac:#1a9fd4;--ac2:#0d7aad;
  --rd:#d63031;--gn:#00b894;--am:#f39c12;
  --tx:#e8edf5;--tx2:#8fa3c0;--tx3:#5a7299;
  --br:#1e3054;--br2:#243b5e;
  --cd:#111e36;--cd2:#152040;
  --r:12px;--rs:8px;
}
*{margin:0;padding:0;box-sizing:border-box;-webkit-tap-highlight-color:transparent}
html,body{height:100%;background:var(--nv);color:var(--tx);font-family:'Source Sans 3',sans-serif;font-size:15px;overflow:hidden}
h1,h2{font-family:'Oswald',sans-serif}

#app{display:flex;flex-direction:column;height:100dvh;max-width:480px;margin:0 auto}
#hdr{background:var(--nv2);border-bottom:1px solid var(--br);padding:10px 14px;flex-shrink:0;display:flex;align-items:center;gap:10px}
#hdr-ico{width:34px;height:34px;background:var(--ac);border-radius:8px;display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0}
#hdr-txt h1{font-size:15px;font-weight:600}
#hdr-txt p{font-size:10px;color:var(--tx2)}
#hdr-r{margin-left:auto;display:flex;align-items:center;gap:6px}
#q-dot{width:18px;height:18px;background:var(--rd);border-radius:50%;font-size:10px;font-weight:700;color:#fff;display:none;align-items:center;justify-content:center;font-family:'Oswald',sans-serif}

#content{flex:1;overflow-y:auto;overflow-x:hidden;-webkit-overflow-scrolling:touch}
#content::-webkit-scrollbar{display:none}

#nav{background:var(--nv2);border-top:1px solid var(--br);display:flex;flex-shrink:0}
.nb{flex:1;display:flex;flex-direction:column;align-items:center;padding:7px 4px;cursor:pointer;border:none;background:none;color:var(--tx3);font-size:10px;font-family:'Oswald',sans-serif;gap:2px;transition:color .2s}
.nb span{font-size:19px;line-height:1}
.nb.on{color:var(--ac)}

.scr{display:none;padding:14px;animation:fi .18s ease}
.scr.on{display:block}
@keyframes fi{from{opacity:0;transform:translateY(4px)}to{opacity:1;transform:translateY(0)}}

/* CARDS */
.card{background:var(--cd);border:1px solid var(--br);border-radius:var(--r);padding:13px;margin-bottom:10px}
.stl{font-family:'Oswald',sans-serif;font-size:11px;color:var(--tx2);text-transform:uppercase;letter-spacing:.8px;margin-bottom:8px}

/* KPI */
.kg{display:grid;grid-template-columns:1fr 1fr;gap:9px;margin-bottom:10px}
.kpi{background:var(--cd);border:1px solid var(--br);border-radius:var(--rs);padding:11px;text-align:center}
.kn{font-family:'Oswald',sans-serif;font-size:26px;font-weight:700;line-height:1}
.kl{font-size:10px;color:var(--tx2);margin-top:2px}
.kpi.r .kn{color:var(--rd)} .kpi.a .kn{color:var(--am)}
.kpi.g .kn{color:var(--gn)} .kpi.b .kn{color:var(--ac)}

/* BADGES */
.bdg{display:inline-block;font-size:10px;font-family:'Oswald',sans-serif;padding:2px 7px;border-radius:4px;letter-spacing:.3px}
.br{background:rgba(214,48,49,.2);color:#ff7675;border:1px solid rgba(214,48,49,.3)}
.ba{background:rgba(243,156,18,.15);color:#f39c12;border:1px solid rgba(243,156,18,.25)}
.bg{background:rgba(0,184,148,.15);color:#00b894;border:1px solid rgba(0,184,148,.25)}
.bb{background:rgba(26,159,212,.15);color:#1a9fd4;border:1px solid rgba(26,159,212,.25)}
.bx{background:rgba(90,114,153,.15);color:var(--tx2);border:1px solid var(--br)}

/* QA */
.qg{display:grid;grid-template-columns:1fr 1fr;gap:9px;margin-bottom:10px}
.qa{background:var(--cd2);border:1px solid var(--br2);border-radius:var(--rs);padding:13px 8px;display:flex;flex-direction:column;align-items:center;gap:5px;cursor:pointer;transition:all .15s;text-align:center}
.qa:active{transform:scale(.95)} .qa span:first-child{font-size:23px}
.qa span:last-child{font-family:'Oswald',sans-serif;font-size:11px;color:var(--tx2)}

/* INCIDENT LIST */
.ii{background:var(--cd);border:1px solid var(--br);border-radius:var(--rs);padding:11px;margin-bottom:7px;display:flex;gap:9px;align-items:flex-start;cursor:pointer;transition:border-color .15s}
.ii:active{border-color:var(--ac)}
.ii-ico{width:34px;height:34px;border-radius:7px;display:flex;align-items:center;justify-content:center;font-size:17px;flex-shrink:0}
.ig{background:rgba(214,48,49,.15)} .im{background:rgba(243,156,18,.15)} .in{background:rgba(26,159,212,.15)}
.ii-b{flex:1;min-width:0}
.ii-t{font-size:13px;font-weight:600;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.ii-m{font-size:11px;color:var(--tx2);margin-top:2px}
.ii-tgs{margin-top:5px;display:flex;gap:4px;flex-wrap:wrap}

/* FORMS */
.fg{margin-bottom:11px}
.fl{font-size:11px;font-family:'Oswald',sans-serif;color:var(--tx2);letter-spacing:.5px;margin-bottom:4px;display:block;text-transform:uppercase}
.fi,.fs,.ft{width:100%;background:var(--nv3);border:1px solid var(--br2);border-radius:var(--rs);color:var(--tx);font-family:'Source Sans 3',sans-serif;font-size:14px;padding:9px 11px;outline:none;transition:border-color .2s;-webkit-appearance:none}
.fi:focus,.fs:focus,.ft:focus{border-color:var(--ac)}
.ft{resize:none;height:80px;line-height:1.5}
.fs option{background:var(--nv2)}
.lr{font-size:10px;color:var(--ac);margin-top:3px;opacity:.8}

.btn{width:100%;padding:11px;border-radius:var(--rs);border:none;font-family:'Oswald',sans-serif;font-size:14px;letter-spacing:.7px;cursor:pointer;transition:all .15s;display:flex;align-items:center;justify-content:center;gap:5px}
.bp{background:var(--ac);color:#fff} .bp:active{background:var(--ac2);transform:scale(.98)}
.bs{background:transparent;color:var(--tx2);border:1px solid var(--br2)}
.bd{background:var(--rd);color:#fff}
.bsm{width:auto;padding:6px 12px;font-size:11px}

/* EVIDENCIAS */
.evg{display:grid;grid-template-columns:repeat(3,1fr);gap:6px;margin-bottom:10px}
.evt{position:relative;aspect-ratio:1;border-radius:6px;overflow:hidden;background:var(--nv3);border:1px solid var(--br)}
.evt img{width:100%;height:100%;object-fit:cover}
.evd{position:absolute;top:3px;right:3px;background:rgba(0,0,0,.7);border:none;color:#fff;width:20px;height:20px;border-radius:50%;font-size:10px;cursor:pointer}
.eva{aspect-ratio:1;border-radius:6px;border:2px dashed var(--br2);display:flex;flex-direction:column;align-items:center;justify-content:center;cursor:pointer;gap:3px;background:transparent;color:var(--tx3);font-family:'Oswald',sans-serif;font-size:10px}
.eva:active{border-color:var(--ac);color:var(--ac)}

/* CHECKLIST */
.cks{margin-bottom:12px}
.ckt{font-family:'Oswald',sans-serif;font-size:11px;color:var(--ac);text-transform:uppercase;letter-spacing:.5px;margin-bottom:7px;display:flex;justify-content:space-between}
.cki{display:flex;align-items:center;gap:9px;padding:8px 10px;background:var(--cd);border:1px solid var(--br);border-radius:var(--rs);margin-bottom:4px;cursor:pointer}
.cki.ok{border-color:var(--gn);background:rgba(0,184,148,.05)}
.cki.fail{border-color:var(--rd);background:rgba(214,48,49,.05)}
.ckb{width:18px;height:18px;border-radius:3px;border:2px solid var(--br2);flex-shrink:0;display:flex;align-items:center;justify-content:center;font-size:11px;transition:all .15s}
.cki.ok .ckb{background:var(--gn);border-color:var(--gn);color:#fff}
.cki.fail .ckb{background:var(--rd);border-color:var(--rd);color:#fff}
.ckx{flex:1;font-size:12px;line-height:1.3}
.ckf{background:transparent;border:1px solid var(--rd);color:var(--rd);font-size:10px;padding:2px 5px;border-radius:3px;cursor:pointer;flex-shrink:0}
.pb{height:5px;background:var(--br);border-radius:3px;overflow:hidden;margin:6px 0}
.pf{height:100%;border-radius:3px;transition:width .4s;background:linear-gradient(90deg,var(--ac),var(--gn))}

/* LOG */
.li{display:flex;gap:8px;padding:9px;background:var(--cd);border-left:3px solid var(--br2);border-radius:0 var(--rs) var(--rs) 0;margin-bottom:5px}
.lt{font-family:'Oswald',sans-serif;font-size:11px;color:var(--ac);flex-shrink:0;min-width:40px}
.ld{font-size:12px;line-height:1.4;color:var(--tx2)}

/* LEGAL */
.lgi{background:var(--cd);border:1px solid var(--br);border-radius:var(--rs);padding:11px;margin-bottom:7px;cursor:pointer}
.lga{font-family:'Oswald',sans-serif;font-size:10px;color:var(--ac);letter-spacing:.5px}
.lgt{font-size:13px;font-weight:600;margin:2px 0}
.lgb{font-size:12px;color:var(--tx2);line-height:1.5;display:none;margin-top:7px;border-top:1px solid var(--br);padding-top:7px}
.lgi.op .lgb{display:block}

/* SETTINGS */
.sr{display:flex;align-items:center;padding:12px;background:var(--cd);border:1px solid var(--br);border-radius:var(--rs);margin-bottom:7px;gap:10px}
.si{flex:1} .sl{font-size:13px;font-weight:600} .sd{font-size:11px;color:var(--tx2)}
.tog{width:44px;height:24px;background:var(--br);border-radius:12px;position:relative;cursor:pointer;transition:background .2s;flex-shrink:0;border:none}
.tog.on{background:var(--gn)}
.tog::after{content:'';width:18px;height:18px;background:#fff;border-radius:50%;position:absolute;top:3px;left:3px;transition:left .2s}
.tog.on::after{left:23px}

/* MODAL */
#mo{display:none;position:fixed;inset:0;background:rgba(0,0,0,.78);z-index:100;align-items:flex-end;max-width:480px;margin:0 auto}
#mo.on{display:flex}
#md{background:var(--nv2);border-radius:var(--r) var(--r) 0 0;border:1px solid var(--br);border-bottom:none;padding:18px 14px;width:100%;max-height:90vh;overflow-y:auto;animation:su .22s ease}
@keyframes su{from{transform:translateY(100%)}to{transform:translateY(0)}}
#mh{font-family:'Oswald',sans-serif;font-size:17px;margin-bottom:14px;display:flex;justify-content:space-between;align-items:center}
#mc{background:none;border:1px solid var(--br);color:var(--tx2);width:26px;height:26px;border-radius:5px;cursor:pointer;font-size:13px}

/* CÁMARA FULLSCREEN */
#cam{display:none;position:fixed;inset:0;z-index:300;background:#000;flex-direction:column}
#cam.on{display:flex}
#cv{flex:1;width:100%;object-fit:cover}
#cc{display:none}
#cam-bar{background:rgba(0,0,0,.6);padding:16px;display:flex;align-items:center;justify-content:space-between;flex-shrink:0}
#cam-snap{width:62px;height:62px;border-radius:50%;background:rgba(255,255,255,.92);border:4px solid var(--ac);font-size:28px;cursor:pointer;display:flex;align-items:center;justify-content:center}
#cam-sw{background:rgba(255,255,255,.15);border:none;color:#fff;width:44px;height:44px;border-radius:50%;cursor:pointer;font-size:20px}
#cam-cl{background:rgba(255,255,255,.15);border:none;color:#fff;width:44px;height:44px;border-radius:50%;cursor:pointer;font-size:20px}
#cam-lbl{position:absolute;top:16px;left:50%;transform:translateX(-50%);background:rgba(0,0,0,.5);color:#fff;font-family:'Oswald',sans-serif;font-size:11px;padding:4px 14px;border-radius:10px;letter-spacing:.5px;pointer-events:none}

/* TURNO HDR */
.thdr{background:linear-gradient(135deg,var(--nv3),var(--nv2));border:1px solid var(--br);border-radius:var(--r);padding:13px;margin-bottom:10px}
#clk{font-family:'Oswald',sans-serif;font-size:30px;color:var(--ac);line-height:1}

/* TOAST */
#toast{position:fixed;bottom:72px;left:50%;transform:translateX(-50%) translateY(10px);font-family:'Oswald',sans-serif;font-size:12px;padding:9px 18px;border-radius:8px;opacity:0;transition:all .25s;z-index:400;white-space:nowrap;max-width:94vw;pointer-events:none}
#toast.on{opacity:1;transform:translateX(-50%) translateY(0)}

.dvd{height:1px;background:var(--br);margin:12px 0}
.cr{font-size:10px;color:var(--tx3);text-align:center;padding:6px 0}
</style>
</head>
<body>
<div id="app">

<!-- HEADER -->
<div id="hdr">
  <div id="hdr-ico">🛡️</div>
  <div id="hdr-txt">
    <h1>SISEP Campo</h1>
    <p id="hdr-sub">Cargando configuración...</p>
  </div>
  <div id="hdr-r">
    <div id="q-dot"></div>
    <button class="btn bsm bs" onclick="nav('config')" style="height:28px;padding:0 10px;font-size:11px">⚙️</button>
  </div>
</div>

<!-- SCREENS -->
<div id="content">

  <!-- INICIO -->
  <div class="scr on" id="s-inicio">
    <div class="thdr">
      <div id="clk">00:00:00</div>
      <div style="font-size:11px;color:var(--tx2)" id="fch"></div>
      <div style="margin-top:7px;display:flex;gap:6px;flex-wrap:wrap">
        <span class="bdg bb">Turno activo</span>
        <span class="bdg bx" id="agente-badge">Sin configurar</span>
      </div>
    </div>

    <div id="alerta-cfg" style="background:rgba(243,156,18,.12);border:1px solid rgba(243,156,18,.3);border-radius:var(--rs);padding:10px 13px;margin-bottom:10px;font-size:12px;display:none;align-items:center;gap:8px">
      <span>⚠️</span><span>Configure su nombre e instalación en ⚙️ antes de registrar</span>
    </div>

    <div class="kg">
      <div class="kpi r"><div class="kn" id="k1">0</div><div class="kl">Graves</div></div>
      <div class="kpi a"><div class="kn" id="k2">0</div><div class="kl">Menos graves</div></div>
      <div class="kpi b"><div class="kn" id="k3">0</div><div class="kl">Incidentes</div></div>
      <div class="kpi g"><div class="kn" id="k4">—</div><div class="kl">Autocontrol</div></div>
    </div>

    <div class="stl">⚡ Acciones rápidas</div>
    <div class="qg">
      <div class="qa" onclick="openInc()"><span>🚨</span><span>Nuevo incidente</span></div>
      <div class="qa" onclick="nav('auto')"><span>✅</span><span>Autocontrol</span></div>
      <div class="qa" onclick="nav('turno')"><span>📓</span><span>Libro de turno</span></div>
      <div class="qa" onclick="openAcceso()"><span>🪪</span><span>Control acceso</span></div>
    </div>

    <div class="stl">🕐 Últimos registros</div>
    <div id="recientes"></div>
    <div class="cr">DL-70/2023 · D-111/2024 · R-36/2024</div>
  </div>

  <!-- INCIDENTES -->
  <div class="scr" id="s-inc">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:10px">
      <h2 style="font-size:18px">Incidentes</h2>
      <button class="btn bp bsm" onclick="openInc()">+ Nuevo</button>
    </div>
    <div style="display:flex;gap:5px;margin-bottom:10px;overflow-x:auto;padding-bottom:3px">
      <button class="btn bsm" id="ft" onclick="filtrar('todos')" style="white-space:nowrap;background:var(--ac);color:#fff">Todos</button>
      <button class="btn bsm bs" id="fg" onclick="filtrar('grave')" style="white-space:nowrap">Graves</button>
      <button class="btn bsm bs" id="fm" onclick="filtrar('menos')" style="white-space:nowrap">Menos graves</button>
      <button class="btn bsm bs" id="fi" onclick="filtrar('incidente')" style="white-space:nowrap">Incidentes</button>
    </div>
    <div id="lista-inc"></div>
  </div>

  <!-- AUTOCONTROL -->
  <div class="scr" id="s-auto">
    <h2 style="font-size:18px;margin-bottom:3px">Autocontrol</h2>
    <div style="font-size:11px;color:var(--tx2);margin-bottom:10px">Anexo I · Resolución 36/2024</div>
    <div class="card" style="margin-bottom:10px">
      <div style="display:flex;justify-content:space-between;align-items:center">
        <div><div style="font-family:'Oswald',sans-serif;font-size:22px;color:var(--gn)" id="ap">0%</div>
          <div style="font-size:11px;color:var(--tx2)">Cumplimiento</div></div>
        <div style="text-align:right">
          <div style="font-size:11px;color:var(--tx2)" id="ac">0/0</div>
          <div style="font-size:11px;color:var(--rd)" id="af">0 infracciones</div>
        </div>
      </div>
      <div class="pb"><div class="pf" id="ab" style="width:0%"></div></div>
    </div>
    <div id="ck"></div>
    <button class="btn bp" onclick="actaAuto()" style="height:42px">📄 Generar Acta (Art. 20 D-111)</button>
    <div style="height:14px"></div>
  </div>

  <!-- TURNO -->
  <div class="scr" id="s-turno">
    <h2 style="font-size:18px;margin-bottom:10px">Libro de Turno</h2>
    <div class="card" style="margin-bottom:10px">
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:9px">
        <div><label class="fl">Instalación</label>
          <input class="fi" id="t-inst" placeholder="Nombre de la instalación" value=""></div>
        <div><label class="fl">Turno</label>
          <select class="fs" id="t-tur">
            <option>Diurno 7:00–15:00</option>
            <option>Tarde 15:00–23:00</option>
            <option>Nocturno 23:00–7:00</option>
          </select></div>
      </div>
    </div>
    <div class="stl">📝 Nueva entrada</div>
    <div class="card">
      <div class="fg">
        <label class="fl">Tipo de novedad</label>
        <select class="fs" id="t-tipo">
          <option value="normal">Novedad de rutina</option>
          <option value="incidente">Incidente detectado</option>
          <option value="visita">Visita de autoridad</option>
          <option value="relevo">Relevo de guardia</option>
          <option value="armamento">Control de armamento</option>
          <option value="ronda">Ronda perimetral</option>
        </select>
      </div>
      <div class="fg">
        <label class="fl">Descripción</label>
        <textarea class="ft" id="t-desc" placeholder="Describa la novedad del turno..."></textarea>
      </div>
      <button class="btn bp" onclick="addLog()" style="height:40px">+ Registrar entrada</button>
    </div>
    <div class="stl" style="margin-top:8px">📋 Registro del turno</div>
    <div id="log-list"></div>
    <div style="height:14px"></div>
  </div>

  <!-- LEGAL -->
  <div class="scr" id="s-legal">
    <h2 style="font-size:18px;margin-bottom:3px">Base Legal</h2>
    <div style="font-size:11px;color:var(--tx2);margin-bottom:10px">Consulta offline · Sin Internet</div>
    <input class="fi" id="leg-q" placeholder="🔍  Buscar artículo o tema..." style="margin-bottom:10px" oninput="renderLegal(this.value)">
    <div id="leg-list"></div>
    <div style="height:14px"></div>
  </div>

  <!-- CONFIG -->
  <div class="scr" id="s-config">
    <h2 style="font-size:18px;margin-bottom:3px">Configuración</h2>
    <div style="font-size:11px;color:var(--tx2);margin-bottom:14px">Agente · Instalación · Sistema</div>

    <div class="stl">👤 Datos del agente</div>
    <div class="fg">
      <label class="fl">Nombre y apellidos</label>
      <input class="fi" id="c-nombre" placeholder="Nombre completo del agente">
    </div>
    <div class="fg">
      <label class="fl">Instalación / Objetivo asignado</label>
      <input class="fi" id="c-inst" placeholder="Nombre exacto de la instalación">
      <div class="lr">⚖️ Se usará en todos los registros</div>
    </div>
    <div class="fg">
      <label class="fl">Cargo</label>
      <select class="fs" id="c-cargo">
        <option>Agente de Seguridad y Protección</option>
        <option>Jefe de Turno de S. y P.</option>
        <option>Jefe de Objetivo de S. y P.</option>
        <option>Jefe de Grupo de S. Interna</option>
        <option>Técnico de Seguridad y Protección</option>
        <option>Especialista de S. y P.</option>
        <option>Sereno</option>
        <option>Custodio</option>
      </select>
    </div>
    <button class="btn bp" onclick="guardarCfg()" style="height:42px;margin-bottom:14px">💾 Guardar configuración</button>

    <div class="dvd"></div>
    <div class="stl" style="margin-top:12px">📊 Datos locales</div>
    <div class="card">
      <div style="display:flex;justify-content:space-between;font-size:13px;margin-bottom:6px">
        <span>Incidentes guardados</span><span id="ci-cnt" style="color:var(--ac);font-family:'Oswald',sans-serif">0</span>
      </div>
      <div style="display:flex;justify-content:space-between;font-size:13px;margin-bottom:6px">
        <span>Entradas de turno</span><span id="ct-cnt" style="color:var(--ac);font-family:'Oswald',sans-serif">0</span>
      </div>
      <div style="display:flex;justify-content:space-between;font-size:13px">
        <span>Último registro</span><span id="c-last" style="color:var(--tx2);font-size:12px">—</span>
      </div>
    </div>
    <button class="btn bd" onclick="pedirBorrar()" style="height:40px;margin-bottom:8px">🗑️ Borrar todos los datos</button>
    <button class="btn bs" onclick="exportarDatos()" style="height:40px;margin-bottom:14px">📥 Exportar datos (JSON)</button>

    <div class="dvd"></div>
    <div class="stl" style="margin-top:12px">📲 Instalar app</div>
    <div class="card" style="font-size:12px;color:var(--tx2);line-height:1.8">
      <b style="color:var(--tx)">Android Chrome:</b> menú ⋮ → "Añadir a pantalla de inicio"<br>
      <b style="color:var(--tx)">iPhone Safari:</b> botón Compartir ↑ → "Añadir a pantalla de inicio"<br>
      <b style="color:var(--tx)">Exportar datos:</b> triple toque en la cabecera azul
    </div>
    <div class="cr">SISEP Campo v1.0 · I+D+I UEB AGESP Oriente</div>
  </div>

</div><!-- /content -->

<!-- NAV -->
<nav id="nav">
  <button class="nb on" id="nb-inicio" onclick="nav('inicio')"><span>🏠</span>Inicio</button>
  <button class="nb" id="nb-inc" onclick="nav('inc')"><span>🚨</span>Incidentes</button>
  <button class="nb" id="nb-auto" onclick="nav('auto')"><span>✅</span>Autocontrol</button>
  <button class="nb" id="nb-turno" onclick="nav('turno')"><span>📓</span>Turno</button>
  <button class="nb" id="nb-legal" onclick="nav('legal')"><span>⚖️</span>Legal</button>
</nav>
</div><!-- /app -->

<!-- MODAL -->
<div id="mo" onclick="cmo(event)">
  <div id="md">
    <div id="mh"><span id="mt"></span><button id="mc" onclick="cmo()">✕</button></div>
    <div id="mb"></div>
  </div>
</div>

<!-- CÁMARA FULLSCREEN -->
<div id="cam">
  <video id="cv" playsinline autoplay></video>
  <canvas id="cc"></canvas>
  <div id="cam-lbl">CAPTURA DE EVIDENCIA</div>
  <div id="cam-bar">
    <button id="cam-cl" onclick="cerrarCam()">✕</button>
    <button id="cam-snap">📷</button>
    <button id="cam-sw" onclick="girarCam()">🔄</button>
  </div>
</div>

<!-- TOAST -->
<div id="toast"></div>

<script>
// ══ STORAGE ══════════════════════════════════════════
const S={
  get(k,d=null){try{const v=localStorage.getItem(k);return v!==null?JSON.parse(v):d}catch{return d}},
  set(k,v){try{localStorage.setItem(k,JSON.stringify(v))}catch(e){alert('Almacenamiento lleno. Exporte datos.')}},
  del(k){localStorage.removeItem(k)}
};

// ══ DATA ═════════════════════════════════════════════
const DB={
  incs(){return S.get('sc_incs',[])},
  addInc(i){const d=this.incs();d.unshift(i);S.set('sc_incs',d)},
  logs(){return S.get('sc_logs',[])},
  addLog(l){const d=this.logs();d.unshift(l);S.set('sc_logs',d)},
  auto(){return S.get('sc_auto',{})},
  setAuto(a){S.set('sc_auto',a)},
  cfg(){return S.get('sc_cfg',{})},
  setCfg(c){S.set('sc_cfg',c)}
};

// ══ CHECKLIST DATOS ══════════════════════════════════
const CL=[
  {s:'1. Recursos y estrategia',i:['Estructura organizativa suficiente para la protección','Medios físicos y técnicos diseñados e implementados','Plan de Seguridad aprobado y clasificado','Contratos y base legal de protección vigentes']},
  {s:'2. Plan de Seguridad',i:['Plan elaborado en formato vigente','Amenazas y riesgos correctamente definidos','Fuerzas de protección habilitadas e idóneas','Medidas aplicadas en blancos de posible amenaza']},
  {s:'3. Fuerzas de Seguridad',i:['Organización del servicio conocida por el personal','Armamento en correctas condiciones técnicas','Aprobación de cada efectivo al día','Uniformes y medios disponibles para el servicio']},
  {s:'4. Control de Acceso',i:['RRHH y medios técnicos disponibles en puestos','Medidas para identificación de personas y vehículos','Control de carga, paquetes y equipaje','Registros de acceso conservados correctamente']},
  {s:'5. Seguridad Perimetral',i:['Posiciones fijas y rondas de vigilancia organizadas','Iluminación de seguridad operativa en perímetro','Estado técnico del cercado perimetral correcto','Medios técnicos instalados y en funcionamiento']},
  {s:'6. Armamento',i:['Limpieza y estado técnico de cada arma verificado','Municiones verificadas en cantidad y tipo','Libro de control del armamento actualizado','Condiciones de almacenamiento correctas']},
];

const LEGAL=[
  {a:'Art. 3 DL-70',t:'Concepto de Seguridad y Protección Física',n:'DL-70/2023',b:'Conjunto de medidas organizativas, de regulación, fiscalización, de control interno, jurídico, técnico y operacional, destinadas a garantizar la integridad y custodia de las personas, los bienes y recursos. Se integra con la Protección de Información Oficial, Ciberseguridad, Criptografía, Protección Contra Incendios y Sustancias Peligrosas.'},
  {a:'Art. 11 DL-70',t:'Niveles de categorización de objetivos',n:'DL-70/2023',b:'Tres niveles: a) Seguridad máxima: instalaciones estratégicas, vitales, de importancia política, económica y militar. b) Seguridad media: objetivos de importancia económica y social para la región o provincia. c) Seguridad básica: instalaciones que requieren atención sin afectar gravemente las funciones del Estado.'},
  {a:'Art. 33 DL-70',t:'Medios técnicos de seguridad',n:'DL-70/2023',b:'Incluyen: Sistema Automático contra Intrusos, Circuito Cerrado de Televisión, Sistema Automatizado de Control de Acceso y Salida, Sistema Automático de Extinción de Incendios, Sistema Automático de Detección de Incendios, y Vehículos Aéreos No Tripulados para seguridad.'},
  {a:'Art. 138 D-111',t:'Violaciones graves y menos graves',n:'D-111/2024',b:'Violaciones graves: acciones u omisiones que constituyen riesgos que comprometen la Seguridad y Protección Física, poniendo en peligro la vida de personas, la economía y el medio ambiente, y pueden generar un incidente de seguridad. Se clasifican según la categorización del objetivo y la afectación potencial.'},
  {a:'Art. 139 D-111',t:'Definición de incidente de seguridad',n:'D-111/2024',b:'El incidente de seguridad es un evento o circunstancia que ha ocasionado o podría ocasionar daños relacionados con la actividad de Seguridad y Protección Física.'},
  {a:'Art. 141 D-111',t:'Investigación — plazo 30 días',n:'D-111/2024',b:'La investigación se realiza en un plazo de hasta treinta días contados a partir de conocida la violación o incidente, por expertos investigadores, previa aprobación del órgano de Protección del Ministerio del Interior.'},
  {a:'Art. 144 D-111',t:'Conductas contravencionales (35)',n:'D-111/2024',b:'Son contravenciones: no tener medidas organizativas, no elaborar o actualizar el plan de seguridad, incumplir el plan aprobado, no activar medios técnicos, omitir categorización, infringir proceso de habilitación del personal, importar medios sin autorización, modificar CCTV sin aprobación, no facilitar acceso al MININT, entre otras 26 más.'},
  {a:'Art. 67 D-111',t:'Requisitos del personal de seguridad',n:'D-111/2024',b:'Mayor de 18 años, ciudadano cubano residente en el territorio, apto física y mentalmente (certificado médico cada 2 años), sin antecedentes penales, no separado deshonrosamente de instituciones, buen concepto público, preparación y capacidad profesional para el cargo.'},
  {a:'Art. 20 D-111',t:'Acta de autocontrol — 2 ejemplares',n:'D-111/2024',b:'Concluida la acción de autocontrol, se elabora un acta con dos ejemplares como mínimo: uno para el lugar controlado y otro para el controlador, según las formalidades que establezca el Ministro del Interior.'},
  {a:'Art. 141 D-111',t:'Proceso investigativo de violaciones',n:'D-111/2024',b:'Pasos: (a) Detección de indicios o pruebas; (b) emisión del reporte hacia autoridades competentes; (c) análisis para determinar magnitud del daño, responsables, causas y condiciones; (d) emisión del dictamen evaluativo por expertos investigadores. Plazo: 30 días desde conocida la violación.'},
  {a:'Anexo I R-36',t:'Lista de verificación del autocontrol',n:'R-36/2024',b:'12 acápites: 1.Recursos y estrategia, 2.Plan de seguridad, 3.Fuerzas de seguridad, 4.Control de acceso, 5.Seguridad perimetral, 6.Puntos vitales y áreas reservadas, 7.Medidas organizativas y de control, 8.Servicios de protección, 9.Conocimiento de trabajadores, 10.Guardia obrera, 11.Armamento, 12.Implementación DL-70.'},
  {a:'Anexo II R-36',t:'Libro de control de visitantes',n:'R-36/2024',b:'Datos obligatorios: nombre y apellidos, número de documento de identificación, lugar de procedencia, fecha/hora de entrada y salida, nombre del visitado, área a visitar, nombre del jefe que autoriza, firma del expedidor. Se archiva 6 meses y luego puede destruirse.'},
  {a:'Art. 119 D-111',t:'Almacenamiento del armamento',n:'D-111/2024',b:'Las armas se guardan en locales con enrejados en puertas, ventanas y techo no macizo; sistema de señalización de alarmas, medios contra incendios y vigilancia permanente. Armas cortas en armeros o cajas metálicas ancladas. Se consideran puntos vitales en el Plan de Seguridad.'},
];

// ══ CÁMARA ═══════════════════════════════════════════
let stream=null, facing='environment', evidencias=[], camGrid=null;

async function abrirCam(gridId){
  camGrid=gridId;
  if(stream){stream.getTracks().forEach(t=>t.stop());stream=null;}
  try{
    stream=await navigator.mediaDevices.getUserMedia({
      video:{facingMode:facing,width:{ideal:1920},height:{ideal:1080}},audio:false
    });
    document.getElementById('cv').srcObject=stream;
    document.getElementById('cam').classList.add('on');
  }catch(e){
    toast('⚠️ Cámara no disponible: '+e.message,'rd');
  }
}

function cerrarCam(){
  if(stream){stream.getTracks().forEach(t=>t.stop());stream=null;}
  document.getElementById('cam').classList.remove('on');
}

async function girarCam(){
  facing=facing==='environment'?'user':'environment';
  if(stream){stream.getTracks().forEach(t=>t.stop());}
  try{
    stream=await navigator.mediaDevices.getUserMedia({
      video:{facingMode:facing},audio:false
    });
    document.getElementById('cv').srcObject=stream;
  }catch{}
}

document.getElementById('cam-snap').onclick=()=>{
  const v=document.getElementById('cv');
  const c=document.getElementById('cc');
  c.width=v.videoWidth||1280;c.height=v.videoHeight||720;
  c.getContext('2d').drawImage(v,0,0);
  evidencias.push(c.toDataURL('image/jpeg',0.82));
  cerrarCam();
  renderEvs(camGrid);
  toast('📷 Evidencia capturada');
};

function renderEvs(gridId){
  const g=document.getElementById(gridId);if(!g)return;
  g.innerHTML=evidencias.map((s,i)=>`
    <div class="evt"><img src="${s}">
      <button class="evd" onclick="evidencias.splice(${i},1);renderEvs('${gridId}')">✕</button>
    </div>`).join('')+
    `<div class="eva" onclick="abrirCam('${gridId}')"><span style="font-size:22px">📷</span>Cámara</div>
     <label class="eva"><span style="font-size:22px">🖼️</span>Galería
       <input type="file" accept="image/*" multiple style="display:none" onchange="addFiles(event,'${gridId}')">
     </label>`;
}

function addFiles(e,gridId){
  [...e.target.files].forEach(f=>{
    const r=new FileReader();
    r.onload=ev=>{evidencias.push(ev.target.result);renderEvs(gridId);};
    r.readAsDataURL(f);
  });
}

// ══ NAVEGACIÓN ═══════════════════════════════════════
function nav(s){
  document.querySelectorAll('.scr').forEach(x=>x.classList.remove('on'));
  document.querySelectorAll('.nb').forEach(x=>x.classList.remove('on'));
  document.getElementById('s-'+s).classList.add('on');
  const nb=document.getElementById('nb-'+s);
  if(nb)nb.classList.add('on');
  if(s==='inc')renderIncs('todos');
  if(s==='auto')renderCk();
  if(s==='turno'){cargarTurnoInst();renderLog();}
  if(s==='legal')renderLegal('');
  if(s==='config')cargarCfg();
}

// ══ MODAL ════════════════════════════════════════════
function oModal(titulo,html){
  document.getElementById('mt').textContent=titulo;
  document.getElementById('mb').innerHTML=html;
  document.getElementById('mo').classList.add('on');
}
function cmo(e){
  if(e&&e.target!==document.getElementById('mo'))return;
  document.getElementById('mo').classList.remove('on');
  cerrarCam();
}

// ══ INCIDENTES ═══════════════════════════════════════
const IICO={grave:'⚠️',menos:'⚡',incidente:'ℹ️'};
const IBDG={grave:'br',menos:'ba',incidente:'bb'};
const ILBL={grave:'GRAVE',menos:'MENOS GRAVE',incidente:'INCIDENTE'};
const EBDG={abierto:'br',en_proceso:'ba',resuelto:'bg'};
const ELBL={abierto:'ABIERTO',en_proceso:'EN PROCESO',resuelto:'RESUELTO'};

function openInc(){
  evidencias=[];
  const cfg=DB.cfg();
  oModal('🚨 Nuevo Incidente',`
  <div style="overflow-y:auto;max-height:calc(90vh - 60px)">
    <div class="fg">
      <label class="fl">Clasificación</label>
      <select class="fs" id="m-tipo">
        <option value="grave">Violación Grave — Art. 138.2 D-111</option>
        <option value="menos">Violación Menos Grave — Art. 138.1 D-111</option>
        <option value="incidente">Incidente de Seguridad — Art. 139 D-111</option>
      </select>
    </div>
    <div class="fg">
      <label class="fl">Instalación / Objetivo</label>
      <input class="fi" id="m-inst" value="${cfg.instalacion||''}" placeholder="Nombre de la instalación">
    </div>
    <div class="fg">
      <label class="fl">Descripción del hecho</label>
      <textarea class="ft" id="m-desc" placeholder="Describa con precisión el hecho ocurrido, lugar exacto, personas involucradas..."></textarea>
    </div>
    <div class="fg">
      <label class="fl">Artículo infringido (D-111/2024)</label>
      <select class="fs" id="m-art">
        <option>Art. 144.1 — No tener medidas organizativas</option>
        <option>Art. 144.2 — No elaborar/actualizar plan de seguridad</option>
        <option>Art. 144.3 — Incumplir plan de seguridad aprobado</option>
        <option>Art. 144.4 — No activar medios técnicos</option>
        <option>Art. 144.6 — Infringir proceso de habilitación</option>
        <option>Art. 144.13 — Incumplir sistema informativo</option>
        <option>Art. 144.15 — Modificar CCTV sin autorización</option>
        <option>Art. 144.16 — Obstruir cobertura de cámaras</option>
        <option>Art. 144.21 — No informar hecho delictivo en plazo</option>
        <option>Art. 139 — Incidente de seguridad</option>
      </select>
      <div class="lr">⚖️ Decreto 111/2024 · Capítulo X</div>
    </div>
    <div class="fg">
      <label class="fl">Agente que reporta</label>
      <input class="fi" id="m-agente" value="${cfg.nombre||''}" placeholder="Nombre y apellidos del agente">
    </div>
    <div class="fg">
      <label class="fl">📷 Evidencias fotográficas</label>
      <div class="evg" id="ev-grid"></div>
    </div>
    <button class="btn bp" onclick="guardarInc()" style="height:44px">💾 Guardar incidente</button>
    <div style="height:8px"></div>
  </div>`);
  renderEvs('ev-grid');
}

function guardarInc(){
  const tipo=document.getElementById('m-tipo')?.value;
  const inst=document.getElementById('m-inst')?.value?.trim();
  const desc=document.getElementById('m-desc')?.value?.trim();
  const art=document.getElementById('m-art')?.value;
  const agente=document.getElementById('m-agente')?.value?.trim();
  if(!desc){toast('⚠️ Escriba la descripción del hecho','rd');return;}
  if(!inst){toast('⚠️ Indique la instalación','rd');return;}
  if(!agente){toast('⚠️ Indique el agente que reporta','rd');return;}
  const n=new Date();
  const inc={
    _id:Date.now(),tipo,
    titulo:`${desc.substring(0,50)}${desc.length>50?'...':''}`,
    desc,instalacion:inst,articulo:art,reportado_por:agente,
    estado:'abierto',
    hora:n.toLocaleTimeString('es-ES',{hour:'2-digit',minute:'2-digit'}),
    fecha:n.toLocaleDateString('es-ES'),
    ts:n.toISOString(),
    evidencias:[...evidencias]
  };
  DB.addInc(inc);
  document.getElementById('mo').classList.remove('on');
  updateKPIs();
  toast(`✅ Incidente registrado${inc.evidencias.length?' con '+inc.evidencias.length+' foto(s)':''}`);
}

function renderIncs(filtro){
  let data=DB.incs();
  if(filtro!=='todos')data=data.filter(i=>i.tipo===filtro);
  const el=document.getElementById('lista-inc');
  if(!data.length){el.innerHTML='<div style="text-align:center;color:var(--tx3);padding:30px;font-size:13px">Sin registros</div>';return;}
  el.innerHTML=data.map(i=>`
    <div class="ii" onclick="verInc(${i._id})">
      <div class="ii-ico i${i.tipo[0]}">${IICO[i.tipo]||'📋'}</div>
      <div class="ii-b">
        <div class="ii-t">${i.titulo}</div>
        <div class="ii-m">${i.hora} · ${i.fecha} · ${i.instalacion}</div>
        <div class="ii-tgs">
          <span class="bdg ${IBDG[i.tipo]}">${ILBL[i.tipo]}</span>
          <span class="bdg ${EBDG[i.estado]}">${ELBL[i.estado]}</span>
          ${i.evidencias?.length?`<span class="bdg bx">📷 ${i.evidencias.length}</span>`:''}
        </div>
      </div>
    </div>`).join('');
}

function verInc(id){
  const i=DB.incs().find(x=>x._id===id);if(!i)return;
  oModal(`${IICO[i.tipo]} Detalle del registro`,`
    <div class="card" style="margin-bottom:10px">
      <div style="display:flex;gap:6px;margin-bottom:8px">
        <span class="bdg ${IBDG[i.tipo]}">${ILBL[i.tipo]}</span>
        <span class="bdg ${EBDG[i.estado]}">${ELBL[i.estado]}</span>
      </div>
      <div style="font-size:14px;font-weight:600;margin-bottom:7px">${i.titulo}</div>
      <div style="font-size:12px;color:var(--tx2);line-height:1.5">${i.desc}</div>
    </div>
    <div class="card" style="margin-bottom:10px">
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:9px;font-size:12px">
        <div><div class="fl">Hora</div>${i.hora}</div>
        <div><div class="fl">Fecha</div>${i.fecha}</div>
        <div style="grid-column:1/-1"><div class="fl">Instalación</div>${i.instalacion}</div>
        <div style="grid-column:1/-1"><div class="fl">Reportado por</div>${i.reportado_por}</div>
        <div style="grid-column:1/-1"><div class="fl">Fundamento legal</div><span style="color:var(--ac)">${i.articulo}</span></div>
      </div>
    </div>
    ${i.evidencias?.length?`<div class="card" style="margin-bottom:10px">
      <div class="fl">Evidencias fotográficas (${i.evidencias.length})</div>
      <div class="evg">${i.evidencias.map(s=>`<div class="evt"><img src="${s}" onclick="verFoto('${s}')"></div>`).join('')}</div>
    </div>`:''}
    <div style="display:flex;gap:8px">
      <button class="btn bs" style="flex:1;height:40px" onclick="cambiarEstado(${i._id})">🔄 Cambiar estado</button>
      <button class="btn bd" style="flex:1;height:40px" onclick="eliminarInc(${i._id})">🗑️ Eliminar</button>
    </div>`);
}

function cambiarEstado(id){
  const incs=DB.incs();
  const i=incs.find(x=>x._id===id);if(!i)return;
  const est=['abierto','en_proceso','resuelto'];
  i.estado=est[(est.indexOf(i.estado)+1)%3];
  S.set('sc_incs',incs);
  toast(`Estado: ${ELBL[i.estado]}`);
  document.getElementById('mo').classList.remove('on');
  updateKPIs();
}

function eliminarInc(id){
  S.set('sc_incs',DB.incs().filter(x=>x._id!==id));
  document.getElementById('mo').classList.remove('on');
  updateKPIs();renderIncs('todos');
  toast('Registro eliminado','rd');
}

function verFoto(src){
  oModal('📷 Evidencia',`<img src="${src}" style="width:100%;border-radius:var(--rs)">`);
}

function filtrar(f){
  document.querySelectorAll('[id^=f]').forEach(b=>{b.className='btn bsm bs';b.style.background='';b.style.color='';});
  const btn=document.getElementById('f'+f[0]);
  if(btn){btn.style.background='var(--ac)';btn.style.color='#fff';btn.className='btn bsm';}
  renderIncs(f);
}

// ══ ACCESO MODAL ═════════════════════════════════════
function openAcceso(){
  const cfg=DB.cfg();
  oModal('🪪 Control de Acceso',`
  <div style="overflow-y:auto;max-height:calc(90vh - 60px)">
    <div style="display:flex;gap:7px;margin-bottom:12px">
      <button class="btn bsm" id="tv" onclick="swTab('v')" style="flex:1;background:var(--ac);color:#fff">Visitante</button>
      <button class="btn bsm bs" id="th" onclick="swTab('h')" style="flex:1">Vehículo</button>
    </div>
    <div id="tab-v">
      <div class="fg"><label class="fl">Nombre y apellidos</label><input class="fi" id="a-nom" placeholder="Nombre completo del visitante"></div>
      <div class="fg"><label class="fl">No. Identidad / Pasaporte</label><input class="fi" id="a-ci" placeholder="Número de documento"></div>
      <div class="fg"><label class="fl">Procedencia / Centro laboral</label><input class="fi" id="a-proc" placeholder="Institución o lugar de residencia"></div>
      <div class="fg"><label class="fl">Persona a visitar</label><input class="fi" id="a-vis" placeholder="Nombre del visitado"></div>
      <div class="fg"><label class="fl">Área autorizada</label><input class="fi" id="a-area" placeholder="Área o local que se autoriza visitar"></div>
      <div class="lr" style="margin-bottom:12px">⚖️ Anexo II R-36/2024 — Libro de control de visitantes</div>
      <button class="btn bp" onclick="regAcceso('visitante')" style="height:42px">✅ Registrar entrada</button>
    </div>
    <div id="tab-h" style="display:none">
      <div class="fg"><label class="fl">Nombre del conductor</label><input class="fi" id="v-nom" placeholder="Nombre y apellidos del conductor"></div>
      <div class="fg"><label class="fl">Chapa del vehículo</label><input class="fi" id="v-chp" placeholder="Número de matrícula"></div>
      <div class="fg"><label class="fl">No. Vale / Factura entrada</label><input class="fi" id="v-vale" placeholder="Número del documento"></div>
      <div class="fg"><label class="fl">Área de acceso</label><input class="fi" id="v-area" placeholder="Área o zona autorizada"></div>
      <div class="lr" style="margin-bottom:12px">⚖️ Anexo III R-36/2024 — Libro de control de vehículos</div>
      <button class="btn bp" onclick="regAcceso('vehiculo')" style="height:42px">✅ Registrar vehículo</button>
    </div>
  </div>`);
}

function swTab(t){
  document.getElementById('tab-v').style.display=t==='v'?'block':'none';
  document.getElementById('tab-h').style.display=t==='h'?'block':'none';
  document.getElementById('tv').style.cssText=t==='v'?'flex:1;background:var(--ac);color:#fff':'flex:1';
  document.getElementById('tv').className=t==='v'?'btn bsm':'btn bsm bs';
  document.getElementById('th').style.cssText=t==='h'?'flex:1;background:var(--ac);color:#fff':'flex:1';
  document.getElementById('th').className=t==='h'?'btn bsm':'btn bsm bs';
}

function regAcceso(tipo){
  const n=new Date();
  const reg={
    _id:Date.now(),tipo,
    nombre:document.getElementById(tipo==='visitante'?'a-nom':'v-nom')?.value?.trim(),
    hora:n.toLocaleTimeString('es-ES',{hour:'2-digit',minute:'2-digit'}),
    fecha:n.toLocaleDateString('es-ES')
  };
  if(!reg.nombre){toast('⚠️ Indique el nombre','rd');return;}
  // Guardar en log del turno también
  DB.addLog({_id:Date.now(),tipo:'visita',
    desc:`${tipo==='visitante'?'Visitante':'Vehículo'}: ${reg.nombre}`,
    hora:reg.hora,fecha:reg.fecha,ts:n.toISOString()});
  document.getElementById('mo').classList.remove('on');
  toast(`✅ ${tipo==='visitante'?'Visitante':'Vehículo'} registrado`);
}

// ══ AUTOCONTROL ══════════════════════════════════════
let autoState={};

function renderCk(){
  autoState=DB.auto();
  let html='';
  CL.forEach((sec,si)=>{
    const t=sec.i.length;
    const ok=sec.i.filter((_,ii)=>autoState[`${si}-${ii}`]==='ok').length;
    html+=`<div class="cks"><div class="ckt">${sec.s}<span>${ok}/${t}</span></div>`;
    sec.i.forEach((item,ii)=>{
      const st=autoState[`${si}-${ii}`]||'';
      html+=`<div class="cki ${st}" onclick="markCk(${si},${ii})">
        <div class="ckb">${st==='ok'?'✓':st==='fail'?'✗':''}</div>
        <div class="ckx">${item}</div>
        ${st!=='fail'?`<button class="ckf" onclick="markCk(${si},${ii},'fail');event.stopPropagation()">✗ Falla</button>`:''}
      </div>`;
    });
    html+='</div>';
  });
  document.getElementById('ck').innerHTML=html;
  updAuto();
}

function markCk(si,ii,forced){
  const k=`${si}-${ii}`;
  const cur=autoState[k]||'';
  autoState[k]=forced||(cur===''?'ok':cur==='ok'?'':'ok');
  DB.setAuto(autoState);renderCk();
}

function updAuto(){
  const total=CL.reduce((a,s)=>a+s.i.length,0);
  const ok=Object.values(autoState).filter(v=>v==='ok').length;
  const fail=Object.values(autoState).filter(v=>v==='fail').length;
  const pct=Math.round(ok/total*100);
  document.getElementById('ap').textContent=pct+'%';
  document.getElementById('ab').style.width=pct+'%';
  document.getElementById('ac').textContent=`${ok+fail}/${total}`;
  document.getElementById('af').textContent=`${fail} infracciones`;
  document.getElementById('k4').textContent=pct+'%';
}

function actaAuto(){
  const cfg=DB.cfg();
  const fail=Object.values(autoState).filter(v=>v==='fail').length;
  const ok=Object.values(autoState).filter(v=>v==='ok').length;
  const total=CL.reduce((a,s)=>a+s.i.length,0);
  const pct=Math.round(ok/total*100);
  const n=new Date();
  oModal('📄 Acta de Autocontrol',`
    <div style="font-size:13px;line-height:1.8;color:var(--tx2)">
      <div style="font-family:'Oswald',sans-serif;font-size:16px;color:var(--tx);margin-bottom:12px">
        ACTA DE AUTOCONTROL<br>
        <span style="font-size:12px;color:var(--tx2)">Art. 20 · Decreto 111/2024</span>
      </div>
      <div><b>Agente:</b> ${cfg.nombre||'No configurado'}</div>
      <div><b>Instalación:</b> ${cfg.instalacion||'No configurada'}</div>
      <div><b>Fecha:</b> ${n.toLocaleDateString('es-ES')}</div>
      <div><b>Hora:</b> ${n.toLocaleTimeString('es-ES')}</div>
      <div class="dvd" style="margin:10px 0"></div>
      <div><b>Ítems verificados:</b> ${ok+fail} / ${total}</div>
      <div><b>Cumplimiento:</b> <span style="color:${pct>=80?'var(--gn)':pct>=60?'var(--am)':'var(--rd)'}">${pct}%</span></div>
      <div><b>Infracciones detectadas:</b> <span style="color:${fail>0?'var(--rd)':'var(--gn)'}">${fail}</span></div>
      <div class="dvd" style="margin:10px 0"></div>
      ${fail>0?`<div style="color:var(--rd);font-size:12px;margin-bottom:8px">⚠️ Se detectaron infracciones. Elaborar plan de medidas en plazo de 30 días (Art. 125 D-111/2024).</div>`:''}
      <div style="font-size:11px;margin-top:8px;color:var(--tx3)">Resolución 36/2024 · Anexo I — Lista General de Verificación y Chequeo</div>
    </div>
    <button class="btn bp" style="margin-top:14px;height:40px" onclick="document.getElementById('mo').classList.remove('on');toast('📄 Acta generada y guardada')">✅ Confirmar acta</button>`);
}

// ══ TURNO ════════════════════════════════════════════
const TICO={normal:'📋',incidente:'🚨',visita:'👤',relevo:'🔄',armamento:'🔫',ronda:'🔍'};

function cargarTurnoInst(){
  const cfg=DB.cfg();
  const el=document.getElementById('t-inst');
  if(el&&cfg.instalacion&&!el.value)el.value=cfg.instalacion;
}

function addLog(){
  const tipo=document.getElementById('t-tipo').value;
  const desc=document.getElementById('t-desc').value.trim();
  if(!desc){toast('Escriba la descripción','rd');return;}
  const n=new Date();
  DB.addLog({
    _id:Date.now(),tipo,desc,
    instalacion:document.getElementById('t-inst').value,
    turno:document.getElementById('t-tur').value,
    hora:n.toLocaleTimeString('es-ES',{hour:'2-digit',minute:'2-digit'}),
    fecha:n.toLocaleDateString('es-ES'),ts:n.toISOString()
  });
  document.getElementById('t-desc').value='';
  renderLog();toast('✅ Entrada registrada');
}

function renderLog(){
  const el=document.getElementById('log-list');
  const logs=DB.logs().slice(0,30);
  if(!logs.length){el.innerHTML='<div style="text-align:center;color:var(--tx3);padding:18px;font-size:12px">Sin novedades registradas</div>';return;}
  el.innerHTML=logs.map(e=>`
    <div class="li">
      <div class="lt">${e.hora||'—'}</div>
      <div style="font-size:15px;flex-shrink:0">${TICO[e.tipo]||'📋'}</div>
      <div class="ld">${e.desc}</div>
    </div>`).join('');
}

// ══ LEGAL ════════════════════════════════════════════
function renderLegal(q){
  const data=q?LEGAL.filter(i=>
    i.a.toLowerCase().includes(q.toLowerCase())||
    i.t.toLowerCase().includes(q.toLowerCase())||
    i.b.toLowerCase().includes(q.toLowerCase())
  ):LEGAL;
  document.getElementById('leg-list').innerHTML=data.length
    ?data.map((i,idx)=>`
      <div class="lgi" onclick="tlg(${idx})">
        <div style="display:flex;justify-content:space-between">
          <div><div class="lga">${i.a} · ${i.n}</div><div class="lgt">${i.t}</div></div>
          <span style="color:var(--tx3);font-size:12px" id="la${idx}">▼</span>
        </div>
        <div class="lgb" id="lb${idx}">${i.b}</div>
      </div>`).join('')
    :'<div style="text-align:center;color:var(--tx3);padding:20px;font-size:12px">Sin resultados</div>';
}
function tlg(idx){
  const b=document.getElementById('lb'+idx);const a=document.getElementById('la'+idx);
  const o=b.style.display==='block';b.style.display=o?'none':'block';a.textContent=o?'▼':'▲';
}

// ══ CONFIG ═══════════════════════════════════════════
function cargarCfg(){
  const c=DB.cfg();
  document.getElementById('c-nombre').value=c.nombre||'';
  document.getElementById('c-inst').value=c.instalacion||'';
  const sel=document.getElementById('c-cargo');
  if(c.cargo)[...sel.options].forEach((o,i)=>{if(o.text===c.cargo)sel.selectedIndex=i;});
  document.getElementById('ci-cnt').textContent=DB.incs().length;
  document.getElementById('ct-cnt').textContent=DB.logs().length;
  const last=DB.incs()[0];
  document.getElementById('c-last').textContent=last?`${last.fecha} ${last.hora}`:'—';
}

function guardarCfg(){
  const nombre=document.getElementById('c-nombre').value.trim();
  const inst=document.getElementById('c-inst').value.trim();
  const cargo=document.getElementById('c-cargo').value;
  if(!nombre||!inst){toast('⚠️ Complete nombre e instalación','rd');return;}
  DB.setCfg({nombre,instalacion:inst,cargo});
  document.getElementById('agente-badge').textContent=nombre;
  document.getElementById('hdr-sub').textContent=inst;
  document.getElementById('alerta-cfg').style.display='none';
  toast('✅ Configuración guardada');
}

function pedirBorrar(){
  oModal('⚠️ Borrar datos',`
    <div style="font-size:13px;color:var(--tx2);margin-bottom:16px;line-height:1.5">
      Se eliminarán <strong style="color:var(--rd)">todos los incidentes y registros</strong>
      guardados localmente. Esta acción no se puede deshacer.
    </div>
    <div style="display:flex;gap:8px">
      <button class="btn bs" style="flex:1;height:40px" onclick="document.getElementById('mo').classList.remove('on')">Cancelar</button>
      <button class="btn bd" style="flex:1;height:40px" onclick="borrarTodo()">Borrar todo</button>
    </div>`);
}

function borrarTodo(){
  S.del('sc_incs');S.del('sc_logs');S.del('sc_auto');
  document.getElementById('mo').classList.remove('on');
  updateKPIs();renderLog();
  toast('🗑️ Datos eliminados','rd');
  cargarCfg();
}

// ══ KPIs y RECIENTES ════════════════════════════════
function updateKPIs(){
  const incs=DB.incs();
  document.getElementById('k1').textContent=incs.filter(i=>i.tipo==='grave').length;
  document.getElementById('k2').textContent=incs.filter(i=>i.tipo==='menos').length;
  document.getElementById('k3').textContent=incs.filter(i=>i.tipo==='incidente').length;
  const pct=document.getElementById('ap')?.textContent;
  if(pct)document.getElementById('k4').textContent=pct;
  renderRecientes();
}

function renderRecientes(){
  const el=document.getElementById('recientes');
  const incs=DB.incs().slice(0,3);
  if(!incs.length){
    el.innerHTML='<div style="text-align:center;color:var(--tx3);padding:20px;font-size:12px">Sin registros aún</div>';return;
  }
  el.innerHTML=incs.map(i=>`
    <div class="ii" onclick="verInc(${i._id})">
      <div class="ii-ico i${i.tipo[0]}">${IICO[i.tipo]}</div>
      <div class="ii-b">
        <div class="ii-t">${i.titulo}</div>
        <div class="ii-m">${i.hora} · ${i.fecha} · ${i.instalacion}</div>
      </div>
      <span class="bdg ${IBDG[i.tipo]}">${ILBL[i.tipo]}</span>
    </div>`).join('');
}

// ══ CLOCK ════════════════════════════════════════════
function tick(){
  const n=new Date();
  document.getElementById('clk').textContent=n.toLocaleTimeString('es-ES');
  const ds=['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'];
  const ms=['enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre'];
  document.getElementById('fch').textContent=`${ds[n.getDay()]}, ${n.getDate()} de ${ms[n.getMonth()]} de ${n.getFullYear()}`;
}
setInterval(tick,1000);tick();

// ══ TOAST ════════════════════════════════════════════
function toast(msg,tipo='gn'){
  const t=document.getElementById('toast');
  t.textContent=msg;
  t.style.background=tipo==='rd'?'var(--rd)':tipo==='am'?'var(--am)':'var(--gn)';
  t.style.color=tipo==='am'?'#000':'#fff';
  t.classList.add('on');
  clearTimeout(t._t);t._t=setTimeout(()=>t.classList.remove('on'),2800);
}

// ══ INIT ═════════════════════════════════════════════
(function init(){
  const cfg=DB.cfg();
  if(cfg.nombre){
    document.getElementById('agente-badge').textContent=cfg.nombre;
    document.getElementById('hdr-sub').textContent=cfg.instalacion||'Sin instalación';
  } else {
    document.getElementById('alerta-cfg').style.display='flex';
  }
  updateKPIs();
  renderLegal('');
  // PWA install prompt
  let dp;
  window.addEventListener('beforeinstallprompt',e=>{
    e.preventDefault();dp=e;
    const b=document.createElement('button');
    b.className='btn bp bsm';b.textContent='📲 Instalar SISEP Campo';
    b.style.cssText='position:fixed;bottom:70px;right:12px;z-index:50;width:auto;box-shadow:0 4px 14px rgba(0,0,0,.5);padding:10px 14px';
    b.onclick=()=>{dp.prompt();b.remove();};
    document.body.appendChild(b);
    setTimeout(()=>{if(b.parentNode)b.remove();},12000);
  });
  // SERVICE WORKER via Blob — caché offline del propio archivo
  if('serviceWorker' in navigator){
    const sw=`
const C='sisep-campo-v1';
self.addEventListener('install',e=>{self.skipWaiting();});
self.addEventListener('activate',e=>{
  e.waitUntil(caches.keys().then(ks=>Promise.all(ks.filter(k=>k!==C).map(k=>caches.delete(k)))));
  self.clients.claim();
});
self.addEventListener('fetch',e=>{
  e.respondWith(caches.open(C).then(cache=>
    cache.match(e.request).then(r=>{
      const net=fetch(e.request).then(res=>{
        if(res.ok)cache.put(e.request,res.clone());
        return res;
      }).catch(()=>r||new Response('Offline',{status:503}));
      return r||net;
    })
  ));
});`;
    try{
      const blob=new Blob([sw],{type:'application/javascript'});
      navigator.serviceWorker.register(URL.createObjectURL(blob))
        .then(()=>console.log('[SISEP] SW activo'))
        .catch(e=>console.warn('[SISEP] SW:',e.message));
    }catch(e){console.warn('[SISEP] SW no soportado:',e.message);}
  }
})();

// ══ EXPORTAR DATOS JSON ══════════════════════════════
function exportarDatos(){
  const datos={
    exportado:new Date().toISOString(),
    agente:DB.cfg(),
    incidentes:DB.incs(),
    turno:DB.logs(),
    autocontrol:DB.auto()
  };
  const blob=new Blob([JSON.stringify(datos,null,2)],{type:'application/json'});
  const a=document.createElement('a');
  a.href=URL.createObjectURL(blob);
  a.download=`SISEP_Campo_${new Date().toISOString().slice(0,10)}.json`;
  a.click();
  toast('📥 Datos exportados como JSON');
}

// Añadir botón exportar en config al cargar
document.addEventListener('DOMContentLoaded',()=>{});
// Acceso rápido: triple tap en header exporta datos
let tapCount=0;
document.getElementById('hdr').addEventListener('click',()=>{
  tapCount++;
  setTimeout(()=>tapCount=0,600);
  if(tapCount===3){exportarDatos();}
});
</script>
</body>
</html>
