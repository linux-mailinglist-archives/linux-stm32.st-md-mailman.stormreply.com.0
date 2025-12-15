Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BB6CC17B4
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 09:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23988C8F265;
	Tue, 16 Dec 2025 08:10:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AD46C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:30:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CB5E44433;
 Mon, 15 Dec 2025 14:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1E61C2BC86;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765809005;
 bh=TVMBoDrL66oVfaYiSBbPmPDD5+tqhVvfo29udD0zzsc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=FXf41P+Yh1GfPML23QnV7Bglz7xoYIrMdIqY3p175Xv7szqQCdVLjQXf52BYoLitr
 3k1Np+HOL3rCMXcbwfETwgkudaSYmayHERn3mL2t7Z6036cHw/PyEflrWgnVe8j5CJ
 k0Qu+SiopJ76/4/y6I6lAQ7uwerSe43igYYt7A7WTTvsM2zcsExH43uRl4tS24sNBX
 gZ+aKwX+jfRPknW/VTcgA/F1bnaFkBMC9iqua7btgFJayNZDox2RFJFPD7Z5f4p9sY
 IfjSDr/J9ufUKTHneCHD16VLZ1X7zodk1aIwoay4yZYNwTF77X+rSStoIT90f1smIX
 ZL4647+5oNiVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D82FBD5B176;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:04 +0100
MIME-Version: 1.0
Message-Id: <20251215-fts-fixes-v1-4-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=roHV704aaY9rcMfaAuaHi+mzFaL37M4mv+RVt1dZ7JA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrW0Sc0TA1KAN4LrhLHI2SDk8w1khRX2x3I
 BJwsriezd6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 choAD/9+4C7jcAftRIQrmL5PLcMe0RuAWm3WOJFJAENwF817DbTZ1B+tnoDmaq4JHk6tiS+koRK
 3UflGChw68pIVdGkPMb46OmqKMJDnMynFu0J4I924oEfXtIOBygHbGn9xYuD3QdX0YiaPJFFuw4
 O/OLlxo5UGd8ADmNvKnJZh+G9yeKrYnRj+hCW/cXex8+mJsPLILQTPWX0ct48oVfO6kAYF36jgZ
 6BlxX0mnl+7X36LhV8nbj5mh2/3ucXyJHw90gjQXS/AwbF9Ltgmfxc0G2CHrsu/8MzoeB9ZBlhW
 PfEctdTDsaDOhZYDRM8D4DE4MrTQPsgDsZTKaDZjoZXawdooPQ33nJCWIyRxBgIaNUcJvNbZ7B1
 cbsmz+RakyxukqjY6Ori/Jkfq99jL2IAihPjPVy20FWiVAS/NgyeRKMhuSh1Q5hwJPqc8MWAQCq
 1a2u7SexBs2sx/BeQ14OuEJOBphYTKjDaymVVPbV2/24pADHQFl73+9XdLiaqogU4Tk45ts9mzx
 NwAtPN5nIpQLX4g3F7X2diyHKHH5XrspYM30IozfcRsEN+hNH1/y8jLhkZ47f6Rze4WUUcHBo/i
 j1ajLbNS9B40ZPjanNwzbW4uaNPmTTNBvuqygoURHJV5kZi0a3BSLUWh533P7/3dKWAW1qz5gqt
 Lx2twOZKVbNUeBA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:10:20 +0000
Cc: linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/4] Input: stmfts - use client to make future
	code cleaner
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

Make code cleaner, compiler will optimize it away anyway.

Preparation for FTM5 support, where more steps are needed.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 4b166b0a9a5a6..06845a00348cc 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -747,9 +747,10 @@ static int stmfts_runtime_suspend(struct device *dev)
 static int stmfts_runtime_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
+	struct i2c_client *client = sdata->client;
 	int ret;
 
-	ret = i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
+	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);
 	if (ret)
 		dev_err(dev, "failed to resume device: %d\n", ret);
 

-- 
2.51.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
