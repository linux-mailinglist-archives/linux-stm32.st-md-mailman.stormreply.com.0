Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F02B0ABA
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Sep 2019 10:57:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E61FAC35E01;
	Thu, 12 Sep 2019 08:57:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D132C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2019 08:57:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8C8u6xt002413; Thu, 12 Sep 2019 10:56:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hC/Ep7sILGc8IpTJGW+E2kTEYIt84RL/dPIXG9oXwF0=;
 b=DxjeenHlDwZIXSKz4Z4Cj9H1cpx4vn5MQKPwyPNsHrltd/aGq+o1yO8tGnckqJRC1rQT
 TTPOBEn7Xm3/pY0nTQv62iCWyOKOPdXagbxmaGYUTGLFXVJRr9J745Yf0T8YzhMgvxIj
 Egqir2G8pxnZajnCAKontJPhtgQ3bODtPj0En19MSxqkZnR62OROnca6RjLlA+wST1Kv
 0+UXJgXGPswnPexcPT76AarTnogHSI0AsJoVVCIZICvYkoaPww4Pbdl2oNvga7B66J5P
 5HaDRbiCk1h77MaWfvXvtIl9nPZnpZLMtIg/C1rvoSeOq5j8JYibDjDUguNOPx5DkzdF YA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uv2awg4hb-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 12 Sep 2019 10:56:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C5C2A53;
 Thu, 12 Sep 2019 08:56:46 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1BA12B841B;
 Thu, 12 Sep 2019 10:56:45 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 12 Sep
 2019 10:56:45 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 12 Sep 2019 10:56:45
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 12 Sep 2019 10:56:29 +0200
Message-ID: <1568278589-20400-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-12_04:2019-09-11,2019-09-12 signatures=0
Subject: [Linux-stm32] [PATCH] drm/stm: dsi: higher pll out only in video
	burst mode
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

In order to better support video non-burst modes,
the +20% on pll out is added only in burst mode.

Signed-off-by: Philippe Cornu <philippe.cornu@st.com>
Reviewed-by: Yannick FERTRE <yannick.fertre@st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index a03a642..514efef 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -260,8 +260,11 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 	/* Compute requested pll out */
 	bpp = mipi_dsi_pixel_format_to_bpp(format);
 	pll_out_khz = mode->clock * bpp / lanes;
+
 	/* Add 20% to pll out to be higher than pixel bw (burst mode only) */
-	pll_out_khz = (pll_out_khz * 12) / 10;
+	if (mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		pll_out_khz = (pll_out_khz * 12) / 10;
+
 	if (pll_out_khz > dsi->lane_max_kbps) {
 		pll_out_khz = dsi->lane_max_kbps;
 		DRM_WARN("Warning max phy mbps is used\n");
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
