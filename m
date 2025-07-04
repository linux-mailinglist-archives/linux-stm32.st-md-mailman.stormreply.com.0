Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1209AAF8A26
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 09:54:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7B99C36B2F;
	Fri,  4 Jul 2025 07:54:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64FA5C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751615690; x=1783151690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gjeDw4vIXjSrxqdxHy0Im4aZwqFHN+s2mpooAal1uHY=;
 b=Hx4Z/2mcs3MwDTkAoJD69T7RV+2j85scUVqsSSMlvs4ZUB5e8r3HfcbL
 +rC+tO79o8THB/K4gqJFz7YhWCD/k8qvmMg/eadms3L/TF+mJBh5+YrXh
 EPYJ9A6VNTDAtNHe627Ui+Z85/US8XECY52Uz6kxY4z7wBuRhgprbwpV4
 k0G/dAensy7wt3ze4AdyT0/DGaOH785EkAtAoHqnFjPIQR+6E3kKaXRz3
 k8Pv2MI03ych35eteQeYsWHvTxG1O1CzYGCS7JIJZIEXRWY5efiCsuOSg
 9EPzvU8MFRlGBeogmVH5m8XucmfWXMJepzWMqvPo+L17F2nRdlGW0rKxa A==;
X-CSE-ConnectionGUID: stTA3uxzR4qtPJpV9bqpYQ==
X-CSE-MsgGUID: JVAPJMpYQbqQtNcE0/YQDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194238"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="64194238"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:49 -0700
X-CSE-ConnectionGUID: /bzuSEQFSLmXBgTqlRBzJg==
X-CSE-MsgGUID: fs1mzZWtTNG62igOJzDl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158616625"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 svinhufvud.fi.intel.com) ([10.245.244.244])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:46 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
 by svinhufvud.fi.intel.com (Postfix) with ESMTP id DD9DD44419;
 Fri,  4 Jul 2025 10:54:44 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  4 Jul 2025 10:54:44 +0300
Message-Id: <20250704075444.3221445-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 57/80] regulator: stm32-vrefbuf: Remove
	redundant pm_runtime_mark_last_busy() calls
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/regulator/stm32-vrefbuf.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
index a85ea94f0673..9e391206f09d 100644
--- a/drivers/regulator/stm32-vrefbuf.c
+++ b/drivers/regulator/stm32-vrefbuf.c
@@ -67,7 +67,6 @@ static int stm32_vrefbuf_enable(struct regulator_dev *rdev)
 		writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 	}
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -87,7 +86,6 @@ static int stm32_vrefbuf_disable(struct regulator_dev *rdev)
 	val &= ~STM32_ENVR;
 	writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
@@ -104,7 +102,6 @@ static int stm32_vrefbuf_is_enabled(struct regulator_dev *rdev)
 
 	ret = readl_relaxed(priv->base + STM32_VREFBUF_CSR) & STM32_ENVR;
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -125,7 +122,6 @@ static int stm32_vrefbuf_set_voltage_sel(struct regulator_dev *rdev,
 	val = (val & ~STM32_VRS) | FIELD_PREP(STM32_VRS, sel);
 	writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
@@ -144,7 +140,6 @@ static int stm32_vrefbuf_get_voltage_sel(struct regulator_dev *rdev)
 	val = readl_relaxed(priv->base + STM32_VREFBUF_CSR);
 	ret = FIELD_GET(STM32_VRS, val);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -218,7 +213,6 @@ static int stm32_vrefbuf_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, rdev);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
