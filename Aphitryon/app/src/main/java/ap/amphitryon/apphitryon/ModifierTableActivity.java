package ap.amphitryon.apphitryon;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.io.IOException;
import java.util.ArrayList;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class ModifierTableActivity extends AppCompatActivity {

    String responseStr ;
    OkHttpClient client = new OkHttpClient();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setContentView(R.layout.activity_modifier_table);
        super.onCreate(savedInstanceState);
        String table = getIntent().getStringExtra("itemClicked");
        Log.d("Test", table);
        ArrayList<String> lstInfos = new ArrayList<String>();
        String[] arr = table.split("[:;\n]");
        for (String s : arr) {
            s = s.replaceAll("\\s+", "");
            lstInfos.add(s);
            Log.d("Test",s);
        }

        final EditText textDate = findViewById(R.id.tbxDate);
        final EditText textService = findViewById(R.id.tbxService);
        final EditText textNomTable = findViewById(R.id.tbxNomTable);
        final EditText textNombrePlace = findViewById(R.id.tbxNbPlace);

        textDate.setText(lstInfos.get(5));
        textService.setText(lstInfos.get(7));
        textNomTable.setText(lstInfos.get(1));
        textNombrePlace.setText(lstInfos.get(3));

        final Button btnquitter = (Button) findViewById(R.id.btnRetour);
        btnquitter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ModifierTableActivity.this.finish();
            }
        });

        final Button btnConfirmerCreationTable = (Button)findViewById(R.id.btnConfirmerModif);
        btnConfirmerCreationTable.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Appel de la fonction authentification
                try {
                    modifierTable();
                    ModifierTableActivity.this.finish();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
    }


    public void modifierTable() throws IOException {
        final EditText textDate = findViewById(R.id.tbxDate);
        final EditText textService = findViewById(R.id.tbxService);
        final EditText textNomTable = findViewById(R.id.tbxNomTable);
        final EditText textNbPlaces = findViewById(R.id.tbxNbPlace);


        RequestBody formBody = new FormBody.Builder()
                .add("DATEE", textDate.getText().toString())
                .add("IDSERVICE",  textService.getText().toString())
                .add("NOMTABLE",  textNomTable.getText().toString())
                .add("NBPLACE",  textNbPlaces.getText().toString())
                .build();

        Request request = new Request.Builder()
                .url("http://192.168.1.76/BackApTryon/controleurs/modifierTable.php")
                .post(formBody)
                .build();

        Call call = client.newCall(request);
        call.enqueue(new Callback() {
            public  void onResponse(Call call, Response response) throws IOException {
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