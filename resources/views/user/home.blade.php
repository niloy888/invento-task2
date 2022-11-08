@extends('user.master')
@section('body')

<div class="sl-mainpanel">
    <nav class="breadcrumb sl-breadcrumb">
        <a class="breadcrumb-item" href="{{route('home')}}">URL Shortener</a>
        <span class="breadcrumb-item active">Dashboard</span>
    </nav>

    <div class="sl-pagebody">

       
        <div class="container col-md-6">
            <form id="pickurlform">
                @csrf
                <div class="form-group">
                    <label for="url">Link</label>
                    <input type="text" class="form-control" name="url" id="url" placeholder="Enter the link here">

                </div>
                <div class="form-group">
                    <label for="expire_after_days">Expire After (Days)</label>
                    <input type="number" min="1" class="form-control" name="expire_after_days" id="expire_after_days" value="1">
                </div>
                <div class="form-group">
                    <label for="">Private URL</label><br>

                    <div class="form-group form-check-inline">
                        <input checked class="form-group-input" type="radio" name="isPrivate" id="inlineRadio1"
                            value="0">
                        <label class="form-group-label" for="inlineRadio1">No</label>
                    </div>
                    <div class="form-group form-check-inline">
                        <input class="form-group-input" type="radio" name="isPrivate" id="inlineRadio2" value="1">
                        <label class="form-group-label" for="inlineRadio2">Yes</label>
                    </div>

                </div>
                <div class="form-group">
                    <label for="">Single Use</label><br>

                    <div class="form-group form-check-inline">
                        <input checked class="form-group-input" type="radio" name="isSingleUse" id="isSingleUseRadio1"
                            value="0">
                        <label class="form-group-label" for="isSingleUseRadio1">No</label>
                    </div>
                    <div class="form-group form-check-inline">
                        <input class="form-group-input" type="radio" name="isSingleUse" id="isSingleUseRadio2" value="1">
                        <label class="form-group-label" for="isSingleUseRadio2">Yes</label>
                    </div>

                </div>
                <div class="form-group">
                    <label for="">Custom URL</label><br>

                    <div class="form-group form-check-inline">
                        <input checked class="form-group-input" type="radio" name="customUrlRadio" id="customurlno"
                            value="0">
                        <label class="form-group-label" for="customurlno">No</label>
                    </div>
                    <div class="form-group form-check-inline">
                        <input class="form-group-input" type="radio" name="customUrlRadio" id="customurlyes" value="1">
                        <label class="form-group-label" for="customurlyes">Yes</label>
                    </div>
                    <div class="form-group customUrl" style="display: none">
                        <input class="form-control" type="text" name="customUrl" placeholder="try your custom url">

                    </div>
                    <div class="alert alert-danger errormsg" role="alert" style="display: none">
                    </div>
                    <div class="alert alert-success successmsg" role="alert" style="display: none">
                    </div>

                </div>
                <button type="submit" id="pickurlbtn" class="btn btn-primary">Next</button>
            </form>

            <div class="result" style="display: none">
                <div class="form-group">
                    <input readonly type="url" id="resulturl" class="form-control mb-2" >
                    {{-- <a target="_blank" href="" ></a> --}}
                    <button onclick="copyurl()" type="button" class="btn btn-primary">Copy URL</button>
                </div>

            </div> 
        </div>

    </div><!-- sl-pagebody -->
</div>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"
    integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
    $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
    });

        
    $("form").submit(function (e) { 
        e.preventDefault();
        $(".errormsg").hide();

        // $(this).find("button[type='submit']").prop('disabled',true);
        $.ajax({
        type: "POST",
        url: "./api/shorten",
        data: new FormData(this),
        dataType: "json",
        processData: false,
        contentType: false,
        success: function (response) {

                console.log(response);
                $(".successmsg").show();
                $(".successmsg").html('Url shortened successfully');
                $("#pickurlbtn").hide();
                $(".result").show();
                $("#resulturl").val(response.success.default_short_url);
            
            },
            error: function(jqXHR, textStatus, errorThrown){
                $(".errormsg").show();
                $(".errormsg").html(jqXHR.responseJSON.message);
                console.log(jqXHR);
            }
        });
    });

 
    function copyurl() {
        var copyText = document.getElementById("resulturl");
        copyText.select();  
        document.execCommand('copy');
    }

    $("input[name='customUrlRadio']").change(function (e) { 
        // alert(this.value)
        if (this.value == 1) {
            $(".customUrl").show();
        }
        else{
            $(".customUrl").hide();

        }
        
    });
    
</script>