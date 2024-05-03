package ap.amphitryon.apphitryon;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
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

public class AfficherTableActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_afficher_table);
        try {
            listeTables();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void listeTables() throws IOException {
        OkHttpClient client = new OkHttpClient();
        ArrayList arrayListTables = new ArrayList<String>();

        Request request = new Request.Builder()
                .url("http://10.100.0.6/~mnicolas/BackApTryon/controleurs/afficherTables.php")
                .build();

        Call call = client.newCall(request);
        call.enqueue(new Callback() {

            public void onResponse(Call call, Response response) throws IOException {
                String responseStr = response.body().string();
                JSONArray jsonArraytables = null;
                try {
                    jsonArraytables = new JSONArray(responseStr);
                    for (int i = 0; i < jsonArraytables.length(); i++) {
                        JSONObject jsonClasse = null;
                        jsonClasse = jsonArraytables.getJSONObject(i);
                        arrayListTables.add(jsonClasse.getString("NOMTABLE"));
                    }
                    ListView listViewTable = findViewById(R.id.listViewTable);
                    ArrayAdapter<String> arrayAdapterClasse = new
                            ArrayAdapter<String>(AfficherTableActivity.this,
                            android.R.layout.simple_list_item_1, arrayListTables);
                    runOnUiThread(() -> {
                        listViewTable.setAdapter(arrayAdapterClasse);
                    });
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }

            public void onFailure(Call call, IOException e) {
                Log.d("Test", "erreur!!! connexion impossible");
            }
        });
    }
}