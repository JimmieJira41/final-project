<template>
    <div class="container card borderless shadow p-3">
        <form class="form-group">
            <h3>ข้อมูลพนักงาน</h3>
            <div class="row p-3">
                <div class="col">
                    <label for="username">Username</label>
                    <input
                        type="text"
                        class="form-control"
                        id="username"
                        placeholder="Username"
                    />
                </div>
                <div class="col">
                    <label for="password">Password</label>
                    <input
                        type="password"
                        class="form-control"
                        id="password"
                        placeholder="Password"
                    />
                </div>
                <div class="col">
                    <label for="permission">Permission</label>
                    <select
                        class="form-select"
                        aria-label="permission"
                    >
                        <option selected>Please select permission</option>
                        <option value="1">Admin</option>
                        <option value="2">Super Admin</option>
                    </select>
                </div>
            </div>
            <div class="row p-3">
                <div class="col">
                    <label for="name">ชื่อ</label>
                    <input
                        type="text"
                        class="form-control"
                        id="name"
                        placeholder="ชื่อ"
                    />
                </div>
            </div>
        </form>
        

    </div>
</template>
<script>
export default {};
</script>
