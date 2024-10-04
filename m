Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242A98FFF6
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 11:41:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47382C78023;
	Fri,  4 Oct 2024 09:41:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93D95C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728034911; x=1759570911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=caxOy/jgffzaiTHudoOppz/Vo2lQ194SRaTCVSsthec=;
 b=MVMIK5iuuceCYom5K9YG5FupT1VkDHBjIeDjfc0/H/OscHiG39wP0O+7
 +A1CBdQog9PuJXgiuJAlueWAryhthRvKA+rI/nRSapypByaZ446v9bwnh
 ZiXNuTpw+C1uWaSH07OMkoMEWJ1qWbCzJ+0wKlVT/FGoCfu62AmFXmsW8
 E9u+Yf4SoghhCNN1q/Mlu1A7T5u0gzhzWvfiz4AKLtG0TtaE+03WSQAe9
 XnQVFp9W5p6Qxu61xZCAda2inJVUqaIwjlpR3/35kU8vTF3yMDeWQ4o0Q
 TOjQ1dr2EspPHj9xTVsaBnpl504gcR1CU6zYnyw1T4sJPFoy3j9KX6Uzk g==;
X-CSE-ConnectionGUID: s2j8+bsiQre2IyfrldsK/g==
X-CSE-MsgGUID: /49gHPm9RhG36wU94Mt3LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136201"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27136201"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:49 -0700
X-CSE-ConnectionGUID: CDNy/UxyQ5yR4P99lTb9gQ==
X-CSE-MsgGUID: Ix2TPCorRyiHZW4/Nle32g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="105492071"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 02:41:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 92DB211F727;
 Fri,  4 Oct 2024 12:41:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1sweoi-000Tec-1m;
 Fri, 04 Oct 2024 12:41:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  4 Oct 2024 12:41:34 +0300
Message-Id: <20241004094134.113980-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 37/51] regulator: stm32-vrefbuf: Switch to
	__pm_runtime_put_autosuspend()
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

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/regulator/stm32-vrefbuf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
index 40855105dd33..870e568e5de9 100644
--- a/drivers/regulator/stm32-vrefbuf.c
+++ b/drivers/regulator/stm32-vrefbuf.c
@@ -68,7 +68,7 @@ static int stm32_vrefbuf_enable(struct regulator_dev *rdev)
 	}
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
 }
@@ -88,7 +88,7 @@ static int stm32_vrefbuf_disable(struct regulator_dev *rdev)
 	writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
 }
@@ -105,7 +105,7 @@ static int stm32_vrefbuf_is_enabled(struct regulator_dev *rdev)
 	ret = readl_relaxed(priv->base + STM32_VREFBUF_CSR) & STM32_ENVR;
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
 }
@@ -126,7 +126,7 @@ static int stm32_vrefbuf_set_voltage_sel(struct regulator_dev *rdev,
 	writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
 }
@@ -145,7 +145,7 @@ static int stm32_vrefbuf_get_voltage_sel(struct regulator_dev *rdev)
 	ret = FIELD_GET(STM32_VRS, val);
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
 }
@@ -219,7 +219,7 @@ static int stm32_vrefbuf_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rdev);
 
 	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
 
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
