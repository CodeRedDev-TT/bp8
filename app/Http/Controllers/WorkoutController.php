<?php

namespace App\Http\Controllers;

use App\Models\PodLap;
use App\Models\PodStation;
use App\Models\WorkoutPod;
use Illuminate\Http\Request;
use App\Models\Workout;
use App\Models\Station;
use Illuminate\Support\Facades\DB;

class WorkoutController extends Controller
{
    public function index()
    {

        $workouts = Workout::orderBy('name', 'ASC');
        $workouts = $workouts->paginate(10);

        return view('workout.index', compact('workouts'));
    }

    public function create()
    {
        $stations = DB::table("stations")
            ->leftJoin("station_categories", "stations.id", "=", "station_categories.stationid")
            ->leftjoin("categories", "station_categories.categoryid", "=", "categories.id")
            ->leftJoin("uploads", "stations.asset", "=", "uploads.id")
            ->select("stations.id", "stations.name", "uploads.file_name", "categories.name as cname")
            ->orderBy("categories.name")
            ->get();

        return view('workout.add', compact('stations'));
    }

    public function store(Request $request)
    {
        try {

//            $request->validate([
//                'name' => 'required|max:100',
//                'days' => 'required|array',
//                'asset' => 'required',
//            ]);
            
            //dd($request);

            DB::beginTransaction();
            $workout = new Workout;
            $workout->name = $request->name;
            $workout->waterbreak_frequency = $request->waterbreak_freq;
            $workout->waterbreak_time = $request->waterbreak_time;
            $workout->days = implode(",", $request->days);
            $workout->asset = $request->asset;
            $workout->save();

            $pods = $request->all();
            //dd($request->all());

            for($i = 0; $i < $request->pods; $i++){
                
                $laps = $pods['laps_'.($i+1)];
                
                for($j = 0; $j < $laps; $j++){
                    
                    $workoutLap = new PodLap;
                    $workoutLap->workoutid = $workout->id;
                    $workoutLap->pod_number = $i+1;
                    $workoutLap->save();
        
                    $workoutPod = new WorkoutPod;
                    $workoutPod->sets = $pods['sets_'.($i + 1).'_' . ($j + 1)];
                    //$workoutPod->laps = $laps;
                    $workoutPod->timesplit = json_encode($pods['timesplit_'.($i + 1).'_' . ($j + 1)]);
                    $workoutPod->workoutid = $workout->id;
                    $workoutPod->lap_id = $workoutLap->id;
                    $workoutPod->save();
        
                    for ($k = 0; $k < count($pods['stations_'.($i + 1).'_' . ($j + 1)]); $k++) {
                        $podStation = new PodStation;
                        $podStation->podid = $workoutPod->id;
                        $podStation->stationid = $pods['stations_'.($i + 1).'_' . ($j + 1)][$k];
                        $podStation->save();
                    }
                }
            }

            DB::commit();
            return redirect()->route('workout');

        }catch (\Exception $e){
            DB::rollBack();
            return redirect()->back()->withErrors(['db_error' => $e->getMessage()]);
        }
    }


    public function show(Category $category)
    {
        //
    }

    public function edit($id)
    {
        $workout = Workout::findOrFail($id);
        $laps = PodLap::where('workoutid', $id)->get();
        $pods = WorkoutPod::where('workoutid', $id)->get();
    
        $podlaps = array();
        foreach($laps as $lap){
            array_push($podlaps, $lap->pod_number);
        }
        $podlaps = array_unique($podlaps);
        $podcount = max($podlaps);
        
        $podids = array();
        foreach($pods as $pod)
            array_push($podids, $pod->id);

        $podstations = PodStation::whereIn('podid', $podids)->get();
        //$stations = Station::orderBy('name', 'ASC')->get();
        $stations = DB::table("stations")
            ->leftJoin("station_categories", "stations.id", "=", "station_categories.stationid")
            ->leftjoin("categories", "station_categories.categoryid", "=", "categories.id")
            ->leftJoin("uploads", "stations.asset", "=", "uploads.id")
            ->select("stations.id", "stations.name", "uploads.file_name", "categories.name as cname")
            ->orderBy("categories.name")
            ->get();

        return view('workout.edit', compact('workout', 'laps', 'podcount', 'pods', 'podstations', 'stations'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|max:100',
            'days' => 'required|array',
            'asset' => 'required',
        ]);

        DB::beginTransaction();
        $workout = Workout::findOrFail($id);
        $workout->name = $request->name;
        $workout->waterbreak_frequency = $request->waterbreak_freq;
        $workout->waterbreak_time = $request->waterbreak_time;
        $workout->days = implode(",", $request->days);
        $sets = $request->sets;
        $laps = $request->laps;
        $workout->asset = $request->asset;
        $workout->save();

        $pods = WorkoutPod::where('workoutid', $id)->get();
        $podids = array();
        foreach($pods as $pod)
            array_push($podids, $pod->id);

        PodStation::whereIn('podid', $podids)->delete();
        PodLap::where("workoutid",$id)->delete();
        WorkoutPod::where("workoutid",$id)->delete();

        $pods = $request->all();
    
        for($i = 0; $i < $request->pods; $i++){
        
            $laps = $pods['laps_'.($i+1)];
        
            for($j = 0; $j < $laps; $j++){
            
                $workoutLap = new PodLap;
                $workoutLap->workoutid = $workout->id;
                $workoutLap->pod_number = $i+1;
                $workoutLap->save();
            
                $workoutPod = new WorkoutPod;
                $workoutPod->sets = $pods['sets_'.($i + 1).'_' . ($j + 1)];
                //$workoutPod->laps = $laps;
                $workoutPod->timesplit = json_encode($pods['timesplit_'.($i + 1).'_' . ($j + 1)]);
                $workoutPod->workoutid = $workout->id;
                $workoutPod->lap_id = $workoutLap->id;
                $workoutPod->save();
            
                for ($k = 0; $k < count($pods['stations_'.($i + 1).'_' . ($j + 1)]); $k++) {
                    $podStation = new PodStation;
                    $podStation->podid = $workoutPod->id;
                    $podStation->stationid = $pods['stations_'.($i + 1).'_' . ($j + 1)][$k];
                    $podStation->save();
                }
            }
        }

        DB::commit();
        return redirect()->route('workout');
    }

    public function destroy($id)
    {

        $pods = WorkoutPod::where('workoutid', $id)->get();
        $podids = array();
        foreach($pods as $pod)
            array_push($podids, $pod->id);

        PodStation::whereIn('podid', $podids)->delete();
        WorkoutPod::where("workoutid",$id)->delete();

        Workout::destroy($id);

        return redirect()->route('workout');
    }
}
