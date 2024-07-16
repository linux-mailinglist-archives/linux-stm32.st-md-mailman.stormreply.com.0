Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1620E932F29
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2024 19:35:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFB42C71280;
	Tue, 16 Jul 2024 17:35:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E349C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2024 17:35:13 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so40644995e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2024 10:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721151313; x=1721756113;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bAQWEK46ZWZIRZK4a1Nbp7rquUK8x0wTaH1JyzdX3Kg=;
 b=KafghoHdJuC88q0tbzm1fw6vTlepZOLZkJQ5nkh+31ItbiygmXObsUeYZhW4mNccXR
 lzassqjv6ySkNmho1dFspfVyDY0xjbbJLURjTnRV1xvWNvqnloEUIa4BnTaLgFrRjpSo
 9EdkTqRn/IE8WSd/ltkKms62kguQ6dXx1nUZHk2NSdeQpNFTWg6rFykhFXgigGavSwRI
 IYAaYsPwhoQqN/IGfS/7YmGj/z7Xw1pBOC7paxwy9rGv7HKdmzH51qT6rfYlENhHL4XX
 0zziCCVI1PeGQ55hLAwkrs7A7k5/xgR1hVbSzcezgGNPHPnz7xcfwJDpvqKLjAHpz5Hn
 lXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721151313; x=1721756113;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAQWEK46ZWZIRZK4a1Nbp7rquUK8x0wTaH1JyzdX3Kg=;
 b=MzcA/FH8HT2p4iVIjuJETF3QOd4B7Tm1XFCElz54zDzhCZHISg3ZyMBbHQqmxNIRVO
 wyrxa6m/extcaokXUq0yzP/gOY9MjkZB+zCc4T+njcLzEeA2vwnmR1G//A/aAEDiNz/8
 1aB7Xo0kbXS3WJr4FUIIhEHUxiUf8lH2pesyRIxw0oXCQRVk0jBPdukmK2W5FfP7RdBi
 SHNAPxbGoGc+ijBF+dMEqC661ilr5667Pd89EDObjZlrboDLc3ogSJ6a+h5hDP0o9kDu
 oBhcBfSHP/sldYarxCFhLZuRuL+jiqEAiDWrIcNLBWUGfyJfSpiGU4hE50SHSHAq+JnR
 Eihw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+1CXGqB9miUfy6gmYDi+NmFBp+SO0Wm/6kXCsaE+ExARt7oFhFXkoNrtGzCdG2IjR5nVWBfx9rEAIld34x6zT8tvBRTkGfKIBgv96LTVZnb0TKWhjHfUw
X-Gm-Message-State: AOJu0YwXbN73bFFN8QRA4bywtZ/js7CH8Q/1JlVQIDaHtbMIEJYQYOE6
 rHsxu6upSTSR92WESXQ6/ru4HSpechSg+kOTcxtsmaI6SPXZ6D5J
X-Google-Smtp-Source: AGHT+IFsEJAoNxLYSE5KxDRk11nslRcJ+xQxLGcEtecc0HTGqboFocwxBD4yicc4yd2u8CqRnVX0ig==
X-Received: by 2002:a05:6000:2c1:b0:367:9ab5:2c80 with SMTP id
 ffacd0b85a97d-3682635d007mr1853778f8f.57.1721151312578; 
 Tue, 16 Jul 2024 10:35:12 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db04841sm9612414f8f.101.2024.07.16.10.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 10:35:12 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 16 Jul 2024 19:34:51 +0200
MIME-Version: 1.0
Message-Id: <20240716-thermal-v4-1-947b327e165c@gmail.com>
References: <20240716-thermal-v4-0-947b327e165c@gmail.com>
In-Reply-To: <20240716-thermal-v4-0-947b327e165c@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 1/2] thermal: st: switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Remove those guards on every ST thermal related drivers.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/thermal/st/st_thermal.c        | 4 +---
 drivers/thermal/st/st_thermal_memmap.c | 2 +-
 drivers/thermal/st/stm_thermal.c       | 8 +++-----
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/thermal/st/st_thermal.c b/drivers/thermal/st/st_thermal.c
index 2a105409864e..5f33543a3a54 100644
--- a/drivers/thermal/st/st_thermal.c
+++ b/drivers/thermal/st/st_thermal.c
@@ -236,7 +236,6 @@ void st_thermal_unregister(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(st_thermal_unregister);
 
-#ifdef CONFIG_PM_SLEEP
 static int st_thermal_suspend(struct device *dev)
 {
 	struct st_thermal_sensor *sensor = dev_get_drvdata(dev);
@@ -265,9 +264,8 @@ static int st_thermal_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-SIMPLE_DEV_PM_OPS(st_thermal_pm_ops, st_thermal_suspend, st_thermal_resume);
+DEFINE_SIMPLE_DEV_PM_OPS(st_thermal_pm_ops, st_thermal_suspend, st_thermal_resume);
 EXPORT_SYMBOL_GPL(st_thermal_pm_ops);
 
 MODULE_AUTHOR("STMicroelectronics (R&D) Limited <ajitpal.singh@st.com>");
diff --git a/drivers/thermal/st/st_thermal_memmap.c b/drivers/thermal/st/st_thermal_memmap.c
index e427117381a4..97493d2b2f49 100644
--- a/drivers/thermal/st/st_thermal_memmap.c
+++ b/drivers/thermal/st/st_thermal_memmap.c
@@ -170,7 +170,7 @@ static void st_mmap_remove(struct platform_device *pdev)
 static struct platform_driver st_mmap_thermal_driver = {
 	.driver = {
 		.name	= "st_thermal_mmap",
-		.pm     = &st_thermal_pm_ops,
+		.pm     = pm_sleep_ptr(&st_thermal_pm_ops),
 		.of_match_table = st_mmap_thermal_of_match,
 	},
 	.probe		= st_mmap_probe,
diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 34785b9276fc..ffd988600ed6 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -440,7 +440,6 @@ static int stm_thermal_prepare(struct stm_thermal_sensor *sensor)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stm_thermal_suspend(struct device *dev)
 {
 	struct stm_thermal_sensor *sensor = dev_get_drvdata(dev);
@@ -466,10 +465,9 @@ static int stm_thermal_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(stm_thermal_pm_ops,
-			 stm_thermal_suspend, stm_thermal_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(stm_thermal_pm_ops,
+				stm_thermal_suspend, stm_thermal_resume);
 
 static const struct thermal_zone_device_ops stm_tz_ops = {
 	.get_temp	= stm_thermal_get_temp,
@@ -580,7 +578,7 @@ static void stm_thermal_remove(struct platform_device *pdev)
 static struct platform_driver stm_thermal_driver = {
 	.driver = {
 		.name	= "stm_thermal",
-		.pm     = &stm_thermal_pm_ops,
+		.pm     = pm_sleep_ptr(&stm_thermal_pm_ops),
 		.of_match_table = stm_thermal_of_match,
 	},
 	.probe		= stm_thermal_probe,

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
