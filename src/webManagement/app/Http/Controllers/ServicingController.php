<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreServicingRequest;
use App\Http\Requests\UpdateServicingRequest;
use App\Models\Servicing;

class ServicingController extends Controller
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
     * @param  \App\Http\Requests\StoreServicingRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreServicingRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Servicing  $servicing
     * @return \Illuminate\Http\Response
     */
    public function show(Servicing $servicing)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Servicing  $servicing
     * @return \Illuminate\Http\Response
     */
    public function edit(Servicing $servicing)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateServicingRequest  $request
     * @param  \App\Models\Servicing  $servicing
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateServicingRequest $request, Servicing $servicing)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Servicing  $servicing
     * @return \Illuminate\Http\Response
     */
    public function destroy(Servicing $servicing)
    {
        //
    }
}
