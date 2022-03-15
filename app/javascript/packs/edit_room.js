function kaydır() {
    window.scrollTo(0,document.body.scrollHeight);
}

function onlyOneCheckBox(limit) {
    var limit = limit;
    var checkboxgroup = document.getElementById('checkboxgroup').getElementsByTagName("input");
    for (var i = 0; i < checkboxgroup.length; i++) {
        checkboxgroup[i].onclick = function() {
            var checkedcount = 0;
            for (var i = 0; i < checkboxgroup.length; i++) {
                checkedcount += (checkboxgroup[i].checked) ? 1 : 0;
            }
            if (checkedcount > limit) {
                console.log("You can select maximum of " + limit + " checkbox.");
                alert("You can select maximum of " + limit + " checkbox.");
                this.checked = false;
            }
        }
    }
}
