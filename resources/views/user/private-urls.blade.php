@extends('user.master')
@section('body')

<div class="sl-mainpanel">
    <nav class="breadcrumb sl-breadcrumb">
        <a class="breadcrumb-item" href="{{route('home')}}">URL Shortener</a>
        <span class="breadcrumb-item active">Dashboard</span>
    </nav>

    <div class="sl-pagebody">
        <table class="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Destination Url</th>
                <th scope="col">Short Url</th>
                <th scope="col">Single Use</th>
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
    $(function () {
        $.ajax({
            type: "GET",
            url: "./api/get_private_urls",
            dataType: "json",
            success: function (response) {
                console.log(response);
                let txt = '';
                $.each(response, function (i, val) { 
                     txt += `
                     <tr>
                        <th scope="row">${i+1}</th>
                        <td><a target="_blank" href="${val.destination_url}">${val.destination_url}</a></td>
                        <td><a target="_blank" href="${val.default_short_url}">${val.default_short_url}</a></td>
                        <td>${val.single_use == 1 ? 'Yes' : 'No'}</td>
                     </tr>
                     `
                });

                $("#tbody").html(txt);
            }
        });
    });
</script>