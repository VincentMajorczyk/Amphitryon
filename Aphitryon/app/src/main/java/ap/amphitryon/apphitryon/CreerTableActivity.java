package ap.amphitryon.apphitryon;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

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

public class CreerTableActivity extends AppCompatActivity {
    String responseStr ;
    OkHttpClient client = new OkHttpClient();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_creer_table);

        final Button btnquitter = (Button) findViewById(R.id.btnRetour);
        btnquitter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                CreerTableActivity.this.finish();
            }
        });


        final Button btnConfirmerCreationTable = (Button)findViewById(R.id.btnConfirmer);
        btnConfirmerCreationTable.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Appel de la fonction authentification
                try {
                    ajouterTable();
                    CreerTableActivity.this.finish();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });


        Request request = new Request.Builder()
                .url("http://192.168.1.76/BackApTryon/controleurs/afficherServices.php")
                .build();
        ArrayList arrayListServices = new ArrayList<String>();
        OkHttpClient client = new OkHttpClient();

        Call call = client.newCall(request);
        call.enqueue(new Callback() {

            public void onResponse(Call call, Response response) throws IOException {
                String responseStr = response.body().string();
                JSONArray jsonArrayServices = null;
                Log.d("Test", responseStr);
                try {
                    jsonArrayServices = new JSONArray(responseStr);
                    Log.d("Test", jsonArrayServices.toString());
                    for (int i = 0; i < jsonArrayServices.length(); i++) {
                        Log.d("Test", "erreur!!! connexion impossible");
                        JSONObject jsonService = null;
                        jsonService = jsonArrayServices.getJSONObject(i);
                        arrayListServices.add(jsonService.getString("IDSERVICE"));
                    }
                    Spinner dropdown = findViewById(R.id.spinnerService);
                    ArrayAdapter<String> adapter = new ArrayAdapter<String>(CreerTableActivity.this,
                            android.R.layout.simple_spinner_dropdown_item, arrayListServices);
                    runOnUiThread(()->{
                        dropdown.setAdapter(adapter);
                    });
                    dropdown.setAdapter(adapter);
                } catch (JSONException e) {
                    e.printStackTrace();
                    Log.d("Test", "erreur!!! connexion impossible");
                }
            }

            public void onFailure(Call call, IOException e) {
                Log.d("Test", "erreur!!! connexion impossible");
            }
        });
    }
    public void ajouterTable() throws IOException {
        final EditText textDate = findViewById(R.id.tbxDate);
        final Spinner textService = findViewById(R.id.spinnerService);
        final EditText textNomTable = findViewById(R.id.tbxNomTable);
        final EditText textNbPlaces = findViewById(R.id.tbxNbPlace);


        RequestBody formBody = new FormBody.Builder()
                .add("DATEE", textDate.getText().toString())
                .add("IDSERVICE",  textService.getSelectedItem().toString())
                .add("NOMTABLE",  textNomTable.getText().toString())
                .add("NBPLACE",  textNbPlaces.getText().toString())
                .build();

        Request request = new Request.Builder()
                .url("http://192.168.1.76/BackApTryon/controleurs/creerTable.php")
                .post(formBody)
                .build();

        Call call = client.newCall(request);
        call.enqueue(new Callback() {
            public  void onResponse(Call call, Response response) throws IOException {
                Log.d("Test", call.toString());
                responseStr = response.body().string();
                Log.d("Test",responseStr + "1");
            }

            public void onFailure(Call call, IOException e) {
                Log.d("Test", "Erreur lors de la connexion : " + e.getMessage()); // Enregistrement de l'erreur dans les journaux
                e.printStackTrace(); // Affichage de la pile d'appels pour obtenir plus d'informations sur l'erreur
            }

        });






    }
}