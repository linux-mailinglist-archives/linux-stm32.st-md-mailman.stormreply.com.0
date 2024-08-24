Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE07095DB28
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Aug 2024 05:49:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7445AC71289;
	Sat, 24 Aug 2024 03:49:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76F97C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Aug 2024 03:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=D9jVhl7oJxULjz2/rXwXfEOWQLpDc7NeMcx1BhhLUUk=; b=OQjhwG5q0Syjaw8wq3XKSQxyzK
 F9hdV5VMIlZ4OpNOBRpUW4cP4Uov5jWpPSM3Ymnyux9uaOqRperERaJvNp5R7Ejwlg/31yHfe/18/
 LDmv+Pc3eS9ZmLURoaAkGj5/EWBm5E/57XTEaSKR6lv7FfaxTScBeGXi+kCY//jkX6+8i4CyV5/bW
 EiNNAAArjhjZm3nvjgwJlHca2s/RtGgqlkF88XC2YnoNxd/m4g8/WpQMk2XG7bKxwmXIlKo4tp65X
 HyB+AI9FHIqoC5DkZ5Tmg5FOGfaNnqGRJYY6IjwTw/Tb1ncGAjYwXnGhfrt63FxkvdxHxOUFIVmhY
 aGsZkdBg==;
Received: from
 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1shhmP-00000001N0f-2L3A; Sat, 24 Aug 2024 03:49:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Date: Sat, 24 Aug 2024 05:49:13 +0200
Message-ID: <20240824034925.1163244-3-hch@lst.de>
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
Subject: [Linux-stm32] [PATCH 2/4] dma-mapping: don't return errors from
	dma_set_min_align_mask
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

A NULL dev->dma_parms indicates either a bus that is not DMA capable or
grave bug in the implementation of the bus code.

There isn't much the driver can do in terms of error handling for either
case, so just warn and continue as DMA operations will fail anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 include/linux/dma-mapping.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index f693aafe221f2c..cfd6bafec3f944 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -575,13 +575,12 @@ static inline unsigned int dma_get_min_align_mask(struct device *dev)
 	return 0;
 }
 
-static inline int dma_set_min_align_mask(struct device *dev,
+static inline void dma_set_min_align_mask(struct device *dev,
 		unsigned int min_align_mask)
 {
 	if (WARN_ON_ONCE(!dev->dma_parms))
-		return -EIO;
+		return;
 	dev->dma_parms->min_align_mask = min_align_mask;
-	return 0;
 }
 
 #ifndef dma_get_cache_alignment
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
