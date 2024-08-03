package com.example.qrcodeandroid;

import static android.app.Activity.RESULT_OK;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;

import com.journeyapps.barcodescanner.CaptureActivity;

import org.godotengine.godot.Godot;
import org.godotengine.godot.plugin.GodotPlugin;
import org.godotengine.godot.plugin.SignalInfo;
import org.godotengine.godot.plugin.UsedByGodot;

import java.util.HashSet;
import java.util.Set;

public class QRCodeAndroid extends GodotPlugin {

    private static final int REQUEST_CODE_SCAN = 1;
    public Activity activity;
    public SignalInfo qrdata = new SignalInfo("qrdata", String.class);
    public QRCodeAndroid(Godot godot){
        super(godot);
        activity = getActivity();
    }

    @NonNull
    public String getPluginName() {
        return "QRCodeAndroid";
    }

    @NonNull
    @Override
    public Set<SignalInfo> getPluginSignals() {
        HashSet<SignalInfo> signals = new HashSet<>();
        signals.add(qrdata);
        return signals;
    }

    public void onMainActivityResult(int requestCode, int resultCode, Intent data) {
        super.onMainActivityResult(requestCode,resultCode,data);
        emitSignal(qrdata.getName(),"+++++++++++++++++++++++++++++");
        if(resultCode == RESULT_OK){
            emitSignal(qrdata.getName(),"+++++++++++++++++++++++++++++2");
            if (requestCode == REQUEST_CODE_SCAN){
                emitSignal(qrdata.getName(),"+++++++++++++++++++++++++++++3");
                String result = data.getStringExtra("SCAN_RESULT");
                //发射信号,拿到扫描返回值
                emitSignal(qrdata.getName(),result);
            }
        }
    }


    @UsedByGodot
    public String getQRCodeAndroid(){
        emitSignal(qrdata.getName(),"/-/-/-/-/-/-/-/-/-/-/-/-//-/-");

        Intent intent = new Intent(activity, CaptureActivity.class);
        activity.startActivityForResult(intent,REQUEST_CODE_SCAN);
        return "Hello QRCodeAndroid";
    }
}
