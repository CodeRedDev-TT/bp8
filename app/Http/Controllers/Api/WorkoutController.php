<?php

namespace App\Http\Controllers\Api;

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

    public function get($id){
        $workout = Workout::findOrFail($id);
        $pods = WorkoutPod::where('workoutid', $id)->get();

        $podids = array();
        foreach($pods as $pod)
            array_push($podids, $pod->id);

        $podstations = PodStation::whereIn('podid', $podids)->get();

        foreach($pods as $pod){
            $pstations = array();
            foreach($podstations as $station){
                if($pod->id == $station->podid) {
                    $stationItem = Station::findOrFail($station->stationid);
                    $asset = Upload::find($stationItem->asset);
                    $station->name = $stationItem->name;
                    $station->asset = $asset;
                    array_push($pstations, $station);
                }
            }
            $pod->stations = $pstations;
        }

        $workout->assetUrl = asset("storage/app/public/");
        $workout->asset = Upload::find($workout->asset);
        $workout->pods = $pods;

        return response()->json([
            'status' => true,
            'data' => $workout,
            'message' => ''
        ]);
    }

    public function track(Request $request, $id){
        $track = WorkoutTrack::where("guid", $request->guid)->get();

        if(count($track) == 0){
            $track = new WorkoutTrack();
            $track->guid = $request->guid;
            $track->workoutid = $id;
        }else{
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

    public function getTrack($id){
        $track = WorkoutTrack::where("guid", $id)->get();

        return response()->json([
            'status' => true,
            'data' => $track,
            'message' => ''
        ]);

    }
}
