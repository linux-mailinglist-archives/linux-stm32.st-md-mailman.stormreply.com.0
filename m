Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A247A58694C
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30BE7C640F7;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 155E5C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Jul 2022 21:25:01 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so2015905wmb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Jul 2022 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linexp-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6IoU0PuNuCRcBh+gum4Wd5t5Tge49JrI8fmxQkb2xQI=;
 b=VHvF9bowyvjKbhs3nKAQr0yL/YBT0FIp4Fpto86reo5w9jDV5TBOxiWH93V1G4UenW
 Eqp1O+ORe8DqWkkcTrZZuSpbp5BlxGr7LMzm1MT5bsVkpljWUqI9+GM3kZzdqsJ7u322
 PkQ0qIKn3KAf9Ig9YeMmxQIPZ1o4558waWmxz2P9TE0Y40JifHASUmsajnjQvWqNJk5R
 71uam9+sSqF1QTu8ZSDfUrfjrPbI/AeChPArx40sl16b20FXzqhXXWTU5597OTnfOR36
 nG4Hyahg4H6OlL9BCUvwkZBczE/wbO0QsxUwGK8b5k95y58++P6PKJXponhL8LOaOU/k
 tKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6IoU0PuNuCRcBh+gum4Wd5t5Tge49JrI8fmxQkb2xQI=;
 b=T1nDIRjYMyCb2LfxE7ej4kEvvvQF9z5niUhJ47TY4DN0zr36xk/dhav/N1uZHqzyY7
 aqJ+y6yjvGhK0UI8gnM8+fsYpft6QVrH1eQWyY2J0mtZOWT1sCFI+wtsHR/xvnmcLq12
 4587iq/9LkUthuhXGpTuvxjqJ51wQh8HSclkfb4Mhhp3WnlIurUQVFd2zbP1MYEk/jTh
 bn2BdYWhV8xkniTHiS8+DK0gyCWeKJcErj3R6cnDw3eDNVfOV7qULAIhqrYL+UvBze6r
 IPQl/aTBwjmpiuW6z2TGJ3V2NomKAj7DIoREICWBZ+mD183zeCgVPE2hAWwf+s42GZk8
 xyrA==
X-Gm-Message-State: AJIora/2F8+1R8td2DpWDB+S7hE1Hgg7I4KfehEy2j8wwV/atYPMvYhE
 7XYaTy7qT2zXMDcpGfzpgJ2bOA==
X-Google-Smtp-Source: AGRyM1spXhMkMTmmqCi49PMudOLtGq3ZW+qNmbnk9hVYAcyFndJGxL+k0SSuo+aTO25YzIS1GQm9lQ==
X-Received: by 2002:a05:600c:2059:b0:3a2:e5a4:ef8 with SMTP id
 p25-20020a05600c205900b003a2e5a40ef8mr4081389wmg.146.1657488300613; 
 Sun, 10 Jul 2022 14:25:00 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:c7c0:6823:f3ce:2447])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c3b1300b003a2dd0d21f0sm7142759wms.13.2022.07.10.14.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 14:25:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Date: Sun, 10 Jul 2022 23:24:02 +0200
Message-Id: <20220710212423.681301-13-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710212423.681301-1-daniel.lezcano@linexp.org>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:00:10 +0000
Cc: linux-pm@vger.kernel.org, khilman@baylibre.com, amitk@kernel.org,
 linux-kernel@vger.kernel.org, abailon@baylibre.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, rui.zhang@intel.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v1 12/33] thermal/drivers/st: Switch to new of
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
initialization to a simpler approach.

Use this new API.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 drivers/thermal/st/stm_thermal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 5fd3fb8912a6..e4ca0d504a4f 100644
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
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
