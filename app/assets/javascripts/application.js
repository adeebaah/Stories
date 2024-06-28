// app/assets/javascripts/application.js

document.addEventListener('DOMContentLoaded', function() {
    var checkBox = document.getElementById('check');
    var btnIcon = document.getElementById('btn');
    var cancelIcon = document.getElementById('cancel');

    checkBox.addEventListener('change', function() {
        if (checkBox.checked) {
            btnIcon.style.opacity = '0';
            btnIcon.style.visibility = 'hidden';
            cancelIcon.style.opacity = '1';
            cancelIcon.style.visibility = 'visible';
        } else {
            btnIcon.style.opacity = '1';
            btnIcon.style.visibility = 'visible';
            cancelIcon.style.opacity = '0';
            cancelIcon.style.visibility = 'hidden';
        }
    });
});
