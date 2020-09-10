Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0F264216
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 11:32:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AADE7C3FAFE;
	Thu, 10 Sep 2020 09:32:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE6E2C3FAE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 09:32:36 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08A9QfoN032717; Thu, 10 Sep 2020 11:32:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+COKLz+6WybyodfwHJziasnDtJLeiuO/fCZoNZW0ReY=;
 b=qhQd43AVtcAtVe1yYjZgrjJKsZeHIsn1fMqBGqkh+uy30fFquTmT/YHAAL1uGSygckVw
 J7GZh0ITHhQ1o0Grnr2Mz/GrSIWVo8cDQzyUFEmOdptjbUpQBxUmO36gpqiCCIofoDaq
 qI4Tq3/x5tgZfSrvhIP1TejKWVHFsVjUdzxYmUnwie6MGn1YweQrgtMhfqbCcX3YUFUY
 vLvcQk63RKwJUMrTnNGbHUXBSx2SGM6MX7iP0T6zQL3iPXIc40IMcumcPhURaDx/Ls1t
 X+6t92qT2TPCZni9udW0lPvH8lKdoSunFHLFeD+CtL6vbsnZpEZ5XEbM5rPWtcDEof0L Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0ev27vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 11:32:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F34C10002A;
 Thu, 10 Sep 2020 11:32:29 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 756DB21CA68;
 Thu, 10 Sep 2020 11:32:29 +0200 (CEST)
Received: from localhost (10.75.127.50) by GPXDAG3NODE5.st.com (10.75.127.72)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 10 Sep 2020 11:32:28 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@st.com>
Date: Thu, 10 Sep 2020 11:32:29 +0200
Message-ID: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_01:2020-09-10,
 2020-09-10 signatures=0
Cc: linux-kernel@vger.kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: stm32: do not display error when DMA is
	not requested
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

DMA usage is optional for the I2C driver. check for the -ENODEV
error in order to avoid displaying an error when no DMA
has been requested.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
This patch should be applied on top of the patch [i2c: stm32: Simplify with dev_err_probe()]
---
 drivers/i2c/busses/i2c-stm32.c   | 16 ++++++++++------
 drivers/i2c/busses/i2c-stm32f7.c |  5 +++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 198f848b7be9..91767156d63d 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -25,8 +25,11 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	/* Request and configure I2C TX dma channel */
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->chan_tx),
-				    "can't request DMA tx channel\n");
+		if (PTR_ERR(dma->chan_tx) == -ENODEV)
+			ret = PTR_ERR(dma->chan_tx);
+		else
+			ret = dev_err_probe(dev, PTR_ERR(dma->chan_tx),
+					    "can't request DMA tx channel\n");
 		goto fail_al;
 	}
 
@@ -44,8 +47,11 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	/* Request and configure I2C RX dma channel */
 	dma->chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->chan_rx),
-				    "can't request DMA rx channel\n");
+		if (PTR_ERR(dma->chan_tx) == -ENODEV)
+			ret = PTR_ERR(dma->chan_tx);
+		else
+			ret = dev_err_probe(dev, PTR_ERR(dma->chan_rx),
+					    "can't request DMA rx channel\n");
 		goto fail_tx;
 	}
 
@@ -73,8 +79,6 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
-	if (ret != -EPROBE_DEFER)
-		dev_info(dev, "can't use DMA\n");
 
 	return ERR_PTR(ret);
 }
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index a8f1758e4c5b..58f342aea3c1 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2049,6 +2049,11 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 					     STM32F7_I2C_TXDR,
 					     STM32F7_I2C_RXDR);
 	if (PTR_ERR(i2c_dev->dma) == -ENODEV) {
+		/*
+		 * DMA usage is not mandatory for the I2C, it is not an error
+		 * to receive -ENODEV
+		 */
+		dev_dbg(i2c_dev->dev, "not using DMA\n");
 		i2c_dev->dma = NULL;
 	} else if (IS_ERR(i2c_dev->dma)) {
 		ret = dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->dma),
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
