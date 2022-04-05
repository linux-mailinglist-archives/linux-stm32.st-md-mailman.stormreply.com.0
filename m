Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8DA4F331F
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Apr 2022 15:11:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5200C6048F;
	Tue,  5 Apr 2022 13:11:31 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D33F6C60479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 13:11:30 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KXnyW2G6Cz685VR;
 Tue,  5 Apr 2022 21:08:35 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 5 Apr 2022 15:11:28 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <corbet@lwn.net>, <viro@zeniv.linux.org.uk>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <kpsingh@kernel.org>,
 <tixxdz@gmail.com>, <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <zohar@linux.ibm.com>
Date: Tue, 5 Apr 2022 15:11:16 +0200
Message-ID: <20220405131116.3810418-1-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <CACYkzJ7ZVbL2MG7ugmDEfogSPAHkYYMCHxRO_eBCJJmBZyn6Rw@mail.gmail.com>
References: <CACYkzJ7ZVbL2MG7ugmDEfogSPAHkYYMCHxRO_eBCJJmBZyn6Rw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.204.63.22]
X-ClientProxiedBy: lhreml754-chm.china.huawei.com (10.201.108.204) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [POC][USER SPACE][PATCH] Introduce LSM to protect
	pinned objects
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

Introduce a new LSM to protect pinned objects in a bpf filesystem
instance. This is useful for example to ensure that an LSM will always
enforce its policy, even despite root tries to unload the corresponding
eBPF program.

Achieve the protection by denying inode unlink and unmount of the
protected bpf filesystem instance. Since protected inodes hold a
reference of the link of loaded programs (e.g. LSM hooks), denying
operations on them will prevent the ref count of the links from reaching
zero, ensuring that the programs remain always active.

Enable the protection only for the instance created by the user space
counterpart of the LSM, and don't interfere with other instances, so
that their behavior remains unchanged.

Suggested-by: Djalal Harouni <tixxdz@gmail.com>
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 .gitignore       |  4 +++
 Makefile         | 18 ++++++++++++++
 bpffs_lsm_kern.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 bpffs_lsm_user.c | 60 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 Makefile
 create mode 100644 bpffs_lsm_kern.c
 create mode 100644 bpffs_lsm_user.c

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 000000000000..7fa02964f1dc
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,4 @@
+*.o
+vmlinux.h
+bpffs_lsm_kern.skel.h
+bpffs_lsm_user
diff --git a/Makefile b/Makefile
new file mode 100644
index 000000000000..c3d805759db3
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+all: bpffs_lsm_user
+
+clean:
+	rm -rf bpffs_lsm.skel.h vmlinux.h bpffs_lsm_kern.o bpffs_lsm_user
+
+vmlinux.h:
+	/usr/sbin/bpftool btf dump file /sys/kernel/btf/vmlinux format c > \
+			  vmlinux.h
+
+bpffs_lsm_kern.skel.h: bpffs_lsm_kern.o
+	bpftool gen skeleton $< > $@
+
+bpffs_lsm_kern.o: bpffs_lsm_kern.c vmlinux.h
+	clang -Wall -Werror -g -O2 -target bpf -c $< -o $@
+
+bpffs_lsm_user: bpffs_lsm_user.c bpffs_lsm_kern.skel.h bpffs_lsm_kern.o
+	cc -Wall -Werror -g -o $@ $< -lbpf
diff --git a/bpffs_lsm_kern.c b/bpffs_lsm_kern.c
new file mode 100644
index 000000000000..b3ccb2a75c95
--- /dev/null
+++ b/bpffs_lsm_kern.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Huawei Technologies Duesseldorf GmbH
+ *
+ * Authors:
+ * Roberto Sassu <roberto.sassu@huawei.com>
+ *
+ * Implement an LSM to protect a bpf filesystem instance.
+ */
+
+#include "vmlinux.h"
+#include <errno.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include <bpf/bpf_core_read.h>
+
+char _license[] SEC("license") = "GPL";
+
+uint32_t monitored_pid = 0;
+
+struct {
+	__uint(type, BPF_MAP_TYPE_INODE_STORAGE);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__type(key, int);
+	__type(value, sizeof(uint8_t));
+} inode_storage_map SEC(".maps");
+
+SEC("lsm/sb_set_mnt_opts")
+int BPF_PROG(sb_set_mnt_opts, struct super_block *sb, void *mnt_opts,
+	     unsigned long kern_flags, unsigned long *set_kern_flags)
+{
+	u32 pid;
+
+	pid = bpf_get_current_pid_tgid() >> 32;
+	if (pid != monitored_pid)
+		return 0;
+
+	if (!bpf_inode_storage_get(&inode_storage_map, sb->s_root->d_inode, 0,
+				   BPF_LOCAL_STORAGE_GET_F_CREATE))
+		return -EPERM;
+
+	return 0;
+}
+
+SEC("lsm/inode_unlink")
+int BPF_PROG(inode_unlink, struct inode *dir, struct dentry *dentry)
+{
+	if (bpf_inode_storage_get(&inode_storage_map,
+				  dir->i_sb->s_root->d_inode, 0, 0))
+		return -EPERM;
+
+	return 0;
+}
+
+SEC("lsm/sb_umount")
+int BPF_PROG(sb_umount, struct vfsmount *mnt, int flags)
+{
+	if (bpf_inode_storage_get(&inode_storage_map,
+				  mnt->mnt_sb->s_root->d_inode, 0, 0))
+		return -EPERM;
+
+	return 0;
+}
diff --git a/bpffs_lsm_user.c b/bpffs_lsm_user.c
new file mode 100644
index 000000000000..e20180cc5db9
--- /dev/null
+++ b/bpffs_lsm_user.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Huawei Technologies Duesseldorf GmbH
+ *
+ * Author: Roberto Sassu <roberto.sassu@huawei.com>
+ *
+ * Implement the user space side of the LSM for bpffs.
+ */
+
+#include <fcntl.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <limits.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+
+#include "bpffs_lsm_kern.skel.h"
+
+#define MOUNT_FLAGS (MS_NOSUID | MS_NODEV | MS_NOEXEC | MS_RELATIME)
+
+int main(int argc, char *argv[])
+{
+	char mntpoint[] = "/tmp/bpf_private_mountXXXXXX";
+	char path[PATH_MAX];
+	struct bpffs_lsm_kern *skel;
+	int ret, i;
+
+	skel = bpffs_lsm_kern__open_and_load();
+	if (!skel)
+		return -EINVAL;
+
+	ret = bpffs_lsm_kern__attach(skel);
+	if (ret < 0)
+		goto out_destroy;
+
+	mkdtemp(mntpoint);
+
+	skel->bss->monitored_pid = getpid();
+	ret = mount(mntpoint, mntpoint, "bpf", MOUNT_FLAGS, NULL);
+	skel->bss->monitored_pid = 0;
+
+	if (ret < 0)
+		goto out_destroy;
+
+	for (i = 0; i < skel->skeleton->prog_cnt; i++) {
+		snprintf(path, sizeof(path), "%s/%s", mntpoint,
+			 skel->skeleton->progs[i].name);
+		ret = bpf_link__pin(*skel->skeleton->progs[i].link, path);
+		if (ret < 0)
+			goto out_destroy;
+	}
+
+	ret = 0;
+out_destroy:
+	bpffs_lsm_kern__destroy(skel);
+	return ret;
+}
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
