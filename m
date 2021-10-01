Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28941EAC8
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Oct 2021 12:14:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5F6CC5AB66;
	Fri,  1 Oct 2021 10:14:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5ADCC5AB63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Oct 2021 10:14:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1918RG1V001404; 
 Fri, 1 Oct 2021 12:12:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=klYlsgXNrX/dEhQFG0PtdrruuCVV1pMU8Q+SHb4aKw4=;
 b=fSxYlbA0sG2aM8ouZccxZ0mGQGvJRYZDEjs+78o9/nWkru+XxgtM4Ov3Cscuv7GAIS9+
 nu5m3XiKsgS688dhX5AH2Qd5gmqQ1IdikWRNQkFM3jIr/IuXk22fedxb2c8Uccfxxzr1
 dO4s5hg5qkLbvL6hPBhbYs7kVpO1XDNmFlMUmVGub8x+ToVBFVDUORswr/PMSmq4Wo8L
 dL1UaN403UeHpWwV6nQdedU0PRaW5V/WUo8593SXqbkuKSzS8bojUIZaq3qG3ELC3t2Y
 3DelcD38VOxA1gEcZXAHBOnoyw3e6ypGUYKWPZPx2QcV8zJGu01NT0ChUaYDlzAAoGQU sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bds9njb51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 12:12:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F013100038;
 Fri,  1 Oct 2021 12:12:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35C93226FDD;
 Fri,  1 Oct 2021 12:12:47 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct 2021 12:12:46
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 1 Oct 2021 12:12:31 +0200
Message-ID: <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-09-30_01,2020-04-07_01
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.pouliquen@foss.st.com, Christoph Hellwig <hch@lst.de>
Subject: [Linux-stm32] [RFC PATCH 4/7] remoteproc: create the
	REMOTEPROC_VIRTIO config
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

Create the config to associate to the remoteproc virtio.

Notice that the REMOTEPROC_VIRTIO config can not set to m. the reason
is that it defines API that is used by the built-in remote proc core.
Functions such are rproc_add_virtio_dev can be called during the
Linux boot phase.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/Kconfig               | 11 +++++++++-
 drivers/remoteproc/Makefile              |  2 +-
 drivers/remoteproc/remoteproc_internal.h | 28 ++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 9a6eedc3994a..f271552c0d84 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -6,7 +6,7 @@ config REMOTEPROC
 	depends on HAS_DMA
 	select CRC32
 	select FW_LOADER
-	select VIRTIO
+	select REMOTEPROC_VIRTIO
 	select WANT_DEV_COREDUMP
 	help
 	  Support for remote processors (such as DSP coprocessors). These
@@ -14,6 +14,15 @@ config REMOTEPROC
 
 if REMOTEPROC
 
+config REMOTEPROC_VIRTIO
+	bool "Remoteproc virtio device "
+	select VIRTIO
+	help
+	  Say y here to have a virtio device support for the remoteproc
+	  communication.
+
+	  It's safe to say N if you don't use the virtio for the IPC.
+
 config REMOTEPROC_CDEV
 	bool "Remoteproc character device interface"
 	help
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index bb26c9e4ef9c..73d2384a76aa 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -8,8 +8,8 @@ remoteproc-y				:= remoteproc_core.o
 remoteproc-y				+= remoteproc_coredump.o
 remoteproc-y				+= remoteproc_debugfs.o
 remoteproc-y				+= remoteproc_sysfs.o
-remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
+obj-$(CONFIG_REMOTEPROC_VIRTIO)		+= remoteproc_virtio.o
 obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 152fe2e8668a..4ce012c353c0 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -30,10 +30,38 @@ int rproc_of_parse_firmware(struct device *dev, int index,
 			    const char **fw_name);
 
 /* from remoteproc_virtio.c */
+#if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
+
 int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
 void rproc_vdev_release(struct kref *ref);
 
+#else
+
+int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return -ENXIO;
+}
+
+static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return IRQ_NONE;
+}
+
+static inline void rproc_vdev_release(struct kref *ref)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+}
+
+#endif
+
 /* from remoteproc_debugfs.c */
 void rproc_remove_trace_file(struct dentry *tfile);
 struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
