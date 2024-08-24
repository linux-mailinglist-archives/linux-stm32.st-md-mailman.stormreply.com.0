Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C3895DB26
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Aug 2024 05:49:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C25BC7128A;
	Sat, 24 Aug 2024 03:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 436DBC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Aug 2024 03:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=lT8Q7lVbYLqAyc8sacwXTnlCDNIWPRROT3qiMFaqTZk=; b=ici0RPIL/M2nHmgpbOTzIczhfy
 Xf064nAGTpp3wblOY3ztqrmNg4G/oRrsm5TKwa4zywRcNwzYu1Rf08QJQ65m5S/L2Jx3eV+UQGsf7
 Mff+VAf+rr/L13sUmvF8WDOG+nvWHJYug58RxXvej6IIhW42tl98VqftFcYlm4cOdm5oA9+3nebE8
 5wFm2Mr7RYRQ+elxXzSZwHxZgjr9NAWBba6mtZDB6PDwBmc/tqvLVQB7URXCL2TWBxLx7QqSC3E5g
 vah03tQD4MtZdIu0x0BotBzYDJN+KnTgC3ow+x5Hd71rRPBnzVus8CdHINbN7Me70ym6TfyJiPRsl
 dh9ksCqA==;
Received: from
 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1shhmJ-00000001Mzu-3l73; Sat, 24 Aug 2024 03:49:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Date: Sat, 24 Aug 2024 05:49:11 +0200
Message-ID: <20240824034925.1163244-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
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
Subject: [Linux-stm32] remove the dma_set_{max_seg_size, seg_boundary,
	min_align_mask} return value v2
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

Hi all,

the above three functions can only return errors if the bus code failed
to allocate the dma_parms structure, which is a grave error that won't
get us far.  Thus remove the pointless return values, that so far have
fortunately been mostly ignored, but which the cleanup brigade now wants
to check for for no good reason.

Changes since v1:
 - fix SCSI to not call dma_set_max_seg_size and dma_set_seg_boundary
   unconditionally

Diffstat:
 drivers/accel/qaic/qaic_drv.c                         |    4 --
 drivers/dma/idma64.c                                  |    4 --
 drivers/dma/pl330.c                                   |    5 ---
 drivers/dma/qcom/bam_dma.c                            |    6 ----
 drivers/dma/sh/rcar-dmac.c                            |    4 --
 drivers/dma/ste_dma40.c                               |    6 ----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                |    6 ----
 drivers/media/common/videobuf2/videobuf2-dma-contig.c |    3 --
 drivers/media/pci/intel/ipu6/ipu6.c                   |    4 --
 drivers/mmc/host/mmci_stm32_sdmmc.c                   |    3 +-
 drivers/net/ethernet/microsoft/mana/gdma_main.c       |    6 ----
 drivers/scsi/lpfc/lpfc_init.c                         |    7 -----
 drivers/scsi/scsi_lib.c                               |   11 ++++++-
 include/linux/dma-mapping.h                           |   25 +++++++-----------
 14 files changed, 32 insertions(+), 62 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
