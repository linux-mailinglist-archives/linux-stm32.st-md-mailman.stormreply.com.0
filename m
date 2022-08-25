Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E65365A0AC4
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 09:53:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B70FBC640F9;
	Thu, 25 Aug 2022 07:53:42 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80AC6C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 07:53:41 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z2so25033927edc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=78LV1OFXn4kU+Li1Jo3v1pAvNQIAGmy0sk/6bF76fRQ=;
 b=Wd51wZvW5WFwaIoYN+lZ7WHoYz8LAT/LPsPSjAobWsPxeAy1SqWwSgQXNTbCFJEEFN
 dTuv8fiTkttDgJ+zDqXUQeTmFin9tS1kg3LomvI5oh0xcddf71DyXfveF39TixR4DFxu
 hRv+fJxhv+j9rRQqeUIqwJdFXp/gz2MKdQZ34HsnWsPDKV8Q8eHBxuC1P1GC5+3VcuO1
 V8j+cHHxip61cL0sUUkKKMjZn25Dy9eHrHWW2KQR3wVa/Gy0MXSsERnN8iNyTpYkxiTI
 7pzltRRgFUBUU2HudbKJ/l9Iz4WZwQhzAGhVZS8aqWN/dybO0mS+upWrof4DYmhTSpK8
 BxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=78LV1OFXn4kU+Li1Jo3v1pAvNQIAGmy0sk/6bF76fRQ=;
 b=0d5UzURjezNBDx0asU9IzOabPEeAt5zS4AzaTNi7UrI91GytxjPV0ZmM7Stm1Ze6pG
 BWsiQZNn0Za0RQcHBBJgBTKbjvgjdcEgn7lx2TUNdpZW8Tkewt4WYApBdJ0ddnwZumfG
 48dfJILqCxlAnXjBT6zxPiZwi5dWU4Jh20VsemrdtSqAyF7W2TvZqypI+m6oZAZ2HN45
 +C8TviSvn6bHUjZ1kqeiEeP5B7rJIr4rfk38bhMeIGXFLHXtJSDW+zgl6kCLlB2jVq/u
 naFqDRkOtACMYBCDiRDXf51TsONNfL65do1gl55cOTqj1iCg91ZmzR4WH/JswC0M0vQS
 JTbg==
X-Gm-Message-State: ACgBeo1La1OxKQafzRIy5DnjZeyT2KJ64QpPEzJQj8hmFnp+19tVwcnM
 8iouPwnCfAOrBZGpRVj5EIM8MA==
X-Google-Smtp-Source: AA6agR5W9ulp4PdYSwLAp/6nQblVWJxOhoKk/OJmVAtEANwcbeTL0n2XJqbo+/Dr37lNINquqWbUNQ==
X-Received: by 2002:a05:6402:3509:b0:43e:d80b:44a8 with SMTP id
 b9-20020a056402350900b0043ed80b44a8mr2174857edd.255.1661414021084; 
 Thu, 25 Aug 2022 00:53:41 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:142d:a900:eab:b5b1:a064:1d0d])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a170906b09600b0073dbfd33a8dsm1491736ejy.21.2022.08.25.00.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 00:53:40 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Date: Thu, 25 Aug 2022 09:53:37 +0200
Message-Id: <20220825075338.35338-2-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825075338.35338-1-jinpu.wang@ionos.com>
References: <20220825075338.35338-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Cai Huoqing <cai.huoqing@linux.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] mtd: rawnand: stm32_fmc2: Fix dma_map_sg
	error check
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
Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 87c1c7dd97eb..a0c825af19fa 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -862,8 +862,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
 			 eccsteps, dma_data_dir);
-	if (ret < 0)
-		return ret;
+	if (!ret)
+		return -EIO;
 
 	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
 					    eccsteps, dma_transfer_dir,
@@ -893,8 +893,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
