Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13C550753
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Jun 2022 00:23:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17B89C5F1F9;
	Sat, 18 Jun 2022 22:23:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E11FBC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jun 2022 22:23:56 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5577683F6A;
 Sun, 19 Jun 2022 00:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655591036;
 bh=JzLYLG6+uKVyOgzUfVF0G9CvRGpBJwsOe34hPa8nUFg=;
 h=From:To:Cc:Subject:Date:From;
 b=lPOHB5RQ1msl7YpLe2ibK3mzPfL0TZaxDoxFK+HHiO/PfqWEuWxprnYOSOrZt/bEo
 Q/w3/rvigkzWXWN/NQ9Mr/IZX+STi873pJyQX8IpbpI/4Fz6NnU9MPDpxQmS6lp0p5
 foMF4EVbVj1HP5/B6KzkErz99knJJJFXj/KhNxlp72U3pwjxjeCTwGHK1FdG7e2/Mz
 aqL3jJr6kUL/8mTf301HPy21u2Un7uybz1curgddQdCpjakNhnOsAoFyMx6UiSww9u
 MUotBAv//w2wiVZ0te7EFRfC2NHuw+UbKYuBYLr0H2tL/CDT3Y8F9jjbJ0Bpz6G9W0
 ULDLE0PM3tTlg==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Date: Sun, 19 Jun 2022 00:23:54 +0200
Message-Id: <20220618222354.478227-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] media: stm32: dcmi: Drop always NULL sd_state
	from dcmi_pipeline_s_fmt()
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

The second argument is always NULL, stop passing it to the function.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 56f4e04bc7c49..ec54b5ecfd544 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -622,7 +622,6 @@ static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
 }
 
 static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
-			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *format)
 {
 	struct media_entity *entity = &dcmi->source->entity;
@@ -664,7 +663,7 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
 			format->format.width, format->format.height);
 
 		fmt.pad = pad->index;
-		ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
+		ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
 		if (ret < 0) {
 			dev_err(dcmi->dev, "%s: Failed to set format 0x%x %ux%u on \"%s\":%d pad (%d)\n",
 				__func__, format->format.code,
@@ -1115,7 +1114,7 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
 	mf->width = sd_framesize.width;
 	mf->height = sd_framesize.height;
 
-	ret = dcmi_pipeline_s_fmt(dcmi, NULL, &format);
+	ret = dcmi_pipeline_s_fmt(dcmi, &format);
 	if (ret < 0)
 		return ret;
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
