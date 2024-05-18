Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF58CAE67
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 14:35:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 467FFC6DD66;
	Tue, 21 May 2024 12:35:54 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44D31C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2024 12:12:50 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e576057c06so16932661fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2024 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716034370; x=1716639170;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iZK4uEAHMWC7+OzKf8O0ygaLmakDxoLTPfLX2sxqysQ=;
 b=V4q5DKRYdRDnZO0NQJR8lD66IveM7/tsIUgu/x4/9NYXx+1sFbP5MRbnksK3c6gZ+Y
 PFkHTvoRWiNfj08qsnThkxBeN4rNa+LYzFYYmd0LlNC8TqQ6W5VsMLVT/Zhs9H52PqJY
 qroRiZSD4SDIruhTpcsJmh+WCtPiKyhW2s5Bv85Id9lQ7a62BuqhOJbwheGb1kSoigXa
 xGQTuKpMkaA+FyZ7O2Cukxp6KOIMzS6jQMmDiuURAfyy/i36qv7Oqhnbm/sa5enb4RcS
 j7mCzh9fuFJQ/7FfUl9zsDIqIbxPldYpmsxRsjy7LBMNNSvRQo3/tzL6gGCxafrbk9Ez
 IeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716034370; x=1716639170;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZK4uEAHMWC7+OzKf8O0ygaLmakDxoLTPfLX2sxqysQ=;
 b=FD7XhWMmgAU/zkF5iuWdnDFyDX89WiRWTC57rm0bzEsxzZcl/4/G6hL4W55z2C/Rjn
 gudZb8zbUUduOaXelu4W6JSDSCstIp6vz+zEIva2FHFxODKuhroNPzWiPO7sJ+GcIC9l
 2+NXplFJr9MZVzUiaq7CR9TArJGGB0gJfFeVck0Mc1eOVIPXKN0DSSj9H4Th/qrXIFNg
 R9lwh/2z7gVYUNusp6TjTGFt5yDS1DTHGllGkRqK1/LlrZU7lJeIAz116+GmysymwF5L
 iLEZ4udZJpIpLcAL++Xvs3ErYE1nYAyCQYBneTqQvqfHbb4K1JndVEFghJ+QX32en17B
 oK+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWbXjyC6LajzXf5tAkRCUpEv/LFYRR79Fg5vbQgjedEyCtpfuKpRU7lJIbUKbxUNCqxWsoxVQFAhEu6A6eQcSUyEhHwtD6gb2NgUIwo9U7c6GaS6o+9tls
X-Gm-Message-State: AOJu0Yw5pX6kkgBAMtF+UH/FHc8WpJvb2UNiuvaqPZyB+IcV1/wD/JAL
 tsuEiJcJ1glj8aLFuQ+mknHbQbkwhoboC2peLT9xORSbOzEKePzE
X-Google-Smtp-Source: AGHT+IEgVLnhmwBYh/F3A7zypWfD3dPLiM8lgaXLecPRLfLx6gkZ5jPCjuVL5Z1h01pYyi0ORRYBqg==
X-Received: by 2002:ac2:46e2:0:b0:523:8744:54ae with SMTP id
 2adb3069b0e04-52387445634mr6715047e87.63.1716034369520; 
 Sat, 18 May 2024 05:12:49 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-523713d5081sm1636086e87.244.2024.05.18.05.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 05:12:49 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sat, 18 May 2024 14:12:04 +0200
MIME-Version: 1.0
Message-Id: <20240518-thermal-v1-1-7dfca3ed454b@gmail.com>
References: <20240518-thermal-v1-0-7dfca3ed454b@gmail.com>
In-Reply-To: <20240518-thermal-v1-0-7dfca3ed454b@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Tue, 21 May 2024 12:35:52 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] thermal: st: switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
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
2.45.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
