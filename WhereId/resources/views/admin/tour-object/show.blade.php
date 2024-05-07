@extends('admin.shared.layout')
@section('content')
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <div class="row mt-1 justify-content-center">


                <div class="col-5 d-flex  mb-1">
                    <img src="{{$data->image}}" class="img-fluid rounded" alt="...">
                </div>
                <div class="col-12 mb-3 d-flex justify-content-center">
                    <span class="fs-4">Image</span>
                </div>
                <div class="col-12">

                        <div class="mb-3">
                            <label class="form-label">Id</label>
                            <input type="text" class="form-control" name="id" value="{{$data->id}}" disabled>
                            @error('id')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" class="form-control" name="name" value="{{$data->name}}" disabled>
                            @error('name')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Tour Type</label>
                            <input type="text" class="form-control" disabled name="tourtype" value="{{ $data->tour_type_id }} - {{$data->tourType->type}}">
                            @error('tourtype')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Province</label>
                            <input type="text" class="form-control"disabled  name="province" value="{{ $data->province_id }} - {{$data->province->name}}">

                            @error('province')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Distance (km)</label>
                            <input type="number" class="form-control" disabled name="distance" step="any" value="{{$data->distance}}">
                            @error('distance')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Price</label>
                            <input type="number" class="form-control" disabled name="distance" step="any" value="{{$data->price}}">
                            @error('price')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Rating (out of 5)</label>
                            <input type="number" class="form-control" disabled name="rating" step="any" value="{{$data->rating}}">
                            @error('rating')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Review</label>
                            <input type="number" class="form-control" disabled name="review" value="{{$data->review}}">
                            @error('review')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <input type="text" class="form-control" disabled name="description" value="{{$data->description}}">
                            @error('description')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" disabled name="location" value="{{$data->location}}">
                            @error('location')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Note</label>
                            <input type="text" class="form-control" disabled name="note" value="{{$data->note}}">
                            @error('note')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="d-flex justify-content-end">
                            <a class="btn btn-secondary mb-2" href="{{route('admin_tour_objects.index')}}">Back</a>
                        </div>

                </div>
            </div>
        </div>
    </div>
@endsection
