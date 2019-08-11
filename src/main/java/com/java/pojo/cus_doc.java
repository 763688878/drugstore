package com.java.pojo;



import java.util.List;

public class cus_doc {
    private List<Customer> customerIds;
    private List<Doctor> doctorIds;

    public List<Customer> getCustomerIds() {
        return customerIds;
    }

    public void setCustomerIds(List<Customer> customerIds) {
        this.customerIds = customerIds;
    }

    public List<Doctor> getDoctorIds() {
        return doctorIds;
    }

    public void setDoctorIds(List<Doctor> doctorIds) {
        this.doctorIds = doctorIds;
    }
}
