Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201C6724E6
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 18:30:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1D4AC6904A;
	Wed, 18 Jan 2023 17:30:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D3F6C6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 17:30:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IHHSYM013300; Wed, 18 Jan 2023 18:29:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ZyZacvmPX30CnzTNwDG1lwIQ0Nni4QdJteNf/VXJ/S8=;
 b=1xDLVJPrDMSNWFhGPGMhI01oyod1zhndHSgCXMtMcGDXpQZZekbqz6lUAfpeAQ3hXZwT
 jJFlI7MKTpjSi2QCb8OIvVr51F1uNvWPvMGxdKG78Cmcn5w/ibL+p/S1jFpfTY2r0rAm
 9jeLwBg28ipR6ZGkfnYovzhpc1hkoPWVnzAInAx/agqvX5dPUr1f3Qx5QoQvTaaRxe4J
 52qySX24f2MGAm4NQkxN4YTXWxUVlu55mmyG+KeX2mm+IV4jn96LtmuwTFNRyzgJMT/E
 DzY/B9ghg8+9knj3bi08Qp1REvI18E6UlCNKnB4dwm2kDXDwfwdTJwpv48o8eBRLhNbO qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n5mc4uhmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 18:29:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF0C410002A;
 Wed, 18 Jan 2023 18:29:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA2EE228A21;
 Wed, 18 Jan 2023 18:29:50 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 18 Jan
 2023 18:29:50 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 18 Jan 2023 18:29:39 +0100
Message-ID: <20230118182856.v6.3.I59210046e368cfc22bd3cca2afe1653674f8ece8@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118172940.841094-1-patrick.delaunay@foss.st.com>
References: <20230118172940.841094-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
Cc: linux-kernel@vger.kernel.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 3/3] nvmem: stm32: detect bsec pta presence
	for STM32MP15x
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

On STM32MP15x SoC, the SMC backend is optional when OP-TEE is used;
the PTA BSEC should be used as it is done on STM32MP13x platform,
but the BSEC SMC can be also used: it is a legacy mode in OP-TEE,
not recommended but used in previous OP-TEE firmware.

The presence of OP-TEE is dynamically detected in STM32MP15x device tree
and the supported NVMEM backend is dynamically detected:
- PTA with stm32_bsec_pta_find
- SMC with stm32_bsec_check

With OP-TEE but without PTA and SMC detection, the probe is deferred for
STM32MP15x devices.

On STM32MP13x platform, only the PTA is supported with cfg->ta = true
and this detection is skipped.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
---

Changes in v6:
- added reviewed by Etienne Carriere

Changes in v5:
- update the BSEC SMC detection logic in stm32_romem_probe()
  after Etienne Carierre review to support NVMEM probe after OP-TEE probe

Changes in v3:
- use of_find_compatible_node in optee_presence_check function
  instead of of_find_node_by_path("/firmware/optee")

Changes in v2:
- Added patch in the serie for BSEC PTA support on STM32MP15x
  with dynamic detection of OP-TEE presence and SMC support (legacy mode)

 drivers/nvmem/stm32-romem.c | 38 +++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
index 978a63edf297..ba779e26937a 100644
--- a/drivers/nvmem/stm32-romem.c
+++ b/drivers/nvmem/stm32-romem.c
@@ -159,6 +159,31 @@ static int stm32_bsec_pta_write(void *context, unsigned int offset, void *buf,
 	return stm32_bsec_optee_ta_write(priv->ctx, priv->lower, offset, buf, bytes);
 }
 
+static bool stm32_bsec_smc_check(void)
+{
+	u32 val;
+	int ret;
+
+	/* check that the OP-TEE support the BSEC SMC (legacy mode) */
+	ret = stm32_bsec_smc(STM32_SMC_READ_SHADOW, 0, 0, &val);
+
+	return !ret;
+}
+
+static bool optee_presence_check(void)
+{
+	struct device_node *np;
+	bool tee_detected = false;
+
+	/* check that the OP-TEE node is present and available. */
+	np = of_find_compatible_node(NULL, NULL, "linaro,optee-tz");
+	if (np && of_device_is_available(np))
+		tee_detected = true;
+	of_node_put(np);
+
+	return tee_detected;
+}
+
 static int stm32_romem_probe(struct platform_device *pdev)
 {
 	const struct stm32_romem_cfg *cfg;
@@ -195,11 +220,16 @@ static int stm32_romem_probe(struct platform_device *pdev)
 	} else {
 		priv->cfg.size = cfg->size;
 		priv->lower = cfg->lower;
-		if (cfg->ta) {
+		if (cfg->ta || optee_presence_check()) {
 			rc = stm32_bsec_optee_ta_open(&priv->ctx);
-			/* wait for OP-TEE client driver to be up and ready */
-			if (rc)
-				return rc;
+			if (rc) {
+				/* wait for OP-TEE client driver to be up and ready */
+				if (rc == -EPROBE_DEFER)
+					return -EPROBE_DEFER;
+				/* BSEC PTA is required or SMC not supported */
+				if (cfg->ta || !stm32_bsec_smc_check())
+					return rc;
+			}
 		}
 		if (priv->ctx) {
 			rc = devm_add_action_or_reset(dev, stm32_bsec_optee_ta_close, priv->ctx);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
