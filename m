Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC15A0AC5
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 09:53:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6494C640FC;
	Thu, 25 Aug 2022 07:53:43 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98892C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 07:53:42 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id m1so117200edb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Lc3v8hBHsCf49bYVex16KFSKbVG0hlFgO3dkVBUtLng=;
 b=e6L6q0BJUH+0W1pJctd5mNfbN9fET2DENNXVuhELy/kF0phr1KgPmbFrEL6S4XysGM
 ENOkFXDnlTf0HOOXyds250s4+e1nZ2S5t+l5rV5GknHKbwpwF6O1m1hlgSlTqwKshIfX
 qN5WrWKcNdQUeCq47fNrJljeHZ8YDMoqz900JcLJAUW0RDTMCs7DXcu6ob3YpWHQN5pj
 MxgcRgZFdqYKrj/le87dmCMrQZsXfgZvKns67C1hqEKSmcZ6LvTmBnZvphVn7aebsrBe
 XwkKOEgJUO8H/YDCOF7FaMrBMN/aSMBZ/ZivCIvOjBrywuiGm3PrCtSNjj6DwGlKw0cU
 MW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Lc3v8hBHsCf49bYVex16KFSKbVG0hlFgO3dkVBUtLng=;
 b=g+FmonPeXREzgzLN6Fz0VAgxjbPNyD0g/3vLqp7HJKY3b7mAUU0ZEOqiL+onRSP/A5
 CYAdDt/cRTG6kmIJIo3f4UqaQl6SY1cdMWWznJQ16gcDDDYp5AYXw/FmzZY215Y/GsVn
 Bp94+tx7zFVN1Gs3ba8PYwhBNp9RvYXMdloIANNElf5dP1NMljpqvE0c5RP9GutJ8kEV
 AaFX+vjdwDyTi9nRGx11J2CJngqAkTaQU0C9pbnQccCdDf3h31CqQhJRbGJdxF9c+Nbi
 COff9owviQ4imbXW1r7C9E4wdQNcsByO68WYDz00Pq5QNcUogu2WEK5b1rsN3DvK76D1
 C9Bg==
X-Gm-Message-State: ACgBeo0vgEq5r4o+j7RwQpvcizp8I8RDLoXgAOGymggIdQBTc5VxozRQ
 qTWCC+53CRhqiFKV7VBP02w3Ww==
X-Google-Smtp-Source: AA6agR6Wb3bI3r2PWMumq/hRNZ1lgycNJckeEnHdbCXKdsWIg069biDuqP8AkDqmL9yidwsSFdF9nQ==
X-Received: by 2002:aa7:cc97:0:b0:445:afab:2634 with SMTP id
 p23-20020aa7cc97000000b00445afab2634mr2190277edt.54.1661414022265; 
 Thu, 25 Aug 2022 00:53:42 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:142d:a900:eab:b5b1:a064:1d0d])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a170906b09600b0073dbfd33a8dsm1491736ejy.21.2022.08.25.00.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 00:53:41 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Date: Thu, 25 Aug 2022 09:53:38 +0200
Message-Id: <20220825075338.35338-3-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825075338.35338-1-jinpu.wang@ionos.com>
References: <20220825075338.35338-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Cai Huoqing <cai.huoqing@linux.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] mtd: rawnand: marvell: Fix error handle
	regarding dma_map_sg
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

dma_map_sg return 0 on error, in case of error return -ENXIO,
also add the dma_unmap_sg as rollback on the following error.

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
Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 2455a581fd70..d9f2f1d0b5ef 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -865,13 +865,19 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 	marvell_nfc_enable_dma(nfc);
 	/* Prepare the DMA transfer */
 	sg_init_one(&sg, nfc->dma_buf, dma_len);
-	dma_map_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	ret = dma_map_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	if (!ret) {
+		dev_err(nfc->dev, "Could not map DMA S/G list\n");
+		return -ENXIO;
+	}
+
 	tx = dmaengine_prep_slave_sg(nfc->dma_chan, &sg, 1,
 				     direction == DMA_FROM_DEVICE ?
 				     DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
 				     DMA_PREP_INTERRUPT);
 	if (!tx) {
 		dev_err(nfc->dev, "Could not prepare DMA S/G list\n");
+		dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
 		return -ENXIO;
 	}
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
