Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CEB32AC98
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 00:47:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62B14C56638;
	Tue,  2 Mar 2021 23:47:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA0F4C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 23:47:15 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id q23so26274100lji.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 15:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LS4d4uUxDq7yhtpjLQE7kDOpsO4KYhMcEce+00T9U+s=;
 b=b2YvmtWceuUdn6lRyC69kZzsj1GrBVdKv/s37uBMpqnrZeFSFFX3v7i6xMxDXM0DR1
 3S5dN2pEfvAef3sPnfgVkmEU3K7V/vJq9ZpXQW43ps/9hu1KxRmJiYKJ3P1wDPufQdln
 b482GFvnPEz8YRgub0ODGDSMeNZWts5Z1KBKxazzoxwhkFFIIEr49PX7KisrzY4L8d29
 2DF1zgd6B1P/twHqi/XfuHR3dUcQjsFZdjpD7PTqTJty0smvB+kLU1cs4/8RagQVII2S
 lJGjneBExfZnY4mmoqynG7aZlywjm/znyxLx4Ppbl/Pkv8lbwfth9qPpS4zT1fvo0/eU
 bkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LS4d4uUxDq7yhtpjLQE7kDOpsO4KYhMcEce+00T9U+s=;
 b=t0l7bvpCuhfQLItT13UJ3asYxFWVffzp7y46HoQ/Y/6vhJuEjbrTELQt3Bq3k7BmoO
 NbG2iyyTpc/IrW4O/YmAyNGDH/Y2NYbOzuOVeYV4d82S5n/js+lWk+d180hJ+ZatN2Ni
 +Tii9MgIY3ZZoogjrr3sqaYN+6tzj4az8St2TXcEDY+spCt/+c1Epl9LCUvsD2Yf2hav
 uUhYjnklTT4UEbDgA7Qs2XaMIGXv8spIUSEJW9jEDIHyJgIPU2eYWpbNpctJu+P6QLHz
 Cm5BmDDmNn5z9CiNbZ3eIR4WvVf826kNEwICZEp/60/lBbNaaG3TS4auihqFPCHKKmS5
 F5Rw==
X-Gm-Message-State: AOAM532LrXtJ5LgwXYy2/1UXgUPR5XNgckNip7fmBH69ZzymzH/B0XbD
 rXycC39sGHB3pbYR58jTvt8=
X-Google-Smtp-Source: ABdhPJy5L1J338j45dySxGdt1O0nFPc4P4bq9ZZ67C0FYOxtdRwp0t/z2lccEUEyzMGMCigXG4BIZw==
X-Received: by 2002:a2e:3c13:: with SMTP id j19mr13431079lja.130.1614728835186; 
 Tue, 02 Mar 2021 15:47:15 -0800 (PST)
Received: from localhost.localdomain (h-98-128-229-129.NA.cust.bahnhof.se.
 [98.128.229.129])
 by smtp.gmail.com with ESMTPSA id j15sm1974359lfm.138.2021.03.02.15.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 15:47:14 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Wed,  3 Mar 2021 00:47:10 +0100
Message-Id: <20210302234710.74455-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mfd: stmpe: Revert "Constify static struct
	resource"
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

Andy noted that constification of some static resource structs in
intel_quark_i2c_gpio.c were incorrect. It turns out there is another
change from the same series that is also incorrect in stmpe.c.
These structures are modified at init and can not be made const.

This reverts commit 8d7b3a6dac4eae22c58b0853696cbd256966741b.

Fixes: 8d7b3a6dac4e ("mfd: stmpe: Constify static struct resource")
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
I went through the series and this was the only additional issue I
found. Sorry about that.

 drivers/mfd/stmpe.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 90f3292230c9..1aee3b3253fc 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -312,7 +312,7 @@ EXPORT_SYMBOL_GPL(stmpe_set_altfunc);
  * GPIO (all variants)
  */
 
-static const struct resource stmpe_gpio_resources[] = {
+static struct resource stmpe_gpio_resources[] = {
 	/* Start and end filled dynamically */
 	{
 		.flags	= IORESOURCE_IRQ,
@@ -336,7 +336,7 @@ static const struct mfd_cell stmpe_gpio_cell_noirq = {
  * Keypad (1601, 2401, 2403)
  */
 
-static const struct resource stmpe_keypad_resources[] = {
+static struct resource stmpe_keypad_resources[] = {
 	{
 		.name	= "KEYPAD",
 		.flags	= IORESOURCE_IRQ,
@@ -357,7 +357,7 @@ static const struct mfd_cell stmpe_keypad_cell = {
 /*
  * PWM (1601, 2401, 2403)
  */
-static const struct resource stmpe_pwm_resources[] = {
+static struct resource stmpe_pwm_resources[] = {
 	{
 		.name	= "PWM0",
 		.flags	= IORESOURCE_IRQ,
@@ -445,7 +445,7 @@ static struct stmpe_variant_info stmpe801_noirq = {
  * Touchscreen (STMPE811 or STMPE610)
  */
 
-static const struct resource stmpe_ts_resources[] = {
+static struct resource stmpe_ts_resources[] = {
 	{
 		.name	= "TOUCH_DET",
 		.flags	= IORESOURCE_IRQ,
@@ -467,7 +467,7 @@ static const struct mfd_cell stmpe_ts_cell = {
  * ADC (STMPE811)
  */
 
-static const struct resource stmpe_adc_resources[] = {
+static struct resource stmpe_adc_resources[] = {
 	{
 		.name	= "STMPE_TEMP_SENS",
 		.flags	= IORESOURCE_IRQ,
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
