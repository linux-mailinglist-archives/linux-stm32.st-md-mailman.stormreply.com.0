Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D281D91786C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 08:01:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94EA0C78012;
	Wed, 26 Jun 2024 06:01:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30151C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 21:33:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-424ad991cbbso1706575e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719351195; x=1719955995;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zmhey6jWNgkoZcPsesEc/YC3gENWDbb7EazMCNZY/50=;
 b=k1RHPlOk2GsYtQ7HlH7KQDEh4PDuXI2nNHUnZpxWtzDrKE4SRRO/7ykG2M1g81KZNs
 FdsgY2GPw+I4XIfXy1+DaBZ54p41g2d6eegXE7vQbC/3Gda3wYEROhQOzbmPvVVTOV/H
 bRxBwDHauicDHlSDanwITQ99BPN5Q7S0SeIkRL/VuyNO30asb3x0EHlA2VYXf3oYSOAS
 si9YrHDMHuzI8uwtJpUVfNj3JHpcl2kv6/6U+/J04C25GNMhmD8bidRUtqlKGHmIrE1r
 Y+jtHRqu0sR3hCA2qL8MlfNbm8S+3IU0YSLh+vUZJLhX0du7EJIlQwBYMWtp7zU9lP/D
 +7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719351195; x=1719955995;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zmhey6jWNgkoZcPsesEc/YC3gENWDbb7EazMCNZY/50=;
 b=PcLEcBfQF2jDKDbpImCzozhVYua9c5/2nOUjYYotwEMdp5hOgDq7k7Iwl12ywcjqbF
 JONWZWEkjdOKUYjmv8AAPx7dCoUaP5EaPditUDrfoRzHkc28aIbXGVg1gDnol190xYLg
 K153e+0gEBpfCK7NJosLV1pWJ2SpQGyMukM+00IZlLHKggr/xfaPRLLMFiVzrdZhDCif
 9L2GHTK9scN6g92iXOHicekzyqwcJn7mePOuWh/0dQA6U9wqxme8UlBfVF3FXRkPF9ae
 HCIhD7mTdz3KoQ8mUUgfJ0ELXOAjJJZILqeRrGwtoXbtCfD1WGEWufQnAOPJn6ItpZsE
 D9xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfcEhnXh3q277lsS6Y8iXPT+KgmQ3GVxnjqW2CcSVjJ+32h0cI4bWSlB+pulirBiz2hEwMCuhvlONPnDde1PrRL+teNVb+29T+BSBHy09+nolid03svrGc
X-Gm-Message-State: AOJu0YwXEzkX6igFcQuCWVMmU/MMCLG2m0rIJfnmK5ZaL+wX9ig/mLoP
 kebJox5Y3B7iQHX3UHf2Upp2l4DPX1piAa/YF4CBo7rq1lOBSbeSG3ey1A==
X-Google-Smtp-Source: AGHT+IHZcYPdA/oB1eqxXUZJdRHrdM0ptr8uZAvGcXG5QB+c4jay5cR1N2yLLu/ozoO9syYLBuFxfQ==
X-Received: by 2002:a5d:518c:0:b0:362:3b56:dbda with SMTP id
 ffacd0b85a97d-366e9463e46mr5084476f8f.9.1719351194528; 
 Tue, 25 Jun 2024 14:33:14 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366e88c0c38sm9561633f8f.32.2024.06.25.14.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:33:14 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 25 Jun 2024 23:32:41 +0200
MIME-Version: 1.0
Message-Id: <20240625-thermal-v2-2-bf8354ed51ee@gmail.com>
References: <20240625-thermal-v2-0-bf8354ed51ee@gmail.com>
In-Reply-To: <20240625-thermal-v2-0-bf8354ed51ee@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.0
X-Mailman-Approved-At: Wed, 26 Jun 2024 06:01:46 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/3] thermal: sti: depend on THERMAL_OF
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
Changes in v2:
- Remove unused struct thermal_trip trip
---
 drivers/thermal/st/Kconfig      |  1 +
 drivers/thermal/st/st_thermal.c | 25 ++++++++++---------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/thermal/st/Kconfig b/drivers/thermal/st/Kconfig
index ecbdf4ef00f4..2d08147876ee 100644
--- a/drivers/thermal/st/Kconfig
+++ b/drivers/thermal/st/Kconfig
@@ -5,6 +5,7 @@
 
 config ST_THERMAL
 	tristate "Thermal sensors on STMicroelectronics STi series of SoCs"
+	depends on THERMAL_OF
 	help
 	  Support for thermal sensors on STMicroelectronics STi series of SoCs.
 
diff --git a/drivers/thermal/st/st_thermal.c b/drivers/thermal/st/st_thermal.c
index 5f33543a3a54..1f2ba5c88cbc 100644
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
@@ -199,27 +198,22 @@ int st_thermal_register(struct platform_device *pdev,
 
 	polling_delay = sensor->ops->register_enable_irq ? 0 : 1000;
 
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
 
-	return 0;
+	/*
+	 * devm_thermal_of_zone_register() doesn't enable hwmon by default
+	 * Enable it here
+	 */
+	return devm_thermal_add_hwmon_sysfs(dev, sensor->thermal_dev);
 
-tzd_unregister:
-	thermal_zone_device_unregister(sensor->thermal_dev);
 sensor_off:
 	st_thermal_sensor_off(sensor);
 
@@ -232,7 +226,8 @@ void st_thermal_unregister(struct platform_device *pdev)
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
