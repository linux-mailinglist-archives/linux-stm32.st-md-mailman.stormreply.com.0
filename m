Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313D586951
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C21B0C64109;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2A0DC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 21:27:27 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k11so17261134wrx.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linexp-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dxp2C7hOahM111jOQKxvW4vMPiwlgfAm7+eoRoP/H0c=;
 b=s0JsTCXNvt2WXkcPVxGiAIXsDZBIj5/AZesH2AAmCTyIEv16R//Vuw19MnW0bj3ZRG
 XuDTksIpw4MlrYs/cjNUee35Kgmoe3mzLas8SPOGTENfmGVbH62AekMDGcRqLfQfWx47
 QHIJhEK+pvoQ3OsvU0bIKjNE0bSLJAMh1vWLYkZRZ1FM0BBm/fy51sDs8JmlHV2m1ZWk
 uGOZ46cC8LTcgJ2lt0ZmOzv5Is22R7LxCyO8G3Ly7NxpLMANhOBsRN4SMSvI3Ld25F+S
 /xlPKQnTOzN6Ag/mIT7OrSfged+na2T1jYMqAO/K8bndS3mUwyKaqU4VBTJR8Fqq3L01
 eW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dxp2C7hOahM111jOQKxvW4vMPiwlgfAm7+eoRoP/H0c=;
 b=MccUSCCyUg2y0HBE6qwiCkKyTrrnbeuAdq7T13m0wUPYqZ4xcRtZle18olxuUtWfbE
 292SLIbKG2hADKnd0K8Ewvhwq4RGSiX1deWYmFUbXjN/LbHsCEewlsYu59SEyCVwPfQ9
 lW6B7t84ToWpv74StKu42FVa99n+0FwjPR6t3UNCtpEhq9pfWVM1YOBl5ZsrOZ9iHKFI
 oXA8OYpziimnStNWTKuZQa5+7KdFCEOmJbKjj3UMCEDMgcX9CNdyPTrmf24ft4uTkXbV
 68XfC6oQ/TjVUW9YWGxYeuZNfq0u5on78wF+9QyImyjLvIA1G8xp6ScuHlt6LEv+CH71
 0H3A==
X-Gm-Message-State: AJIora+dYFxXFrOlmXyEvq9eX86cHp+aan/0dsUpgo15Koxyzo3exY/Z
 F9IGHagU7SzausRhuSY8uBpDSw==
X-Google-Smtp-Source: AGRyM1tLUg/TxD3ibkRz8emLONGbMJ+9j8IhiFQVSF+CzEDj/RrI348CxZMU0187ugCaQfxFAjyrsQ==
X-Received: by 2002:a05:6000:1a85:b0:21e:88f9:848d with SMTP id
 f5-20020a0560001a8500b0021e88f9848dmr4392788wry.82.1658784447240; 
 Mon, 25 Jul 2022 14:27:27 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1780:8e54:dd38:6668])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d52d1000000b0021d68a504cbsm12668772wrv.94.2022.07.25.14.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 14:27:26 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Date: Mon, 25 Jul 2022 23:26:17 +0200
Message-Id: <20220725212637.2818207-13-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
References: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
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
Subject: [Linux-stm32] [PATCH v2 12/32] thermal/drivers/st: Switch to new of
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
