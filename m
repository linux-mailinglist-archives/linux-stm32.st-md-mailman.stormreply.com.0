Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 773ED70D8A5
	for <lists+linux-stm32@lfdr.de>; Tue, 23 May 2023 11:14:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D11F9C6B456;
	Tue, 23 May 2023 09:14:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA56DC6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 May 2023 09:14:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34N9A8rD017501; Tue, 23 May 2023 11:14:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=NDNZsAz7mKi6XbEYTiSx/dxMOVnJMUMJpHPiiUqvcT8=;
 b=bXQn+8LUxvUNR+nCEEe9eu3VroC1WMv/dZipssZMgeZLkLgO4wZXOpo/UlLF6+mbpv8a
 kkiPK/aXFg3rW80OJjO1GmHSCUsxfVZhu5hymBftWrT1bcVVRLJ56sZqWYuL4XOe7HbR
 Ol+qvKLFz/4z/MDc6jOQie9L++iQ0UOzo1GBXe2vZurrDE8ivXMZxqXCJsB2p50Nfui/
 5lFNfDaeyai6u19M9cAihKtni04HRqJh/czMX6lyY7K49tTX16Amlx0knGjo6u0baqIw
 1dSl2F+0VYI5VVB1V6FFPbG004wp1GET6FW33196w9J2xUUqDgrVEN3mp+vPiGXaFgjn iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qrspngg39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 11:14:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40B3710002A;
 Tue, 23 May 2023 11:14:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36972222CB8;
 Tue, 23 May 2023 11:14:18 +0200 (CEST)
Received: from localhost (10.252.31.43) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 23 May
 2023 11:14:17 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 23 May 2023 11:13:50 +0200
Message-ID: <20230523091350.292221-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.31.43]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_06,2023-05-22_03,2023-05-22_02
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH 4/4] remoteproc: stm32: Add support of an
	OP-TEE TA to load the firmware
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

Add the support of signed firmware using new TEE remoteproc device to
manage a remote firmware in a secure trusted application.

The support of a signed or a non signed firmware is based on compatible:
- with legacy compatible "st,stm32mp1-m4" the Linux kernel loads a
  non-signed (ELF) firmware image,
- with compatible "st,stm32mp1-m4-tee" the Linux kernel load a signed
  firmware image. In this case it calls TEE services to manage the firmware
  loading and the remoteproc life-cycle.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/Kconfig       |   1 +
 drivers/remoteproc/stm32_rproc.c | 234 ++++++++++++++++++++++++++-----
 2 files changed, 198 insertions(+), 37 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 2969f067e3c3..e6f0ca4adf8a 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -316,6 +316,7 @@ config STM32_RPROC
 	depends on ARCH_STM32
 	depends on REMOTEPROC
 	select MAILBOX
+	select TEE_REMOTEPROC
 	help
 	  Say y here to support STM32 MCU processors via the
 	  remote processor framework.
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8746cbb1f168..d2c909905cba 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -20,6 +20,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/tee_remoteproc.h>
 #include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
@@ -49,6 +50,13 @@
 #define M4_STATE_STANDBY	4
 #define M4_STATE_CRASH		5
 
+/*
+ * Define a default index in future may come a global list of
+ * firmwares which list platforms and associated firmware(s)
+ */
+
+#define STM32_MP1_FW_ID    0
+
 struct stm32_syscon {
 	struct regmap *map;
 	u32 reg;
@@ -89,6 +97,8 @@ struct stm32_rproc {
 	struct stm32_mbox mb[MBOX_NB_MBX];
 	struct workqueue_struct *workqueue;
 	bool secured_soc;
+	bool fw_loaded;
+	struct tee_rproc *trproc;
 	void __iomem *rsc_va;
 };
 
@@ -208,6 +218,139 @@ static int stm32_rproc_mbox_idx(struct rproc *rproc, const unsigned char *name)
 	return -EINVAL;
 }
 
