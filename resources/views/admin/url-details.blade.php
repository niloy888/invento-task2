@extends('admin.master')
@section('body')

<div class="sl-mainpanel">
    <nav class="breadcrumb sl-breadcrumb">
        <a class="breadcrumb-item" href="{{route('home')}}">URL Shortener</a>
        <span class="breadcrumb-item active">Details</span>
    </nav>

    <div class="sl-pagebody">
        <table class="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">IP Address</th>
                <th scope="col">Operating System</th>
                <th scope="col">Operating System Version</th>
                <th scope="col">Browser</th>
                <th scope="col">Device Type</th>
                <th scope="col">Visited At</th>
              </tr>
            </thead>
            <tbody id="tbody">
              
            </tbody>
          </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"
    integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
    $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
    });

    $(function () {
        let id = "<?php echo $id ?>"
        urlDetailsList(id);
        console.log(id);
    });

    function urlDetailsList(id){
        $("#tbody").html('');
        $.ajax({
            type: "GET",
            url: `../api/url_details_list/${id}`,
            dataType: "json",
            success: function (response) {
                console.log(response);
                let txt = '';
                $.each(response, function (i, val) { 
                     txt += `
                     <tr>
                        <th scope="row">${i+1}</th>
                        <td>${val.ip_address}</td>
                        <td>${val.operating_system}</td>
                        <td>${val.operating_system_version}</td>
                        <td>${val.browser}</td>
                        <td>${val.device_type}</td>
                        <td>${val.visited_at.substring(0, 10)}</td>
                     </tr>
                     `
                });

                $("#tbody").html(txt);
            }
        });
    }
</script>