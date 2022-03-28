Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF04EA7F5
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8DAC62D59;
	Tue, 29 Mar 2022 06:33:01 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F13BC628A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:53:47 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KS0cN3jGnz67w73;
 Tue, 29 Mar 2022 01:51:16 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 19:53:45 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <corbet@lwn.net>, <viro@zeniv.linux.org.uk>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <zohar@linux.ibm.com>
Date: Mon, 28 Mar 2022 19:50:28 +0200
Message-ID: <20220328175033.2437312-14-roberto.sassu@huawei.com>
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
Subject: [Linux-stm32] [PATCH 13/18] bpf-preload: Move pinned links and maps
	to a dedicated directory in bpffs
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

With support for preloading multiple eBPF programs, any map, link or prog
will appear in the bpf filesystem. To identify which eBPF program a pinned
object belongs to, create a subdir for each eBPF program preloaded and
place the pinned object in the new subdir.

Keep the pinned objects of iterators_bpf in the root directory of bpffs,
for compatibility reasons.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 kernel/bpf/inode.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index 440ea517cc29..619cdef0ba54 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -740,9 +740,30 @@ static bool bpf_preload_list_mod_get(void)
 	return ret;
 }
 
+static struct dentry *create_subdir(struct dentry *parent, const char *name)
+{
+	struct dentry *dentry;
+	int err;
+
+	inode_lock(parent->d_inode);
+	dentry = lookup_one_len(name, parent, strlen(name));
+	if (IS_ERR(dentry))
+		goto out;
+
+	err = vfs_mkdir(&init_user_ns, parent->d_inode, dentry, 0755);
+	if (err) {
+		dput(dentry);
+		dentry = ERR_PTR(err);
+	}
+out:
+	inode_unlock(parent->d_inode);
+	return dentry;
+}
+
 static int bpf_preload_list(struct dentry *parent)
 {
 	struct bpf_preload_ops_item *cur;
+	struct dentry *cur_parent;
 	int err;
 
 	if (bpf_preload_ops) {
@@ -755,7 +776,19 @@ static int bpf_preload_list(struct dentry *parent)
 		if (!cur->ops)
 			continue;
 
-		err = cur->ops->preload(parent);
+		cur_parent = parent;
+
+		if (strcmp(cur->obj_name, "bpf_preload")) {
+			cur_parent = create_subdir(parent, cur->obj_name);
+			if (IS_ERR(cur_parent))
+				cur_parent = parent;
+		}
+
+		err = cur->ops->preload(cur_parent);
+
+		if (cur_parent != parent)
+			dput(cur_parent);
+
 		if (err)
 			return err;
 	}
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
