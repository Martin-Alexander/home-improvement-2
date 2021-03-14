require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import { initializeComments } from "../initializers/comments";
import { initializeMobileMenu } from "../mobile_menu";

document.addEventListener("turbolinks:load", () => {
  initializeComments();
  initializeMobileMenu();
});
