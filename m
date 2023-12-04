Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C715802FCC
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 11:12:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C87A0C6B46B;
	Mon,  4 Dec 2023 10:12:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27AB2C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 10:12:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B49mJ8G026676; Mon, 4 Dec 2023 11:12:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=VZZBxcUbum7P76Wj0XWqOVN7boKS0FAnpWW8U/8QDpY=; b=Yo
 XNXdmu+4u32P2n3ppS29fhvm9+UEPwhPClh7jyP3KX+v28h0R8IvedPSUGLF/12I
 JbIHQQD4VKPz7iXdR0z+6MfRIuutduD7FEcQF170PGTJGaMQ4dqgMHajsi/itEFL
 Qlh4scDw3sfB/1hcCwV+pQdcCCFbZ+N4bLwnXrZ+Z+hayoo8d6d3EDS/3ghDIiAo
 CiQ/IeexLtxQmt4tH6DjmPxTH7HSSQFdzqEvdsCqMKhoznWmpJkm/CT0hVTUV87P
 INgcSP7pwJL/FQd8AkXEVvMu2yBGgiyKi4sjWxljZEkS4uL7bS+oy0rm80sqtOm9
 Th7rO4HguhEkHo9kxFfg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uqtk8pm0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 11:12:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EDE8100089;
 Mon,  4 Dec 2023 11:12:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16CD821ADAD;
 Mon,  4 Dec 2023 11:12:03 +0100 (CET)
Received: from localhost (10.252.13.105) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Dec
 2023 11:12:02 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Richard Cochran <richardcochran@gmail.com>
Date: Mon, 4 Dec 2023 11:11:11 +0100
Message-ID: <20231204101113.276368-3-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101113.276368-1-raphael.gallais-pou@foss.st.com>
References: <20231204101113.276368-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.13.105]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] drm/stm: dsi: add pm runtime ops
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

From: Yannick Fertre <yannick.fertre@foss.st.com>

Update control of clocks and supply thanks to the PM runtime
mechanism to avoid kernel crash during a system suspend.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v2:
	- Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_OPS and removed
	__maybe_unused
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index b1aee43d51e9..82fff9e84345 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -11,6 +11,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/mipi_display.h>
@@ -77,6 +78,7 @@ enum dsi_color {
 struct dw_mipi_dsi_stm {
 	void __iomem *base;
 	struct clk *pllref_clk;
+	struct clk *pclk;
 	struct dw_mipi_dsi *dsi;
 	u32 hw_version;
 	int lane_min_kbps;
@@ -443,7 +445,6 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_mipi_dsi_stm *dsi;
-	struct clk *pclk;
 	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -483,21 +484,21 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 		goto err_clk_get;
 	}
 
-	pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(pclk)) {
-		ret = PTR_ERR(pclk);
+	dsi->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(dsi->pclk)) {
+		ret = PTR_ERR(dsi->pclk);
 		DRM_ERROR("Unable to get peripheral clock: %d\n", ret);
 		goto err_dsi_probe;
 	}
 
-	ret = clk_prepare_enable(pclk);
+	ret = clk_prepare_enable(dsi->pclk);
 	if (ret) {
 		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
 		goto err_dsi_probe;
 	}
 
 	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
-	clk_disable_unprepare(pclk);
+	clk_disable_unprepare(dsi->pclk);
 
 	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
 		ret = -ENODEV;
@@ -551,6 +552,7 @@ static int dw_mipi_dsi_stm_suspend(struct device *dev)
 	DRM_DEBUG_DRIVER("\n");
 
 	clk_disable_unprepare(dsi->pllref_clk);
+	clk_disable_unprepare(dsi->pclk);
 	regulator_disable(dsi->vdd_supply);
 
 	return 0;
@@ -569,8 +571,16 @@ static int dw_mipi_dsi_stm_resume(struct device *dev)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(dsi->pclk);
+	if (ret) {
+		regulator_disable(dsi->vdd_supply);
+		DRM_ERROR("Failed to enable pclk: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(dsi->pllref_clk);
 	if (ret) {
+		clk_disable_unprepare(dsi->pclk);
 		regulator_disable(dsi->vdd_supply);
 		DRM_ERROR("Failed to enable pllref_clk: %d\n", ret);
 		return ret;
@@ -582,6 +592,8 @@ static int dw_mipi_dsi_stm_resume(struct device *dev)
 static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
 			    dw_mipi_dsi_stm_resume)
+	RUNTIME_PM_OPS(dw_mipi_dsi_stm_suspend,
+		       dw_mipi_dsi_stm_resume, NULL)
 };
 
 static struct platform_driver dw_mipi_dsi_stm_driver = {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
