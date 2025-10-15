Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A9BDD3AB
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 09:54:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B41D8C5661C;
	Wed, 15 Oct 2025 07:54:43 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9ADC8C56618
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:54:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi
 [87.94.110.32])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 50099E92;
 Wed, 15 Oct 2025 09:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1760514783;
 bh=CwTElZLs4bPxkRmOwkt0UmU404lXkx8MOBZz7ohhI+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rJGFkmn1kKN24nB2M+W2y4AIRNkExAH8h+nRq/ZxqF0B3xoB6HbzVwGREl78Dl2D/
 PhpxcvDB8y6dHm1eeI1i4y0MBN1bilwaDMoh3/UXmCO20p/AsZO9Q1HGRGa8Zmfe2k
 JJL1AM50DjZRqhXckDfWJhLRjyQmYGWspZcP2uek=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 15 Oct 2025 10:53:45 +0300
Message-ID: <20251015075353.22625-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [Linux-stm32] [PATCH v2 22/25] media: stm32: dma2d: Drop unneeded
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
index 468c247ba328..30544ceca42c 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -355,13 +355,8 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = file2ctx(file);
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
