Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23D396EF2
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 10:29:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EFA8C57B69;
	Tue,  1 Jun 2021 08:29:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EF99C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 15:48:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14VFlCqA009080
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 31 May 2021 17:48:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=ljKzDSN0ubegxSHHbZEaQxobi1OhzCtaCp7VInqBDBQ=;
 b=nd8SdTjxqaZl+YWWHX66nqCChMN2wf+uCRHthpsNuJFAzYllJccQsNE0gwbSXz15xC9y
 jT92p7KIOwS0rVyyQRbZtn7/QnIf7QoYzMXFMNmpbh47sbLoAL0uX+YGA2vzQ3ORB8h5
 M6GdComcZAK1+wTyc9JacT7hAqsni0GXBYlub6ePG044j8rUth1eP8Ly5rgELJQHXRV6
 1CjEpEq3QnCRj/O++TEc4ygdz00O3WtD5q1V0omT8YOE+OMLVDuq1tLFK2XCargfJvau
 OzxaPfQmNciTNr11sypA4ds3Penv1ckCuuwi9cI6YoSadkEXBxODW3JxMSJwZAGqKCHz SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38vutw26ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 31 May 2021 17:48:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 45192100034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 17:48:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3849521019E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 17:48:51 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 31 May 2021 17:48:50
 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael GALLAIS-POU
 <raphael.gallais-pou@foss.st.com>
Date: Mon, 31 May 2021 17:48:45 +0200
Message-ID: <20210531154845.50515-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-31_10:2021-05-31,
 2021-05-31 signatures=0
X-Mailman-Approved-At: Tue, 01 Jun 2021 08:29:53 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] drm/stm: dsi: compute LP <=> HS time delay
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
time delay between LP and HS, for either data and clock lanes.

By using the info in STM32MP15x datasheet, compute the actual
delay from lane's bps.
For the other devices whose datasheet don't provide this info yet,
stick to the legacy values.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
To: Philippe CORNU <philippe.cornu@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>
To: Raphael GALLAIS-POU <raphael.gallais-pou@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com

Ticket: https://intbugzilla.st.com/show_bug.cgi?id=91708

 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 8399d337589d..cd5054bb5bc1 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -309,10 +309,31 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	return 0;
 }
 
+#define DSI_PHY_DELAY(fp, vp, mbps) DIV_ROUND_UP((fp) * (mbps) + 1000 * (vp), 8000)
+
 static int
 dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
 			   struct dw_mipi_dsi_dphy_timing *timing)
 {
+	struct dw_mipi_dsi_stm *dsi = priv_data;
+
+	if (dsi->hw_version == HWVER_131) {
+		/*
+		 * From datasheet of STM32MP15x
+		 * phy_clkhs2lp_time = (232+136*UI)/(8*UI)
+		 * phy_clklp2hs_time = (512+40*UI)/(8*UI)
+		 * phy_hs2lp_time = (128+64*UI)/(8*UI)
+		 * phy_lp2hs_time = (256+32*UI)/(8*UI)
+		 */
+		timing->clk_hs2lp = DSI_PHY_DELAY(232, 136, lane_mbps);
+		timing->clk_lp2hs = DSI_PHY_DELAY(512, 40, lane_mbps);
+		timing->data_hs2lp = DSI_PHY_DELAY(128, 64, lane_mbps);
+		timing->data_lp2hs = DSI_PHY_DELAY(256, 32, lane_mbps);
+
+		return 0;
+	}
+
+	/* No data for the older DSI, yet */
 	timing->clk_hs2lp = 0x40;
 	timing->clk_lp2hs = 0x40;
 	timing->data_hs2lp = 0x40;
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
