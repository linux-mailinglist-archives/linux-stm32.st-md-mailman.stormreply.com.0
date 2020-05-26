Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 554861A452C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 12:24:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13CD6C36B0D;
	Fri, 10 Apr 2020 10:24:45 +0000 (UTC)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [92.103.151.219])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C330C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 10:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id CF18527E05D7;
 Fri, 10 Apr 2020 12:24:41 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Tauu7QdF0F_V; Fri, 10 Apr 2020 12:24:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 5F82627E0589;
 Fri, 10 Apr 2020 12:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 5F82627E0589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1586514281;
 bh=HcxJ6DLN3dQyTIH886Czrjj7+pb+tkaU97+d+7JF+Kw=;
 h=From:To:Date:Message-Id;
 b=e9YOgxQ8KJK6iwGyl1wfGlIJ0sLD7SiyWn2pMxn7C1ovz2yJb3Hl1rCwFRccJ/Y1s
 JWfbH24nceHgj7R/r/bM0QFcsdVvDeth3WhaHsUIRXR5pFybGaXU2AAOeQEtYly8hb
 HhsUqc4dazZ1HMMAD/ECiOSyKjP6auN3wz3G7HKI=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XktIL38oOsdu; Fri, 10 Apr 2020 12:24:41 +0200 (CEST)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 44BEC27E039A;
 Fri, 10 Apr 2020 12:24:41 +0200 (CEST)
From: Clement Leger <cleger@kalray.eu>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Fri, 10 Apr 2020 12:24:32 +0200
Message-Id: <20200410102433.2672-2-cleger@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200410102433.2672-1-cleger@kalray.eu>
References: <20200410102433.2672-1-cleger@kalray.eu>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Clement Leger <cleger@kalray.eu>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] remoteproc: add
	rproc_coredump_set_elf_info
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This function allows drivers to correctly setup the coredump output
elf information.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_core.c       | 32 ++++++++++++++++++++--
 drivers/remoteproc/remoteproc_elf_loader.c |  3 --
 include/linux/remoteproc.h                 |  2 ++
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a9ac1d01e09b..382443bab583 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1562,6 +1562,28 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
 }
 EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
 
+/**
+ * rproc_coredump_set_elf_info() - set coredump elf information
+ * @rproc:	handle of a remote processor
+ * @class:	elf class for coredump elf file
+ * @size:	elf machine for coredump elf file
+ *
+ * Set elf information which will be used for coredump elf file.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine)
+{
+	if (class != ELFCLASS64 && class != ELFCLASS32)
+		return -EINVAL;
+
+	rproc->elf_class = class;
+	rproc->elf_machine = machine;
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_coredump_set_elf_info);
+
 /**
  * rproc_coredump() - perform coredump
  * @rproc:	rproc handle
@@ -1584,6 +1606,11 @@ static void rproc_coredump(struct rproc *rproc)
 	if (list_empty(&rproc->dump_segments))
 		return;
 
+	if (class == ELFCLASSNONE) {
+		dev_err(&rproc->dev, "Elf class is not set\n");
+		return;
+	}
+
 	data_size = elf_size_of_hdr(class);
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
 		data_size += elf_size_of_phdr(class) + segment->size;
@@ -1602,7 +1629,7 @@ static void rproc_coredump(struct rproc *rproc)
 	elf_hdr_init_ident(ehdr, class);
 
 	elf_hdr_set_e_type(class, ehdr, ET_CORE);
-	elf_hdr_set_e_machine(class, ehdr, EM_NONE);
+	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
 	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
 	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
 	elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
@@ -2043,7 +2070,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
-	rproc->elf_class = ELFCLASS32;
+	rproc->elf_class = ELFCLASSNONE;
+	rproc->elf_machine = EM_NONE;
 
 	device_initialize(&rproc->dev);
 	rproc->dev.parent = dev;
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 16e2c496fd45..4869fb7d8fe4 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -248,9 +248,6 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			memset(ptr + filesz, 0, memsz - filesz);
 	}
 
-	if (ret == 0)
-		rproc->elf_class = class;
-
 	return ret;
 }
 EXPORT_SYMBOL(rproc_elf_load_segments);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ed127b2d35ca..d67eb5a40476 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -515,6 +515,7 @@ struct rproc {
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
+	u16 elf_machine;
 };
 
 /**
@@ -619,6 +620,7 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
 						     struct rproc_dump_segment *segment,
 						     void *dest),
 				      void *priv);
+int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine);
 
 static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
