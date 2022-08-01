Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8A587312
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 23:23:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38555C640F2;
	Mon,  1 Aug 2022 21:23:38 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88E03C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Aug 2022 21:23:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z16so15554298wrh.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Aug 2022 14:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linexp-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Dxp2C7hOahM111jOQKxvW4vMPiwlgfAm7+eoRoP/H0c=;
 b=pcZJblaRye/CU2ZG2aS4bfkarrAJPR8cXC0LFsksRkWtGR161vS7ze8cLfF1rEfblK
 rQ6kSCvE+KyYpyEs/GNjMbzN2/vz1n3UU6EulgZbrKdFKdW0sXzesEUMR5J8thSwWXoU
 yX++xLcaVyfCdUB5Gyvw8PuyqMbFDcp0wCA1saq8q5/jyY3IRW7xRin8SuVw0/MFAt2n
 QqfyQ3Whi2/+mM4SkTIeFUEdb07Ej4EMCr2PEeEktE5U8f4wjm8RKXfA+v7rEYj+0zN6
 Cd4rLRzeBBmGZSKrxOXEYaEgNfAIV3r3FMQwTHHy7ZzK2l5Bld6ikof1C13L5ArqnNPT
 3oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Dxp2C7hOahM111jOQKxvW4vMPiwlgfAm7+eoRoP/H0c=;
 b=ubKtVOC937M3IImNySdtfTQ7+quwYD5TgabRMyMFXQ30axhvG6jrH6ldnbxdm2hkLq
 S7vpCn1WoPRRwIHY4NyE8t6UilmQuPsG+KhLkMf2uWkNhIIsND9IcZP0Iwm/6XDCQ4YC
 uouhTqjHVOpvCeXU/EtjD5f9SjHEYRBYqcNig9yU7P7uCxFtnI6MSPeivXU8jV2Z3u2Q
 OexMuaAjVGdCHLPhSfO7gEH7GFChwEHV86fCNvWZY//RXNAZgR6fDiMhTD4MvIu9ue0q
 bl0gQf7A8vvgwznF7eMeV3qVl7eAXcI+6PtqG+mdd7I5JP/vsPFe4W1+zH5NknQyaPrW
 /Jog==
X-Gm-Message-State: ACgBeo0NLCnop36uoNiuULQ1tsqtghsKGbmXHpBPBLJnlJPsCBXwRWmV
 r9iP0WPSfNlljJQ52eAI84uuFg==
X-Google-Smtp-Source: AA6agR6btACMuEpyA6/viNcHMHjs1GPLsxuLBfadlyEO6Vct9/gpgVno3agbcYvw+AmU0aYsslXq1Q==
X-Received: by 2002:a5d:6dad:0:b0:21e:903f:f45e with SMTP id
 u13-20020a5d6dad000000b0021e903ff45emr11488602wrs.385.1659389016074; 
 Mon, 01 Aug 2022 14:23:36 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d00:ceb8:9c09:1302])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb07000000b0021e501519d3sm12995285wrr.67.2022.08.01.14.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 14:23:35 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linexp.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Date: Mon,  1 Aug 2022 23:22:24 +0200
Message-Id: <20220801212244.1124867-13-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801212244.1124867-1-daniel.lezcano@linexp.org>
References: <20220801212244.1124867-1-daniel.lezcano@linexp.org>
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
Subject: [Linux-stm32] [PATCH v4 12/32] thermal/drivers/st: Switch to new of
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
