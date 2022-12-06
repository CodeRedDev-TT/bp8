<?php

namespace App\Http\Controllers;

use App\Models\Station;
use App\Models\Category;
use App\Models\StationCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StationController extends Controller
{

    public function index()
    {

        $stations = DB::table("stations")
                    ->leftJoin("station_categories", "stations.id", "=", "station_categories.stationid")
                    ->leftjoin("categories", "station_categories.categoryid", "=", "categories.id")
                    ->select("stations.id", "stations.name", "stations.asset", "categories.name as cname")
                    ->orderBy("categories.name")
                    ->paginate(10);
        //$stations = $stations->paginate(10);
        
        //dd($stations);

        return view('station.index', compact('stations'));
    }


    public function create()
    {
        $categories = Category::orderBy('name', 'ASC')->get();

        return view('station.add', compact('categories'));
    }


    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:100',
            'categories' => 'required',
            'asset' => 'required'
        ]);

        try {
            DB::beginTransaction();
            $station = new Station;
            $station->name = $request->name;
            $station->asset = $request->asset;
            $station->save();

            foreach ($request->categories as $category) {
                $stationCategory = new StationCategory;
                $stationCategory->stationid = $station->id;
                $stationCategory->categoryid = $category;
                $stationCategory->save();
            }
            DB::commit();
            return redirect()->route('station');

        }catch (\Exception $e){
            DB::rollBack();
            return redirect()->back()->withErrors(['db_error' => $e->getMessage()]);
        }

    }


    public function show()
    {
        //
    }


    public function edit($id)
    {
        $categories = Category::orderBy('name', 'ASC')->get();
        $station = Station::findOrFail($id);
        $stationcategories = StationCategory::where("stationid", $id)->pluck('categoryid')->toArray();

        return view('station.edit', compact('station', 'stationcategories', 'categories'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|max:100',
            'categories' => 'required',
            'asset' => 'required'
        ]);

        try {
            DB::beginTransaction();

            $station = Station::findOrFail($id);
            $station->name = $request->name;
            $station->asset = $request->asset;
            $station->save();

            StationCategory::where("stationid", $id)->delete();

            foreach ($request->categories as $category) {
                $stationCategory = new StationCategory;
                $stationCategory->stationid = $station->id;
                $stationCategory->categoryid = $category;
                $stationCategory->save();
            }
            DB::commit();
            return redirect()->route('station');

        }catch (\Exception $e){
            DB::rollBack();
            return redirect()->back()->withErrors(['db_error' => $e->getMessage()]);
        }
    }


    public function destroy($id)
    {
        Station::destroy($id);
        return redirect()->route('station');
    }
}
