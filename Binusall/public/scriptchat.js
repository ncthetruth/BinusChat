    var modals = document.getElementsByClassName("myModal");
    var modalOpenBtn = document.getElementsByClassName("myBtn");
    var currentModal = null;

    // Function to open modal by id
    function openModal(id) {
    for (i = 0; i < modals.length; i++) {
        if (modals[i].getAttribute('id') == id) {
        currentModal = modals[i];
        currentModal.style.display = "block";
        break;
        }
    }
    }

    // When the user clicks the button, open modal with the same id
    modalOpenBtn.onclick = function() {
    let currentID = modalOpenBtn.getAttribute('id');
    openModal(currentID);
    }