<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use illuminate\support\Facades\Auth;
class UserController extends Controller
{
    public function shorten(Request $request)
    {
        $request->validate([
            'url'               => 'required',
            'expire_after_days' => 'required',
        ]);

        $builder = new \AshAllenDesign\ShortURL\Classes\Builder();
       
        if ($request->customUrlRadio == 1) {
       
            if ($request->isSingleUse == 1) {
                if ($request->isPrivate == 1) {
                    $shortURLObject = $builder->destinationUrl($request->url)->urlKey($request->customUrl)->singleUse()->deactivateAt(\Carbon\Carbon::now()->addDays($request->expire_after_days))->privateStatus(1)->make();
                    return response()->json(['success' => $shortURLObject]);
                } else {
                    $shortURLObject = $builder->destinationUrl($request->url)->urlKey($request->customUrl)->singleUse()->deactivateAt(\Carbon\Carbon::now()->addDays($request->expire_after_days))->make();
                    return response()->json(['success' => $shortURLObject]);
                }
            } else {
                if ($request->isPrivate == 1) {
                    $shortURLObject = $builder->destinationUrl($request->url)->urlKey($request->customUrl)->deactivateAt(\Carbon\Carbon::now()->addDays($request->expire_after_days))->privateStatus(1)->make();
                    return response()->json(['success' => $shortURLObject]);
                } else {
                    $shortURLObject = $builder->destinationUrl($request->url)->urlKey($request->customUrl)->deactivateAt(\Carbon\Carbon::now()->addDays($request->expire_after_days))->make();
                    return response()->json(['success' => $shortURLObject]);
                }
            }
        } else {
            if ($request->isSingleUse == 1) {
                if ($request->isPrivate == 1) {
                    $shortURLObject = $builder->destinationUrl($request->url)->singleUse()->deactivateAt(\Carbon\Carbon::now()->addDays($request->expire_after_days))->privateStatus(1)->make();
                    return response()->json(['success' => $shortURLObject]);
                } else {
                    $shortURLObject = $builder->destinationUrl($request->url)->singleUse()->deactivateAt(\Carbon\Carbon::now()->addDays($request->expire_after_days))->make();
                    return response()->json(['success' => $shortURLObject]);
                }
            } else {
                if ($request->isPrivate == 1) {
                    $shortURLObject = $builder->destinationUrl($request->url)->deactivateAt(\Carbon\Carbon::now()->addDays($request->expire_after_days))->privateStatus(1)->make();
                    return response()->json(['success' => $shortURLObject]);
                } else {
                    $shortURLObject = $builder->destinationUrl($request->url)->deactivateAt(\Carbon\Carbon::now()->addDays($request->expire_after_days))->make();
                    return response()->json(['success' => $shortURLObject]);
                }
            }

        }

    }

    public function privateUrlList(){
        $urls = \AshAllenDesign\ShortURL\Models\ShortURL::where('user_id',Auth::id())->where('is_private',1)->get();

        return response()->json($urls);
    }

    public function urlList(){
        $urls = \AshAllenDesign\ShortURL\Models\ShortURL::with('user')->get();

        return response()->json($urls);
    }

    public function urlDetailsList($id){
        $urls = \AshAllenDesign\ShortURL\Models\ShortURLVisit::where('short_url_id',$id)->get();

        return response()->json($urls);
    }

    public function deleteRecord($id){
        $url = \AshAllenDesign\ShortURL\Models\ShortURL::find($id);
        $url->delete();
        return response()->json(['success'=>'record deleted successfully']);
    }
}
