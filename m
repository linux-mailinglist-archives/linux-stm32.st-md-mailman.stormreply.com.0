Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA02113BA
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jul 2020 21:42:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BE68C36B24;
	Wed,  1 Jul 2020 19:42:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B47F3C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 19:42:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061JXrnH014351; Wed, 1 Jul 2020 21:42:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=3XpC/7/KvaihJVbbDEYxDWf1ZxZhppRyJrwJQBjz1QY=;
 b=iUtjGZxU2s4cmOVX8Tl9RDRNioP7wbW0K7j+bGHJLyXuzUCDmVJP0a0FNTtRdnKVY1Cp
 +L4LFKgZjznDzEeoo9jwXLeEG3Iq9wu/QDV92SHMwYyL/SIWxwKVkij13a+XluWM6bQU
 Ph1FwwfkQ4NV95xk0hPYN66JfRJeS6vxxsNp03GfLc0gBNU0qyEKkOvKNRohebBQgd9w
 kDgPU/NrggzJxrbL1ywzoCTyiE1x0ir+6ILWNWNBvgp0fcAHGsNQq+SBEa/5uBGurHDG
 uMq0fBqZYalperUJmL4HXpTzB/MJi9GLW9QZaRxZn6oeMJHQYgpFzFuQwsnBTKe4Ea+3 pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1kyhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 21:42:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0FBE910002A;
 Wed,  1 Jul 2020 21:42:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAC2F2BEC5A;
 Wed,  1 Jul 2020 21:42:36 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 1 Jul 2020 21:42:36 +0200
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 1 Jul 2020 21:42:34 +0200
Message-ID: <20200701194234.18123-1-yannick.fertre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_10:2020-07-01,
 2020-07-01 signatures=0
Subject: [Linux-stm32] [PATCH] drm/bridge/synopsys: dsi: add support for
	non-continuous HS clock
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

From: Antonio Borneo <antonio.borneo@st.com>

Current code enables the HS clock when video mode is started or to
send out a HS command, and disables the HS clock to send out a LP
command. This is not what DSI spec specify.

Enable HS clock either in command and in video mode.
Set automatic HS clock management for panels and devices that
support non-continuous HS clock.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index d580b2aa4ce9..979acaa90d00 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -365,7 +365,6 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
 	if (lpm)
 		val |= CMD_MODE_ALL_LP;
 
-	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
 	dsi_write(dsi, DSI_CMD_MODE_CFG, val);
 }
 
@@ -541,16 +540,22 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
 				 unsigned long mode_flags)
 {
+	u32 val;
+
 	dsi_write(dsi, DSI_PWR_UP, RESET);
 
 	if (mode_flags & MIPI_DSI_MODE_VIDEO) {
 		dsi_write(dsi, DSI_MODE_CFG, ENABLE_VIDEO_MODE);
 		dw_mipi_dsi_video_mode_config(dsi);
-		dsi_write(dsi, DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS);
 	} else {
 		dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
 	}
 
+	val = PHY_TXREQUESTCLKHS;
+	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
+		val |= AUTO_CLKLANE_CTRL;
+	dsi_write(dsi, DSI_LPCLK_CTRL, val);
+
 	dsi_write(dsi, DSI_PWR_UP, POWERUP);
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
