window.onload = function () {
    
    $('#pay').click(function () {
        var identifier = $(this).attr('identifier');

        data = {
            'identifier':identifier
        };

        $.get('/pay/',data,function (response) {
            console.log(response)
            if(response.status){
                window.open(response.alipayurl,target='_self')
            }
        })
    })
    
}