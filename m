Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 326404EA7F3
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA3A3C62D33;
	Tue, 29 Mar 2022 06:33:00 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06C7AC628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:53:45 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KS0cL000Bz67mcQ;
 Tue, 29 Mar 2022 01:51:13 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 19:53:43 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <corbet@lwn.net>, <viro@zeniv.linux.org.uk>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <zohar@linux.ibm.com>
Date: Mon, 28 Mar 2022 19:50:26 +0200
Message-ID: <20220328175033.2437312-12-roberto.sassu@huawei.com>
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
Subject: [Linux-stm32] [PATCH 11/18] bpf-preload: Store multiple
	bpf_preload_ops structures in a linked list
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

In preparation to support preloading multiple eBPF programs, define a
linked list of bpf_preload_ops_item structures. The new structure contains
the object name from the eBPF program to preload (except for iterators_bpf
whose kernel module name is bpf_preload, the object name and the kernel
module name should match).

The new structure also contains a bpf_preload_ops structure declared in the
light skeleton, with the preload method of the eBPF program.

The list of eBPF programs that can be preloaded can be specified in a
subsequent patch from the kernel configuration or with the new option
bpf_preload_list= in the kernel command line.

For now, bpf_preload is always preloaded, as it still relies on the old
registration method consisting in setting the bpf_preload_ops global
variable. That will change when bpf_preload will switch to the new
registration method based on the linked list.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 kernel/bpf/inode.c | 89 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 16 deletions(-)

diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index bb8762abbf3d..0a6e83d32360 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -685,35 +685,91 @@ static int bpf_parse_param(struct fs_context *fc, struct fs_parameter *param)
 struct bpf_preload_ops *bpf_preload_ops;
 EXPORT_SYMBOL_GPL(bpf_preload_ops);
 
-static bool bpf_preload_mod_get(void)
+struct bpf_preload_ops_item {
+	struct list_head list;
+	struct bpf_preload_ops *ops;
+	char *obj_name;
+};
+
+static LIST_HEAD(preload_list);
+static DEFINE_MUTEX(bpf_preload_lock);
+
+static bool bpf_preload_mod_get(const char *obj_name,
+				struct bpf_preload_ops **ops)
 {
-	/* If bpf_preload.ko wasn't loaded earlier then load it now.
-	 * When bpf_preload is built into vmlinux the module's __init
+	/* If the kernel preload module wasn't loaded earlier then load it now.
+	 * When the preload code is built into vmlinux the module's __init
 	 * function will populate it.
 	 */
-	if (!bpf_preload_ops) {
-		request_module("bpf_preload");
-		if (!bpf_preload_ops)
+	if (!*ops) {
+		mutex_unlock(&bpf_preload_lock);
+		request_module(obj_name);
+		mutex_lock(&bpf_preload_lock);
+		if (!*ops)
 			return false;
 	}
 	/* And grab the reference, so the module doesn't disappear while the
 	 * kernel is interacting with the kernel module and its UMD.
 	 */
-	if (!try_module_get(bpf_preload_ops->owner)) {
+	if (!try_module_get((*ops)->owner)) {
 		pr_err("bpf_preload module get failed.\n");
 		return false;
 	}
 	return true;
 }
 
-static void bpf_preload_mod_put(void)
+static void bpf_preload_mod_put(struct bpf_preload_ops *ops)
 {
-	if (bpf_preload_ops)
-		/* now user can "rmmod bpf_preload" if necessary */
-		module_put(bpf_preload_ops->owner);
+	if (ops)
+		/* now user can "rmmod <kernel module>" if necessary */
+		module_put(ops->owner);
 }
 
-static DEFINE_MUTEX(bpf_preload_lock);
+static bool bpf_preload_list_mod_get(void)
+{
+	struct bpf_preload_ops_item *cur;
+	bool ret = false;
+
+	ret |= bpf_preload_mod_get("bpf_preload", &bpf_preload_ops);
+
+	list_for_each_entry(cur, &preload_list, list)
+		ret |= bpf_preload_mod_get(cur->obj_name, &cur->ops);
+
+	return ret;
+}
+
+static int bpf_preload_list(struct dentry *parent)
+{
+	struct bpf_preload_ops_item *cur;
+	int err;
+
+	if (bpf_preload_ops) {
+		err = bpf_preload_ops->preload(parent);
+		if (err)
+			return err;
+	}
+
+	list_for_each_entry(cur, &preload_list, list) {
+		if (!cur->ops)
+			continue;
+
+		err = cur->ops->preload(parent);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static void bpf_preload_list_mod_put(void)
+{
+	struct bpf_preload_ops_item *cur;
+
+	list_for_each_entry(cur, &preload_list, list)
+		bpf_preload_mod_put(cur->ops);
+
+	bpf_preload_mod_put(bpf_preload_ops);
+}
 
 static int populate_bpffs(struct dentry *parent)
 {
@@ -724,12 +780,13 @@ static int populate_bpffs(struct dentry *parent)
 	 */
 	mutex_lock(&bpf_preload_lock);
 
-	/* if bpf_preload.ko wasn't built into vmlinux then load it */
-	if (!bpf_preload_mod_get())
+	/* if kernel preload mods weren't built into vmlinux then load them */
+	if (!bpf_preload_list_mod_get())
 		goto out;
 
-	err = bpf_preload_ops->preload(parent);
-	bpf_preload_mod_put();
+	err = bpf_preload_list(parent);
+	bpf_preload_list_mod_put();
+
 out:
 	mutex_unlock(&bpf_preload_lock);
 	return err;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
