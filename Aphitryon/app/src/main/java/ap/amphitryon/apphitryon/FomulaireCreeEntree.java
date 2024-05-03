package ap.amphitryon.apphitryon;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.RadioGroup;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class FomulaireCreeEntree extends AppCompatActivity {
    String responseStr ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fomulaire_cree_entree);

        final Button btnquitter = (Button) findViewById(R.id.btnannuler);
        btnquitter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FomulaireCreeEntree.this.finish();
            }
        });

        final RadioGroup idplat = findViewById(R.id.radioGroup);
        final EditText nomPlat = findViewById(R.id.tbxnom);
        final EditText descriptif = findViewById(R.id.tbxdescript);


        RequestBody formBody = new FormBody.Builder()
                .add("IDPLAT", String.valueOf(idplat.getCheckedRadioButtonId()))
                .add("NOMPLAT", nomPlat.getText().toString())
                .add("DESCRIPTIF",  descriptif.getText().toString())
                .build();

        Log.d("Test", formBody.toString());
        Request request = new Request.Builder()
                .url("http://10.100.0.6/~mnicolas/BackApTryon/controleurs/creePlats.php")
                .post(formBody)
                .build();

        Log.d("Test", formBody.toString());
        ArrayList arrayListDessert = new ArrayList<String>();
        OkHttpClient client = new OkHttpClient();

        Call call = client.newCall(request);
        call.enqueue(new Callback() {

            public  void onResponse(Call call, Response response) throws IOException {

                responseStr = response.body().string();
                Log.d("Test",responseStr);
                if (responseStr.compareTo("false")!=0){

                } else {
                    Log.d("Test","Login ou mot de  passe non valide !");
                }
            }

            public void onFailure(Call call, IOException e) {
                Log.d("Test", "Erreur lors de la connexion : " + e.getMessage()); // Enregistrement de l'erreur dans les journaux
                e.printStackTrace(); // Affichage de la pile d'appels pour obtenir plus d'informations sur l'erreur
            }

        });

    }

}