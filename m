Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF2CC17B2
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 09:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 119D0C8F263;
	Tue, 16 Dec 2025 08:10:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13BA1C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:30:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E397544288;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA85DC16AAE;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765809005;
 bh=ECIRge4VolAPtMWjM+w9B4pFiGXOGHl1dGi9UBY1dM0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=XS/JYPfig7JEX+7lPY5AXwkqXjRfzQLYaZ7C8zl16YUHkUsuB7TCJ9E9Bw16tLLVu
 oLySkVnQDZtNjBYAZbrUwuxBA+B3rd3/CiA2jAyyY5vdTJ4taSly1e5Fih/sVYBJ6E
 hDO0t86Wbqs3/b4PvOFOPGpUwpvvcrO3P/kxzH7j7bLoWCv4MFkHmjepGab/fYibdt
 TZGLAIcsJx8rQpNR7Bx5AsRiefu5aAUtKN9/biNpMQZCpp8VMKH+dVgiDAVcynQAC3
 4iESSd/SQ8u52DKY48Ef1NDxmnW/UrRaQA4Ihwy55DQu9NepoHlk/3qvB6An7n1eF6
 LTPY8ZuiwXXIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B158FD5B172;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:02 +0100
MIME-Version: 1.0
Message-Id: <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+8T1xTsOJVjn1XL+OiuDFzpjTwMdaheaKiJkn4uzNC0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrVk+/KB6coTqNYuMnIBrB/vm2/YxgSKgeO
 8D5TYOcCq2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 covAEACkdHFzLF0RrJb2jwOKLvgWbj8IznAZvFQpIEQkeIU5AwcTJ1W9s2KF9wToGtq0+B0VWj+
 fhPAsSz1iFl5SYfbBL56CuJp821p0Yn4QY0SyNrahuGyu9n6i900VLzcvB0rWqrR4RV4Bc9UOio
 VUmytGFM0q3f2/tY2pvHMsjhV9bD3DsUOc5e9WiXBViDmgnr7WCIjtTpFyhGRJ4jMw+bA14Y2TC
 07emPYv7j8L2Eq+9sQ4dNmQnP08J4XVlT1049ul3d5gfTNebtKcKoEDQ4rpcSIClPU1ODnMITnu
 rcWLOekQH4/CgsX62gA7rUqVISQJ0O+2XQmHaIdj6/pDLU+iQNaXcaDI7v/moY03HVuDQBpqrJ3
 JD8QnHAjwIRiKKG6EDj+i72lrQ21a3w4MMMSnoGTx3k4uJP8/AE3DLzyIaYf107Hrw0hDyC5ji7
 CbSlohpGYP8vOfzJccv1RnhhfoZeSmVWMPEa6G5mvuHCooAz2qT0d/tWqM3ML1Q2JAfPK6BHfK8
 rgAfBlxaUqI3lwDntbn9r3fNCuGvQwiaYIZiWGuGFEoBMJbANQuULYQEXDf1kY8o0UMfNb+Qx9C
 mS8D/VtdQl5WRPVB2YeSpQZgUf9UMQaa6G+oZaS41jzFGqvw/Di6gFm94TxnUW14NK2BbmeCcIw
 hVftWP6lsLGmQUQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:10:20 +0000
Cc: linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/4] Input: stmfts - Make comments correct
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
Reply-To: david@ixit.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Petr Hodina <petr.hodina@protonmail.com>

No functional change.

Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 9f5609524fef6..ad363b3c344cd 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -141,7 +141,7 @@ static enum led_brightness stmfts_brightness_get(struct led_classdev *led_cdev)
 
 /*
  * We can't simply use i2c_smbus_read_i2c_block_data because we
- * need to read more than 255 bytes (
+ * need to read 256 bytes, which exceeds the 255-byte SMBus block limit.
  */
 static int stmfts_read_events(struct stmfts_data *sdata)
 {
@@ -594,9 +594,6 @@ static void stmfts_power_off(void *data)
 						sdata->regulators);
 }
 
-/* This function is void because I don't want to prevent using the touch key
- * only because the LEDs don't get registered
- */
 static int stmfts_enable_led(struct stmfts_data *sdata)
 {
 	int err;

-- 
2.51.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
