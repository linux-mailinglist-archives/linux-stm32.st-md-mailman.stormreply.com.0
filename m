Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD92531E5
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 16:49:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3EEBC32E90;
	Wed, 26 Aug 2020 14:49:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC006C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFABF2177B;
 Wed, 26 Aug 2020 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453381;
 bh=4KSU23WtTjItpkpM4PdbL4vEH8O0UC56ECWXv2J/6J0=;
 h=From:To:Cc:Subject:Date:From;
 b=ScUGKkM+UeSzgY8CMhwi8/yLLMbvJ0FnhzjziU28im+JhxuxMHaDVTMN80ixGtMTt
 Am/zzb5mVpN9sx7OSMnAH1h57ECyeO2+QJbuALgfs9vdz5A8/gdyvvQFmJQih4fqtb
 DSRsulWA1dpGg5pD7Fvr08H8nTo55Pl9X4WXKrFY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 26 Aug 2020 16:49:33 +0200
Message-Id: <20200826144935.10067-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 1/3] mfd: madera: Simplify with dev_err_probe()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/madera-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/madera-core.c b/drivers/mfd/madera-core.c
index 8a8d733fdce5..4ed6ad8ce002 100644
--- a/drivers/mfd/madera-core.c
+++ b/drivers/mfd/madera-core.c
@@ -369,19 +369,14 @@ EXPORT_SYMBOL_GPL(madera_of_match);
 static int madera_get_reset_gpio(struct madera *madera)
 {
 	struct gpio_desc *reset;
-	int ret;
 
 	if (madera->pdata.reset)
 		return 0;
 
 	reset = devm_gpiod_get_optional(madera->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(reset)) {
-		ret = PTR_ERR(reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(madera->dev, "Failed to request /RESET: %d\n",
-				ret);
-		return ret;
-	}
+	if (IS_ERR(reset))
+		return dev_err_probe(madera->dev, PTR_ERR(reset),
+				"Failed to request /RESET");
 
 	/*
 	 * A hard reset is needed for full reset of the chip. We allow running
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
