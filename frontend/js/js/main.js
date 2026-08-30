// ==========================
// Validación formulario de contacto
// ==========================
const formContacto = document.getElementById('contacto');

if (formContacto) {
  formContacto.addEventListener('submit', (e) => {
    e.preventDefault();

    const nombre = formContacto.nombre.value.trim();
    const correo = formContacto.correo.value.trim();
    const telefono = formContacto.telefono.value.trim();
    const mensaje = formContacto.mensaje.value.trim();

    const correoRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!nombre || !correo || !telefono || !mensaje) {
      alert("Todos los campos son obligatorios");
      return;
    }

    if (!correoRegex.test(correo)) {
      alert("Correo inválido");
      return;
    }

    alert("Formulario enviado con éxito ✅");
    formContacto.reset();
  });
}

// ==========================
// Validación suscripción en footer
// ==========================
const formSuscripcion = document.getElementById('suscripcion');

if (formSuscripcion) {
  formSuscripcion.addEventListener('submit', (e) => {
    e.preventDefault();
    const email = formSuscripcion.querySelector('input[type="email"]').value.trim();
    const correoRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!correoRegex.test(email)) {
      alert("Correo inválido");
      return;
    }

    alert("¡Gracias por suscribirte!");
    formSuscripcion.reset();
  });
}

// ==========================
// Modo oscuro/claro
// ==========================
const modoBtn = document.getElementById('modo-btn');

if (modoBtn) {
  modoBtn.addEventListener('click', () => {
    document.body.classList.toggle('dark');
    if (document.body.classList.contains('dark')) {
      localStorage.setItem('modo', 'oscuro');
    } else {
      localStorage.setItem('modo', 'claro');
    }
  });

  // Cargar preferencia al inicio
  if (localStorage.getItem('modo') === 'oscuro') {
    document.body.classList.add('dark');
  }
}
const menuBtn = document.getElementById('menu-btn');
const menu = document.getElementById('menu');

if (menuBtn && menu) {
  menuBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
  });
}
