Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB9244C5F
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Aug 2020 18:00:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDAC4C36B26;
	Fri, 14 Aug 2020 16:00:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5E61C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Aug 2020 14:18:16 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <has@pengutronix.de>)
 id 1k6aX6-0000CU-Ft; Fri, 14 Aug 2020 16:18:12 +0200
Received: from has by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <has@pengutronix.de>)
 id 1k6aX4-0005WZ-5U; Fri, 14 Aug 2020 16:18:10 +0200
From: Holger Assmann <h.assmann@pengutronix.de>
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@st.com>,
 Etienne Carriere <etienne.carriere@st.com>
Date: Fri, 14 Aug 2020 16:13:55 +0200
Message-Id: <20200814141355.3816-1-h.assmann@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: has@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 16:00:25 +0000
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: stm32: remove unnecessary DMA kernel
	error log
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

We currently print errors twice when there is an actual error
when requesting a DMA channel, once in stm32f7_i2c_probe()
when stm32_i2c_dma_request() fails and once more in
stm32_i2c_dma_request() itself. stm32_i2c_dma_request() is only
called from stm32f7_i2c_probe(), so we could drop the duplicate
error message.

This has the effect that we no longer warn about absence of a
DMA channel. This is intended as it is not mandatory for the
i2c-stm32 devices to have DMA enabled.  Also, the overall number
of DMA channels on the STM32 is limited and has to be shared
with other peripherals. This may lead to DMA being intentionally
off for specific devices.

This patch removes the unnecessary error message.

Fixes: e07a89775c71 ("i2c: stm32: don't print an error on probe deferral")
Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
---
 drivers/i2c/busses/i2c-stm32.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 3f69a3bb6119..cc05a4202559 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -26,8 +26,6 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
 		ret = PTR_ERR(dma->chan_tx);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "can't request DMA tx channel\n");
 		goto fail_al;
 	}
 
@@ -46,9 +44,6 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma->chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
 		ret = PTR_ERR(dma->chan_rx);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "can't request DMA rx channel\n");
-
 		goto fail_tx;
 	}
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
