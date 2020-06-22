Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3992036EF
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2020 14:38:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24136C36B0C;
	Mon, 22 Jun 2020 12:38:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD205C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 12:38:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MCYpiK018122
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 22 Jun 2020 14:38:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=STMicroelectronics;
 bh=OQL5NAoMJSOm+ygJHkrEsPggragtybuk76BienSRiE4=;
 b=dec0k9yfhjvyGxEeXyOzRbNLegCdr3NkTMASng3UFpHVP4kqhC1xBtCT+UWnNqXqJUY6
 WgsGiooqMY3iNEef+/fUsVbv/S7rOpJG9zO7cl1Vzvu4MWwicVrTjd/DTh4I6eZzFqK9
 QxDHBzlIbOEczcarNszecXmsUznHfn1kEAGvuEJd9pCGb3pMzsrtZr28Tjm0dvQmYJ3F
 XpNQcfS2hNq3nmVrT2O6V203h80KYxoiegB3eQfeyIUwLsPyg0mBl+WPDxbZW00KQDIt
 bCUDlvK8HMjcEY9DFNWk87TACWdv4slHp7ERPdxIjvhfEooRTgEBxlbBXj5HmIxLxTxN Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31s7k8hs6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 22 Jun 2020 14:38:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60C7F100038
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 14:38:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B075209AC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 14:38:04 +0200 (CEST)
Received: from lmecxl0694.lme.st.com (10.75.127.47) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 14:38:03 +0200
From: Antonio Borneo <antonio.borneo@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Philippe CORNU
 <philippe.cornu@st.com>
Date: Mon, 22 Jun 2020 14:36:42 +0200
Message-ID: <20200622123642.1196964-2-antonio.borneo@st.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622123642.1196964-1-antonio.borneo@st.com>
References: <20200622123642.1196964-1-antonio.borneo@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_07:2020-06-22,
 2020-06-22 signatures=0
Cc: Bernard PUEL <bernard.puel@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Valere DELONG <valere.delong@st.com>
Subject: [Linux-stm32] [PATCH 1/1] drm/bridge/synopsys/dsi: fix activation
	sequence
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

The current driver relies on the probing of panel or bridge
sub-nodes to trigger the execution of dsi host attach() in order
to add the dsi bridge to the global bridge list through
drm_bridge_add().
This causes an incomplete driver initialization if the panel or
the next bridge is not present as sub-node, e.g. because it is an
i2c device, thus sub-node of the respective i2c controller.

Move the relevant code from host attach() to probe(), and the
corresponding code from detach() to remove().

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Change-Id: I29df3ddbfc43272d56bef95f32686b2055778571
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 72 ++++++++++---------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index bd5d63032a75..02aadfc7042d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -310,16 +310,8 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 {
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
-	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	int i, nb_endpoints;
 	int ret = -ENODEV;
 
-	/* Get number of endpoints */
-	nb_endpoints = of_graph_get_endpoint_count(host->dev->of_node);
-	if (!nb_endpoints)
-		return -ENODEV;
-
 	if (device->lanes > dsi->plat_data->max_data_lanes) {
 		dev_err(dsi->dev, "the number of data lanes(%u) is too many\n",
 			device->lanes);
@@ -331,29 +323,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	for (i = 1; i < nb_endpoints; i++) {
-		ret = drm_of_find_panel_or_bridge(host->dev->of_node, i, 0,
-						  &panel, &bridge);
-		if (!ret)
-			break;
-		else if (ret == -EPROBE_DEFER)
-			return ret;
-	}
-
-	/* check if an error is returned >> no panel or bridge detected */
-	if (ret)
-		return ret;
-
-	if (panel) {
-		bridge = drm_panel_bridge_add(panel, DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
-
-	dsi->panel_bridge = bridge;
-
-	drm_bridge_add(&dsi->bridge);
-
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(pdata->priv_data, device);
 		if (ret < 0)
@@ -376,10 +345,6 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 			return ret;
 	}
 
-	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
-
-	drm_bridge_remove(&dsi->bridge);
-
 	return 0;
 }
 
@@ -1091,6 +1056,9 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	struct reset_control *apb_rst;
 	struct dw_mipi_dsi *dsi;
 	struct resource *res;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int i, nb_endpoints;
 	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -1171,11 +1139,45 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	dsi->bridge.of_node = pdev->dev.of_node;
 #endif
 
+	nb_endpoints = of_graph_get_endpoint_count(pdev->dev.of_node);
+	if (!nb_endpoints)
+		return ERR_PTR(-ENODEV);
+
+	for (i = 1; i < nb_endpoints; i++) {
+		ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, i, 0,
+				&panel, &bridge);
+		if (!ret)
+			break;
+		else if (ret == -EPROBE_DEFER)
+			return ERR_PTR(ret);
+	}
+
+	/* check if an error is returned >> no panel or bridge detected */
+	if (ret) {
+		dev_info(dsi->dev, "no panel or bridge detected");
+		return ERR_PTR(ret);
+	}
+	dev_info(dsi->dev, "panel or bridge detected");
+
+	if (panel) {
+		bridge = drm_panel_bridge_add(panel, DRM_MODE_CONNECTOR_DSI);
+		if (IS_ERR(bridge))
+			return ERR_PTR(PTR_ERR(bridge));
+	}
+
+	dsi->panel_bridge = bridge;
+
+	drm_bridge_add(&dsi->bridge);
+
 	return dsi;
 }
 
 static void __dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi)
 {
+	/* FIXME: it is not anymore port 1 */
+	drm_of_panel_bridge_remove(dsi->bridge.of_node, 1, 0);
+	drm_bridge_remove(&dsi->bridge);
+
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 
 	pm_runtime_disable(dsi->dev);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
