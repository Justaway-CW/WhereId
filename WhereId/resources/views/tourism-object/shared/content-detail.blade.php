
<div class="container">
    <div class="row pt-3 pb-5">

        <div class="col-lg-6 col-12">
            <h2 class="mb-4 black">{{ $tourobject->name }}</h2>
        </div>

        <div class="clearfix"></div>

        <div class="col-lg-5 col-12 object-detail-image clipped-lg d-flex align-items-center">
            <img src="{{$tourobject->image}}" class="img-fluid rounded" alt="...">
        </div>

        <div class="col-lg-6 col-12 m-auto">
            <div class="accordion" id="accordionExample">

                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button black" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Description
                    </button>
                    </h2>

                    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p> {{ $tourobject->description }}</p>
                            @if ($tourobject->tour_type_id == 3)
                                @switch(true)
                                    @case($tourobject->price <= 25000)
                                    <p>Price : Rp0,00 - Rp25.000,00 /person</p>
                                    @break

                                    @case($tourobject->price > 25000 && $tourobject->price <= 50000)
                                    <p>Price : Rp25.000,00 - Rp50.000,00 /person</p>
                                    @break

                                    @case($tourobject->price > 50000 && $tourobject->price <= 75000)
                                    <p>Price : Rp50.000,00 - Rp75.000,00 /person</p>
                                    @break

                                    @case($tourobject->price > 75000 && $tourobject->price <= 100000)
                                    <p>Price : Rp75.000,00 - Rp100.000,00 /person</p>
                                    @break

                                    @case($tourobject->price > 100000 && $tourobject->price <= 125000)
                                    <p>Price : Rp100.000,00 - Rp125.000,00 /person</p>
                                    @break

                                    @case($tourobject->price > 125000 && $tourobject->price <= 150000)
                                    <p>Price : Rp125.000,00 - Rp150.000,00 /person</p>
                                    @break

                                    @case($tourobject->price > 150000 && $tourobject->price <= 175000)
                                    <p>Price : Rp150.000,00 - Rp175.000,00 /person</p>
                                    @break

                                    @case($tourobject->price > 175000 && $tourobject->price <= 200000)
                                    <p>Price : Rp175.000,00 - Rp200.000,00 /person</p>
                                    @break

                                    @default
                                    <p>Price : Rp200.000,00 ++ /person </p>
                                @endswitch
                            @else

                                @if ($tourobject->price == 0)
                                    <p>Entry Fee : Free</p>
                                @else
                                    <p>Entry Fee : ~{{$tourobject->price}} /person</p>
                                @endif
                            @endif

                            <p> Location : <a href="https://www.google.com/maps/search/?api=1&query={{ $tourobject->name }} {{ $tourobject->location }}" target="_blank">{{ $tourobject->location }}</a></p>
                            <p> Distance : {{ $tourobject->distance }} km from province capital ({{ $tourobject->province->capital }} city)</p>
                            <p> Rating & Review : {{ $tourobject->rating }} stars from {{ $tourobject->review }} reviews on Google Maps and TripAdvisor</p>
                            <p> Last Updated : {{ $tourobject->updated_at }}</p>
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed black" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            Note
                    </button>
                    </h2>

                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p>{{ $tourobject->note ?? '-'}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
