/* 
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */

function chooseTable(id) {
    var table = document.getElementById(id);
    var information = document.getElementById('information');
    if (table.name == 0) {
        table.name = 2;
        table.style.backgroundColor = '#765852';
        information.value += id + " ";
    } else {
        table.name = 0;
        table.style.backgroundColor = '#614504';
        information.value = information.value.replace(id + " ", "");
    }
}

function check() {
    var people = document.getElementById('people').value;
    var num = 0;
    var buttons = document.getElementsByTagName('button');
    for (var i = 0, len = buttons.length; i < len; i++) {
        if (buttons[i].name == 2) {
            num += buttons[i].values;
        }
    }
    if (num < people) {
        if (confirm("Don't book enough seat for " + people + " people\nDo you want to continue?")) {
            return true;
        } else {
            return false;
        }
    } else {
        return true;
    }
}
