var roles = {
    1:['Alumno','Administrativo','Jefe de práctica','Profesor','Egresado'],
    2:['No tiene categoria']
}

var newsub = document.getElementById('floatingInputGrid100')?document.getElementById('floatingInputGrid100').value:"";
var main = document.getElementById('floatingSelectGrid1');
var sub = document.getElementById('floatingSelectGrid2');


function selectDinamico(idRol) {
    var selected_option = roles[idRol];
    while(sub.options.length > 0) {
        sub.options.remove(0);
    }
    Array.from(selected_option).forEach(function (e1) {
        let option = new Option(e1,e1);
        if (newsub!=="" && newsub===e1) {
            option.selected = true;
            newsub = "";
        }
        sub.appendChild(option);
    });
}

document.addEventListener("DOMContentLoaded", function(event) {
    selectDinamico(main.value);
});

main.addEventListener('change',function() {
    selectDinamico(this.value);
});

