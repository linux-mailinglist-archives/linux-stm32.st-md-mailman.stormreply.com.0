Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C26881AAC7C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 17:58:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B391C36B0B;
	Wed, 15 Apr 2020 15:58:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3370C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 15:58:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FFX9Hr020652; Wed, 15 Apr 2020 17:58:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ysOQdhxkH/yrY5LkPt2G2khgQ9eVt+ECxotn643GF5M=;
 b=zxVPhSIXIipKdyN43ht2fZhnWd2je/Ls21V8h85LhCNHLSrJvKD3jhO/1M+GhJjG6RAd
 aRWJkbPx5oxTdC+fi9f+2p1VWrgWptTcD4YA1dQeB17HVUS32g4PuuF+HQzCqbngkZRe
 c/1R6B45PMIpx+OdlIGWMfWi97NRl+/M25gx0ws8S4dFcfYteZmln85vK4Co0n2hs2fQ
 Iq3LFQbeZ9pdHNs7dla4TBBl8AR+HG4GN5/+p2ocj4uwnLW0Hs+iFJw54PPqR78nOqcF
 yJ1dFwl4LDQe5IyQixNkpxkl7uxXLjFsNcpg6uAxNdi2UArX1q/nuwMsS0r23ANwsM83 TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn6svygw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 17:58:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E24D2100039;
 Wed, 15 Apr 2020 17:58:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDF302AF597;
 Wed, 15 Apr 2020 17:58:40 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 15 Apr 2020 17:58:40 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <tony@atomide.com>
Date: Wed, 15 Apr 2020 17:57:28 +0200
Message-ID: <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_05:2020-04-14,
 2020-04-15 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage all
	errors cases at probe time
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

This patch defers its probe when the expected reset control is not
yet ready. This patch also handles properly all errors cases at probe
time.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index b6d45cd..0a96797 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1967,7 +1967,11 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
 	}
 
 	rstc = devm_reset_control_get(dev, NULL);
-	if (!IS_ERR(rstc)) {
+	if (IS_ERR(rstc)) {
+		ret = PTR_ERR(rstc);
+		if (ret == -EPROBE_DEFER)
+			goto err_clk_disable;
+	} else {
 		reset_control_assert(rstc);
 		reset_control_deassert(rstc);
 	}
@@ -1975,7 +1979,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
 	/* DMA setup */
 	ret = stm32_fmc2_dma_setup(fmc2);
 	if (ret)
-		return ret;
+		goto err_dma_setup;
 
 	/* FMC2 init routine */
 	stm32_fmc2_init(fmc2);
@@ -1997,7 +2001,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
 	/* Scan to find existence of the device */
 	ret = nand_scan(chip, nand->ncs);
 	if (ret)
-		goto err_scan;
+		goto err_dma_setup;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
@@ -2010,7 +2014,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
 err_device_register:
 	nand_cleanup(chip);
 
-err_scan:
+err_dma_setup:
 	if (fmc2->dma_ecc_ch)
 		dma_release_channel(fmc2->dma_ecc_ch);
 	if (fmc2->dma_tx_ch)
@@ -2021,6 +2025,7 @@ static int stm32_fmc2_probe(struct platform_device *pdev)
 	sg_free_table(&fmc2->dma_data_sg);
 	sg_free_table(&fmc2->dma_ecc_sg);
 
+err_clk_disable:
 	clk_disable_unprepare(fmc2->clk);
 
 	return ret;
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
