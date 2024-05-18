Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE28CAE66
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 14:35:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ADEFC6C841;
	Tue, 21 May 2024 12:35:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 417DAC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2024 12:12:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4202cea98daso8365065e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2024 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716034371; x=1716639171;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IGJsrqgkoxohMyaFQCRQCQrzlTAn771GcCI5VxzoLbQ=;
 b=YwtGaQvelX3yloK1+OdFmtw/6QYuA3bTeIZchSpOqTuO2jKfaqkhSHG4/R8TnCqHgc
 8zyT/dv+P7JmuWl14i2kKbPt9jjyMW/KznxxvCv03F+ZQC9APG41W18Kx5DFtttTIFqn
 ibTJHm5RM+7QSeCCeYFVjqzmHH0N16kYBQ89Y8/o2DDfErM7pENHJ51aba91rkbZNMsx
 5eZQ8owr/CwmVQY8S/kxZ003EuG5Oppzht1EQMGRHxinRlN2xzWW8QpH382isZ31bxFN
 vqrX2Va5oEzCSgrqwIzVEu3jSV2+HTsakGWr2Wr5utWYYFueER6Z+NZ3AnhfaqInewPX
 /PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716034371; x=1716639171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGJsrqgkoxohMyaFQCRQCQrzlTAn771GcCI5VxzoLbQ=;
 b=EL3BP5/SU7h8y2/G334CNFA65PC2zvoHtFnnlu7jiLrpgrAVB3OBrThXYOFNSCv2I8
 cgPBLBBWzEbzyZO4nWX/uKOwxwma8yyutHovndVEy2YuyhvryiVVXYZNjkKrhUymb/wX
 gZoFRUS5+HKVBstu0A6FkS6AnoCGl9Ogx3DCgLEZvM/gRZFGuxIWHdu6hMfO7986Ccbx
 v4EvsPkMZXif2DiBQoI+Z4gsGEvyPC8O7Xrj1CECOPMLNaE72fKUY3t/SCLNtEbkdzry
 Y1otGEJKyDaIoSlfXOlkpX68vWKfWIBHasQ1Tgrwsk6/CbjwHsnt5VL4qbawOgh0fgQ1
 KAlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw5N5m07I4PglGcPXAlT5HXEh7ihXLx3zjcNIoLr0quBSkFX4wvDfqhWPtqWv1RJJB9AkR5yPUWE//3wVMBcKqss86Qvb6dPQkez1/th63Zsa5GPLtPT5H
X-Gm-Message-State: AOJu0YzcJtr9k4qLdCl9ICMiGaMC4c/QL11KgfoIO/eYcW25Ig0SC5SF
 Hjjh9Ww+jOCaI2LVS/m0sI5hjKVlnmXLJ8a0OiF8jkjnsPRbN0hU
X-Google-Smtp-Source: AGHT+IE/IhYubC0E9IZHEWKwQe0B3qG0jCm6OSbLvY0zrTBrXxj/mkuhSbi+Le/nYtJXLiXMiTQwEw==
X-Received: by 2002:a05:600c:3144:b0:420:1db0:53c1 with SMTP id
 5b1f17b1804b1-4201db054a9mr89916045e9.41.1716034370365; 
 Sat, 18 May 2024 05:12:50 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42017166c64sm215580105e9.8.2024.05.18.05.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 05:12:50 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sat, 18 May 2024 14:12:05 +0200
MIME-Version: 1.0
Message-Id: <20240518-thermal-v1-2-7dfca3ed454b@gmail.com>
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
Subject: [Linux-stm32] [PATCH 2/3] thermal: sti: depend on THERMAL_OF
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
 drivers/thermal/st/Kconfig      |  1 +
 drivers/thermal/st/st_thermal.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

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
index 5f33543a3a54..60e70de724d4 100644
--- a/drivers/thermal/st/st_thermal.c
+++ b/drivers/thermal/st/st_thermal.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 
 #include "st_thermal.h"
+#include "../thermal_hwmon.h"
 
 /* The Thermal Framework expects millidegrees */
 #define mcelsius(temp)			((temp) * 1000)
@@ -203,23 +204,21 @@ int st_thermal_register(struct platform_device *pdev,
 	trip.type = THERMAL_TRIP_CRITICAL;
 
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
 
@@ -232,7 +231,8 @@ void st_thermal_unregister(struct platform_device *pdev)
 	struct st_thermal_sensor *sensor = platform_get_drvdata(pdev);
 
 	st_thermal_sensor_off(sensor);
-	thermal_zone_device_unregister(sensor->thermal_dev);
+	thermal_remove_hwmon_sysfs(sensor->thermal_dev);
+	devm_thermal_of_zone_unregister(sensor->dev, sensor->thermal_dev);
 }
 EXPORT_SYMBOL_GPL(st_thermal_unregister);
 

-- 
2.45.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
