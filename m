Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D624EA7F4
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A45C62D4D;
	Tue, 29 Mar 2022 06:33:01 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AC06C628A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:53:46 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KS0d716hCz67bVy;
 Tue, 29 Mar 2022 01:51:55 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 19:53:44 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <corbet@lwn.net>, <viro@zeniv.linux.org.uk>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <zohar@linux.ibm.com>
Date: Mon, 28 Mar 2022 19:50:27 +0200
Message-ID: <20220328175033.2437312-13-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220328175033.2437312-1-roberto.sassu@huawei.com>
References: <20220328175033.2437312-1-roberto.sassu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.204.63.22]
X-ClientProxiedBy: lhreml754-chm.china.huawei.com (10.201.108.204) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 29 Mar 2022 06:32:58 +0000
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 12/18] bpf-preload: Implement new registration
	method for preloading eBPF programs
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The current registration method consisting in setting the bpf_preload_ops
global variable is not suitable for preloading multiple eBPF programs, as
each eBPF program would overwrite the global variable with its own method.

Implement a new registration method in two steps. First, introduce
bpf_init_preload_list() to populate at kernel initialization time the new
linked list with an element for each of the desired eBPF programs to
preload.

Second, introduce bpf_preload_set_ops() to allow an eBPF program to set its
preload method in the corresponding item of the linked list. The condition
for a successful registration is that the item in the linked list should
already exist. Return a boolean value to report if registration was
successful or not.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 include/linux/bpf_preload.h |   7 +++
 kernel/bpf/inode.c          | 107 +++++++++++++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/include/linux/bpf_preload.h b/include/linux/bpf_preload.h
index e604933b3daa..bdbe75c22fcb 100644
--- a/include/linux/bpf_preload.h
+++ b/include/linux/bpf_preload.h
@@ -19,12 +19,19 @@ extern struct bpf_preload_ops *bpf_preload_ops;
 
 int bpf_obj_do_pin_kernel(struct dentry *parent, const char *name, void *raw,
 			  enum bpf_type type);
+bool bpf_preload_set_ops(const char *name, struct module *owner,
+			 struct bpf_preload_ops *ops);
 #else
 static inline int bpf_obj_do_pin_kernel(struct dentry *parent, const char *name,
 					void *raw, enum bpf_type type)
 {
 	return -EOPNOTSUPP;
 }
+
+static inline bool bpf_preload_set_ops(const char *name, struct module *owner,
+				       struct bpf_preload_ops *ops)
+{
+}
 #endif /*CONFIG_BPF_SYSCALL*/
 
 #endif
diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index 0a6e83d32360..440ea517cc29 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -22,6 +22,8 @@
 #include <linux/bpf_trace.h>
 #include <linux/bpf_preload.h>
 
+static char *bpf_preload_list_str;
+
 static void *bpf_any_get(void *raw, enum bpf_type type)
 {
 	switch (type) {
@@ -855,6 +857,100 @@ static struct file_system_type bpf_fs_type = {
 	.kill_sb	= kill_litter_super,
 };
 
+static struct bpf_preload_ops_item *
+bpf_preload_list_lookup_entry(const char *obj_name)
+{
+	struct bpf_preload_ops_item *cur;
+
+	list_for_each_entry(cur, &preload_list, list)
+		if (!strcmp(obj_name, cur->obj_name))
+			return cur;
+
+	return NULL;
+}
+
+static int bpf_preload_list_add_entry(const char *obj_name,
+				      struct bpf_preload_ops *ops)
+{
+	struct bpf_preload_ops_item *new;
+
+	if (!*obj_name)
+		return 0;
+
+	new = kzalloc(sizeof(*new), GFP_NOFS);
+	if (!new)
+		return -ENOMEM;
+
+	new->obj_name = kstrdup(obj_name, GFP_NOFS);
+	if (!new->obj_name) {
+		kfree(new);
+		return -ENOMEM;
+	}
+
+	new->ops = ops;
+
+	list_add(&new->list, &preload_list);
+	return 0;
+}
+
+bool bpf_preload_set_ops(const char *obj_name, struct module *owner,
+			 struct bpf_preload_ops *ops)
+{
+	struct bpf_preload_ops_item *found_item;
+	bool set = false;
+
+	mutex_lock(&bpf_preload_lock);
+
+	found_item = bpf_preload_list_lookup_entry(obj_name);
+	if (found_item) {
+		if (!found_item->ops ||
+		    (found_item->ops && found_item->ops->owner == owner)) {
+			found_item->ops = ops;
+			set = true;
+		}
+	}
+
+	mutex_unlock(&bpf_preload_lock);
+	return set;
+}
+EXPORT_SYMBOL_GPL(bpf_preload_set_ops);
+
+static int __init bpf_init_preload_list(void)
+{
+	char *str_ptr = bpf_preload_list_str, *str_end;
+	struct bpf_preload_ops_item *cur, *tmp;
+	char obj_name[NAME_MAX + 1];
+	int ret;
+
+	while (str_ptr && *str_ptr) {
+		str_end = strchrnul(str_ptr, ',');
+
+		snprintf(obj_name, sizeof(obj_name), "%.*s",
+			 (int)(str_end - str_ptr), str_ptr);
+
+		if (!bpf_preload_list_lookup_entry(obj_name)) {
+			ret = bpf_preload_list_add_entry(obj_name, NULL);
+			if (ret)
+				goto out;
+		}
+
+		if (!*str_end)
+			break;
+
+		str_ptr = str_end + 1;
+	}
+
+	return 0;
+out:
+	list_for_each_entry_safe(cur, tmp, &preload_list, list) {
+		list_del(&cur->list);
+		kfree(cur->obj_name);
+		kfree(cur);
+	}
+
+	return ret;
+}
+
 static int __init bpf_init(void)
 {
 	int ret;
@@ -864,8 +960,17 @@ static int __init bpf_init(void)
 		return ret;
 
 	ret = register_filesystem(&bpf_fs_type);
-	if (ret)
+	if (ret) {
 		sysfs_remove_mount_point(fs_kobj, "bpf");
+		return ret;
+	}
+
+	ret = bpf_init_preload_list();
+	if (ret) {
+		unregister_filesystem(&bpf_fs_type);
+		sysfs_remove_mount_point(fs_kobj, "bpf");
+		return ret;
+	}
 
 	return ret;
 }
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
