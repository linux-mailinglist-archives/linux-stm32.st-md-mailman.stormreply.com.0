Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D633B1781
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 11:59:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A3DDC597B7;
	Wed, 23 Jun 2021 09:59:57 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86C63C597B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=I33H4EByZc0csK
 pE0fENe7nleEwl4e+vhGhP/UxIkFY=; b=gx/YfhBRyET/K1MN1Fh7AYxfBYv76Z
 qayK8Mo+Uppd4RT2VwUXDvg11Z422h25sCsEqvqubc/IW8CYlrlybm6XOzALgfjq
 WP8TMKw4yMOmVVxn08y4MxAUgvuEZ8YC71FyRXQLc1QTq+rbLQLTOZM15cQ1C/ta
 t1mfISKUzig9o=
Received: (qmail 2552157 invoked from network); 23 Jun 2021 11:59:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 23 Jun 2021 11:59:47 +0200
X-UD-Smtp-Session: l3s3148p1@HQRw92vFHqogARa4RfhaAavnjlTTqzSz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Date: Wed, 23 Jun 2021 11:59:41 +0200
Message-Id: <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/7] i2c: stm32f7: : use proper DMAENGINE API
	for termination
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

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Here, we want dmaengine_terminate_sync()
because there is no other synchronization code in the driver to handle
an async case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 0138317ea600..9ea074a7ced6 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1567,7 +1567,7 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 	if (!ret) {
 		dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
 		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_all(dma->chan_using);
+		dmaengine_terminate_sync(dma->chan_using);
 		f7_msg->result = -ETIMEDOUT;
 	}
 
@@ -1637,7 +1637,7 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 	/* Disable dma */
 	if (i2c_dev->use_dma) {
 		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_all(dma->chan_using);
+		dmaengine_terminate_sync(dma->chan_using);
 	}
 
 	i2c_dev->master_mode = false;
@@ -1678,7 +1678,7 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 		dev_dbg(i2c_dev->dev, "Access to slave 0x%x timed out\n",
 			i2c_dev->msg->addr);
 		if (i2c_dev->use_dma)
-			dmaengine_terminate_all(dma->chan_using);
+			dmaengine_terminate_sync(dma->chan_using);
 		ret = -ETIMEDOUT;
 	}
 
@@ -1727,7 +1727,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	if (!timeout) {
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
 		if (i2c_dev->use_dma)
-			dmaengine_terminate_all(dma->chan_using);
+			dmaengine_terminate_sync(dma->chan_using);
 		ret = -ETIMEDOUT;
 		goto pm_free;
 	}
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
