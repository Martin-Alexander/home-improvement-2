module.exports = {
  purge: [
    "./app/views/**/*.html",
    "./app/views/**/*.html.erb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.jsx"
  ],
  darkMode: false, // or "media" or "class"
  theme: {
    extend: {
      spacing: {
        '84': '21rem',
        '96': '24rem',
      },
      backgroundColor: ['odd']
     }
  },
  variants: {

  },
  plugins: [],
}