Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F17C586953
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4D2BC6410F;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E29BC640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jul 2022 21:03:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id d8so25985093wrp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jul 2022 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linexp-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dxp2C7hOahM111jOQKxvW4vMPiwlgfAm7+eoRoP/H0c=;
 b=Ql9P7khAEbPtBkzjcp5XaCi4QxAdxEPwsFEjSLrsbGi3g8sXAHfkez8w0F5bVztWzB
 1SyHwgpQD3nUGf6heOQfLRl6RD5iMpn2oQG7Cq24Nh7Ih3bM1srVXgRwk7guHGpskcbf
 ZB53KfBDlxkXqE6xOkZV9HIN9s8ueDByYm9VvFqis62zsAUSRUk42oSoiEJJc/o+PioD
 rNrGO8jJUIV77evttqyggj8SB/0vjg7ZCwODaU0C4nNxAzu+2im+9ruR64opivRduQjS
 aL/MkSXeciSXY8+XJ/38eJNVpaXTFExr3nnNOeYREUtanzu0ggPnrxJsbL/0kQQUatll
 5yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dxp2C7hOahM111jOQKxvW4vMPiwlgfAm7+eoRoP/H0c=;
 b=pvqpqq8Pp+8vQtsuAennvKJOVblQD9IoVuJb366/sNUB9GxDkNaSdbl2NiHlgv2xj6
 YYfKuH0o3tdCQAy6xH4nE1p9/zt/pu8VdH9QCOx9KjzmSHRxRyR/W4wXUOoNF4lCJFGa
 uxIdqfUCYZf++nBIdlIkhDMIWwhJFn3T+FPtMzzxZ93CEv28z+tnbrGlKQoZ87/j+CE6
 MSXXrq/OyHXvfqU4JwYSA1II1kvO3f0zDn2auN3t8rYVyPJ5PqNncZVy/W8d+oq1Vfcd
 CtW2dG5V6N49VtTDHzA1/7viAMMtWL5tzVOWRJuzcd90rCC7Po9k7InlsL7iFIjaNldr
 bnpg==
X-Gm-Message-State: AJIora+npAzjfuPLm12jpMOHGwGWZBOp/W7yNjE+OJZrX6NGnkvF3XKW
 +ldqF4jkTBNiUkUTH1XhW+6fow==
X-Google-Smtp-Source: AGRyM1sYCmBc8zP98qeJVTLO6ZLgs3kZlFwsKHO+Jkt00F/R6MOc/u+IonZmnTRz8jHvn7G2ssHHAg==
X-Received: by 2002:a5d:6a04:0:b0:21e:4aab:d58c with SMTP id
 m4-20020a5d6a04000000b0021e4aabd58cmr15147051wru.286.1658955820743; 
 Wed, 27 Jul 2022 14:03:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:65a8:ebd8:4098:d9d0])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c350600b003a38606385esm37908wmq.3.2022.07.27.14.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 14:03:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Date: Wed, 27 Jul 2022 23:02:33 +0200
Message-Id: <20220727210253.3794069-13-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
References: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:00:10 +0000
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
Subject: [Linux-stm32] [PATCH v3 12/32] thermal/drivers/st: Switch to new of
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
