@php
    $atSymbol = '@'; // Assign the '@' symbol to a variable
@endphp
<div class="row mx-2">
    <div class="card col-12 offset-lg-2 col-lg-8 offset-lg-2">
        <div class="row">
            <div class=" col-12 py-4 mb-3 bg-profile">
                <img class="ms-3 rounded-circle profile-photo" src="https://robohash.org/{{ $user->username }}"
                alt="{{ $user->username }}">
            </div>
            {{-- <div class="col-12">
                <hr class="mx-4">
            </div> --}}


            <div class="col-12 col-sm-6 d-flex justify-content-start">
                <div>
                    <h3 class="black ms-2">{{ $user->display_name }}</h3>
                    <p class="ms-2">{{ $atSymbol . $user->username }}</p>
                </div>

            </div>

            <div class="col-12 col-sm-6 profile-name">
                @auth
                    @if (Auth::id() === $user->id)
                        <a
                        type="button"
                        class="btn btn-outline-dark me-2"
                        href="{{ route('users.edit', $user->username) }}"
                        >
                            Edit
                        </a>
                    </button>
                    <button id="openModalEdit" data-bs-toggle="modal"
                        data-bs-target="#editModal">
                    </button>
                    @endif
                @endauth

            </div>

            <div class="col-12">
                <h5 class="fs-5 black ms-2"> Bio : </h5>
                <p class="fs-6 mx-2 justify">
                    {{ $user->bio }}
                </p>
            </div>

        </div>
    </div>

</div>
