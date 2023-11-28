Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8F7FB269
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 08:15:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C816C6B469;
	Tue, 28 Nov 2023 07:15:45 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 864BBC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 16:55:34 +0000 (UTC)
Received: from benjamin-XPS-13-9310..
 (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 75AB7660737B;
 Mon, 27 Nov 2023 16:55:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701104134;
 bh=X02tzOo2kO6Xf8Mm3XO+fdYdi1NrT5mrpTJUnhqGe4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SYacJ+X5qY1brq6yAX2v6Zh8vkADiRh6fL5ssu4J7Myr/+F2ok5EzyvDWTgMHHjXP
 5zzfGnbfATjw9t+mQdXymhiV3mymtoeLiX65T3m8+Ae4xllQeIw6OFIgIeSqC1NSzn
 dbhT00XGtQ+nld5mStG1N0pyys73Mse09oS0sERTP7WakGbDOcD4bjJEPnjWZ/NJ7y
 Gor0tI48ojqW9MVdR4Al0vXf/6SiknsCV8AFr179BFApBGgQUjqxKUFHRGZtC/PScq
 9FbmTemR64ciabk44Ke+awxocJzpI59XYNQVsAv4rhwe4vkrNSdaZJSSvCkpQR6meB
 0UY/Dv//MyFIQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl, mchehab@kernel.org, tfiga@chromium.org,
 m.szyprowski@samsung.com, matt.ranostay@konsulko.com
Date: Mon, 27 Nov 2023 17:54:35 +0100
Message-Id: <20231127165454.166373-37-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Nov 2023 07:15:45 +0000
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 36/55] media: stm32: stm32-dcmi: Use
	min_dma_buffers_needed field
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

smt32-dcmi driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>
CC: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 48140fdf40bb..a267fdcbe886 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2031,7 +2031,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	q->ops = &dcmi_video_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_buffers_needed = 2;
+	q->min_dma_buffers_needed = 2;
 	q->allow_cache_hints = 1;
 	q->dev = &pdev->dev;
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
