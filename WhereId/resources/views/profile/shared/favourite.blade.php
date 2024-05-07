<div class="row mx-2 mt-4">
    <div class="card col-12 offset-lg-2 col-lg-8 offset-lg-2 mb-5">
        <h3 class="my-4 ms-2 black">My Favourite</h3>


        @forelse ($favs as $fav)
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4 d-flex align-items-center clipped-fav">
                        <img src="{{$fav->image}}"
                            class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <div class="row justify-content-between">
                                <div class="col-10">
                                    <a class="detail-href" href="{{ route('tourismobject.detail', $fav->id) }}"><h5 class="card-title black">{{ $fav->name }}</h5></a>
                                </div>

                                <div class="col-2 d-flex justify-content-end">

                                    @auth
                                        @if (Auth::id() === $user->id)
                                            <form method="POST"
                                            action="{{ route('unfavourite', ['id' => $fav->id, 'from' => 0]) }}">
                                            @csrf
                                            <button type="submit" class="fw-light nav-link fs-6"> <span
                                                    class="fas fa-heart" style="color: red">
                                                </span> </button>
                                            </form>
                                        @endif
                                    @endauth
                                </div>

                                <div class="col-12">
                                    <p class="card-text">{{ $fav->location }}</p>
                                    <p class="card-text">{{ $fav->pivot->note }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        @empty
            <hr>
            <p class="text-center mt-4 fs-5 black pb-2">No Data Found!</p>
        @endforelse
    </div>
</div>
