var roles = {
    1:['Alumno','Administrativo','Jefe de Práctica','Profesor','Egresado'],
    2:['No tiene categoria']
}

var main = document.getElementById('floatingSelectGrid1');
var sub = document.getElementById('floatingSelectGrid2');


main.addEventListener('change',function() {
    var selected_option = roles[this.value];
    while(sub.options.length > 0) {
        sub.options.remove(0);
    }
    Array.from(selected_option).forEach(function (e1) {
        let option = new Option(e1,e1);
        sub.appendChild(option);
    });

});