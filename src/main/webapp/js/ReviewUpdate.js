document.addEventListener("DOMContentLoaded", function () {
    const slider = document.querySelector('.slider');
    const images = document.querySelectorAll('.slider img');

    if (!slider || images.length === 0) {
        console.error("Slider or images not found!");
        return;
    }

    let index = 0;

    function showNextImage() {
        // Remove active class from the current image
        images[index].classList.remove('active');

        // Move to the next image
        index = (index + 1) % images.length;

        // Add active class to the next image
        images[index].classList.add('active');

        // Move the slider
        slider.style.transform = `translateX(-${index * 100}%)`;
    }

    // Automatically change images every 3 seconds
    setInterval(showNextImage, 3000);
});