@extends('admin.master')
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
                <th scope="col">User Name</th>
                <th scope="col">Activated At</th>
                <th scope="col">Deactivated At</th>
                <th scope="col">Single Use</th>
                <th scope="col">Private</th>
                <th scope="col">Details</th>
                <th scope="col">Action</th>
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
        urlList();
    });

    function deleteRecord(id){
        $.ajax({
            type: "DELETE",
            url: `./api/delete_record/${id}`,
            dataType: "json",
            data: {
                "_token": "{{ csrf_token() }}",
            },
            success: function (response) {
                console.log(response);
                urlList()
            }
        });
    }

    function urlList(){
        $("#tbody").html('');
        $.ajax({
            type: "GET",
            url: "./api/url_list",
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
                        <td>${val.user.name}</td>
                        <td>${val.activated_at.substring(0, 10)}</td>
                        <td>${val.deactivated_at.substring(0, 10)}</td>
                        <td>${val.single_use == 1 ? 'Yes' : 'No'}</td>
                        <td>${val.is_private == 1 ? 'Yes' : 'No'}</td>
                        <td><a href="./url_details_list/${val.id}">Click here</a></td>
                        <td><button class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete?') ? deleteRecord(${val.id}) : ''; ">Delete</button></td>              
                     </tr>
                     `
                });

                $("#tbody").html(txt);
            }
        });
    }
</script>