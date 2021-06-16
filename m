Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6733AA03F
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 17:45:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95B5BC59780;
	Wed, 16 Jun 2021 15:45:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CD15C58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 15:45:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GFgJuQ002225
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 16 Jun 2021 17:45:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=6uN9k1RVx2eaVMFxl7xFG55JUwSnTg/ZE2QQYMXu2+k=;
 b=gQpGCd2ZGD3SfvINOyZUQvz18f7F0U+WpL457X9/BnFLIv5jLOWf7ObQXxc40Z2cq2hQ
 x3paVE2osSsQNkxl3+CLUTebCnh8DWzGupHGR2vRk4oA7uwO/kaDZ3d4KIl6xZZbu2IK
 68gsB6309LVlpLOGFPPY9nW2aF7F0oQ99ej0saLcF8YuTNTT1/zgkjvedUbvQeggNpiU
 g8Sa88uS6+VK62Mv/zZnZkQrSB0OYdgRb7sU6v1llWozE5zLrjNBwmyJcdH7MAm7VeAJ
 tJ2l97hkXXAtcIaHGIKR+3+cWwztcvBwTcm61vQm2xZNkUAn+L6Y0pFJVzuX+8HE2jPC Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 396srm0qqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 16 Jun 2021 17:44:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C837100034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 17:44:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8201C231526
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 17:44:59 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun 2021 17:44:59
 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael GALLAIS-POU
 <raphael.gallais-pou@foss.st.com>
Date: Wed, 16 Jun 2021 17:44:48 +0200
Message-ID: <20210616154448.1839-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210531154845.50515-1-antonio.borneo@foss.st.com>
References: <20210531154845.50515-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-16_08:2021-06-15,
 2021-06-16 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] drm/stm: dsi: compute the transition time
	from LP to HS and back
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

The driver uses a conservative set of hardcoded values for the
maximum time delay of the transitions between LP and HS, either
for data and clock lanes.

By using the info in STM32MP157 datasheet, valid also for other ST
devices, compute the actual delay from the lane's bps.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
To: Philippe CORNU <philippe.cornu@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>
To: Raphael GALLAIS-POU <raphael.gallais-pou@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com

Ticket: https://intbugzilla.st.com/show_bug.cgi?id=91708

 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 8399d337589d..32cb41b2202f 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -309,14 +309,23 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	return 0;
 }
 
+#define DSI_PHY_DELAY(fp, vp, mbps) DIV_ROUND_UP((fp) * (mbps) + 1000 * (vp), 8000)
+
 static int
 dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
 			   struct dw_mipi_dsi_dphy_timing *timing)
 {
-	timing->clk_hs2lp = 0x40;
-	timing->clk_lp2hs = 0x40;
-	timing->data_hs2lp = 0x40;
-	timing->data_lp2hs = 0x40;
+	/*
+	 * From STM32MP157 datasheet, valid for STM32F469, STM32F7x9, STM32H747
+	 * phy_clkhs2lp_time = (272+136*UI)/(8*UI)
+	 * phy_clklp2hs_time = (512+40*UI)/(8*UI)
+	 * phy_hs2lp_time = (192+64*UI)/(8*UI)
+	 * phy_lp2hs_time = (256+32*UI)/(8*UI)
+	 */
+	timing->clk_hs2lp = DSI_PHY_DELAY(272, 136, lane_mbps);
+	timing->clk_lp2hs = DSI_PHY_DELAY(512, 40, lane_mbps);
+	timing->data_hs2lp = DSI_PHY_DELAY(192, 64, lane_mbps);
+	timing->data_lp2hs = DSI_PHY_DELAY(256, 32, lane_mbps);
 
 	return 0;
 }
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
