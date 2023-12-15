<template>
    <div>
        <table>
            <thead>
            <tr>
                <th></th>
                <th>Email</th>
                <th>Прізвище</th>
                <th>Ім’я</th>
                <th>По батькові</th>
                <th>Дата народження</th>
                <th>Група</th>
                <th>Стать</th>
                <th>Номер телефону</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(row, index) in rows" :key="index">
                <td>
                    <input type="checkbox" v-model="row.selected" />
                </td>
                <td>{{ row.email }}</td>
                <td>{{ row.lastName }}</td>
                <td>{{ row.firstName }}</td>
                <td>{{ row.middleName }}</td>
                <td>{{ row.birthDate }}</td>
                <td>{{ row.group }}</td>
                <td>{{ row.gender }}</td>
                <td>{{ row.phone }}</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
export default {
    props: {
        rows: Array,
    },
    methods: {
        deleteSelected() {
            const selectedRows = this.rows.filter((row) => !row.selected);
            this.$emit('toggle-row', selectedRows);
        },
        duplicateSelected() {
            const selectedRows = this.rows.filter((row) => row.selected);
            for (const selectedRow of selectedRows) {
                const newRow = { ...selectedRow, selected: false };
                this.$emit('add-row', newRow);
            }
        },
    },
};
</script>