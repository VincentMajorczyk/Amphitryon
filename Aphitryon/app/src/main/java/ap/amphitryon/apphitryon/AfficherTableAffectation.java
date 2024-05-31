package ap.amphitryon.apphitryon;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

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
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class AfficherTableAffectation extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_afficher_table_affectation);
        try {
            listeTables();
        } catch (IOException e) {
            e.printStackTrace();
        }
        final Button btnQuitter = (Button) findViewById(R.id.btnQUitter);
        btnQuitter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AfficherTableAffectation.this.finish();
            }
        });
    }

    public void listeTables() throws IOException {
        OkHttpClient client = new OkHttpClient();
        ArrayList arrayListTables = new ArrayList<String>();

        Request request = new Request.Builder()
                .url("http://192.168.1.76/BackApTryon/controleurs/afficherTables.php")
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
                        arrayListTables.add("Nom : " + jsonClasse.getString("NOMTABLE") +
                                "\n" + "Serveur : " + jsonClasse.getString("IDUTILISATEUR"));
                    }
                    ListView listViewTable = findViewById(R.id.listViewTable);
                    ArrayAdapter<String> arrayAdapterClasse = new
                            ArrayAdapter<String>(AfficherTableAffectation.this,
                            android.R.layout.simple_list_item_1, arrayListTables);
                    runOnUiThread(() -> {
                        listViewTable.setAdapter(arrayAdapterClasse);
                        listViewTable.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                            @Override
                            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                                String selectedItem = (String) parent.getItemAtPosition(position);
                                Intent intent = new Intent(AfficherTableAffectation.this, ModifierTableActivity.class);
                                intent.putExtra("itemClicked", selectedItem);
                                startActivity(intent);
                                Toast.makeText(AfficherTableAffectation.this, "Vous avez cliqué sur l'élément: " + parent.getItemAtPosition(position), Toast.LENGTH_SHORT).show();
                            }
                        });
                    });
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }

            public void onFailure(Call call, IOException e) {
                Log.d("Test", "erreur!!! connexion e");
            }
        });
    }
}