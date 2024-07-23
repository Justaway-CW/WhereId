<section class="section1">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 pe-5 mt-5 mb-5">
                <h1 class="display-1 text-uppercase">Where to go?</h1>
                <p class="fs-4 my-4 pb-2">Recommendation System for Tourism Destination in Indonesia</p>
                <div class="d-flex align-items-center position-relative ">
                    {{-- <input type="text" name="email" placeholder="Find your destination"
                        class="form-control bg-white border-0 rounded-4 shadow-none px-4 py-3 w-100"> --}}

                    <select class="form-select bg-white border-0 rounded-4 shadow-none px-4 py-3 w-100 "
                        aria-label="Default select example" id="provinceInputSelect1">
                        <option value="" selected>Select your destination</option>
                        @foreach ($provinces as $province)
                            <option value="{{ $province->keyname }}">{{ $province->name }}</option>
                        @endforeach
                    </select>
                    <button id="openModal1" onclick="autoInputProvince()" data-bs-toggle="modal"
                        data-bs-target="#inputModal"
                        class="btn btn-primary rounded-4 px-3 py-2 position-absolute align-items-center m-1 end-0 ">
                        <span class="fas fa-search"> </span>
                    </button>
                </div>
            </div>
            <div class="col-md-6">
                {{-- <img src="{{ url('storage/assets/images/homeimage.png') }}" alt="img" class="img-fluid"> --}}
                <img src="https://drive.google.com/thumbnail?id=1IOy4i1bwipXnFShtsNnIWm5JzGmkA01i&amp;sz=w1000" alt="img" class="img-fluid rounded-circle">
            </div>
        </div>
    </div>
</section>
