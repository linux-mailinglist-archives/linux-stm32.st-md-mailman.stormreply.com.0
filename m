Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68396E4662
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2019 10:57:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C003C36B0B;
	Fri, 25 Oct 2019 08:57:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86235C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 08:57:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9P8ulZV000677; Fri, 25 Oct 2019 10:57:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1bGUFwD+2UgboE1ietTsPulFCvB9SBgC3gckInFtWYQ=;
 b=LDZwF2QuJhmbo2IepC9jiZpT5Gc7Gw+qsUANIlxZdSFB3ts4bZuZ7WvK71SAJ6jAngM2
 J/0tF9Od5VpCG8MzVS1vpkgNCd8rkpx8KJIwrdD4y/loFtHifIEqrzhHSDFuJpP6z11a
 trKnmgPyQfoATRqSmuxVxqoauIRgk2yhTdcqNo7o2EngIX22m60fMqet4f7zRJ9tqmQG
 rVKBfH8GSfa5gv881r1UIrfU7dfnXST+Pgos5dJQVYniab5r2Vkk5dOoz/HuItFiBqJ0
 WDBoKrLTp6Wo0DIOjxAZOVwGvn5EyJ34Abdw3SWVCxGG/BzU+VsWUVFcl2ObCtTxDTgY EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1xp6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 10:57:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A1FA100038;
 Fri, 25 Oct 2019 10:57:05 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26E642BDA69;
 Fri, 25 Oct 2019 10:57:05 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 25 Oct
 2019 10:57:05 +0200
Received: from localhost (10.48.1.6) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 25 Oct 2019 10:57:04 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>
Date: Fri, 25 Oct 2019 10:56:39 +0200
Message-ID: <20191025085639.2697-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.6]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_05:2019-10-23,2019-10-25 signatures=0
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] remoteproc: stm32: use workqueue to treat
	mailbox callback
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

The mailbox callback is under interrupt context. A consequence is
that RPMsg Callbacks are also in interrupt context.
Create workqueue to treat the callbacks in normal context.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 38 +++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 2cf4b2992bfc..f791770b8850 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
+#include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
 
@@ -31,7 +32,9 @@
 #define STM32_SMC_REG_WRITE	0x1
 
 #define STM32_MBX_VQ0		"vq0"
+#define STM32_MBX_VQ0_ID	0
 #define STM32_MBX_VQ1		"vq1"
+#define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
 struct stm32_syscon {
@@ -58,6 +61,7 @@ struct stm32_mbox {
 	const unsigned char name[10];
 	struct mbox_chan *chan;
 	struct mbox_client client;
+	struct work_struct vq_work;
 	int vq_id;
 };
 
@@ -68,6 +72,7 @@ struct stm32_rproc {
 	u32 nb_rmems;
 	struct stm32_rproc_mem *rmems;
 	struct stm32_mbox mb[MBOX_NB_MBX];
+	struct workqueue_struct *workqueue;
 	bool secured_soc;
 };
 
@@ -261,13 +266,22 @@ static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void stm32_rproc_mb_vq_work(struct work_struct *work)
+{
+	struct stm32_mbox *mb = container_of(work, struct stm32_mbox, vq_work);
+	struct rproc *rproc = dev_get_drvdata(mb->client.dev);
+
+	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
+		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
+}
+
 static void stm32_rproc_mb_callback(struct mbox_client *cl, void *data)
 {
 	struct rproc *rproc = dev_get_drvdata(cl->dev);
 	struct stm32_mbox *mb = container_of(cl, struct stm32_mbox, client);
+	struct stm32_rproc *ddata = rproc->priv;
 
-	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
-		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
+	queue_work(ddata->workqueue, &mb->vq_work);
 }
 
 static void stm32_rproc_free_mbox(struct rproc *rproc)
@@ -285,7 +299,7 @@ static void stm32_rproc_free_mbox(struct rproc *rproc)
 static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
 	{
 		.name = STM32_MBX_VQ0,
-		.vq_id = 0,
+		.vq_id = STM32_MBX_VQ0_ID,
 		.client = {
 			.rx_callback = stm32_rproc_mb_callback,
 			.tx_block = false,
@@ -293,7 +307,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
 	},
 	{
 		.name = STM32_MBX_VQ1,
-		.vq_id = 1,
+		.vq_id = STM32_MBX_VQ1_ID,
 		.client = {
 			.rx_callback = stm32_rproc_mb_callback,
 			.tx_block = false,
@@ -332,6 +346,10 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
 			dev_warn(dev, "cannot get %s mbox\n", name);
 			ddata->mb[i].chan = NULL;
 		}
+		if (ddata->mb[i].vq_id >= 0) {
+			INIT_WORK(&ddata->mb[i].vq_work,
+				  stm32_rproc_mb_vq_work);
+		}
 	}
 }
 
@@ -589,12 +607,18 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
 	rproc->has_iommu = false;
 	ddata = rproc->priv;
+	ddata->workqueue = create_workqueue(dev_name(dev));
+	if (!ddata->workqueue) {
+		dev_err(dev, "cannot create workqueue\n");
+		ret = -ENOMEM;
+		goto free_rproc;
+	}
 
 	platform_set_drvdata(pdev, rproc);
 
 	ret = stm32_rproc_parse_dt(pdev);
 	if (ret)
-		goto free_rproc;
+		goto free_wkq;
 
 	stm32_rproc_request_mbox(rproc);
 
@@ -606,6 +630,8 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
 free_mb:
 	stm32_rproc_free_mbox(rproc);
+free_wkq:
+	destroy_workqueue(ddata->workqueue);
 free_rproc:
 	rproc_free(rproc);
 	return ret;
@@ -614,12 +640,14 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 static int stm32_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct stm32_rproc *ddata = rproc->priv;
 
 	if (atomic_read(&rproc->power) > 0)
 		rproc_shutdown(rproc);
 
 	rproc_del(rproc);
 	stm32_rproc_free_mbox(rproc);
+	destroy_workqueue(ddata->workqueue);
 	rproc_free(rproc);
 
 	return 0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
