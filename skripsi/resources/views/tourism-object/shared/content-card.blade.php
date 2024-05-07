<div class="navbar-gradient">

    <div class="container mb-5">
        <div class="row justify-content-evenly pt-3 mb-3">
            <div class="col-5 col-lg-3">
                <select class="form-select" aria-label="Default select example" id="provinceInputSelect" disabled>
                    <option value="" selected>Province</option>
                    @foreach ($provincesData as $province)
                        <option value="{{ $province->keyname }}">{{ $province->name }}</option>
                    @endforeach
                </select>
                <span class="d-blocks fs-6 text-danger ms-1" id="provinceError"></span>
            </div>

            <div class="col-4 offset-3 col-lg-3 offset-lg-4">
                <select class="form-select" aria-label="Default select example" id="tourObjectTypeSelect" disabled>
                    <option value="" selected>Type</option>
                    @foreach ($tourTypes as $tourType)
                        <option value="{{ $tourType->keyname }}">{{ $tourType->type }}</option>
                    @endforeach
                </select>
                <span class="d-blocks fs-6 text-danger ms-1" id="typeError"></span>
            </div>
        </div>


        <div class="row justify-content-evenly">
            <hr>
            @forelse ($recommendations as $recommendation)
                <div class="col-lg-5 mt-3">
                    <div class="card">
                        <div class="row no-gutters">
                            <div class="col-auto d-flex align-items-center clipped-img">
                                <img src="{{$recommendation['image']}}" class="card-img" alt="Image">
                            </div>
                            <div class="col-md-12">
                                <div class="card-body">
                                    <a class="black" href="{{ route('tourismobject.detail', $recommendation['id']) }}">
                                        <h5 class="card-title black">#{{ $recommendation['rank'] }} - {{ $recommendation['name'] }}</h5>
                                    </a>
                                    <p class="card-text">Rank Value : {{ $recommendation['rankVal'] }}%</p>
                                    <p class="card-text">{{ $recommendation['rating'] }} stars out of {{ $recommendation['review'] }} reviews</p>
                                    <p class="card-text">{{ $recommendation['location'] }}</p>

                                    <div class="row">
                                        <div class="col-3 d-flex">
                                            @include('shared.fav-btn')
                                        </div>
                                        <div class="col-9 d-flex justify-content-end">
                                            Last Updated : {{ $recommendation['updated_at'] }}
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            @empty
                <p class="text-center mt-4 fs-5 black">No Data Found!</p>
            @endforelse

        </div>
    </div>
</div>
