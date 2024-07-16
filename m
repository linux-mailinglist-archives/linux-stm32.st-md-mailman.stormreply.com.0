Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E80932F2A
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2024 19:35:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBD42C7129D;
	Tue, 16 Jul 2024 17:35:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C811C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2024 17:35:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-367a183df54so3913340f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2024 10:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721151314; x=1721756114;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mFZzo+h40ZkOiMih2IEE7mwoxCHvaz4i8bbYlqWEClA=;
 b=avvhf1FKdeQFyCn/H5rF6peO5tivp4uOlM/QK972SQEa1qtFf5LhNIP2bV2F/As/Ue
 0wI8r+9mBtIOw8QANr5n8ApG5mov/34xRYvAGIgqCWDxdHUsWLZPkslOZjlFVPUGmFaP
 gS9Z05baoZmWQoHULgnHQ0PiXv9wMU1E5pvVUf2I75tE342NHoLKY7C0FYrfTMMlWGI0
 uHu4qaf1G3Bb6ngD6dFyFu60LuMvshbu4QhJ/ocRvm8cuGsNHJ8BaQI0G4MY8ig+cDX1
 wOnnHs3icpGIvPsmaNRBNQOtszch78YWD7WREYbR4JA1lJCXkxL+zhm+Fo49fgWfmFyK
 qVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721151314; x=1721756114;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFZzo+h40ZkOiMih2IEE7mwoxCHvaz4i8bbYlqWEClA=;
 b=iHmdibZMP530U3sGvSj6kBW+UKXGvSS7sjrhER4ESt3Y+lP3CUuTpZejeB7PjStRRX
 yQPseIfbLHw48YZybW0UJ2xJoHnuwszxHF/Av9nU1ukSSy8bq91OCDN1KTZZaPDU3rIh
 OD4/FAUoK3R6M1mS9DTGcgrBhgFM2+tR5IN1WDZbN+sEc6HuZleMhwIkuwecLro3pW6X
 +F3JQTHDH1Rq0buNCvukgtNMr61kROG1NUVTkUE83mk+OOqj0bHZ+4RH3umz+PODziS3
 /SwVQ5ypVpsIc6IZnkcm/WASpBAFDn49O/cjOv/VtXrsKsJe8RfMQv6+EgpBMTuYWnm4
 XCNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXReaaPfKuTPPmp71stgrx22w+8SRFTUnCdmN6GPzribLRM2rzTHbxsapAM1dk83zKDfC2DVb4bV5ShmfGr1fnUnKgY5/QZmM7P78l+wvmZnIekF8m6rLx9
X-Gm-Message-State: AOJu0Yy13+plIJUlBXJ5Zdhr9dPfVxfEyV/3U6lv+HBtSGhLAmkHCbYq
 Eai3ahqYUXsO38lTNgGvRGb0B6px3z4iTUKDuOtk4YgXX5WvGXYf
X-Google-Smtp-Source: AGHT+IE70zhsNBUYOAewbvXHcYgepuMa8i+6KzIjuE7KgPVIgmBQVK7/cIQLRs1F0enKt0xhxVITpg==
X-Received: by 2002:a5d:588d:0:b0:367:958e:9822 with SMTP id
 ffacd0b85a97d-36825f715c0mr2543892f8f.14.1721151313262; 
 Tue, 16 Jul 2024 10:35:13 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27877dsm167381895e9.26.2024.07.16.10.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 10:35:13 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 16 Jul 2024 19:34:52 +0200
MIME-Version: 1.0
Message-Id: <20240716-thermal-v4-2-947b327e165c@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 2/2] thermal: sti: depend on THERMAL_OF
	subsystem
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

Switch to thermal_of_zone to handle thermal-zones. Replace
thermal_zone_device_register() by devm_thermal_of_zone_register() and
remove ops st_thermal_get_trip_type, st_thermal_get_trip_temp.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v4:
- Optimize dependencies
- Do not return devm_* exit code
Changes in v3:
- Fix unmet dependency when building with ARM64 compiler
  https://lore.kernel.org/lkml/202406270605.qodaWd4n-lkp@intel.com/
