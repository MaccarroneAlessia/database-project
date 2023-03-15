<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSojournRequest;
use App\Http\Requests\UpdateSojournRequest;
use App\Models\Sojourn;

class SojournController extends Controller
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
     * @param  \App\Http\Requests\StoreSojournRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSojournRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Sojourn  $sojourn
     * @return \Illuminate\Http\Response
     */
    public function show(Sojourn $sojourn)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Sojourn  $sojourn
     * @return \Illuminate\Http\Response
     */
    public function edit(Sojourn $sojourn)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateSojournRequest  $request
     * @param  \App\Models\Sojourn  $sojourn
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSojournRequest $request, Sojourn $sojourn)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Sojourn  $sojourn
     * @return \Illuminate\Http\Response
     */
    public function destroy(Sojourn $sojourn)
    {
        //
    }
}
