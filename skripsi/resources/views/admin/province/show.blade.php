@extends('admin.shared.layout')
@section('content')
<div class="card border-0 shadow-sm rounded">
    <div class="card-body">
    <div class="row mt-1">
        <div class="col-12">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Id</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" value="{{ $data->id }}" disabled>
            </div>

            <div class="mb-3">
                <label for="exampleFormControlInput2" class="form-label">Keyname</label>
                <input type="text" class="form-control" id="exampleFormControlInput2" value="{{ $data->keyname }}" disabled>
              </div>

              <div class="mb-3">
                <label for="exampleFormControlInput3" class="form-label">Name</label>
                <input type="text" class="form-control" id="exampleFormControlInput3" value="{{ $data->name }}" disabled>
              </div>

              <div class="d-flex justify-content-end">
                <a class="btn btn-secondary mb-2" href="{{route('admin_provinces.index')}}">Back</a>
            </div>
        </div>
    </div>
    </div>
</div>
@endsection
