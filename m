Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC29309C3
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2024 13:43:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 743BCC6C83D;
	Sun, 14 Jul 2024 11:43:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0055BC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 11:43:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42660b8dd27so22679145e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720957395; x=1721562195;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=voezqBRIqgR1xMbzJXPZuwUUHTRBRdZ/+JwyhtZNvfc=;
 b=DIXPwYA7BskPtWHlxWd4m0KFW7Q+VIH7eU0fDXL84kwQz/2+J5Dpc9bwLQkNCA6USN
 end2IfIktk6kzU8fFYIbaajbPbL+duopbKMiISDIBWyP1SHOcfBzTeBed2I1DjDq5Vrm
 iQ1yiN3iv7O8L7IxVQq6nPbQf4t2z2tfDZBh0eYVP5njD/56FEJZUXy/MJ3RJGnOaDrl
 JLF6WG0XVIH2SasPe8mgQG6RNjzpUx/nkqhjETBx0EDcMHhlObuHpam7vMHzs3D2u8ss
 Iask80hOdf3R1Q6QPCvvzcXMSKAxINP8+DZ9B5FkP57jaNeSjeL5GQA7pgo55oYyLEH4
 22TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720957395; x=1721562195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=voezqBRIqgR1xMbzJXPZuwUUHTRBRdZ/+JwyhtZNvfc=;
 b=IikISdhDDavuxUJJZhWZ6G+KhU1w107EmliAcY73YvZbsA/Ior6WcdQRJ3P9qJ2OW7
 aqzOhXHlqo9UBif8I39YRYEGtM0gekXmrfYONlinIIVeZt5+fcAoY7ITCBmqf3BPhrS6
 6fNS23IcrIK/upw7ego8SErj9vSQ7imyJg9VpmEwyrzLZ2zJzG09K7lsoBMSBORE8lcQ
 71AAKUaa+oa9G1n63QPB0pjwDoUpNVz9s53quAzjAoB63yGXjKFAOSlAvHOFMgAl6PL5
 cmNYXLO2Z/1GhoX9/wImFvYpnEva+D7CS1QKjtKCVnCcjkMgPb0phrYkEWM5BZ8Myy5i
 D85w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI45sSXau0gBx2cZC+Qm0PdAVd1sFEh8+/HLGH5D95yMKhtSP+MqPuBmkNaeNFx7Q6BY6f5RJgEj4/cvjapBdHswwWMBSugsb4zafEllZopYxU0PRUHb1j
X-Gm-Message-State: AOJu0YyEB020XeuP44zakl+jgUXKgsiDQq3FBg7gls/O59g8PAqrlS9D
 VCbYUeTt+5DRpnEoHDkg8Drhmgm/2cB/rHfhq+iFxAb2b7HaEw6d
X-Google-Smtp-Source: AGHT+IHznxvk3jGNuxACzlPePqJZsFU4Gm7h8xaiwzJni80Kfh+rpr363DBOkzF8Q4inWF6XdCSGjw==
X-Received: by 2002:a05:6000:1814:b0:364:d2b6:4520 with SMTP id
 ffacd0b85a97d-367ce5df304mr10897937f8f.0.1720957394652; 
 Sun, 14 Jul 2024 04:43:14 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db0492asm3624096f8f.103.2024.07.14.04.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 04:43:14 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 14 Jul 2024 13:42:46 +0200
MIME-Version: 1.0
Message-Id: <20240714-thermal-v3-2-88f2489ef7d5@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 2/2] thermal: sti: depend on THERMAL_OF
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
Changes in v3:
- Fix unmet dependency when building with ARM64 compiler
  https://lore.kernel.org/lkml/202406270605.qodaWd4n-lkp@intel.com/
- Remove no more used polling_delay variable detected by kernel robot
  https://lore.kernel.org/lkml/202406270530.kN5wIswi-lkp@intel.com/
Changes in v2:
- Remove unused struct thermal_trip trip
---
 drivers/thermal/st/Kconfig      |  2 ++
 drivers/thermal/st/st_thermal.c | 28 ++++++++++------------------
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/thermal/st/Kconfig b/drivers/thermal/st/Kconfig
index ecbdf4ef00f4..95a634709a99 100644
--- a/drivers/thermal/st/Kconfig
+++ b/drivers/thermal/st/Kconfig
@@ -5,12 +5,14 @@
 
 config ST_THERMAL
 	tristate "Thermal sensors on STMicroelectronics STi series of SoCs"
+	depends on THERMAL_OF
 	help
 	  Support for thermal sensors on STMicroelectronics STi series of SoCs.
 
 config ST_THERMAL_MEMMAP
 	select ST_THERMAL
 	tristate "STi series memory mapped access based thermal sensors"
+	depends on THERMAL_OF
 
 config STM32_THERMAL
 	tristate "Thermal framework support on STMicroelectronics STM32 series of SoCs"
diff --git a/drivers/thermal/st/st_thermal.c b/drivers/thermal/st/st_thermal.c
index 5f33543a3a54..23597819ce84 100644
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
@@ -197,29 +195,22 @@ int st_thermal_register(struct platform_device *pdev,
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
 
@@ -232,7 +223,8 @@ void st_thermal_unregister(struct platform_device *pdev)
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
