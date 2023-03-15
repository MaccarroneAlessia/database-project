<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorePrivateServiceRequest;
use App\Http\Requests\UpdatePrivateServiceRequest;
use App\Models\PrivateService;

class PrivateServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StorePrivateServiceRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePrivateServiceRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PrivateService  $privateService
     * @return \Illuminate\Http\Response
     */
    public function show(PrivateService $privateService)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PrivateService  $privateService
     * @return \Illuminate\Http\Response
     */
    public function edit(PrivateService $privateService)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdatePrivateServiceRequest  $request
     * @param  \App\Models\PrivateService  $privateService
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePrivateServiceRequest $request, PrivateService $privateService)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PrivateService  $privateService
     * @return \Illuminate\Http\Response
     */
    public function destroy(PrivateService $privateService)
    {
        //
    }
}
