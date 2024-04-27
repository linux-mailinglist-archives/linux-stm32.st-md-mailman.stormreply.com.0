Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA68B47E5
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2024 22:36:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C028FC7128E;
	Sat, 27 Apr 2024 20:36:30 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFCA7C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2024 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=YtBKETUeeWdigupUNh1poF2adUaIr8Z2d3RrJ3sCaV0=; b=gOYqFv
 1h+vS8r2Jh7ErStywwggdVCLpThEUHqOT3Pr9Yl8/Bj3LNrIuZKYrWRJs6jd8fpL
 YWuTmxexa05QoXMra0ELDpsHesZVfBelM2P6CO2Yyg5Ok+eucKHhso1HJf0dKvlN
 hHyfEibxw7g1vs8jvFH2DyDozOdipgzZ/mt1pALZr5DR0LVz9eS9upzO6KDsmBMa
 t5qA9bQKCtNvax/YPaPkA5dUsRVckAMvHZTt1uXtldzNryidwLL7hImJnsTIN2Rq
 360HMvNXGh0c2uDI22nZaXEW0Mb3okLZhDgA7JIt94wq4J4IdVD7+CoccN57tKA/
 hWzfRSZ1Y4sk1qtw==
Received: (qmail 1782013 invoked from network); 27 Apr 2024 22:36:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 27 Apr 2024 22:36:21 +0200
X-UD-Smtp-Session: l3s3148p1@8rwe+RkX2s9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Date: Sat, 27 Apr 2024 22:36:01 +0200
Message-ID: <20240427203611.3750-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/15] i2c: stm32f7: use 'time_left' variable
	with wait_for_completion_timeout()
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 01210452216b..cfee2d9c09de 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1789,7 +1789,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
 	struct device *dev = i2c_dev->dev;
-	unsigned long timeout;
+	unsigned long time_left;
 	int i, ret;
 
 	f7_msg->addr = addr;
@@ -1809,8 +1809,8 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	if (ret)
 		goto pm_free;
 
-	timeout = wait_for_completion_timeout(&i2c_dev->complete,
-					      i2c_dev->adap.timeout);
+	time_left = wait_for_completion_timeout(&i2c_dev->complete,
+						i2c_dev->adap.timeout);
 	ret = f7_msg->result;
 	if (ret) {
 		if (i2c_dev->use_dma)
@@ -1826,7 +1826,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 		goto pm_free;
 	}
 
-	if (!timeout) {
+	if (!time_left) {
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
 		if (i2c_dev->use_dma)
 			dmaengine_terminate_sync(dma->chan_using);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
