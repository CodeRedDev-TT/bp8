<?php

namespace App\Http\Controllers\Api;

use App\Models\PodLap;
use App\Models\PodStation;
use App\Models\Upload;
use App\Models\WorkoutPod;
use App\Models\WorkoutTrack;
use Illuminate\Http\Request;
use App\Models\Workout;
use App\Models\Station;
use Illuminate\Support\Facades\DB;

class WorkoutController extends Controller
{
    public function getAll()
    {
        
        $workouts = Workout::orderBy('name', 'ASC')->get();
        
        return response()->json([
            'status' => true,
            'data' => $workouts,
            'message' => ''
        ]);
    }
    
    public function getWorkoutsForToday()
    {
        
        $dayOfWeek = date("l");
        
        $workouts = Workout::where("days", "like", "%$dayOfWeek%")->orderBy('name', 'ASC')->get();
        
        return response()->json([
            'status' => true,
            'data' => $workouts,
            'message' => ''
        ]);
    }
    
    //How to send this to app?
    //talk to prince for best way... Less work for front end.
    
    public function get($id)
    {
        $workout = Workout::findOrFail($id);
        $laps = PodLap::where('workoutid', $id)->get();
        $pods = WorkoutPod::where('workoutid', $id)->get();
        
        $podlaps = array();
        foreach ($laps as $lap) {
            array_push($podlaps, $lap->pod_number);
        }
        
        $podlaps = array_unique($podlaps);
        $podcount = 0;
        if (is_array($podlaps)) {
            $podcount = max($podlaps);
        }
        
        $podids = array();
        foreach ($pods as $pod) {
            array_push($podids, $pod->id);
            $pod->timesplit = json_decode($pod->timesplit);
        }
        
        $podstations = PodStation::whereIn('podid', $podids)->get();
        
        $newpods = array();
        for ($i = 0; $i < $podcount; $i++) {
            $newpod = new \stdClass();
            $newlaps = array();
            foreach ($laps as $lap) {
                foreach ($pods as $pod) {
                    if ($lap->id == $pod->lap_id && $lap->pod_number == ($i+1)) {
                        $newpod->pod_number = $lap->pod_number;
                        
                        $pstations = array();
                        foreach ($podstations as $station) {
                            if ($pod->id == $station->podid) {
                                $stationItem = Station::findOrFail($station->stationid);
                                $asset = Upload::find($stationItem->asset);
                                $station->name = $stationItem->name;
                                $station->asset = $asset;
                                array_push($pstations, $station);
                            }
                        }
                        $lap->stations = $pstations;
                        $lap->sets = $pod->sets;
                        $lap->timesplit = $pod->timesplit;
                        $lap->lap_id = $pod->lap_id;
                        array_push($newlaps, $lap);
                    }
                }
            }
            $newpod->laps = $newlaps;
            array_push($newpods, $newpod);
        }

        
        $workout->assetUrl = asset("storage/app/public/");
        $workout->asset = Upload::find($workout->asset);
        $workout->pods = $newpods;
        
        return response()->json([
            'status' => true,
            'data' => $workout,
            'message' => ''
        ]);
    }
    
    public function track(Request $request, $id)
    {
        $track = WorkoutTrack::where("guid", $request->guid)->get();
        
        if (count($track) == 0) {
            $track = new WorkoutTrack();
            $track->guid = $request->guid;
            $track->workoutid = $id;
        } else {
            $track = $track[0];
        }
        
        $track->data = json_encode($request->data);
        $track->state = $request->state;
        $track->save();
        
        return response()->json([
            'status' => true,
            'data' => $request->state,
            'message' => ''
        ]);
        
    }
    
    public function getTrack($id)
    {
        $track = WorkoutTrack::where("guid", $id)->get();
        
        return response()->json([
            'status' => true,
            'data' => $track,
            'message' => ''
        ]);
        
    }
}
