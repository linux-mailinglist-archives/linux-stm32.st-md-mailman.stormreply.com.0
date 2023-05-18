Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB51970781C
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 04:39:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 910B4C6B442;
	Thu, 18 May 2023 02:39:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D812C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 02:39:58 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 53DEE86153;
 Thu, 18 May 2023 04:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684377597;
 bh=k6JOxNOQCk/PNwgZarVH/piTiE20paUJdsdlhusNVmQ=;
 h=From:To:Cc:Subject:Date:From;
 b=a94ByWtRXkGYfemcmZdV3hBKM7w7+WDdPDbNWQ+OKDh+cFin4E6l/srJSxwIC5OMn
 9jGICj0DYtPBZNjJePMnS6w+z3217+luG2g4W9dlDxWBQShzIx2u/nOwvZM+oq9VB5
 FTxREIRjxAX8nLw4MBhsjgQctmOUDJYzBF0AbS73oe5Hl570TWc1YcL/6OT+tLkjhh
 +hgDvuy7vNha/0SxOPGUUYiDhhiVWfA3LP7yJb5bnJP7GWTrr2LuhwTbA7dRTKaLfg
 PlIAIdN6S3yUiy6t3c0A0VjAcWCSkavHK7ec0xOqzUHqpUyTNWQmEFbZbL+6IrmD9c
 JCQRiTYbit+Cg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 18 May 2023 04:39:46 +0200
Message-Id: <20230518023946.530381-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] [RFC] regulator: stm32-pwr: Fix regulator
	disabling
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

The following shows up in the kernel log on systems using the STM32MP15xx USBPHYC:
"
regulator regulator.19: regulator disable timed out!
reg18: failed to disable: -ETIMEDOUT
"
This 'regulator.19' is 'pwr@50001000' 'reg18' in stm32mp151.dts DT, or
"Power control (PWR)" register "PWR_CR3" bits "REG18" on STM32MP15xx
reference manual.

The reason for the timeout seems to be the poll which this patch changes.
When turning this regulator OFF, PWR_CR3 reads 0xf0000000 , then REG18_EN
bit is cleared, and then this poll waits until REG18_RDY bit is cleared as
well, but that never happens, the PWR_CR3 keeps reading 0xe0000000 .

I am not sure whether this should happen, I suspect the 1V8 supply is
always READY when the 1V8 input is present, and the regulator can only
ever be enabled/disabled using the REG18_EN bit, but the REG18_READY
bit is never cleared again.

This patch adjusts the poll to check whether REG18_EN has been cleared
on regulator disable, but retains the check for REG18_READY in regulator
enable as there it makes sense to verify the regulator is really READY.

Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: Input from ST on behavior of this regulator would be very welcome,
      as well as on this patch.
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/regulator/stm32-pwr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/stm32-pwr.c b/drivers/regulator/stm32-pwr.c
index 0e101dff6ddad..4c60eddad60d0 100644
--- a/drivers/regulator/stm32-pwr.c
+++ b/drivers/regulator/stm32-pwr.c
@@ -93,7 +93,7 @@ static int stm32_pwr_reg_disable(struct regulator_dev *rdev)
 	writel_relaxed(val, priv->base + REG_PWR_CR3);
 
 	/* use an arbitrary timeout of 20ms */
-	ret = readx_poll_timeout(stm32_pwr_reg_is_ready, rdev, val, !val,
+	ret = readx_poll_timeout(stm32_pwr_reg_is_enabled, rdev, val, !val,
 				 100, 20 * 1000);
 	if (ret)
 		dev_err(&rdev->dev, "regulator disable timed out!\n");
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
