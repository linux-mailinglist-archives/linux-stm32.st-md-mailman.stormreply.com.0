Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9A91786A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 08:01:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 769E2C71287;
	Wed, 26 Jun 2024 06:01:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E39CC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 21:33:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42249a4f9e4so45112245e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719351195; x=1719955995;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wOp5UqGNK/+aHc+mtLWt/FVtlNV3iPD/WbMrczGg2CE=;
 b=ahDgNNNPO9hKO7ESaTRpe32Sk6p06hytl5pmg3S9rlkiRt9QAHqIl4oz7r8OdiO9Ay
 mLjkBvqF66CnkpU+zMGcBolyjFIexFe4P+M0ZljfB6psZAld9YJPRDt35GSaEqYzjXua
 KPNZt1+caX+SxZLm4Y/823zynSnEAz/H7K5Qva7+1yQX9kiEQvzAce4hIapW6hDN4hRR
 CnDPsj8sU9PTTJkJnFCvWRc3Op0Y5QEmiVKFlZwFfGxTop69vpnAbR0E6ksnMK1SvOd/
 uO9MbEHO/BFgKNL5CvehQFUfsYQUb8FO4qwE/Lxn88UTLOyKUcLjUt8+77YQw+B6Br/n
 btWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719351195; x=1719955995;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wOp5UqGNK/+aHc+mtLWt/FVtlNV3iPD/WbMrczGg2CE=;
 b=WomNyjUs9g+H/l7EOnQTWDrFJ8RKnG6Z2RG4djS2TblQdmiMjY4YjTrKt9z7yfpBau
 ayRcu2m13AtNMKXD6WAtE9cebIT4Wd6Ei3jDVobLAJtBoxKklq+HvouwEqgK5La/WWNN
 yvcPQjrWVdEHb3OGvcTz3aUYpg9pxoHg6zjMLwANxvlaiW6gHKbpa2EnzJwMBmGSkdBk
 3QFrmEhsObB46gb8so4TFSmVzLmmf4vuAaobuUezXp1EVJtv0nQmqMD5G2fYtmOod4dJ
 jlI1kEJMeMG8hJYeb22YFCXfyKyIc5uHxbzZp6QSsCkY9GYuUsCSdR34i5OVpEcuWnmV
 10rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVioWeMTHDIh0QxBB2Eq2UaJwAj7nCQ0oZl0xrJCX4wyX1Ht2GCluc/3r6g9Vw+P2YQSTx869oQUetNAtt/CBryUWuFlEH++stpzJw31Wgf6GWeogrYCzOM
X-Gm-Message-State: AOJu0YwaAOCtHFK5ioBk37w0mqhEAvgE/xRCuIs1XKoiq9reJAFo/M3P
 LjR5o6iUF9pERSEVyMYuexXKvCKq0kOlUFE3jVs+cMrqVese3LRg
X-Google-Smtp-Source: AGHT+IHM8lLa8Kw/PfBSHM/pQpWPKRg70VziGzuKcSwEmlPeW/23VjI1c7PTAH1z3JhKQC5WZ+U1BQ==
X-Received: by 2002:a5d:518c:0:b0:360:9175:2c33 with SMTP id
 ffacd0b85a97d-366e9461f67mr6558659f8f.8.1719351193778; 
 Tue, 25 Jun 2024 14:33:13 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b861bsm13854978f8f.29.2024.06.25.14.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:33:13 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 25 Jun 2024 23:32:40 +0200
MIME-Version: 1.0
Message-Id: <20240625-thermal-v2-1-bf8354ed51ee@gmail.com>
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
Subject: [Linux-stm32] [PATCH v2 1/3] thermal: st: switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Remove those guards on every ST thermal related drivers.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/thermal/st/st_thermal.c        | 4 +---
 drivers/thermal/st/st_thermal_memmap.c | 2 +-
 drivers/thermal/st/stm_thermal.c       | 8 +++-----
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/thermal/st/st_thermal.c b/drivers/thermal/st/st_thermal.c
index 2a105409864e..5f33543a3a54 100644
--- a/drivers/thermal/st/st_thermal.c
+++ b/drivers/thermal/st/st_thermal.c
@@ -236,7 +236,6 @@ void st_thermal_unregister(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(st_thermal_unregister);
 
-#ifdef CONFIG_PM_SLEEP
 static int st_thermal_suspend(struct device *dev)
 {
 	struct st_thermal_sensor *sensor = dev_get_drvdata(dev);
@@ -265,9 +264,8 @@ static int st_thermal_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-SIMPLE_DEV_PM_OPS(st_thermal_pm_ops, st_thermal_suspend, st_thermal_resume);
+DEFINE_SIMPLE_DEV_PM_OPS(st_thermal_pm_ops, st_thermal_suspend, st_thermal_resume);
 EXPORT_SYMBOL_GPL(st_thermal_pm_ops);
 
 MODULE_AUTHOR("STMicroelectronics (R&D) Limited <ajitpal.singh@st.com>");
diff --git a/drivers/thermal/st/st_thermal_memmap.c b/drivers/thermal/st/st_thermal_memmap.c
index 29c2269b0fb3..28b380013956 100644
--- a/drivers/thermal/st/st_thermal_memmap.c
+++ b/drivers/thermal/st/st_thermal_memmap.c
@@ -180,7 +180,7 @@ static void st_mmap_remove(struct platform_device *pdev)
 static struct platform_driver st_mmap_thermal_driver = {
 	.driver = {
 		.name	= "st_thermal_mmap",
-		.pm     = &st_thermal_pm_ops,
+		.pm     = pm_sleep_ptr(&st_thermal_pm_ops),
 		.of_match_table = st_mmap_thermal_of_match,
 	},
 	.probe		= st_mmap_probe,
diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 34785b9276fc..ffd988600ed6 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -440,7 +440,6 @@ static int stm_thermal_prepare(struct stm_thermal_sensor *sensor)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stm_thermal_suspend(struct device *dev)
 {
 	struct stm_thermal_sensor *sensor = dev_get_drvdata(dev);
@@ -466,10 +465,9 @@ static int stm_thermal_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(stm_thermal_pm_ops,
-			 stm_thermal_suspend, stm_thermal_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(stm_thermal_pm_ops,
+				stm_thermal_suspend, stm_thermal_resume);
 
 static const struct thermal_zone_device_ops stm_tz_ops = {
 	.get_temp	= stm_thermal_get_temp,
@@ -580,7 +578,7 @@ static void stm_thermal_remove(struct platform_device *pdev)
 static struct platform_driver stm_thermal_driver = {
 	.driver = {
 		.name	= "stm_thermal",
-		.pm     = &stm_thermal_pm_ops,
+		.pm     = pm_sleep_ptr(&stm_thermal_pm_ops),
 		.of_match_table = stm_thermal_of_match,
 	},
 	.probe		= stm_thermal_probe,

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
