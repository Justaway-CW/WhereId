
@extends('admin.shared.layout')
@section('content')


    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <div class="row mt-1">
                <div class="col-12">

                        <div class="mb-3">
                            <label for="exampleFormControlInput2" class="form-label">Id</label>
                            <input type="text" class="form-control" name="id" value="{{$data->id}}" disabled>
                            @error('id')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput2" class="form-label">Display Name</label>
                            <input type="text" class="form-control" name="display_name" value="{{$data->display_name}}" disabled>
                            @error('display_name')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput3" class="form-label">Username</label>
                            <input type="text" class="form-control" name="username" value="{{$data->username}}" disabled>
                            @error('username')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput3" class="form-label">Bio</label>
                            <input type="text" class="form-control" name="bio" value="{{$data->bio}}" disabled>
                            @error('bio')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput3" class="form-label">Role</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" id="flexRadioDefault1" value="user" disabled>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  User
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" id="flexRadioDefault2" value="admin" disabled>
                                <label class="form-check-label" for="flexRadioDefault2">
                                  Admin
                                </label>
                              </div>
                            @error('role')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput3" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" value="{{$data->password}}" disabled>
                            @error('password')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>
                        <div class="d-flex justify-content-end">
                            <a class="btn btn-secondary mb-2" href="{{route('admin_users.index')}}">Back</a>
                        </div>

                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload = function() {
            const role = "{{ $data->role }}";
            if (role == "user"){
                document.getElementById('flexRadioDefault1').checked = true;
            }else if (role == "admin"){
                document.getElementById('flexRadioDefault2').checked = true;
            }
        }
    </script>
@endsection

