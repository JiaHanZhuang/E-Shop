
function showLoginForm(){
    $('#loginModal1 .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');
        });

        $('.modal-title').html('Login with');
    });
    $('.error').removeClass('alert alert-danger').html('');
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal1').modal('show');
    }, 230);

}

function showLoginForm1(){
    $('#loginModal2 .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');
        });

        $('.modal-title').html('Login with');
    });
    $('.error').removeClass('alert alert-danger').html('');
}

function openLoginModal1(){
    showLoginForm1();
    setTimeout(function(){
        $('#loginModal2').modal('show');
    }, 230);

}


function IntoExcel() {
    showLoginFormExcel();
    setTimeout(function(){
        $('#uploadingModel').modal('show');
    }, 230);
}

function showLoginFormExcel(){
    $('#uploadingModel .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');
        });

        $('.modal-title').html('Login with');
    });
    $('.error').removeClass('alert alert-danger').html('');
}

