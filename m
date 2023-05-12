Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60847700401
	for <lists+linux-stm32@lfdr.de>; Fri, 12 May 2023 11:39:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03251C6907C;
	Fri, 12 May 2023 09:39:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58A70C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 May 2023 09:39:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C8RUGj025513; Fri, 12 May 2023 11:39:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=5Q1gR8oRjEI5vr4HNTyzzxweoykIM1rjbUQgj6KH048=;
 b=Y7/iOX6z8VwxoNnVwUL91jD9SWEqZxKCPjrcTTgcFnm9qdFbfs4TA2jsgLIrVCgFkcYa
 iXVB0JD2Xfp97v/f4dpd3X7dSJGBrEiLMECnHy5pxZo9ZJCSjYFw0inKRscOBL+8JfpE
 R6+lZ2DC0IO0nPMfhn1WelaMGzrzEu03YrEbGMANbOyKdHyvLtCAB4iHAvs/MUscQemL
 c9ZDI7ZNxAB1WW9hdwfrV8nnbWIUaYnD0O/36f/w0zj0VkAX+FWNy7dGZ9iHqT9JAQs5
 PcKJODj74aOwlz1XK3KrY1mo4OaGRpeJfs3alC9Dh+LJ6SNquWSB+GalVGWoPdVthV7r 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qguwkrskp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 11:39:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9AC1C100038;
 Fri, 12 May 2023 11:39:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89F322248B0;
 Fri, 12 May 2023 11:39:31 +0200 (CEST)
Received: from localhost (10.201.21.213) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 12 May
 2023 11:39:31 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Fri, 12 May 2023 11:39:24 +0200
Message-ID: <20230512093926.661509-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512093926.661509-1-arnaud.pouliquen@foss.st.com>
References: <20230512093926.661509-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_06,2023-05-05_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/4] remoteproc: stm32: Allow hold boot
	management by the SCMI reset controller
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

The hold boot can be managed by the SCMI controller as a reset.
If the "hold_boot" reset is defined in the device tree, use it.
Else use the syscon controller directly to access to the register.
The support of the SMC call is deprecated but kept for legacy support.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Updates vs previous version
- Fix error management of the devm_reset_control_get_optional(dev, "hold_boot");

 drivers/remoteproc/stm32_rproc.c | 76 +++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8746cbb1f168..d85c2f8a2d6b 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -79,6 +79,7 @@ struct stm32_mbox {
 
 struct stm32_rproc {
 	struct reset_control *rst;
+	struct reset_control *hold_boot_rst;
 	struct stm32_syscon hold_boot;
 	struct stm32_syscon pdds;
 	struct stm32_syscon m4_state;
@@ -88,7 +89,7 @@ struct stm32_rproc {
 	struct stm32_rproc_mem *rmems;
 	struct stm32_mbox mb[MBOX_NB_MBX];
 	struct workqueue_struct *workqueue;
-	bool secured_soc;
+	bool hold_boot_smc;
 	void __iomem *rsc_va;
 };
 
@@ -413,13 +414,28 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
 	struct arm_smccc_res smc_res;
 	int val, err;
 
+	/*
+	 * Three ways to manage the hold boot
+	 * - using SCMI: the hold boot is managed as a reset,
+	 * - using Linux(no SCMI): the hold boot is managed as a syscon register
+	 * - using SMC call (deprecated): use SMC reset interface
+	 */
+
 	val = hold ? HOLD_BOOT : RELEASE_BOOT;
 
-	if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->secured_soc) {
+	if (ddata->hold_boot_rst) {
+		/* Use the SCMI reset controller */
+		if (!hold)
+			err = reset_control_deassert(ddata->hold_boot_rst);
+		else
+			err =  reset_control_assert(ddata->hold_boot_rst);
+	} else if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->hold_boot_smc) {
+		/* Use the SMC call */
 		arm_smccc_smc(STM32_SMC_RCC, STM32_SMC_REG_WRITE,
 			      hold_boot.reg, val, 0, 0, 0, 0, &smc_res);
 		err = smc_res.a0;
 	} else {
+		/* Use syscon */
 		err = regmap_update_bits(hold_boot.map, hold_boot.reg,
 					 hold_boot.mask, val);
 	}
@@ -717,34 +733,52 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 		dev_info(dev, "wdg irq registered\n");
 	}
 
-	ddata->rst = devm_reset_control_get_by_index(dev, 0);
+	ddata->rst = devm_reset_control_get_optional(dev, "mcu_rst");
+	if (!ddata->rst) {
+		/* Try legacy fallback method: get it by index */
+		ddata->rst = devm_reset_control_get_by_index(dev, 0);
+	}
 	if (IS_ERR(ddata->rst))
 		return dev_err_probe(dev, PTR_ERR(ddata->rst),
 				     "failed to get mcu_reset\n");
 
 	/*
-	 * if platform is secured the hold boot bit must be written by
-	 * smc call and read normally.
-	 * if not secure the hold boot bit could be read/write normally
+	 * Three ways to manage the hold boot
+	 * - using SCMI: the hold boot is managed as a reset
+	 *    The DT "reset-mames" property should be defined with 2 items:
+	 *        reset-names = "mcu_rst", "hold_boot";
+	 * - using SMC call (deprecated): use SMC reset interface
+	 *    The DT "reset-mames" property is optional, "st,syscfg-tz" is required
+	 * - default(no SCMI, no SMC): the hold boot is managed as a syscon register
+	 *    The DT "reset-mames" property is optional, "st,syscfg-holdboot" is required
 	 */
-	err = stm32_rproc_get_syscon(np, "st,syscfg-tz", &tz);
-	if (err) {
-		dev_err(dev, "failed to get tz syscfg\n");
-		return err;
-	}
 
-	err = regmap_read(tz.map, tz.reg, &tzen);
-	if (err) {
-		dev_err(dev, "failed to read tzen\n");
-		return err;
+	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
+	if (IS_ERR(ddata->hold_boot_rst))
+		return dev_err_probe(dev, PTR_ERR(ddata->rst),
+				     "failed to get hold_boot reset\n");
+
+	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
+		/* Manage the MCU_BOOT using SMC call */
+		err = stm32_rproc_get_syscon(np, "st,syscfg-tz", &tz);
+		if (!err) {
+			err = regmap_read(tz.map, tz.reg, &tzen);
+			if (err) {
+				dev_err(dev, "failed to read tzen\n");
+				return err;
+			}
+			ddata->hold_boot_smc = tzen & tz.mask;
+		}
 	}
-	ddata->secured_soc = tzen & tz.mask;
 
-	err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
-				     &ddata->hold_boot);
-	if (err) {
-		dev_err(dev, "failed to get hold boot\n");
-		return err;
+	if (!ddata->hold_boot_rst && !ddata->hold_boot_smc) {
+		/* Default: hold boot manage it through the syscon controller */
+		err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
+					     &ddata->hold_boot);
+		if (err) {
+			dev_err(dev, "failed to get hold boot\n");
+			return err;
+		}
 	}
 
 	err = stm32_rproc_get_syscon(np, "st,syscfg-pdds", &ddata->pdds);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
