Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1174ABC6302
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 19:51:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C748FC5558D;
	Wed,  8 Oct 2025 17:51:38 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A29D7C5558A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 17:51:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi
 [82.203.166.19])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2D3D51E3A;
 Wed,  8 Oct 2025 19:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759945803;
 bh=XkimHfS9iI8iciAt6GWBkHgYuw7rZ850GjnUqpnVzB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sEXPQ+UxiVRWU9OAhzXSMUBAuujOUuRNOj5TaP89pKSBCukP3rV+kW7IqFjkjzdOs
 yUrG+Eeykb49IPESPQePkprP3aYrFYz1gayzOFSH799QgDKHVBQptzOmOsnYtIjged
 4y6h9qG9xhJaJ7l0wXom2kW5CIjWRa9SNSp/DVpk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed,  8 Oct 2025 20:50:49 +0300
Message-ID: <20251008175052.19925-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [Linux-stm32] [PATCH 22/25] media: stm32: dma2d: Drop unneeded
	v4l2_m2m_get_vq() NULL check
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

The v4l2_m2m_get_vq() function never returns NULL. The check was
probably intended to catch invalid format types, but that's not needed
as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
on the format type, so the type can't be incorrect. Drop the unneeded
return value check and, as the return value is not used for other
purposes and the function has no side effect, the function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 48fa781aab06..643913adc1f3 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -353,13 +353,8 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = prv;
-	struct vb2_queue *vq;
 	struct dma2d_frame *frm;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	frm = get_frame(ctx, f->type);
 	f->fmt.pix.width		= frm->width;
 	f->fmt.pix.height		= frm->height;
-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
