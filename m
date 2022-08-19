Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5A5995C6
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Aug 2022 09:12:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE4CDC640FB;
	Fri, 19 Aug 2022 07:12:46 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93AFDC04005
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 06:08:08 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id e13so4416040edj.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Aug 2022 23:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OzHUmQwcd+nCjF20f8h6cgiTVwPuicRa6w7QZAA1SIg=;
 b=YvXzy4ZZy1mdY4EMhepxkx1ON9GYFpmRW9Ft40fg5ySPmER4WpPEAyH3L2RPcRsDzn
 E3fbrhOX1RZ6y3tlBQK1gEOw3s81guyqOtbmH27tahaoKKVBaXeNpEHk6YF11vQlUI4y
 GJnFXYkXFW6nvVO8SaIE+GRZ1PupQN3KqmS/i5opp1YE2pZzKO8Fiilwqy6WRK0ij+M1
 pu2ShCoE+5XhledK85vKM0BQXjbtLuuesDCNfsvvfiMVj+UfZ6ghPG8gzgGa0P/3cHAe
 lapqf0KVRt2y3d06Mam60j47THi3xFU81mHpIEcUU33+bd+tpRGo+dBzZLdB1iqy/wxF
 4fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OzHUmQwcd+nCjF20f8h6cgiTVwPuicRa6w7QZAA1SIg=;
 b=jO3n2mXsjr2+MuFbnR22i0qXDr9GbnrciiDuqL4ozTd109oXQZWiZHRY9tn8KVll5Z
 6AuGix15VZNvMeuGKm9BL3FkS0sLQ6A1xSgOtXqvf/WDxZipgF/+Mvn0rNpzOJUI2q0A
 SSXtcpaOeyBIM4nMiEMazCPlOyCNulgLx9L0/JXaxVBP7C+Zr1msBEa+MmKmL7f2NP1x
 OBv15cmyGerAfLefI5G6oSUoWYGVaKpIAB42+Rl7xin6R7Zf1M5loJWr2qKrUxJGF+zN
 gAWgXv40wrQLMw61BEpb3pQw4wp0pLskDa9y/aaq9MwAv3BRZL8pZOEUVafK9mHQsIQh
 ge3Q==
X-Gm-Message-State: ACgBeo2qqntifS9kDZP5Tirob+L0zuCkD4lQBfq5IRNhhtC9uExvEFpn
 9FlCY0DzQ/AkTXxihKWoIexfPA==
X-Google-Smtp-Source: AA6agR5DmMBvK+oUIDsQEG+pVfZgLO3Ld7GCkKqrInhA0LiEoWlC+RNyND2neXiQETWHpQprWlyS9g==
X-Received: by 2002:a05:6402:42c3:b0:43d:682f:c0ca with SMTP id
 i3-20020a05640242c300b0043d682fc0camr4885929edc.334.1660889288038; 
 Thu, 18 Aug 2022 23:08:08 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:143b:fd00:5207:8c7f:747a:b80d])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a1709063a8e00b0073a644ef803sm1809660ejd.101.2022.08.18.23.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 23:08:07 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Aug 2022 08:07:46 +0200
Message-Id: <20220819060801.10443-5-jinpu.wang@ionos.com>
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
Subject: [Linux-stm32] [PATCH v1 04/19] mtd: rawnand: stm32_fmc2: Fix
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
