Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9010B58A371
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Aug 2022 00:52:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DA51C640F8;
	Thu,  4 Aug 2022 22:52:28 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57DEEC640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Aug 2022 22:52:27 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id bv3so1355710wrb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Aug 2022 15:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linexp-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yY7L3sqNECPS66oxsrQOipowqI7T9PMCADR4st5QAxA=;
 b=3Y9D4c0pyJct0t/fz7pa2WXBbqdvotgWraefV8v2UY7pxsaEPt47JCaSTkf6H1qQLb
 zbV5fNW+BcLlFmg4MLjR1sDclhAnx2dD40KR0SZYM4m84+448LPEWoXQ5iGn+K1PJfI6
 yB0eq540SKxHm53nel5dNm8EomKKvVGli1jwkxbvVnldrZQIDKz0QECXvKW8wDvKfpyi
 FdMpej2QIt8qODrFpHMwTvjfVSqtT9u4ICOpLczrwXysPLZQlLbOAIqXJI0mwg0K/hKB
 9Nj+dxEcYXA6UYrxN5KSthGlB9t+c0NsF7xYrUQ0oD6HeLXnhB2iF/4Qw0dDWT1rDRjI
 K+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yY7L3sqNECPS66oxsrQOipowqI7T9PMCADR4st5QAxA=;
 b=WS7dEGaBlbeb9JkFhm3A/Y4PmvGKUQTvj+UjSmwUCOvgy2Nl8Yssztq6+fA7og5DGm
 I1OyFNOYzh4rWyL5Egj80s7BndWuj1NGlsqOx3JGXgifD+PVcp5VkCMANWsz34ud1TY6
 McxntjzsqNH4zHvkLy+vH8xwh2OJ2VJM58IaXTMVWGjI3/s4Y8RbKsw/9fxN9s4I7QyX
 DfkQKTm6ycYwNUPqnvsZVkHfewSO+X0dIpG/2yU2xY6j/9p1tdRHAg9IM+dXUdxDn4Z1
 Nlfx+wkS0ZseeXO0TdKOgu/8z/PNzScnExzAHuB3G0t2hnijxiaBdu/28aD2lOet7AYl
 pugg==
X-Gm-Message-State: ACgBeo1qcts98guWd2SO4GMVCk1jOzHHBDS3gYXi3boGhOxlIsBuc6El
 M5l298KGJCoGFgb3OnDMOIHeZg==
X-Google-Smtp-Source: AA6agR5kNFd41Sa5oFqkxaJt/vY0sCyYBpHlLVNk5sjOZyy1oAqv1odmMR8zg0KdC1W58YFZxfJbeA==
X-Received: by 2002:a5d:6512:0:b0:21e:cdab:1598 with SMTP id
 x18-20020a5d6512000000b0021ecdab1598mr2533247wru.687.1659653546829; 
 Thu, 04 Aug 2022 15:52:26 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:31aa:ed2c:3f7:19d])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a056000051000b0021f87e8945asm2495906wrf.12.2022.08.04.15.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 15:52:26 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Date: Fri,  5 Aug 2022 00:43:28 +0200
Message-Id: <20220804224349.1926752-13-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
References: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Cc: heiko@sntech.de, hayashi.kunihiko@socionext.com, tiny.windzz@gmail.com,
 Amit Kucheria <amitk@kernel.org>, bjorn.andersson@linaro.org,
 thierry.reding@gmail.com, glaroque@baylibre.com, abailon@baylibre.com,
 miquel.raynal@bootlin.com, digetx@gmail.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, f.fainelli@gmail.com,
 khilman@baylibre.com, damien.lemoal@opensource.wdc.com, jonathanh@nvidia.com,
 anarsoul@gmail.com, rui.zhang@intel.com, linux-pm@vger.kernel.org,
 niklas.soderlund@ragnatech.se, broonie@kernel.org, matthias.bgg@gmail.com,
 talel@amazon.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 j-keerthy@ti.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org,
 mcoquelin.stm32@gmail.com, baolin.wang7@gmail.com, shawnguo@kernel.org,
 lukasz.luba@arm.com
Subject: [Linux-stm32] [PATCH v5 12/33] thermal/drivers/st: Switch to new of
	API
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

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach. The ops are no longer device
tree specific and are the generic ones provided by the core code.

Convert the ops to the thermal_zone_device_ops format and use the new
API to register the thermal zone with these generic ops.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 drivers/thermal/st/stm_thermal.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 5fd3fb8912a6..78feb802a87d 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -302,9 +302,9 @@ static int stm_disable_irq(struct stm_thermal_sensor *sensor)
 	return 0;
 }
 
-static int stm_thermal_set_trips(void *data, int low, int high)
+static int stm_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
 {
-	struct stm_thermal_sensor *sensor = data;
+	struct stm_thermal_sensor *sensor = tz->devdata;
 	u32 itr1, th;
 	int ret;
 
@@ -350,9 +350,9 @@ static int stm_thermal_set_trips(void *data, int low, int high)
 }
 
 /* Callback to get temperature from HW */
-static int stm_thermal_get_temp(void *data, int *temp)
+static int stm_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct stm_thermal_sensor *sensor = data;
+	struct stm_thermal_sensor *sensor = tz->devdata;
 	u32 periods;
 	int freqM, ret;
 
@@ -474,7 +474,7 @@ static int stm_thermal_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(stm_thermal_pm_ops,
 			 stm_thermal_suspend, stm_thermal_resume);
 
-static const struct thermal_zone_of_device_ops stm_tz_ops = {
+static const struct thermal_zone_device_ops stm_tz_ops = {
 	.get_temp	= stm_thermal_get_temp,
 	.set_trips	= stm_thermal_set_trips,
 };
@@ -539,9 +539,9 @@ static int stm_thermal_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	sensor->th_dev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0,
-							      sensor,
-							      &stm_tz_ops);
+	sensor->th_dev = devm_thermal_of_zone_register(&pdev->dev, 0,
+						       sensor,
+						       &stm_tz_ops);
 
 	if (IS_ERR(sensor->th_dev)) {
 		dev_err(&pdev->dev, "%s: thermal zone sensor registering KO\n",
@@ -572,7 +572,6 @@ static int stm_thermal_probe(struct platform_device *pdev)
 	return 0;
 
 err_tz:
-	thermal_zone_of_sensor_unregister(&pdev->dev, sensor->th_dev);
 	return ret;
 }
 
@@ -582,7 +581,6 @@ static int stm_thermal_remove(struct platform_device *pdev)
 
 	stm_thermal_sensor_off(sensor);
 	thermal_remove_hwmon_sysfs(sensor->th_dev);
-	thermal_zone_of_sensor_unregister(&pdev->dev, sensor->th_dev);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
