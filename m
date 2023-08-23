Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA05785B96
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 17:11:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D3ADC6B44E;
	Wed, 23 Aug 2023 15:11:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B688CC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 15:11:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6883964804;
 Wed, 23 Aug 2023 15:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25581C433C9;
 Wed, 23 Aug 2023 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692803475;
 bh=PafhZcJT5SQLA6QnjYq4kDAbgIm4cBuEG5/om2ECzEM=;
 h=From:To:Cc:Subject:Date:From;
 b=CTg0dxn2ottiJGvb2EFmf9W3p6crkzpOyJ8nPYWGbQqUgiFIlHILV+QeINMIbs2db
 wJ4rTwnm2Nw4MGbO2f/RacNnAWl09a28H0f+J0lgCb5IQ9b94UowanZtP8BbnIF/1A
 3w/8BcesIFouUcwW2l1hGyHabhiXsUcZ4XxTrFaO0zQIbBUieZQyqRcK4HogyQnJor
 j2pMmLnd5ZQWFp68/7qoIUc3/NfBYMqT6jrS3MII+gL4ZPxcRclABAYEqq9Rf3Jppv
 GeKCf+1aE3zxPAZSGc4oxdXDujDeDKS8AdoeR4QNw6pUaR/BQjyPeyro2iPvrwdG6B
 I2fq+5sesLO/w==
Received: (nullmailer pid 2357148 invoked by uid 1000);
 Wed, 23 Aug 2023 15:11:12 -0000
From: Rob Herring <robh@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 23 Aug 2023 10:10:59 -0500
Message-Id: <20230823151059.2356881-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: [Linux-stm32] [PATCH] watchdog: stm32: Drop unnecessary
	of_match_ptr()
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

With COMPILE_TEST recently enabled, 0-day reports a warning:

drivers/watchdog/stm32_iwdg.c:215:34: warning: 'stm32_iwdg_of_match' defined but not used [-Wunused-const-variable=]

As STM32 platforms are always used with DT, drop the of_match_ptr().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308211837.4VBSUAtZ-lkp@intel.com/
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 570a71509d2a..9a554a3db4e2 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -288,7 +288,7 @@ static struct platform_driver stm32_iwdg_driver = {
 	.probe		= stm32_iwdg_probe,
 	.driver = {
 		.name	= "iwdg",
-		.of_match_table = of_match_ptr(stm32_iwdg_of_match),
+		.of_match_table = stm32_iwdg_of_match,
 	},
 };
 module_platform_driver(stm32_iwdg_driver);
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
