Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6CB561C2
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Sep 2025 17:19:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39327C3F931;
	Sat, 13 Sep 2025 15:19:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C75B8C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Sep 2025 15:19:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A8FA43B3C;
 Sat, 13 Sep 2025 15:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BF1C4CEEB;
 Sat, 13 Sep 2025 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757776759;
 bh=3l1oTIkNxjy5OX16l6qHW4FBN6o/HIdlJKsNx/PnB8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DvhQNiLrokdSbX0zoE8wOEAUlZEhtvHh5Ejbk+iAGs3xhPdbMoHvRPoeT62QVW1+R
 Ryq2MGV6Q1XhS5caliz+jZPSOOf9UJfofiFlMENHninWsoaLA/M+WCUsGKs5tlRUkX
 Spx5L9f/WBNJXRe3q91dKnTkBEs4iDJdBqvx5IJOcz+ppe4UOwUPHasbRYVcmPEU5J
 BEomchFqI8hUZOpncDK03NySvToKtUm2uqhq40jNDC/MGOkR8h3tX0GSVN5EioEXeC
 Q5Jl2Zjmr06eRoG5MYMaaUWL78Syjaj1upYMboBkjcYXHIdCnwIxQ7WWC2fsHI4yn0
 8NpFtDs5Jhliw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Date: Sat, 13 Sep 2025 11:19:11 -0400
Message-ID: <20250913151912.1412912-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025091309-quote-graves-e875@gregkh>
References: <2025091309-quote-graves-e875@gregkh>
MIME-Version: 1.0
Cc: Sasha Levin <sashal@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jack Wang <jinpu.wang@ionos.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-mtd@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5.10.y 1/2] mtd: rawnand: stm32_fmc2: Fix
	dma_map_sg error check
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
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c0c47f31c100d..9e535405e8b20 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -858,8 +858,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
 			 eccsteps, dma_data_dir);
-	if (ret < 0)
-		return ret;
+	if (!ret)
+		return -EIO;
 
 	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
 					    eccsteps, dma_transfer_dir,
@@ -889,8 +889,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 		ret = dma_map_sg(nfc->dev, nfc->dma_ecc_sg.sgl,
 				 eccsteps, dma_data_dir);
-		if (ret < 0)
+		if (!ret) {
+			ret = -EIO;
 			goto err_unmap_data;
+		}
 
 		desc_ecc = dmaengine_prep_slave_sg(nfc->dma_ecc_ch,
 						   nfc->dma_ecc_sg.sgl,
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
