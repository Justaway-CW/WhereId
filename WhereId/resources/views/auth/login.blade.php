@extends('shared.layout-wo-footer')
@section('content')
<link href="{{ url('storage/assets/styles/authPageStyles.css') }}" rel="stylesheet" crossorigin="anonymous">

    <div class="container py-4 authPage" >
        <div class="row justify-content-center">
            <div class="col-10 col-sm-8 col-md-6 col-lg-5 success-message">
                @include('shared.success-message')
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-10 col-sm-8 col-md-6 col-lg-5 card pb-5 " >
                <form class="form mt-5 mx-3" action="{{ route('login') }}" method="post">
                    @csrf
                    <h3 class="text-center text-dark">Login</h3>
                    <div class="form-group mt-3">
                        <label for="username" class="text-dark">Username:</label><br>
                        <input type="text" name="username" id="username" class="form-control">
                        @error('username')
                            <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                        @enderror
                    </div>

                    <div class="form-group mt-3">
                        <label for="password" class="text-dark">Password:</label><br>
                        <input type="password" name="password" id="password" class="form-control">
                        @error('password')
                            <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="remember-me" class="text-dark"></label><br>
                        <input type="submit" name="submit" class="btn btn-primary btn-md" value="Submit">
                    </div>
                    <div class="text-right mt-2">
                        <a href="/register" class="text-dark">Register here</a>
                    </div>
                </form>
            </div>
        </div>
    </div>


@endsection
