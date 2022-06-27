Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E95566724
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jul 2022 11:56:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 704D2C640F4;
	Tue,  5 Jul 2022 09:56:07 +0000 (UTC)
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 023D9C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 09:56:05 +0000 (UTC)
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
 (envelope-from <mchehab@linuxtv.org>)
 id 1o8fHn-00FTU1-4C; Tue, 05 Jul 2022 09:56:03 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 27 Jun 2022 08:15:37 +0000
To: linuxtv-commits@linuxtv.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Message-Id: <E1o8fHn-00FTU1-4C@www.linuxtv.org>
Cc: Marek Vasut <marex@denx.de>, Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [git:media_tree/master] media: stm32: dcmi: Drop
	always NULL sd_state from dcmi_pipeline_s_fmt()
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
Reply-To: linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: stm32: dcmi: Drop always NULL sd_state from dcmi_pipeline_s_fmt()
Author:  Marek Vasut <marex@denx.de>
Date:    Sat Jun 18 23:23:54 2022 +0100

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
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

 drivers/media/platform/st/stm32/stm32-dcmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

---

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 5f08ba47ea96..c604d672c215 100644
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
 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
