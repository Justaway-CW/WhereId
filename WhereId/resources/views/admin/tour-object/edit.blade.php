@extends('admin.shared.layout')
@section('content')
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    $(document).ready(function() {
      // Set the value of the select input
      $('#tourObjectTypeSelect').val({{$data->tour_type_id }});
      $('#tourObjectProvinceSelect').val({{$data->province_id }});
      $('#price').val({{$data->price }});

    });
</script>

    @include('shared.warning-message')
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
                    <form action="{{ route('admin_tour_objects.update', $data->id) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('put')
                        <div class="mb-3">
                            <label class="form-label">*Name</label>
                            <input type="text" class="form-control" name="name" value="{{$data->name}}">
                            @error('name')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Tour Type</label>
                            <select name="tourtype" class="form-select" aria-label="Default select example" id="tourObjectTypeSelect">
                                <option value="">Select an option...</option>
                                @foreach ($tourTypes as $tourType)
                                    <option value="{{ $tourType->id }}">{{ $tourType->type }}</option>
                                @endforeach

                            </select>
                            @error('tourtype')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Province</label>
                            <select name="province" class="form-select" aria-label="Default select example" id="tourObjectProvinceSelect">
                                <option value="" selected>Select an option...</option>

                                @foreach ($provinces as $province)
                                    <option value="{{ $province->id }}">{{ $province->name }}</option>
                                @endforeach
                            </select>
                            @error('province')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Distance (km)</label>
                            <input type="number" class="form-control" name="distance" step="any" value="{{$data->distance}}">
                            @error('distance')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Price (in Rupiah)</label>
                            <input type="number" class="form-control" name="price" step="any" value="{{$data->price}}">
                            @error('price')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Rating (out of 5)</label>
                            <input type="number" class="form-control" name="rating" step="any" value="{{$data->rating}}">
                            @error('rating')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Review</label>
                            <input type="number" class="form-control" name="review" value="{{$data->review}}">
                            @error('review')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <input type="text" class="form-control" name="description" value="{{$data->description}}">
                            @error('description')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" name="location" value="{{$data->location}}">
                            @error('location')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Note</label>
                            <input type="text" class="form-control" name="note" value="{{$data->note}}">
                            @error('note')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="image">Picture </label>
                            <input type="file" name="image" class="form-control">
                            @error('image')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>
                        <div class="d-flex justify-content-end">
                            <a class="btn btn-danger mb-2 me-2" href="{{route('admin_tour_objects.index')}}">Cancel</a>
                            <button class="btn btn-success mb-2" type="submit">Save</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

