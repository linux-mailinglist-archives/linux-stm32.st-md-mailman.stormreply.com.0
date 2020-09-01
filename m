Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16425938F
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Sep 2020 17:27:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76E43C32EA4;
	Tue,  1 Sep 2020 15:27:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7581EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Sep 2020 15:27:36 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B670214D8;
 Tue,  1 Sep 2020 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598974055;
 bh=TxQu2yA10K+9lWq+TKY2JDeXUOfkOFu5YajYPSCGs6s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m7pW1hFOu4r/Fytp0mI7U9/5laqm05C7C7LoNdZtlVyfJN5SIplvnI1LbdIAphqIz
 Lge21VQ7IK84PLBBEwenFUelYGUjkQ6/NV12f63lsHVZeoYeXz1wpW4g/eUYqq9H5u
 1k3xqQnrBL5NW4PO6e9tFmmxZIf80aj7JkW+mEcw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Date: Tue,  1 Sep 2020 17:27:04 +0200
Message-Id: <20200901152713.18629-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901152713.18629-1-krzk@kernel.org>
References: <20200901152713.18629-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 02/11] spi: sprd: Simplify with dev_err_probe()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/spi/spi-sprd-adi.c |  5 +----
 drivers/spi/spi-sprd.c     | 17 +++++------------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
index 127b8bd25831..392ec5cfa3d6 100644
--- a/drivers/spi/spi-sprd-adi.c
+++ b/drivers/spi/spi-sprd-adi.c
@@ -504,10 +504,7 @@ static int sprd_adi_probe(struct platform_device *pdev)
 			dev_info(&pdev->dev, "no hardware spinlock supplied\n");
 			break;
 		default:
-			dev_err(&pdev->dev,
-				"failed to find hwlock id, %d\n", ret);
-			fallthrough;
-		case -EPROBE_DEFER:
+			dev_err_probe(&pdev->dev, ret, "failed to find hwlock id\n");
 			goto put_ctlr;
 		}
 	}
diff --git a/drivers/spi/spi-sprd.c b/drivers/spi/spi-sprd.c
index 0443fec3a6ab..635738f54c73 100644
--- a/drivers/spi/spi-sprd.c
+++ b/drivers/spi/spi-sprd.c
@@ -553,22 +553,15 @@ static int sprd_spi_dma_tx_config(struct sprd_spi *ss, struct spi_transfer *t)
 static int sprd_spi_dma_request(struct sprd_spi *ss)
 {
 	ss->dma.dma_chan[SPRD_SPI_RX] = dma_request_chan(ss->dev, "rx_chn");
-	if (IS_ERR_OR_NULL(ss->dma.dma_chan[SPRD_SPI_RX])) {
-		if (PTR_ERR(ss->dma.dma_chan[SPRD_SPI_RX]) == -EPROBE_DEFER)
-			return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_RX]);
-
-		dev_err(ss->dev, "request RX DMA channel failed!\n");
-		return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_RX]);
-	}
+	if (IS_ERR_OR_NULL(ss->dma.dma_chan[SPRD_SPI_RX]))
+		return dev_err_probe(ss->dev, PTR_ERR(ss->dma.dma_chan[SPRD_SPI_RX]),
+				     "request RX DMA channel failed!\n");
 
 	ss->dma.dma_chan[SPRD_SPI_TX]  = dma_request_chan(ss->dev, "tx_chn");
 	if (IS_ERR_OR_NULL(ss->dma.dma_chan[SPRD_SPI_TX])) {
 		dma_release_channel(ss->dma.dma_chan[SPRD_SPI_RX]);
-		if (PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]) == -EPROBE_DEFER)
-			return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]);
-
-		dev_err(ss->dev, "request TX DMA channel failed!\n");
-		return PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]);
+		return dev_err_probe(ss->dev, PTR_ERR(ss->dma.dma_chan[SPRD_SPI_TX]),
+				     "request TX DMA channel failed!\n");
 	}
 
 	return 0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
