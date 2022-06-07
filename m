Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 164AE53F760
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jun 2022 09:38:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4B56C5EC56;
	Tue,  7 Jun 2022 07:38:29 +0000 (UTC)
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7770BC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jun 2022 07:38:28 +0000 (UTC)
Date: Tue, 07 Jun 2022 07:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1654587507; x=1654846707;
 bh=D9FtRQsL64UZzeNlDSZGhV3sxAUQRz/jzb9A2KCTcNc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=lprYmJZmwMJvTYN0JJVzs8F7A0ZlKvZQjbW63QrWTgcjshwNqOYQ/cxsJQk/rm3zq
 6y8S6HvRriarbwUhAO01eym7shmHUYNgq/q0FRm4HKmuhi4Dbcj5+PnKTb3QzIL35x
 /JoZk/vUka8VsfNL5bH0brICZepJ4wNHuRQVwSI8LNFdRPj/3e/JKVvXtHLLDs07r1
 f0BUwG2VU8ePeu2ojyE2Rg/Ryu3e1EEF1YSnnowar60Epx9iQTy1QYBSpRE/B6h367
 8JRyvo4KVZB8lt900CqQr6qe18iNeH9Jz/EjlH7E9v7ke39eY/de6U/sy4jEtLx0lA
 9j6OsaTM/hkAw==
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Message-ID: <20220607073809.21458-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Cc: nikita@trvn.ru, dmitry.torokhov@gmail.com, stephan@gerhold.net,
 rydberg@bitmath.org, andi.shyti@samsung.com, zhengyongjun3@huawei.com,
 ~postmarketos/upstreaming@lists.sr.ht, mcoquelin.stm32@gmail.com,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] input: stmfts: Add #define STMFTS_RETRY_COUNT
	3
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
Reply-To: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add #define STMFTS_RETRY_COUNT 3 to retry stmfts_command() 3 times.
Without it, STMFTS_SYSTEM_RESET or STMFTS_SLEEP_OUT may return -ETIMEDOUT
to failed attempt due to no event received for the completion.

Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 drivers/input/touchscreen/stmfts.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index c175d44c52f3..730035f5c62c 100644
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
