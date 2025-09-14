Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28054B5674F
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Sep 2025 10:02:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC9CDC36B3A;
	Sun, 14 Sep 2025 08:02:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA2B6C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Sep 2025 08:02:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6164B4400A;
 Sun, 14 Sep 2025 08:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C35C4CEF1;
 Sun, 14 Sep 2025 08:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1757836936;
 bh=Wl3GvEpXEoZA8lGiGYs8MlLTRQrCTWdnUNYFvuC0zYQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=EK8ayFXg10hDyaaWbIkcrvWj5z2Xvc6QTiD7DBnvIO7ZxGYzbpWbdMOhRwS1jaJMP
 wmJdiC+rWFgIk1CzWgZ4xnWgAzU8g9ALxz7SVAbN1XTeGej2vTuiNTc5ZVKFLwbAA9
 U3VZiUlYZK+C5qMRjFActtX2VyqWk4R8gJEVBrRU=
To: alexandre.torgue@foss.st.com, cai.huoqing@linux.dev,
 christophe.kerello@foss.st.com, gregkh@linuxfoundation.org,
 jinpu.wang@ionos.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, miquel.raynal@bootlin.com, p.zabel@pengutronix.de,
 richard@nod.at, sashal@kernel.org, vigneshr@ti.com
From: <gregkh@linuxfoundation.org>
Date: Sun, 14 Sep 2025 10:01:56 +0200
In-Reply-To: <20250913151912.1412912-1-sashal@kernel.org>
Message-ID: <2025091456-rendering-twistable-9506@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore
Cc: stable-commits@vger.kernel.org
Subject: [Linux-stm32] Patch "mtd: rawnand: stm32_fmc2: Fix dma_map_sg error
	check" has been added to the 5.10-stable tree
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


This is a note to let you know that I've just added the patch titled

    mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-rawnand-stm32_fmc2-fix-dma_map_sg-error-check.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-179501-greg=kroah.com@vger.kernel.org Sat Sep 13 17:19:24 2025
From: Sasha Levin <sashal@kernel.org>
Date: Sat, 13 Sep 2025 11:19:11 -0400
Subject: mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check
To: stable@vger.kernel.org
Cc: Jack Wang <jinpu.wang@ionos.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, Christophe Kerello <christophe.kerello@foss.st.com>, Cai Huoqing <cai.huoqing@linux.dev>, linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Message-ID: <20250913151912.1412912-1-sashal@kernel.org>

From: Jack Wang <jinpu.wang@ionos.com>

[ Upstream commit 43b81c2a3e6e07915151045aa13a6e8a9bd64419 ]

dma_map_sg return 0 on error, in case of error return -EIO.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Cc: linux-mtd@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20220819060801.10443-5-jinpu.wang@ionos.com
Stable-dep-of: 513c40e59d5a ("mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer")
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -858,8 +858,8 @@ static int stm32_fmc2_nfc_xfer(struct na
 
 	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
 			 eccsteps, dma_data_dir);
-	if (ret < 0)
-		return ret;
+	if (!ret)
+		return -EIO;
 
 	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
 					    eccsteps, dma_transfer_dir,
@@ -889,8 +889,10 @@ static int stm32_fmc2_nfc_xfer(struct na
 
 		ret = dma_map_sg(nfc->dev, nfc->dma_ecc_sg.sgl,
 				 eccsteps, dma_data_dir);
-		if (ret < 0)
+		if (!ret) {
+			ret = -EIO;
 			goto err_unmap_data;
+		}
 
 		desc_ecc = dmaengine_prep_slave_sg(nfc->dma_ecc_ch,
 						   nfc->dma_ecc_sg.sgl,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-5.10/media-i2c-imx214-fix-link-frequency-validation.patch
queue-5.10/flexfiles-pnfs-fix-null-checks-on-result-of-ff_layou.patch
queue-5.10/overflow-allow-mixed-type-arguments.patch
queue-5.10/tcp_bpf-call-sk_msg_free-when-tcp_bpf_send_verdict-f.patch
queue-5.10/media-mtk-vcodec-venc-avoid-wenum-compare-conditional-warning.patch
queue-5.10/tracing-fix-tracing_marker-may-trigger-page-fault-du.patch
queue-5.10/nfsv4-don-t-clear-capabilities-that-won-t-be-reset.patch
queue-5.10/s390-cpum_cf-deny-all-sampling-events-by-counter-pmu.patch
queue-5.10/mtd-add-check-for-devm_kcalloc.patch
queue-5.10/nfsv4-flexfiles-fix-layout-merge-mirror-check.patch
queue-5.10/overflow-correct-check_shl_overflow-comment.patch
queue-5.10/compiler.h-drop-fallback-overflow-checkers.patch
queue-5.10/mtd-nand-raw-atmel-respect-tar-tclr-in-read-setup-timing.patch
queue-5.10/mtd-nand-raw-atmel-fix-comment-in-timings-preparation.patch
queue-5.10/nfsv4-clear-the-nfs_cap_xattr-flag-if-not-supported-.patch
queue-5.10/net-fix-null-ptr-deref-by-sock_lock_init_class_and_name-and-rmmod.patch
queue-5.10/mtd-rawnand-stm32_fmc2-fix-dma_map_sg-error-check.patch
queue-5.10/mtd-rawnand-stm32_fmc2-avoid-overlapping-mappings-on-ecc-buffer.patch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
