Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D049309C4
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2024 13:43:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CC8CC6DD96;
	Sun, 14 Jul 2024 11:43:20 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 026B1C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 11:43:15 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52ea7d2a039so3546174e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720957394; x=1721562194;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wOp5UqGNK/+aHc+mtLWt/FVtlNV3iPD/WbMrczGg2CE=;
 b=O18pYzNX5nnFQgn92EOdMCsjBeQle8zDzUKnN9maHEUbi6M2S2cQME4UT4YzTDX4LG
 56MIfxykSTjnhbNNeVn/KbGi+eR5u2+0m2w6g+k4nJJLrz1e4dISJmAGwgLBlLmk3Idi
 IT6wn0BtYeyaJgKUHUuKjRSVG+X625tn07uvHqZ9S8YQCnRunoeeIrJHtcggUjrPVOqB
 ED+d5IzJWaLqLOd3NqpC4fudDv5r/n7+2qwXaxIcK6GkRcnQHL1LH2f+3klFphTIWFeM
 rAG25kR/s9pbsNQijQ5/cbGfrMFKaU1qymNTU84gjfj04+7kOukC414mOhJN5UnGFvpZ
 OBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720957394; x=1721562194;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wOp5UqGNK/+aHc+mtLWt/FVtlNV3iPD/WbMrczGg2CE=;
 b=S0XoJdztGQ+lipkM474GjlfluYU3ek2x6K+1ZpBxbDsXcAcuiOaQCBs4CZRg1j8eSJ
 8l6Yii2TM5hJuGEdFv4RQTI8c1dcizN5P25T3mlUqVNkZl4Es4053ULhsiUCjo8UVWLb
 u7Qf9rVWhVgSU3G+30FoI31IwtNXZAyi0kHKx8o4uiaCQqWGK3vlq/yX4vZ4btHDIY4G
 pLkLsvAinr0jyNRGiJgEGIP1bVXek8Ozi9MFk0/kLKrI0innNA09IREJON0EMS1Q/XEC
 XmCNUnPiWLSxZgM8bQAh2bdikC34Mtt2TxnUxIExLNejxw8YR1gUD7YEqhfQe27ohs1F
 s6Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUy6UGghfJ6JEjWlzFqZ6LpuLs6ILytWnU/nRN4r6OIyGV/BN8iso2wPthavFZzUlj6nyRxZGZMxxgYT+8Hg8NTf8yg2et9TL79ObP6Bd4BhvPRogTOc9L
X-Gm-Message-State: AOJu0YxtJyNETlKBFf7jz7H5zLLfpJdQbEwfOjj0EBhHxBquIum8Qz8V
 RcZuBcsUXpQfHkRXmPFo9lu4y+sKM4qK7xTDdBa9plj3EGccW49n
X-Google-Smtp-Source: AGHT+IGzQSl96QOLEDaGbFjBPAymg5u1VSljhpz6IWeZ7P97LOYVU2MHyNNINrbBaBgAgukwbohIfw==
X-Received: by 2002:a05:6512:39ce:b0:52e:96d7:2f3a with SMTP id
 2adb3069b0e04-52eb99da148mr12221457e87.58.1720957393616; 
 Sun, 14 Jul 2024 04:43:13 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3f2esm3650922f8f.18.2024.07.14.04.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 04:43:13 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 14 Jul 2024 13:42:45 +0200
MIME-Version: 1.0
Message-Id: <20240714-thermal-v3-1-88f2489ef7d5@gmail.com>
References: <20240714-thermal-v3-0-88f2489ef7d5@gmail.com>
In-Reply-To: <20240714-thermal-v3-0-88f2489ef7d5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 1/2] thermal: st: switch from
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
index 29c2269b0fb3..28b380013956 100644
--- a/drivers/thermal/st/st_thermal_memmap.c
+++ b/drivers/thermal/st/st_thermal_memmap.c
@@ -180,7 +180,7 @@ static void st_mmap_remove(struct platform_device *pdev)
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
