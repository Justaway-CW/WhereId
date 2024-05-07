@extends('admin.shared.layout')
@section('content')
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <div class="row mt-1">
                <div class="col-12">
                    <form action="{{ route('admin_tour_objects.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="mb-3">
                            <label class="form-label">*Name</label>
                            <input type="text" class="form-control" name="name">
                            @error('name')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Tour Type</label>
                            <select name="tourtype" class="form-select" aria-label="Default select example" id="tourObjectTypeSelect">
                                <option value="" selected>Select an option...</option>
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
                            <select name="province" class="form-select" aria-label="Default select example">
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
                            <input type="number" class="form-control" name="distance" step="any">
                            @error('distance')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Price (in Rupiah)</label>
                            <input type="number" class="form-control" name="price" step="any">
                            @error('price')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Rating (out of 5)</label>
                            <input type="number" class="form-control" name="rating" step="any">
                            @error('rating')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">*Review</label>
                            <input type="number" class="form-control" name="review" >
                            @error('review')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <input type="text" class="form-control" name="description">
                            @error('description')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" name="location">
                            @error('location')
                                <span class="d-blocks fs-6 text-danger"> {{ $message }} </span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Note</label>
                            <input type="text" class="form-control" name="note">
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
                            <a class="btn btn-danger mb-3 me-2" href="{{route('admin_tour_objects.index')}}">Cancel</a>
                            <button class="btn btn-success mb-3" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