+static void stm32_rproc_request_shutdown(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	int err, dummy_data, idx;
+
+	/* Request shutdown of the remote processor */
+	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
+		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
+		if (idx >= 0 && ddata->mb[idx].chan) {
+			/* A dummy data is sent to allow to block on transmit. */
+			err = mbox_send_message(ddata->mb[idx].chan,
+						&dummy_data);
+			if (err < 0)
+				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
+		}
+	}
+}
+
+static int stm32_rproc_release(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	unsigned int err = 0;
+
+	/* To allow platform Standby power mode, set remote proc Deep Sleep. */
+	if (ddata->pdds.map) {
+		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
+					 ddata->pdds.mask, 1);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set pdds\n");
+			return err;
+		}
+	}
+
+	/* Update coprocessor state to OFF if available. */
+	if (ddata->m4_state.map) {
+		err = regmap_update_bits(ddata->m4_state.map,
+					 ddata->m4_state.reg,
+					 ddata->m4_state.mask,
+					 M4_STATE_OFF);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set copro state\n");
+			return err;
+		}
+	}
+
+	return err;
+}
+
+static int stm32_rproc_tee_elf_sanity_check(struct rproc *rproc,
+					    const struct firmware *fw)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	unsigned int ret = 0;
+
+	if (rproc->state == RPROC_DETACHED)
+		return 0;
+
+	ret = tee_rproc_load_fw(ddata->trproc, fw);
+	if (!ret)
+		ddata->fw_loaded = true;
+
+	return ret;
+}
+
+static int stm32_rproc_tee_elf_load(struct rproc *rproc,
+				    const struct firmware *fw)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	unsigned int ret;
+
+	/*
+	 * This function can be called by remote proc for recovery
+	 * without the sanity check. In this case we need to load the firmware
+	 * else nothing done here as the firmware has been preloaded for the
+	 * sanity check to be able to parse it for the resource table
+	 */
+	if (ddata->fw_loaded)
+		return 0;
+
+	ret = tee_rproc_load_fw(ddata->trproc, fw);
+	if (ret)
+		return ret;
+	ddata->fw_loaded = true;
+
+	/* update the resource table parameters */
+	if (rproc_tee_get_rsc_table(ddata->trproc)) {
+		/* no resource table: reset the related fields */
+		rproc->cached_table = NULL;
+		rproc->table_ptr = NULL;
+		rproc->table_sz = 0;
+	}
+
+	return 0;
+}
+
+static struct resource_table *
+stm32_rproc_tee_elf_find_loaded_rsc_table(struct rproc *rproc,
+					  const struct firmware *fw)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+
+	return tee_rproc_get_loaded_rsc_table(ddata->trproc);
+}
+
+static int stm32_rproc_tee_start(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+
+	return tee_rproc_start(ddata->trproc);
+}
+
+static int stm32_rproc_tee_attach(struct rproc *rproc)
+{
+	/* Nothing to do, remote proc already started by the secured context */
+	return 0;
+}
+
+static int stm32_rproc_tee_stop(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	int err;
+
+	stm32_rproc_request_shutdown(rproc);
+
+	err = tee_rproc_stop(ddata->trproc);
+	if (err)
+		return err;
+
+	ddata->fw_loaded = false;
+
+	return stm32_rproc_release(rproc);
+}
+
 static int stm32_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
@@ -270,7 +413,14 @@ static int stm32_rproc_prepare(struct rproc *rproc)
 
 static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc_elf_load_rsc_table(rproc, fw))
+	struct stm32_rproc *ddata = rproc->priv;
+	int ret;
+
+	if (ddata->trproc)
+		ret = rproc_tee_get_rsc_table(ddata->trproc);
+	else
+		ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
 		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
 
 	return 0;
@@ -503,17 +653,9 @@ static int stm32_rproc_detach(struct rproc *rproc)
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
-	int err, idx;
+	int err;
 
