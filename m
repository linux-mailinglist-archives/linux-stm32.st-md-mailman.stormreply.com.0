Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FC8275254
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 09:36:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29821C3FAFF;
	Wed, 23 Sep 2020 07:36:56 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83074C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 19:27:16 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id a15so15141438ljk.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 12:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yWBOpq0UkvWk4FWbtpDOqSYC9sVpVEgdziUpvPMeV90=;
 b=X5nqZI2YveTvjI1P9aihzxrPaO7idkcriq7Q3Fw9E5sIEuVBnN0tCZWxr/+xZQ6vab
 /AsqPVPT9S8tCYAppc6yafyaQVCnENKgTh4DBalrrlwhZrvmFrIKSxC3xAwhTwj2mgL8
 FIVpiBEUbW2Mp3NvHZgUfcRV2x3sPP/Vsd3EimQ/DWnrsQFP0HdgAukZ+1yEMD0PFIAl
 CEGEF8QVcZNokfI3ZyZbuLVlHYLmdnFMnpyrrOKFAe7u5AMZD+VvYBVcue75k4pr7iOe
 iwg6HJW0NVbrW1TKcHaPKDDwm+BaiyQl+c0ZSFU4tHmIaOYbq/1C6zSMJgZSF7Jlh7ZB
 JXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yWBOpq0UkvWk4FWbtpDOqSYC9sVpVEgdziUpvPMeV90=;
 b=hZ7ULEydk5cx8bRO8xtDzXG4P72tDZ4m152sr+cbD0kVrX13nhXKv0jZIzYwRfFC7P
 u/Ij4tPw4EXAgX2hztZ+wJQlhoAibA2F4efIO22Xrg89y892IzOlw8T304KtEHkF5Xco
 e0kGFwFbv6RgXvWSL/0iO8Umhdvt7MUwB/z/S69v0skY+xqtjJomtvH20zFsLPe+6bD0
 gp6GkTchTG+CLwWSRXRfcyATMPb563YzV7S/nSmWxwS/+y8+fX11Q6zZHhbq0S3ITv7E
 LIZ8OOyRrRfQmZw47nIP4Ampj5PbCzaU+yS+AbSlxBeP1tYkR7apAUJQY+S4WvjfX5Gp
 BD+g==
X-Gm-Message-State: AOAM532dlVAcmAVpveVmVhG19xNpg7c6Wcp59JcEeHOfQdbSiCxGE7kZ
 iTa/krrgwutHek8OttiPUJU=
X-Google-Smtp-Source: ABdhPJwQkesYT7pCpI4VaOYmlUf6IunWjE7IVXyowtAYLEmbr03p7XsYeHEorcJOd6c0Tmav90Nn1g==
X-Received: by 2002:a2e:8695:: with SMTP id l21mr1892135lji.106.1600802835960; 
 Tue, 22 Sep 2020 12:27:15 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id r132sm3770013lff.167.2020.09.22.12.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 12:27:15 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Tue, 22 Sep 2020 21:26:57 +0200
Message-Id: <20200922192659.14535-7-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922192659.14535-1-rikard.falkeborn@gmail.com>
References: <20200922192659.14535-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:36:54 +0000
Cc: linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/8] mfd: stmpe: Constify static struct
	resource
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

Constify a couple of static struct resource. The only usage of the
structs is to assign their address to the resources field in the
mfd_cell struct. This allows the compiler to put them in read-only
memory. Done with the help of Coccinelle.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/mfd/stmpe.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 1aee3b3253fc..90f3292230c9 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -312,7 +312,7 @@ EXPORT_SYMBOL_GPL(stmpe_set_altfunc);
  * GPIO (all variants)
  */
 
-static struct resource stmpe_gpio_resources[] = {
+static const struct resource stmpe_gpio_resources[] = {
 	/* Start and end filled dynamically */
 	{
 		.flags	= IORESOURCE_IRQ,
@@ -336,7 +336,7 @@ static const struct mfd_cell stmpe_gpio_cell_noirq = {
  * Keypad (1601, 2401, 2403)
  */
 
-static struct resource stmpe_keypad_resources[] = {
+static const struct resource stmpe_keypad_resources[] = {
 	{
 		.name	= "KEYPAD",
 		.flags	= IORESOURCE_IRQ,
@@ -357,7 +357,7 @@ static const struct mfd_cell stmpe_keypad_cell = {
 /*
  * PWM (1601, 2401, 2403)
  */
-static struct resource stmpe_pwm_resources[] = {
+static const struct resource stmpe_pwm_resources[] = {
 	{
 		.name	= "PWM0",
 		.flags	= IORESOURCE_IRQ,
@@ -445,7 +445,7 @@ static struct stmpe_variant_info stmpe801_noirq = {
  * Touchscreen (STMPE811 or STMPE610)
  */
 
-static struct resource stmpe_ts_resources[] = {
+static const struct resource stmpe_ts_resources[] = {
 	{
 		.name	= "TOUCH_DET",
 		.flags	= IORESOURCE_IRQ,
@@ -467,7 +467,7 @@ static const struct mfd_cell stmpe_ts_cell = {
  * ADC (STMPE811)
  */
 
-static struct resource stmpe_adc_resources[] = {
+static const struct resource stmpe_adc_resources[] = {
 	{
 		.name	= "STMPE_TEMP_SENS",
 		.flags	= IORESOURCE_IRQ,
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
