Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDC95DB27
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Aug 2024 05:49:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B5EDC7128F;
	Sat, 24 Aug 2024 03:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30207C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Aug 2024 03:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hfCFH7RPHdPA6U8oxZwM/RzFKw4srQhejXrAt6uaIy8=; b=3/wz9G3CM/7zwOw+geH+3HijIX
 cgRSROcz97yOSL7g5QA59ZHHQTGTMTrLnBSogzHi6HhvO2ymO6GbZihU8VNaYatUN7nOc36JOTCzG
 nv9v6zxENuJIXEGTG6xiIkCBcQD/zvFVoHGQR2dfVcdpBGimBGrAhzDIqn0pDuzWAWDyXWErGcyCZ
 /G5zCzSvZesYxU3tkQGvOQ513LzCGjfxlDDtS4+HfGH/JxUFBCdd26G7OSLD5F+di+wI1q1S8yUvT
 YDwvZT7nd/jKD3ZHfdFIKToJqstLH63TCtL78pykSJHnWMBU+mgwk4i4n0iLR9epU0+4FDQYmFILL
 zpFmyeCQ==;
Received: from
 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1shhmM-00000001N07-2TWU; Sat, 24 Aug 2024 03:49:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Date: Sat, 24 Aug 2024 05:49:12 +0200
Message-ID: <20240824034925.1163244-2-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240824034925.1163244-1-hch@lst.de>
References: <20240824034925.1163244-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-hyperv@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Linux-stm32] [PATCH 1/4] scsi: check that busses support the DMA
	API before setting dma parameters
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

We'll start throwing warnings soon when dma_set_seg_boundary and
dma_set_max_seg_size are called on devices for buses that don't fully
support the DMA API.  Prepare for that by making the calls in the SCSI
midlayer conditional.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/scsi_lib.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 3958a6d14bf457..7f0394c4492033 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1988,8 +1988,15 @@ void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
 	if (shost->no_highmem)
 		lim->features |= BLK_FEAT_BOUNCE_HIGH;
 
-	dma_set_seg_boundary(dev, shost->dma_boundary);
-	dma_set_max_seg_size(dev, shost->max_segment_size);
+	/*
+	 * Propagate the DMA formation properties to the dma-mapping layer as
+	 * a courtesy service to the LLDDs.  This needs to check that the buses
+	 * actually support the DMA API first, though.
+	 */
+	if (dev->dma_parms) {
+		dma_set_seg_boundary(dev, shost->dma_boundary);
+		dma_set_max_seg_size(dev, shost->max_segment_size);
+	}
 }
 EXPORT_SYMBOL_GPL(scsi_init_limits);
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
