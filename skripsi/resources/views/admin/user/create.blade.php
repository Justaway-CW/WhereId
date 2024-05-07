@extends('admin.shared.layout')
@section('content')
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <div class="row mt-1">
                <div class="col-12">
                    <form action="{{ route('admin_users.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="exampleFormControlInput2" class="form-label">Display Name</label>
                            <input type="text" class="form-control" name="display_name">
                            @error('display_name')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput3" class="form-label">Username</label>
                            <input type="text" class="form-control" name="username">
                            @error('username')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput3" class="form-label">Bio</label>
                            <input type="text" class="form-control" name="bio">
                            @error('bio')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput3" class="form-label">Role</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" id="flexRadioDefault1" value="user" checked>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  User
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="role" id="flexRadioDefault2" value="admin" >
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
                            <input type="password" class="form-control" name="password">
                            @error('password')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="d-flex justify-content-end">
                            <a class="btn btn-danger mb-3 me-2" href="{{route('admin_users.index')}}">Cancel</a>
                            <button class="btn btn-success mb-3" type="submit">Submit</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
