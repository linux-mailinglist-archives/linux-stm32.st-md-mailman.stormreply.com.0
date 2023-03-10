Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F436B46EA
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 15:47:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ED91C6A60C;
	Fri, 10 Mar 2023 14:47:43 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15F17C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 14:47:42 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id e21so4419986oie.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 06:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678459661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lRN0jAfi5iqcqL3ePabHiQPwHcWvAmjJJvRbEXcLzU0=;
 b=JpgFkEA1J+m2GdqJhR+PJYGzxl5tf2WTqm5JC08BbdsbAn7zqNsyTRxjor/wcmrPVg
 f90LE1dmS0w+M14yny4cTONN2ozxfZsPddLm6smf5pMz5BgXTQfauzO1awR+yEEYt25D
 W5XufTlX5O6eBWYfDBJfeZFff0jxkrCGrhT1n5bwwJ+zBFbkK6zgyhXoQiGs179L3jaP
 fC5MKIoETj8GGAvB9Yih1lUAy2sCHiVhIyMLoHQeN+EWbfmXqsL7+yU7KfCmsm3WN3PD
 DKbkI+Un6hH7jZvF3K7pFwHH6qpFwdGdU661UEbzqWFmYIJrK/AfpWjLTQ0927n5/VHO
 guFw==
X-Gm-Message-State: AO0yUKUJavBgWSV1XItn8TNRYkVfgHevlrYjAfw353dsDPsyz7MxERfB
 UQB3Ss3infsha9HfHk76aQ==
X-Google-Smtp-Source: AK7set8NyE9pelZcNVRqymxGqcdHaorNLGYGKwkwEPG5NWZLihqksz6QnJRuEAnZN8WQX6FSLVz58g==
X-Received: by 2002:a05:6808:2805:b0:37a:f32f:730c with SMTP id
 et5-20020a056808280500b0037af32f730cmr10660264oib.35.1678459660802; 
 Fri, 10 Mar 2023 06:47:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y63-20020aca3242000000b00383eaea5e88sm953962oiy.38.2023.03.10.06.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:47:40 -0800 (PST)
Received: (nullmailer pid 1543406 invoked by uid 1000);
 Fri, 10 Mar 2023 14:47:12 -0000
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 10 Mar 2023 08:47:12 -0600
Message-Id: <20230310144712.1543379-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mfd: Use of_property_present() for testing DT
	property presence
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

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/mfd/bcm2835-pm.c | 2 +-
 drivers/mfd/khadas-mcu.c | 2 +-
 drivers/mfd/stmpe.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 49cd1f03884a..aa1263d22249 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -28,7 +28,7 @@ static const struct mfd_cell bcm2835_power_devs[] = {
 static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 				struct bcm2835_pm *pm)
 {
-	if (of_find_property(pm->dev->of_node, "reg-names", NULL)) {
+	if (of_property_present(pm->dev->of_node, "reg-names")) {
 		struct resource *res;
 
 		pm->base = devm_platform_ioremap_resource_byname(pdev, "pm");
diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index 7338cc16f327..1c807c0e6d25 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -112,7 +112,7 @@ static int khadas_mcu_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	if (of_find_property(dev->of_node, "#cooling-cells", NULL))
+	if (of_property_present(dev->of_node, "#cooling-cells"))
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 					    khadas_mcu_fan_cells,
 					    ARRAY_SIZE(khadas_mcu_fan_cells),
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index c304d20bb988..a92301dfc712 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1378,7 +1378,7 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 
 	stmpe_of_probe(pdata, np);
 
-	if (of_find_property(np, "interrupts", NULL) == NULL)
+	if (!of_property_present(np, "interrupts"))
 		ci->irq = -1;
 
 	stmpe = devm_kzalloc(ci->dev, sizeof(struct stmpe), GFP_KERNEL);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
