Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EB6462FD8
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 10:38:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE7E6C5A4D4;
	Tue, 30 Nov 2021 09:38:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 249A8C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 09:38:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A01E9B817F7;
 Tue, 30 Nov 2021 09:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989DEC53FC7;
 Tue, 30 Nov 2021 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638265104;
 bh=r0cAyP2rsavYVcD1jWm5stdLNg5T4rJuUcSS69KJPfQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Xo10gcG0m4f0eUy7oYK1K4FuAOihAPTCSvOQzL2vICKP5WOZwwqauPghwDE5zMHfp
 WdVOja671ngrq/sblbI8fcZykH+8pE+NTj/JJV2mvlS84k0vh827eKNXo87JeF7fsZ
 8eQnhVSt0fjnKAlGvzU7EQRAFP0yjgGc58o6cChxaCErr4q3mhlpSavF/3gVPT5j7w
 ioj63Apox+UqLp68THmwnDrzddukzpzloeBYjN4AVRekyOz1qaIpcMesYph+Yh6+/+
 dU2yeY/9otNFJv44xUk3VJd/2tSsu4qAr+HAGMWIT+sGVw99Ue6F97oshSc0cHAksY
 kgwq+uF53ahkA==
From: Wolfram Sang <wsa@kernel.org>
To: linux-i2c@vger.kernel.org
Date: Tue, 30 Nov 2021 10:38:16 +0100
Message-Id: <20211130093816.12789-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Wolfram Sang <wsa@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] i2c: stm32f7: remove noisy and imprecise log
	messages
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

The log messages talk about 'bus recovery' while it is not a bus
recovery with 9 pulses but merely a controller reset. Controller resets
are not worth log messages. The 'bus busy' message should be emitted by
upper layers, a busy bus may be expectected in some cases.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Alain, do you agree? Only compile tested.

 drivers/i2c/busses/i2c-stm32f7.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index b9b19a2a2ffa..e0e7d0001cbc 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -832,8 +832,6 @@ static int stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
 
-	dev_info(i2c_dev->dev, "Trying to recover bus\n");
-
 	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
 			     STM32F7_I2C_CR1_PE);
 
@@ -854,13 +852,9 @@ static int stm32f7_i2c_wait_free_bus(struct stm32f7_i2c_dev *i2c_dev)
 	if (!ret)
 		return 0;
 
-	dev_info(i2c_dev->dev, "bus busy\n");
-
 	ret = stm32f7_i2c_release_bus(&i2c_dev->adap);
-	if (ret) {
-		dev_err(i2c_dev->dev, "Failed to recover the bus (%d)\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return -EBUSY;
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
