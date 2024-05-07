@extends('shared.layout-wo-footer')
@section('content')
<script src="{{ url('storage/assets/script/comment-script.js') }}"></script>
<div class="navbar-gradient">
    @include('tourism-object.shared.content-detail')
    @include('tourism-object.shared.comment-section')
</div>
@endsection
