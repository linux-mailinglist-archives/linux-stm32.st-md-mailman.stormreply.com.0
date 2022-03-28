Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC954EA7F8
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6AB0C62D70;
	Tue, 29 Mar 2022 06:33:01 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9DB4C628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:55:03 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KS0dr4kkWz67Q5R;
 Tue, 29 Mar 2022 01:52:32 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 19:55:01 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <corbet@lwn.net>, <viro@zeniv.linux.org.uk>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <zohar@linux.ibm.com>
Date: Mon, 28 Mar 2022 19:50:31 +0200
Message-ID: <20220328175033.2437312-17-roberto.sassu@huawei.com>
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
Subject: [Linux-stm32] [PATCH 16/18] bpf-preload: Do kernel mount to ensure
	that pinned objects don't disappear
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

One of the differences between traditional LSMs in the security subsystem
and LSMs implemented as eBPF programs is that for the latter category it
cannot be guaranteed that they cannot be stopped.

If a pinned program is unpinned, its execution will be stopped and will not
enforce anymore its policy. For traditional LSMs this problem does not
arise as, once they are invoked by the kernel, only the LSMs themselves
decide whether or not they could be stopped.

Solve this problem by mounting the bpf filesystem from the kernel, so that
an object cannot be unpinned (a kernel mount is not accessible to user
space). This will ensure that the LSM will run until the very end of the
kernel lifecycle.

Delay the kernel mount until the security subsystem (e.g. IMA) is fully
initialized (e.g. keys loaded), so that the security subsystem can evaluate
kernel modules loaded by populate_bpffs().

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 fs/namespace.c      | 1 +
 include/linux/bpf.h | 5 +++++
 init/main.c         | 2 ++
 kernel/bpf/inode.c  | 9 +++++++++
 4 files changed, 17 insertions(+)

diff --git a/fs/namespace.c b/fs/namespace.c
index 6e9844b8c6fb..3b69f96dc641 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -31,6 +31,7 @@
 #include <uapi/linux/mount.h>
 #include <linux/fs_context.h>
 #include <linux/shmem_fs.h>
+#include <linux/bpf.h>
 #include <linux/mnt_idmapping.h>
 
 #include "pnode.h"
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index bdb5298735ce..5f624310fda2 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1103,6 +1103,8 @@ static inline void bpf_module_put(const void *data, struct module *owner)
 		module_put(owner);
 }
 
+void __init mount_bpffs(void);
+
 #ifdef CONFIG_NET
 /* Define it here to avoid the use of forward declaration */
 struct bpf_dummy_ops_state {
@@ -1141,6 +1143,9 @@ static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
 {
 	return -EINVAL;
 }
+static inline void __init mount_bpffs(void)
+{
+}
 #endif
 
 struct bpf_array {
diff --git a/init/main.c b/init/main.c
index 0c064c2c79fd..30dcd0dd9faa 100644
--- a/init/main.c
+++ b/init/main.c
@@ -99,6 +99,7 @@
 #include <linux/kcsan.h>
 #include <linux/init_syscalls.h>
 #include <linux/stackdepot.h>
+#include <linux/bpf.h>
 #include <net/net_namespace.h>
 
 #include <asm/io.h>
@@ -1638,4 +1639,5 @@ static noinline void __init kernel_init_freeable(void)
 	 */
 
 	integrity_load_keys();
+	mount_bpffs();
 }
diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index c1941c65ce95..e8361d7679d0 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -1020,3 +1020,12 @@ static int __init bpf_init(void)
 	return ret;
 }
 fs_initcall(bpf_init);
+
+static struct vfsmount *bpffs_mount __read_mostly;
+
+void __init mount_bpffs(void)
+{
+	bpffs_mount = kern_mount(&bpf_fs_type);
+	if (IS_ERR(bpffs_mount))
+		pr_err("bpffs: could not mount!\n");
+}
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
