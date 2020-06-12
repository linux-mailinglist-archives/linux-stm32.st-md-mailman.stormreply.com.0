Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE491F7AB5
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2020 17:23:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28D17C36B21;
	Fri, 12 Jun 2020 15:23:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E668FC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 15:23:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05CFMR02016903; Fri, 12 Jun 2020 17:23:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Pjdkqf0iNDhsdmITwjZsSH1DCxFnXTvI5U7f8Lsv1nI=;
 b=RrjTyH/f/Qz2lchyKJILkskbIzipXYbJ1COBEXLK9jkdfdbf8T/SYChUKy8YfSexhwLv
 ZaeluLMGXLTG92XxUt+bc+1KhPhd12rRfrcp/fM7Qysb7N5lRmGVTAig6HX4z6vjQ8iZ
 Ie2YfFoGeTdH9NYdC1ZzIZNAXuhgz7OyiY4Dq9zG0ME9dY62UuWFIBfQV6nW8GKsR57B
 IyWNqep9xpRnSv/BcPdYFLxEzfGAjkumWBhlakANzbA7ElbwXGAMR54x6TixQpo/yjGe
 xe8Iqa56m4ceT/dxMkdab0yhrzuW8bt1Z96vlFJydQTgiweVsyZUPU0MVdvwPzbLdSch kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g0ww8s82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 17:23:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 265BE100034;
 Fri, 12 Jun 2020 17:23:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16E702B9918;
 Fri, 12 Jun 2020 17:23:23 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 12 Jun 2020 17:23:22 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <arnd@linaro.org>,
 <alexandre.torgue@st.com>
Date: Fri, 12 Jun 2020 17:22:37 +0200
Message-ID: <1591975362-22009-2-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_11:2020-06-12,
 2020-06-12 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 1/6] mtd: rawnand: stm32_fmc2: do not
	display errors if the driver is deferred
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

A MDMA issue has been solved on Kernel 5.7. The effect of this fix is
that the MDMA driver is now deferred and the FMC2 NFC driver is also
deferred. All is working fine but there is a FMC2 log in the console:
stm32_fmc2_nfc 58002000.nand-controller: failed to request tx DMA
channel: -517

This patch removes the display of this log in the console in case of
this error is -EPROBE_DEFER.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 65c9d17..e7b706b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1570,7 +1570,7 @@ static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 	nfc->dma_tx_ch = dma_request_chan(nfc->dev, "tx");
 	if (IS_ERR(nfc->dma_tx_ch)) {
 		ret = PTR_ERR(nfc->dma_tx_ch);
-		if (ret != -ENODEV)
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
 			dev_err(nfc->dev,
 				"failed to request tx DMA channel: %d\n", ret);
 		nfc->dma_tx_ch = NULL;
@@ -1580,7 +1580,7 @@ static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 	nfc->dma_rx_ch = dma_request_chan(nfc->dev, "rx");
 	if (IS_ERR(nfc->dma_rx_ch)) {
 		ret = PTR_ERR(nfc->dma_rx_ch);
-		if (ret != -ENODEV)
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
 			dev_err(nfc->dev,
 				"failed to request rx DMA channel: %d\n", ret);
 		nfc->dma_rx_ch = NULL;
@@ -1590,7 +1590,7 @@ static int stm32_fmc2_nfc_dma_setup(struct stm32_fmc2_nfc *nfc)
 	nfc->dma_ecc_ch = dma_request_chan(nfc->dev, "ecc");
 	if (IS_ERR(nfc->dma_ecc_ch)) {
 		ret = PTR_ERR(nfc->dma_ecc_ch);
-		if (ret != -ENODEV)
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
 			dev_err(nfc->dev,
 				"failed to request ecc DMA channel: %d\n", ret);
 		nfc->dma_ecc_ch = NULL;
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