- Remove no more used polling_delay variable detected by kernel robot
  https://lore.kernel.org/lkml/202406270530.kN5wIswi-lkp@intel.com/
Changes in v2:
- Remove unused struct thermal_trip trip
---
 drivers/thermal/Kconfig         |  2 +-
 drivers/thermal/st/st_thermal.c | 28 +++++++++++-----------------
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index ed16897584b4..b6b916e7e294 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -429,7 +429,7 @@ source "drivers/thermal/samsung/Kconfig"
 endmenu
 
 menu "STMicroelectronics thermal drivers"
-depends on (ARCH_STI || ARCH_STM32) && OF
+depends on (ARCH_STI || ARCH_STM32) && THERMAL_OF
 source "drivers/thermal/st/Kconfig"
 endmenu
 
diff --git a/drivers/thermal/st/st_thermal.c b/drivers/thermal/st/st_thermal.c
index 5f33543a3a54..a14a37d54698 100644
--- a/drivers/thermal/st/st_thermal.c
+++ b/drivers/thermal/st/st_thermal.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 
 #include "st_thermal.h"
+#include "../thermal_hwmon.h"
 
 /* The Thermal Framework expects millidegrees */
 #define mcelsius(temp)			((temp) * 1000)
@@ -135,8 +136,6 @@ static struct thermal_zone_device_ops st_tz_ops = {
 	.get_temp	= st_thermal_get_temp,
 };
 
-static struct thermal_trip trip;
-
 int st_thermal_register(struct platform_device *pdev,
 			const struct of_device_id *st_thermal_of_match)
 {
@@ -145,7 +144,6 @@ int st_thermal_register(struct platform_device *pdev,
 	struct device_node *np = dev->of_node;
 	const struct of_device_id *match;
 
-	int polling_delay;
 	int ret;
 
 	if (!np) {
@@ -197,29 +195,24 @@ int st_thermal_register(struct platform_device *pdev,
 	if (ret)
 		goto sensor_off;
 
-	polling_delay = sensor->ops->register_enable_irq ? 0 : 1000;
-
-	trip.temperature = sensor->cdata->crit_temp;
-	trip.type = THERMAL_TRIP_CRITICAL;
-
 	sensor->thermal_dev =
-		thermal_zone_device_register_with_trips(dev_name(dev), &trip, 1, sensor,
-							&st_tz_ops, NULL, 0, polling_delay);
+		devm_thermal_of_zone_register(dev, 0, sensor, &st_tz_ops);
 	if (IS_ERR(sensor->thermal_dev)) {
-		dev_err(dev, "failed to register thermal zone device\n");
+		dev_err(dev, "failed to register thermal of zone\n");
 		ret = PTR_ERR(sensor->thermal_dev);
 		goto sensor_off;
 	}
-	ret = thermal_zone_device_enable(sensor->thermal_dev);
-	if (ret)
-		goto tzd_unregister;
 
 	platform_set_drvdata(pdev, sensor);
 
+	/*
+	 * devm_thermal_of_zone_register() doesn't enable hwmon by default
+	 * Enable it here
+	 */
+	devm_thermal_add_hwmon_sysfs(dev, sensor->thermal_dev);
+
 	return 0;
 
-tzd_unregister:
-	thermal_zone_device_unregister(sensor->thermal_dev);
 sensor_off:
 	st_thermal_sensor_off(sensor);
 
@@ -232,7 +225,8 @@ void st_thermal_unregister(struct platform_device *pdev)
 	struct st_thermal_sensor *sensor = platform_get_drvdata(pdev);
 
 	st_thermal_sensor_off(sensor);
-	thermal_zone_device_unregister(sensor->thermal_dev);
+	thermal_remove_hwmon_sysfs(sensor->thermal_dev);
+	devm_thermal_of_zone_unregister(sensor->dev, sensor->thermal_dev);
 }
 EXPORT_SYMBOL_GPL(st_thermal_unregister);
 

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
