Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6C62DE12
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Nov 2022 15:28:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC320C6506F;
	Thu, 17 Nov 2022 14:28:37 +0000 (UTC)
Received: from mail-4324.protonmail.ch (mail-4324.protonmail.ch [185.70.43.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B413C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Nov 2022 14:28:36 +0000 (UTC)
Date: Thu, 17 Nov 2022 14:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1668695315; x=1668954515;
 bh=h8QUQMuBeId16fwT8sIh6ZqutzDewiMZtFIp21P7mOY=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=cLYLHTMvI4pQQtyVvzPKzaE42SZoN0qoVPQeQLANiJ77ipklFCAlKAu9C2fUV9eQn
 B+dBlatkXMTkQhcJxLeUiX5os+iXkuE6Dny9XEf+idfQzdHupDpmBG/f6/MHmuA7Lr
 XEd9hN5wfk4hjQEfPv1xyMlEAh3lnNglucGJ2Xdk43Vwhsz2JpZFKojtMoU4tDd1lf
 YP3z2yogAUeXhmE3lTxsdYliSWbIy5uNXp1g7nrsotbj8VmDvtOGHEq5ekFX3m6LdO
 i1eJuzY10Jz64eFubqo79KYtQfTU/717jpWZI7ABXH9twBqmoSps8Uow3PsOpbOHes
 aCVnYVrwm/oQw==
To: linux-input@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Message-ID: <20221117142753.2477-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Cc: Nikita Travkin <nikita@trvn.ru>, Corey Minyard <cminyard@mvista.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] Input: stmfts - retry commands after timeout
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

Add #define STMFTS_RETRY_COUNT 3 to retry stmfts_command() 3 times.
Without it, STMFTS_SYSTEM_RESET or STMFTS_SLEEP_OUT may return -110 to
failed attempt due to no event received for completion.

Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 drivers/input/touchscreen/stmfts.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index d5bd170808fb..22de34966373 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -68,6 +68,7 @@
 #define STMFTS_DATA_MAX_SIZE	(STMFTS_EVENT_SIZE * STMFTS_STACK_DEPTH)
 #define STMFTS_MAX_FINGERS	10
 #define STMFTS_DEV_NAME		"stmfts"
+#define STMFTS_RETRY_COUNT	3
 
 enum stmfts_regulators {
 	STMFTS_REGULATOR_VDD,
@@ -317,19 +318,20 @@ static irqreturn_t stmfts_irq_handler(int irq, void *dev)
 
 static int stmfts_command(struct stmfts_data *sdata, const u8 cmd)
 {
-	int err;
+	int err, retry;
 
 	reinit_completion(&sdata->cmd_done);
 
-	err = i2c_smbus_write_byte(sdata->client, cmd);
-	if (err)
-		return err;
-
-	if (!wait_for_completion_timeout(&sdata->cmd_done,
-					 msecs_to_jiffies(1000)))
-		return -ETIMEDOUT;
+	for (retry = 0; retry < STMFTS_RETRY_COUNT; retry++) {
+		err = i2c_smbus_write_byte(sdata->client, cmd);
+		if (err)
+			return err;
 
-	return 0;
+		if (wait_for_completion_timeout(&sdata->cmd_done,
+						msecs_to_jiffies(1000)))
+			return 0;
+	}
+	return -ETIMEDOUT;
 }
 
 static int stmfts_input_open(struct input_dev *dev)
-- 
2.30.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
