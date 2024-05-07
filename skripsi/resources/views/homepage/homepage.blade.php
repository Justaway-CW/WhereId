@extends('layout')
@section('content')
    <script src="{{ url('storage/assets/script/homepage-script.js') }}"></script>

    @include('homepage.shared.section-1')
    @include('homepage.shared.section-2')
    @include('homepage.shared.modal-input')
@endsection