-	/* request shutdown of the remote processor */
-	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
-		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
-		if (idx >= 0 && ddata->mb[idx].chan) {
-			err = mbox_send_message(ddata->mb[idx].chan, "detach");
-			if (err < 0)
-				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
-		}
-	}
+	stm32_rproc_request_shutdown(rproc);
 
 	err = stm32_rproc_set_hold_boot(rproc, true);
 	if (err)
@@ -525,29 +667,8 @@ static int stm32_rproc_stop(struct rproc *rproc)
 		return err;
 	}
 
-	/* to allow platform Standby power mode, set remote proc Deep Sleep */
-	if (ddata->pdds.map) {
-		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
-					 ddata->pdds.mask, 1);
-		if (err) {
-			dev_err(&rproc->dev, "failed to set pdds\n");
-			return err;
-		}
-	}
-
-	/* update coprocessor state to OFF if available */
-	if (ddata->m4_state.map) {
-		err = regmap_update_bits(ddata->m4_state.map,
-					 ddata->m4_state.reg,
-					 ddata->m4_state.mask,
-					 M4_STATE_OFF);
-		if (err) {
-			dev_err(&rproc->dev, "failed to set copro state\n");
-			return err;
-		}
-	}
 
-	return 0;
+	return stm32_rproc_release(rproc);
 }
 
 static void stm32_rproc_kick(struct rproc *rproc, int vqid)
@@ -659,8 +780,22 @@ static const struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
+static const struct rproc_ops st_rproc_tee_ops = {
+	.prepare	= stm32_rproc_prepare,
+	.start		= stm32_rproc_tee_start,
+	.stop		= stm32_rproc_tee_stop,
+	.attach		= stm32_rproc_tee_attach,
+	.kick		= stm32_rproc_kick,
+	.parse_fw	= stm32_rproc_parse_fw,
+	.find_loaded_rsc_table = stm32_rproc_tee_elf_find_loaded_rsc_table,
+	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
+	.sanity_check	= stm32_rproc_tee_elf_sanity_check,
+	.load		= stm32_rproc_tee_elf_load,
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
-	{ .compatible = "st,stm32mp1-m4" },
+	{.compatible = "st,stm32mp1-m4",},
+	{.compatible = "st,stm32mp1-m4-tee",},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_rproc_match);
@@ -801,6 +936,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
+	struct tee_rproc *trproc;
 	struct rproc *rproc;
 	unsigned int state;
 	int ret;
@@ -809,11 +945,29 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
-	if (!rproc)
-		return -ENOMEM;
+	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
+		trproc = tee_rproc_register(dev, STM32_MP1_FW_ID);
+		if (IS_ERR_OR_NULL(trproc)) {
+			return PTR_ERR(trproc);
+		/*
+		 * Delegate the firmware management to the secure context.
+		 * The firmware loaded has to be signed.
+		 */
+		dev_info(dev, "Support of signed firmware only\n");
+		}
+	}
+	rproc = rproc_alloc(dev, np->name,
+			    trproc ? &st_rproc_tee_ops : &st_rproc_ops,
+			    NULL, sizeof(*ddata));
+	if (!rproc) {
+		ret = -ENOMEM;
+		goto free_tee;
+	}
 
 	ddata = rproc->priv;
+	ddata->trproc = trproc;
+	if (trproc)
+		ddata->trproc->rproc = rproc;
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
@@ -864,6 +1018,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		device_init_wakeup(dev, false);
 	}
 	rproc_free(rproc);
+free_tee:
+	if (trproc)
+		tee_rproc_unregister(trproc);
+
 	return ret;
 }
 
@@ -885,6 +1043,8 @@ static int stm32_rproc_remove(struct platform_device *pdev)
 		device_init_wakeup(dev, false);
 	}
 	rproc_free(rproc);
+	if (ddata->trproc)
+		tee_rproc_unregister(ddata->trproc);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
