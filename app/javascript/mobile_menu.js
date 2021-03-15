export const initializeMobileMenu = () => {
  const mobileMenu      = document.querySelector("#mobile-menu");
  const pageContent     = document.querySelector("#page-content");
  const openBurgerMenu  = document.querySelector("#open-burger-menu");
  const closeBurgerMenu = document.querySelector("#close-burger-menu");

  const closeMobileMenu = () => {
    mobileMenu.classList.remove("flex");
    mobileMenu.classList.add("hidden");

    pageContent.classList.remove("hidden");
    pageContent.classList.add("block");
  }

  const openMobileMenu = () => {
    mobileMenu.classList.add("flex");
    mobileMenu.classList.remove("hidden");

    pageContent.classList.add("hidden");
    pageContent.classList.remove("block");
  }

  openBurgerMenu.addEventListener("click", openMobileMenu);
  closeBurgerMenu.addEventListener("click", closeMobileMenu);
  document.addEventListener("turbolinks:before-render", closeMobileMenu);
}
