Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 109835995C5
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Aug 2022 09:12:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCA06C640FE;
	Fri, 19 Aug 2022 07:12:46 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC1B6C04005
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 06:08:09 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id gb36so6949500ejc.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Aug 2022 23:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zxM42Y9uEm9HYeKUiC4xFIG7yPyezX+CS6v5K5nZU8U=;
 b=DP1gLMIPVWB7ZYRop6oPt9NMumqgtsCGEOsM4vtsybhCRs5Dzp0CsQyLxargAIZINe
 ODmtV6u0iTI76C8ByXG7V1u+ccKF2e4qad3XsUzDIL6hye4OHE21JrXHHI932pE31adz
 R5XPcDmOIlBlW11EAcwZZ7lNflcuox+CFV9XjBDIN+0uCxGBFeyNFx2ldpUzzJncXSE0
 1qtTuvw6sM8xrgjoFNXPjTWjVc/9E1DWxISdgmYV5jaFfPcDxncJ6b7lwd3QEA0UaswE
 kDGyILqBu+97OQjN5PmYrcF4nGuApHE1R3j50OpsFP7F3eX1tJg1XxbfZIv3QdZxdek/
 84fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zxM42Y9uEm9HYeKUiC4xFIG7yPyezX+CS6v5K5nZU8U=;
 b=ZI1Vbf0diqo/9PK88J669igOc5+GyWMu6YdwUK1+T70LLZThDjWdr/8kAByD9MQ/cQ
 5oLh88lnXiFj4JcQNwAYfOSdSC9JK3VVOtsQlK09rUrQat1KFH0LfJLj4/0dS5kdZaf1
 NUbIDT+mnEbd5p4Vaf4YA9aTelboJvkxY9GNc2HDvM4+wnmTp18M7fIXpdgh/cQcKj9J
 4Bg+WDLuK6gOn+a44CouBunaabQAm8fP6KOU1gqGQLZeg56ZI0J6/LEHoXOZKn4TxG3R
 isgOXow4gmeYz2EhLvYHjGRkaX/6fzy+sPMrmlktLqSgAnvH8yRdTSrSqt/L7ZLU66Cv
 arHg==
X-Gm-Message-State: ACgBeo2KpR1WflQrfjFnIuwmIRPR0Ga4sVoJRDayM/W9WJRO9YQElxsW
 cwFhNqaPCvQLdUk8uS+PTgqq+Q==
X-Google-Smtp-Source: AA6agR7AxvNaR5kMACgc+5EvILcU4znfyr/yCo9fq+C5k8P8mQOI0CDjA9l2YlHqPOv1CkuTKAdmLQ==
X-Received: by 2002:a17:906:5d07:b0:738:b86d:df3d with SMTP id
 g7-20020a1709065d0700b00738b86ddf3dmr3767679ejt.617.1660889289504; 
 Thu, 18 Aug 2022 23:08:09 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:143b:fd00:5207:8c7f:747a:b80d])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a1709063a8e00b0073a644ef803sm1809660ejd.101.2022.08.18.23.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 23:08:08 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Aug 2022 08:07:47 +0200
Message-Id: <20220819060801.10443-6-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819060801.10443-1-jinpu.wang@ionos.com>
References: <20220819060801.10443-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Aug 2022 07:12:45 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Cai Huoqing <cai.huoqing@linux.dev>, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 05/19] mtd: rawnand: marvell: Fix error
	handle regarding dma_map_sg
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

dma_map_sg return 0 on error, in case of error return -EIO,
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
