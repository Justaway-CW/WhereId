@extends('admin.shared.layout')
@section('content')
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <div class="row mt-1">
                <div class="col-12">
                    <form action="{{ route('admin_tour_types.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="exampleFormControlInput2" class="form-label">Keyname</label>
                            <input type="text" class="form-control" name="keyname">
                            @error('keyname')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput3" class="form-label">Type</label>
                            <input type="text" class="form-control" name="type">
                            @error('type')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror

                        </div>

                        <div class="d-flex justify-content-end">
                            <a class="btn btn-danger mb-3 me-2" href="{{route('admin_tour_types.index')}}">Cancel</a>
                            <button class="btn btn-success mb-3" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
