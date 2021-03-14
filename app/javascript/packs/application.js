require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import { initializeComments } from "../initializers/comments";

document.addEventListener("turbolinks:load", () => {
  initializeComments();
});
