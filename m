Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482B11D0E1
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2019 16:23:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11E35C36B21;
	Thu, 12 Dec 2019 15:23:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26603C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 13:56:17 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCDu8QH009011;
 Thu, 12 Dec 2019 07:56:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576158968;
 bh=GwjOlZlkf6ym2bYHe7OPSGZdzZFvLSEucLjQjV/tniI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=CC9SDJtbWZiGZQBVJseB8CQ0NVZ6Q9LHpzBSzFNua2TFwcL/SzNchz/it8h4YTj+W
 VyMw7QaqJcFLPr57HifJCnDfN5xkLfKoYCmZESqh6t/D05WlPZ5ulwMYlKKbIYi/CC
 BZBTMnSnuBTkZo4tn/V1nuKBgW9Y1n8+5IY/vKfg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCDu8LP044855
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Dec 2019 07:56:08 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:56:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:56:07 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCDtdqW048444;
 Thu, 12 Dec 2019 07:56:03 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <nsaenzjulienne@suse.de>, <f.fainelli@gmail.com>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <baohua@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Thu, 12 Dec 2019 15:55:47 +0200
Message-ID: <20191212135550.4634-7-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212135550.4634-1-peter.ujfalusi@ti.com>
References: <20191212135550.4634-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:23:13 +0000
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/9] spi: sirf: Use dma_request_chan() instead
	dma_request_slave_channel()
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

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

By using dma_request_chan() directly the driver can support deferred
probing against DMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/spi/spi-sirf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-sirf.c b/drivers/spi/spi-sirf.c
index e1e639191557..8419e6722e17 100644
--- a/drivers/spi/spi-sirf.c
+++ b/drivers/spi/spi-sirf.c
@@ -1126,16 +1126,16 @@ static int spi_sirfsoc_probe(struct platform_device *pdev)
 	sspi->bitbang.master->dev.of_node = pdev->dev.of_node;
 
 	/* request DMA channels */
-	sspi->rx_chan = dma_request_slave_channel(&pdev->dev, "rx");
-	if (!sspi->rx_chan) {
+	sspi->rx_chan = dma_request_chan(&pdev->dev, "rx");
+	if (IS_ERR(sspi->rx_chan)) {
 		dev_err(&pdev->dev, "can not allocate rx dma channel\n");
-		ret = -ENODEV;
+		ret = PTR_ERR(sspi->rx_chan);
 		goto free_master;
 	}
-	sspi->tx_chan = dma_request_slave_channel(&pdev->dev, "tx");
-	if (!sspi->tx_chan) {
+	sspi->tx_chan = dma_request_chan(&pdev->dev, "tx");
+	if (IS_ERR(sspi->tx_chan)) {
 		dev_err(&pdev->dev, "can not allocate tx dma channel\n");
-		ret = -ENODEV;
+		ret = PTR_ERR(sspi->tx_chan);
 		goto free_rx_dma;
 	}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
