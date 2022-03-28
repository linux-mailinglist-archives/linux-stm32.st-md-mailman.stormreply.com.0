Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C44EA7EB
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69B98C628B0;
	Tue, 29 Mar 2022 06:33:00 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86E51C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:51:13 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KS0YQ3KRMz67Q7R;
 Tue, 29 Mar 2022 01:48:42 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 19:51:11 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <corbet@lwn.net>, <viro@zeniv.linux.org.uk>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <zohar@linux.ibm.com>
Date: Mon, 28 Mar 2022 19:50:18 +0200
Message-ID: <20220328175033.2437312-4-roberto.sassu@huawei.com>
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
Subject: [Linux-stm32] [PATCH 03/18] bpf-preload: Generalize object pinning
	from the kernel
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

Rename bpf_iter_link_pin_kernel() to bpf_obj_do_pin_kernel(), to match the
user space counterpart bpf_obj_do_pin() and similarly to the latter, accept
a generic object pointer and its type, so that the preload method can pin
not only links but also maps and progs.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 kernel/bpf/inode.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index 1f2d468abf58..a9d725db4cf4 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -414,9 +414,10 @@ static const struct inode_operations bpf_dir_iops = {
 	.unlink		= simple_unlink,
 };
 
-/* pin iterator link into bpffs */
-static int bpf_iter_link_pin_kernel(struct dentry *parent,
-				    const char *name, struct bpf_link *link)
+/* pin object into bpffs */
+static int bpf_obj_do_pin_kernel(struct dentry *parent,
+				 const char *name, void *raw,
+				 enum bpf_type type)
 {
 	umode_t mode = S_IFREG | S_IRUSR;
 	struct dentry *dentry;
@@ -428,8 +429,22 @@ static int bpf_iter_link_pin_kernel(struct dentry *parent,
 		inode_unlock(parent->d_inode);
 		return PTR_ERR(dentry);
 	}
-	ret = bpf_mkobj_ops(dentry, mode, link, &bpf_link_iops,
-			    &bpf_iter_fops);
+
+	switch (type) {
+	case BPF_TYPE_PROG:
+		ret = bpf_mkprog(dentry, mode, raw);
+		break;
+	case BPF_TYPE_MAP:
+		ret = bpf_mkmap(dentry, mode, raw);
+		break;
+	case BPF_TYPE_LINK:
+		ret = bpf_mklink(dentry, mode, raw);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
 	dput(dentry);
 	inode_unlock(parent->d_inode);
 	return ret;
@@ -726,8 +741,8 @@ static int populate_bpffs(struct dentry *parent)
 		goto out_put;
 	for (i = 0; i < BPF_PRELOAD_LINKS; i++) {
 		bpf_link_inc(objs[i].link);
-		err = bpf_iter_link_pin_kernel(parent,
-					       objs[i].link_name, objs[i].link);
+		err = bpf_obj_do_pin_kernel(parent, objs[i].link_name,
+					    objs[i].link, BPF_TYPE_LINK);
 		if (err) {
 			bpf_link_put(objs[i].link);
 			goto out_put;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
