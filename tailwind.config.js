/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./privacitat.html"],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        display: ['Poppins', 'sans-serif'],
      },
    },
  },
};
