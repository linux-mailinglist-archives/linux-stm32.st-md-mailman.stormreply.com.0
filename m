Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DF632DD90
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 00:07:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51470C57B75;
	Thu,  4 Mar 2021 23:07:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB646C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 23:07:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 18so626005lff.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Mar 2021 15:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4xPZrQKI9DzyQgI8l1KHtECGn6OvKmEcjIaCH3tRIG0=;
 b=gp193NP4aQsovNv6sTt76j2EtGF5dS+erNhe/XKhkWD1fK9TUgG/v9bOtIKmCes6IJ
 eX28hhrl8od93drGWqI8d2Ja0M7vIz76V9ZPgHMjQYOTfvTnwQT4LLFKd5/l9NHLzrLi
 DfPiEzRtLrZlD7v6Psd2xvn4DM6r6vWBq4DCEtYxAi/GJYxHrMiJstJyFOHEiJAi96ZZ
 RsO0uMtqqMg05quPedHfRvZ4OV9YCIOM72frf4fSJX0FUut3BdgJJyXJbyoJGFi269pv
 A+wFKARPjxNCLYxZC5PVxgaEw5AHc/YO7key9LPTLAzgVH9bv3cLcqOIZ3eT/j9QsgAJ
 6HHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4xPZrQKI9DzyQgI8l1KHtECGn6OvKmEcjIaCH3tRIG0=;
 b=G9Qn5TbVvzxo+SC9Gx8mepVrf7v/31f+Z063Qyy/hYswRWfdhduJuviUiRvax23lJp
 JZQ7h3529slPv4X4nb5bMJd8nxOEydMwP0E6h3ps6fRFo86NhLD3c5Tvi4myjZeHyt09
 BVBLmPbiQCOiMaa5IHnyx9xEnhx8ESoWwdufXItjITivXOLgU/ADPC+UIMoADvMbMh6l
 mvXKNxwHn1MQHAfvLGmWzOkP+1T8ty7v1FVP6r3y4lGxAPzb6Iq0nIoqrgBBqGc0/F/N
 E2gAbJj5ZZOW5t2hKu4zuj//g7XXXBUl+fcn+jz6jUrTtE44vxm0ySA2mtDuYGiS7LuY
 jInw==
X-Gm-Message-State: AOAM533eCPqJRs0SlSzQmn1N+KomAyB/psO32z6VvtpMC/bYCpQJ4Si3
 q+2IcoiQiyNUesbsT6jroSE=
X-Google-Smtp-Source: ABdhPJyFs+iZnPrdGgaBZhKn+g7iLdh1vBSF+AuDTfX76w0LSp9Kj6P0BekF17aSIyahVpPomhmUUw==
X-Received: by 2002:ac2:47f4:: with SMTP id b20mr3499410lfp.524.1614899238094; 
 Thu, 04 Mar 2021 15:07:18 -0800 (PST)
Received: from localhost.localdomain (h-98-128-229-129.NA.cust.bahnhof.se.
 [98.128.229.129])
 by smtp.gmail.com with ESMTPSA id w8sm84825lft.44.2021.03.04.15.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 15:07:17 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Fri,  5 Mar 2021 00:07:09 +0100
Message-Id: <20210304230709.3217-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] mfd: stmpe: Revert "Constify static struct
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

In stmpe_devices_init(), the start and end field of these structs are
modified, so they can not be const. Add a comment to those structs that
lacked it to reduce the risk that this happens again.

This reverts commit 8d7b3a6dac4eae22c58b0853696cbd256966741b.

Fixes: 8d7b3a6dac4e ("mfd: stmpe: Constify static struct resource")
Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
Changes
V1-V2: Add comments to the structs that they are dynamically modified
       Rewrite commit message.

V1: https://lore.kernel.org/lkml/20210302234710.74455-1-rikard.falkeborn@gmail.com/

 drivers/mfd/stmpe.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 90f3292230c9..1dd39483e7c1 100644
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
@@ -336,7 +336,8 @@ static const struct mfd_cell stmpe_gpio_cell_noirq = {
  * Keypad (1601, 2401, 2403)
  */
 
-static const struct resource stmpe_keypad_resources[] = {
+static struct resource stmpe_keypad_resources[] = {
+	/* Start and end filled dynamically */
 	{
 		.name	= "KEYPAD",
 		.flags	= IORESOURCE_IRQ,
@@ -357,7 +358,8 @@ static const struct mfd_cell stmpe_keypad_cell = {
 /*
  * PWM (1601, 2401, 2403)
  */
-static const struct resource stmpe_pwm_resources[] = {
+static struct resource stmpe_pwm_resources[] = {
+	/* Start and end filled dynamically */
 	{
 		.name	= "PWM0",
 		.flags	= IORESOURCE_IRQ,
@@ -445,7 +447,8 @@ static struct stmpe_variant_info stmpe801_noirq = {
  * Touchscreen (STMPE811 or STMPE610)
  */
 
-static const struct resource stmpe_ts_resources[] = {
+static struct resource stmpe_ts_resources[] = {
+	/* Start and end filled dynamically */
 	{
 		.name	= "TOUCH_DET",
 		.flags	= IORESOURCE_IRQ,
@@ -467,7 +470,8 @@ static const struct mfd_cell stmpe_ts_cell = {
  * ADC (STMPE811)
  */
 
-static const struct resource stmpe_adc_resources[] = {
+static struct resource stmpe_adc_resources[] = {
+	/* Start and end filled dynamically */
 	{
 		.name	= "STMPE_TEMP_SENS",
 		.flags	= IORESOURCE_IRQ,
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
