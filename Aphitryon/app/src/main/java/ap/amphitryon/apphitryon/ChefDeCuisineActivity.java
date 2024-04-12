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

public class ChefDeCuisineActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chef_de_cuisine);

        final Button buttonEntrée = (Button)findViewById(R.id.btnEntrée);
        buttonEntrée.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Appel de la fonction authentification
                Intent intent = new Intent(ChefDeCuisineActivity.this, EntrerPlat.class);
                Log.d("Test","chefCuisinier");
                startActivity(intent);
            }
        });

        final Button btnPlats = (Button)findViewById(R.id.btnPlats);
        btnPlats.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Appel de la fonction authentification
                Intent intent = new Intent(ChefDeCuisineActivity.this, PlatsPlat.class);
                Log.d("Test","chefCuisinier");
                startActivity(intent);
            }
        });

    }
}
