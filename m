Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472B26896D
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Sep 2020 12:41:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C283EC424B1;
	Mon, 14 Sep 2020 10:41:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 059F6C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Sep 2020 10:41:11 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08EAbFPo020705; Mon, 14 Sep 2020 12:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4AOl8zA73SiKvpzlJQNtoLQ7m//cXKzrs7YyUfVTfBY=;
 b=O5x0BqE/4a9f2c1gkhYShO5czig4PZSI27N1vVHs5oxGk381Ybc05NixUflE3WzWo5Yh
 XphTxKaEn7fs3oKRv7xgnQnTmTu80/cwSnKmZP2eNX6kLp50bsjvRvzPVmDM5MsdUOGh
 zwhQ2u+96R2THq7tbm2/iIaODXe5xWNVv1uCDAgav3D2ignhf+vvqyKdamvPJzXdevki
 dUQz7RgaHYXf5IXCyEcqrKCv1C8208TMA++aZ3/9IjBdP52StUBXKt1mbwRqM3kml7lZ
 7v7sVxyv3K9hfxkt+fcWzD1DMgww7wqcOFZu3nzCsazFR1CU7sN/w5GxMSEVsn23CT96 ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33gm3w9med-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 12:40:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83187100038;
 Mon, 14 Sep 2020 12:40:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D5DE2ADA05;
 Mon, 14 Sep 2020 12:40:55 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Sep 2020 12:40:55
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@st.com>
Date: Mon, 14 Sep 2020 12:40:34 +0200
Message-ID: <1600080034-2050-3-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600080034-2050-1-git-send-email-alain.volmat@st.com>
References: <1600080034-2050-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_02:2020-09-10,
 2020-09-14 signatures=0
Cc: linux-kernel@vger.kernel.org, krzk@kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] i2c: stm32: Simplify with
	dev_err_probe()
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

From: Krzysztof Kozlowski <krzk@kernel.org>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
v2: rebased on top of patch [i2c: stm32: fix error message on upon
dma_request_chan & defer handling]
---
 drivers/i2c/busses/i2c-stm32.c   | 10 ++++++----
 drivers/i2c/busses/i2c-stm32f4.c |  6 ++----
 drivers/i2c/busses/i2c-stm32f7.c | 14 +++++---------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 468620db9ea5..157c64e27d0b 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -26,8 +26,9 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
 		ret = PTR_ERR(dma->chan_tx);
-		if ((ret != -ENODEV) && (ret != -EPROBE_DEFER))
-			dev_err(dev, "can't request DMA tx channel\n");
+		if (ret != -ENODEV)
+			ret = dev_err_probe(dev, ret,
+					    "can't request DMA tx channel\n");
 		goto fail_al;
 	}
 
@@ -46,8 +47,9 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma->chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
 		ret = PTR_ERR(dma->chan_rx);
-		if ((ret != -ENODEV) && (ret != -EPROBE_DEFER))
-			dev_err(dev, "can't request DMA rx channel\n");
+		if (ret != -ENODEV)
+			ret = dev_err_probe(dev, ret,
+					    "can't request DMA rx channel\n");
 
 		goto fail_tx;
 	}
diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 48e269284369..937c2c8fd349 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -797,10 +797,8 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 
 	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst)) {
-		ret = PTR_ERR(rst);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Error: Missing reset ctrl\n");
-
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				    "Error: Missing reset ctrl\n");
 		goto clk_free;
 	}
 	reset_control_assert(rst);
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 8a61320a9cb9..0fbd964c2fe8 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1968,11 +1968,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 						    "wakeup-source");
 
 	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(i2c_dev->clk)) {
-		if (PTR_ERR(i2c_dev->clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get controller clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Failed to get controller clock\n");
 
 	ret = clk_prepare_enable(i2c_dev->clk);
 	if (ret) {
@@ -1982,10 +1980,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(rst)) {
-		ret = PTR_ERR(rst);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Error: Missing reset ctrl\n");
-
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				    "Error: Missing reset ctrl\n");
 		goto clk_free;
 	}
 	reset_control_assert(rst);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
