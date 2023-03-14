/* 
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */

function check(drinkID) {
    var drinkID = document.getElementById(drinkID);
    var update = drinkID.value;
    var price = document.getElementById('checkSum').innerHTML;
    if (drinkID.checked) {
        document.getElementById('checkSum').innerHTML = parseInt(price) + parseInt(update);
    } else {
        document.getElementById('checkSum').innerHTML = parseInt(price) - parseInt(update);
    }
}

