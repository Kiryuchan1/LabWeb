<template>
    <div class="container">
        <h1 class="mt-4">Реєстрація</h1>
        <div id="registration-container" class="mt-4">
            <registration-form @form-submitted="addRow" />
        </div>

        <error-message :message="errorMessage" />

        <data-table :rows="tableData" @toggle-row="toggleRow" />
        <button @click="deleteSelected">Видалити обрані</button>
        <button @click="duplicateSelected">Дублювати обрані</button>
    </div>
</template>

<script>
import ErrorMessage from "@/ErrorMessage.vue";
import DataTable from "@/DataTable.vue";
import RegistrationForm from "@/RegistrationForm.vue";

export default {
    components: { DataTable, ErrorMessage, RegistrationForm },
    data() {
        return {
            tableData: [],
            errorMessage: "",
        };
    },
    methods: {
        addRow(data) {
            this.tableData.push(data);
        },
        deleteSelected() {
            const selectedRows = this.tableData.filter((row) => row.selected);
            for (const row of selectedRows) {
                const index = this.tableData.indexOf(row);
                this.tableData.splice(index, 1);
            }
        },
        duplicateSelected() {
            const selectedRows = this.tableData.filter((row) => row.selected);
            for (const row of selectedRows) {
                const newRow = { ...row, selected: false };
                this.tableData.push(newRow);
            }
        },
        toggleRow(row) {
            row.selected = !row.selected;
        },
    },
};
</script>