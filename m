Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F76AE0B8
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Mar 2023 14:38:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF366C65E5A;
	Tue,  7 Mar 2023 13:38:00 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE7D7C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 13:37:59 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id g3so12146162wri.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Mar 2023 05:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678196279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFz3DL0wcsZVMgUUsHXDAfK6kJlbLDI4poI1FgV3Faw=;
 b=o+72SkNnGvUEZIoRxtbUn1yxoMbJK4ejWB7UdQfvn95oxQ1qGBRQkmTuvFIHCKSEQD
 6V5Sb6way+IpVf1rC8Ts5ep1iztmQ7/B5Y21IzuyFDdX+ydu10oWZgvAd0kfo1C0jFU2
 NXTAAd8/JNFFoLXX4Rcp6pauvrWKWmbMd1vPw7jlce/er2GgJSWLGuHD0rRIfYnu19Ml
 4vgQqfv+uSE5DPvKzEY6foTsKhTkpPVp93OodQ6cgqwHb7g2vuwjKwmV3bpdPPwELa5m
 gZQr4IFv45Lh0vAKTshQ6V6mhjkdZSkHBM2U1mSk8lPzeCubKqrGFKAAhOLrd582PJub
 NIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFz3DL0wcsZVMgUUsHXDAfK6kJlbLDI4poI1FgV3Faw=;
 b=wosfLNbVQ2zuOX9oQf8U7ZS8iCPIl+BpWkkPPOzc0cDCftMlD72lP5HnlsbKqnFOgM
 aK0kNSY/ezltveIs49wKjbe6cUJs6OhVBq7BqhDHUZbp6+c6GqTKX9hVRGU/q9rFWhDn
 ViULNDkhohWZ+fFkFBgsSXPMGgP7oZ4K2ucOM4cKunG8RI98Jg/SDsJL3jp/FLZIwAYG
 AWXNXnGijIUWPlS0Vz6ApVcwUGgyV9iWHJ0wS2JvlsLuXvv4yzqOrZTxIeQi28IZKjXU
 eC1ZtuUZAL6Hhk5Ip3WPmbSTL8H7kib5hrGgsH/FA9Gz0rMCT0VDzNBRO559uTcEYYyF
 j3yg==
X-Gm-Message-State: AO0yUKXLijnYFWeK9nOLVfWMNj/8pwqAJE9eb5xoS2hfeaZN6jt2eZiU
 LXYinz7x4Vmp9GDzef0Uw05jQA==
X-Google-Smtp-Source: AK7set9FSAFaADctvHU6vRmP3wIycBL+2ZqOFueq/Gl1g4rVDNPyVhEDXxA8gJtuA2idcajBArYPsQ==
X-Received: by 2002:a5d:66ce:0:b0:2c7:8f73:7700 with SMTP id
 k14-20020a5d66ce000000b002c78f737700mr9276509wrw.39.1678196279346; 
 Tue, 07 Mar 2023 05:37:59 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5ab9:1ac6:870d:35c])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a5d43c5000000b002c55de1c72bsm12311477wrr.62.2023.03.07.05.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:37:59 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	rafael@kernel.org
Date: Tue,  7 Mar 2023 14:37:29 +0100
Message-Id: <20230307133735.90772-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307133735.90772-1-daniel.lezcano@linaro.org>
References: <20230307133735.90772-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, amitk@kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, open list <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 rui.zhang@intel.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v1 05/11] thermal/drivers/stm: Don't set
	no_hwmon to false
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

The thermal->tzp->no_hwmon parameter is only used when calling
thermal_zone_device_register().

Setting it to 'false' before calling thermal_add_hwmon_sysfs() has no
effect.

Remove the call and again prevent the drivers to access the thermal
internals.

Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/st/stm_thermal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 6f2bad8ef82f..903fcf1763f1 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -558,7 +558,6 @@ static int stm_thermal_probe(struct platform_device *pdev)
 	 * Thermal_zone doesn't enable hwmon as default,
 	 * enable it here
 	 */
-	sensor->th_dev->tzp->no_hwmon = false;
 	ret = thermal_add_hwmon_sysfs(sensor->th_dev);
 	if (ret)
 		goto err_tz;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
