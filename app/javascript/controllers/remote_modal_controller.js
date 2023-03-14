import { Controller } from "@hotwired/stimulus"
import { Modal } from 'flowbite';

var modal;
// Connects to data-controller="remote-modal"
export default class extends Controller {
  connect() {
    const targetEl = document.getElementById('remotemodal');
    modal = new Modal(targetEl);
    modal.show();
  }

  close() {
    modal.hide();
  }
}
