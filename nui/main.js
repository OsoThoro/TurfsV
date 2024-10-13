$(function() {
    $("body").hide() 
    window.addEventListener('message', function(event) {
        if (event.data.type == "update") {
            if (event.data.data.gang.name != null) {
                $("body").show(); 
                $("#content").find("span").html( event.data.data.gang.label + " - " + event.data.data.rank.label )
            }
            else {
                $("body").hide() 
            }
        }
    });
});

// Handle NUI message for updating the player's gang display
window.addEventListener('message', function(event) {
    if (event.data.action === 'updateGangDisplay') {
        document.getElementById('gang-name').innerHTML = event.data.gangName;
    }
});
