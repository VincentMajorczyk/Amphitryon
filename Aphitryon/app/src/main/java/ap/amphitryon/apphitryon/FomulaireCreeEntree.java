package ap.amphitryon.apphitryon;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class FomulaireCreeEntree extends AppCompatActivity {

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
    }


}