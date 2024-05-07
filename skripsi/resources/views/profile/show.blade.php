@extends('shared.layout-wo-footer')
@section('content')
<script src="{{ url('storage/assets/script/edit-profile-script.js') }}"></script>
<div class="navbar-gradient">
    <div class="container py-4 ">
        @include('profile.shared.profile')
        @include('profile.shared.favourite')
        @include('profile.shared.modal-edit')
    </div>
</div>
@endsection
