from django import forms
from .models import Car, Maintenance

class CarForm(forms.ModelForm):
    class Meta:
        model = Car
        fields = ['make', 'model', 'year', 'color', 'vin']

class MaintenanceForm(forms.ModelForm):
    class Meta:
        model = Maintenance
        fields = ['date', 'service_type', 'mileage', 'notes', 'cost', 'receipt']
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if 'mileage' in self.fields:
            self.fields['mileage'].widget.attrs.update({
                'class': 'form-control',
                'placeholder': 'e.g., 45000',
                'inputmode': 'numeric',
            })
