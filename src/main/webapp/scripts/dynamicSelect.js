var roles = {
    1:['Alumno','Administrativo','Jefe de Práctica','Profesor','Egresado'],
    2:['No tiene categoria']
}


var main = document.getElementById('floatingSelectGrid1');
var sub = document.getElementById('floatingSelectGrid2');


function selectDinamico(idRol) {
    var selected_option = roles[idRol];
    while(sub.options.length > 0) {
        sub.options.remove(0);
    }
    Array.from(selected_option).forEach(function (e1) {
        let option = new Option(e1,e1);
        sub.appendChild(option);
    });
}

document.addEventListener("DOMContentLoaded", function(event) {
    selectDinamico(main.value);
});

main.addEventListener('change',function() {
    selectDinamico(this.value);
});

