export const initializeMobileMenu = () => {
  const mobileMenu = document.querySelector("#mobile-menu");
  const pageContent = document.querySelector("#page-content");
  const openBurgerMenu = document.querySelector("#open-burger-menu");
  const closeBurgerMenu = document.querySelector("#close-burger-menu");

  openBurgerMenu.addEventListener("click", () => {
    mobileMenu.classList.add("flex");
    mobileMenu.classList.remove("hidden");

    pageContent.classList.add("hidden");
    pageContent.classList.remove("block");
  });

  closeBurgerMenu.addEventListener("click", () => {
    mobileMenu.classList.remove("flex");
    mobileMenu.classList.add("hidden");

    pageContent.classList.remove("hidden");
    pageContent.classList.add("block");
  });
}