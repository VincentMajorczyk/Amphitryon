package ap.amphitryon.apphitryon;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.IOException;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class MainActivity extends AppCompatActivity {
    String responseStr ;
    OkHttpClient client = new OkHttpClient();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button buttonValiderAuthentification = (Button)findViewById(R.id.btnConnex);
        buttonValiderAuthentification.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Appel de la fonction authentification
                try {
                    authentification();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });


    }	public void authentification() throws IOException {

        final EditText textLogin = findViewById(R.id.editTextMail);
        final EditText textMdp = findViewById(R.id.editTextPassword);

        RequestBody formBody = new FormBody.Builder()
                .add("login", textLogin.getText().toString())
                .add("mdp",  textMdp.getText().toString())
                .build();

        Request request = new Request.Builder()
                .url("http://192.168.1.76/BackApTryon/controleurs/authentification.php")
                .post(formBody)
                .build();

        Call call = client.newCall(request);
        call.enqueue(new Callback() {

            public  void onResponse(Call call, Response response) throws IOException {

                responseStr = response.body().string();
                Log.d("Test",responseStr);
                if (responseStr.compareTo("false")!=0){
                    try {
                        JSONObject etudiant = new JSONObject(responseStr);
                        Log.d("Test",etudiant.getString("PRENOM") + " est  connecté");
                        if(etudiant.getString("POSTE").compareTo("ChefCuisinier")==0) {
                            Intent intent = new Intent(MainActivity.this, ChefDeCuisineActivity.class);
                            intent.putExtra("utilisateur", etudiant.toString());
                            Log.d("Test","chefCuisinier");
                            startActivity(intent);
                        }
                        if(etudiant.getString("POSTE").compareTo("ChefSalle")==0) {
                            Intent intent = new Intent(MainActivity.this, ChefDeSalleActivity.class);
                            intent.putExtra("utilisateur", etudiant.toString());
                            Log.d("Test","ChefSalle");
                            startActivity(intent);
                        }
                        if(etudiant.getString("POSTE").compareTo("Serveur")==0) {
                            Intent intent = new Intent(MainActivity.this, ChefDeSalleActivity.class);
                            intent.putExtra("utilisateur", etudiant.toString());
                            Log.d("Test","Serveur");
                            startActivity(intent);
                        }
                    }
                    catch(JSONException e){
                        Log.d("Test",e.getMessage());
                        // Toast.makeText(MainActivity.this, "Erreur de connexion !!!! !", Toast.LENGTH_SHORT).show();
                    }
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
