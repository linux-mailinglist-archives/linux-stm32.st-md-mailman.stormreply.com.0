Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0976E4BB4A2
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 09:56:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE12C5F1FB;
	Fri, 18 Feb 2022 08:56:00 +0000 (UTC)
Received: from msr9.hinet.net (msr9.hinet.net [168.95.4.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E03DBC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 16:07:27 +0000 (UTC)
Received: from laptop.lan (111-253-217-22.dynamic-ip.hinet.net
 [111.253.217.22])
 by msr9.hinet.net (8.15.2/8.15.2) with ESMTP id 21HG6WIc096094;
 Fri, 18 Feb 2022 00:06:32 +0800
From: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 18 Feb 2022 01:06:24 +0900
Message-Id: <20220217160624.20936-1-linmengbo0689@protonmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=Xvg/hXJ9 c=1 sm=1 tr=0 ts=620e728a
 a=QmhVwYW7bC54/XG34QDJIg==:117 a=QmhVwYW7bC54/XG34QDJIg==:17
 a=sfOm8-O8AAAA:8 a=fnsQhsnqeVFlupmvOtAA:9 a=TvTJqdcANYtsRzA46cdi:22
X-Mailman-Approved-At: Fri, 18 Feb 2022 08:56:00 +0000
Cc: Lin@protonmail.com, "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] input: stmfts: #define STMFTS_RETRY_COUNT 3
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
index bc11203c9cf7..d36be85a980e 100644
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
