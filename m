Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88293273C37
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Sep 2020 09:43:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5256EC32EB1;
	Tue, 22 Sep 2020 07:43:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE6DBC32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 07:43:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08M7gTc3002829; Tue, 22 Sep 2020 09:43:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=6mBvDaCXFncoS27ajTyWe8Q1+g8qOj3nydHGBDl8Nus=;
 b=YA2MrzjJnG2u02KkE4z1+J4r4lLTRDUHVPcRpIRlN68xXvBbXKnHUGEk8+0FcXp2s7ar
 R5HYe791+k2LIM3XkrQdQR0FeOho/a12YMa5jtfQTQlTfh93Mv5A1s8EKCvCJX8TOv1C
 uoEpAFdM/UAzQybJmfd2HLc0aEYlPSDRGEHdluZ45Q8NG1E+ca4F9RxKs75eXqH5ZYGY
 dlSomrmTERkTSfGWNFsF/rZi4l6UCNQGoNDQCOHq1MamIsp0IDz5RYspjfmJVHeoKwZS
 7npDV7xvJK43yx+tq2bsvq8tpzAdQNP1Kis0qJbUhwaNGFUZbdm5fTqxLY5VyELuSu6l Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n7eynfd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 09:43:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3B8C100038;
 Tue, 22 Sep 2020 09:43:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89B37212FA9;
 Tue, 22 Sep 2020 09:43:05 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 22 Sep 2020 09:42:50 +0200
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Antonio Borneo <antonio.borneo@st.com>, "Vincent
 Abriou" <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 22 Sep 2020 09:42:42 +0200
Message-ID: <20200922074242.28719-1-yannick.fertre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_06:2020-09-21,
 2020-09-22 signatures=0
Subject: [Linux-stm32] [PATCH v2] drm/panel: otm8009a: remove hack to force
	commands in HS
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

The panel is able to receive commands in LP. The current hack to
force backlight commands in HS was due to workaround an incorrect
settings on DSI controller that prevents sending LP commands while
video out was active.

Remove the hack that forces HS commands.

Changes in v2:
  - Added my signed-off

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 .../gpu/drm/panel/panel-orisetech-otm8009a.c   | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 6ac1accade80..f80b44a8a700 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -99,20 +99,6 @@ static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
 		dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
 }
 
-static void otm8009a_dcs_write_buf_hs(struct otm8009a *ctx, const void *data,
-				      size_t len)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-
-	/* data will be sent in dsi hs mode (ie. no lpm) */
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
-	otm8009a_dcs_write_buf(ctx, data, len);
-
-	/* restore back the dsi lpm mode */
-	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
-}
-
 #define dcs_write_seq(ctx, seq...)			\
 ({							\
 	static const u8 d[] = { seq };			\
@@ -400,7 +386,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 		 */
 		data[0] = MIPI_DCS_SET_DISPLAY_BRIGHTNESS;
 		data[1] = bd->props.brightness;
-		otm8009a_dcs_write_buf_hs(ctx, data, ARRAY_SIZE(data));
+		otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
 
 		/* set Brightness Control & Backlight on */
 		data[1] = 0x24;
@@ -412,7 +398,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 
 	/* Update Brightness Control & Backlight */
 	data[0] = MIPI_DCS_WRITE_CONTROL_DISPLAY;
-	otm8009a_dcs_write_buf_hs(ctx, data, ARRAY_SIZE(data));
+	otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
