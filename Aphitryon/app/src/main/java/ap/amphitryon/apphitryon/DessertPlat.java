package ap.amphitryon.apphitryon;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class DessertPlat extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dessert_plat);
        Request request = new Request.Builder()
                .url("http://192.168.1.76/BackApTryon/controleurs/afficherDesserts.php")
                .build();
        ArrayList arrayListDessert = new ArrayList<String>();
        OkHttpClient client = new OkHttpClient();

        Call call = client.newCall(request);
        call.enqueue(new Callback() {

            public  void onResponse(Call call, Response response) throws IOException {
                String responseStr = response.body().string();
                JSONArray jsonArrayClasses = null;
                Log.d("Test",responseStr);
                try {
                    jsonArrayClasses = new JSONArray(responseStr);
                    Log.d("Test",jsonArrayClasses.toString());
                    for (int i = 0; i < jsonArrayClasses.length(); i++) {
                        Log.d("Test","erreur!!! connexion impossible");
                        JSONObject jsonClasse = null;
                        jsonClasse = jsonArrayClasses.getJSONObject(i);

                        String commande = "";
                        commande += "Nom : " + jsonClasse.getString("NOMPLAT");
                        commande += " \n" +
                                "\n";
                        commande += "Descriptif :"  + jsonClasse.getString("DESCRIPTIF");
                        commande += "\n";
                        arrayListDessert.add(commande);
                    }
                    ListView listViewClasse = findViewById(R.id.lstDessert);
                    ArrayAdapter<String> arrayAdapterClasse = new
                            ArrayAdapter<String>(DessertPlat.this,
                            android.R.layout.simple_list_item_1, arrayListDessert);
                    runOnUiThread(()->{
                        listViewClasse.setAdapter(arrayAdapterClasse);
                    });
                } catch (JSONException e) {
                    e.printStackTrace();
                    Log.d("Test","erreur!!! connexion impossible");
                }
            }
            public void onFailure(Call call, IOException e)
            {
                Log.d("Test","erreur!!! connexion impossible");
            }
        });


        final Button btnquitter = (Button) findViewById(R.id.btnQuitter);
        btnquitter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DessertPlat.this.finish();
            }
        });
    }
}