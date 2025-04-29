Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B3AA0C40
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 14:54:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06166C78F63;
	Tue, 29 Apr 2025 12:54:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0935EC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 12:54:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TBs57x010275;
 Tue, 29 Apr 2025 14:54:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dGEH/7W+8HHWW7dvPoseqXYAg/nEVy3nX2ybUJs+Dz0=; b=LiShzmIpVfS0a/vq
 22fZAoEFkpMKH6P4FoA/yztGax+bSRigfA9bk59EcvX6YpRtYmNcvEZDA05k99cP
 El2fzKLEQFHJR71SH5XeatkUqVhFnX1zSp8dMJItuICPyXxsi3glb5pCeRQaPqOP
 /rgVJkn/x3fdoXIoFDu/WC3fN5XLhlbfYowXenvqu1wnCJR0F0bNJ4vPgVASGJ0F
 7Zu/njiiT+6doshS11xok9iUocWHJ7b6BIe4hoDVXqqCg6kTUPzyuVPszaLhEGqC
 MW1UdEShFqiGe8lCnES69ODd433ZJEBSdNo+TsdU+GhNeBFiIILjS7DP+vYZ1EEw
 wv9czw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcgb1uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 14:54:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3C48E4007F;
 Tue, 29 Apr 2025 14:53:44 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84442A7D1E3;
 Tue, 29 Apr 2025 14:51:48 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 14:51:48 +0200
Received: from localhost (10.252.5.160) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 14:51:48 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <lee@kernel.org>,
 <alexandre.torgue@foss.st.com>, <tglx@linutronix.de>
Date: Tue, 29 Apr 2025 14:51:29 +0200
Message-ID: <20250429125133.1574167-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.5.160]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: [Linux-stm32] [PATCH v6 3/7] clocksource: stm32-lptimer: add
	support for stm32mp25
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

On stm32mp25, DIER (former IER) must only be modified when the lptimer
is enabled. On earlier SoCs, it must be only be modified when it is
disabled. There's also a new DIEROK flag, to ensure register access
has completed.
Add a new "set_evt" routine to be used on stm32mp25, called depending
on the version register, read by the MFD core (LPTIM_VERR).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in V6:
- Fixed warning reported by kernel test robot in
  https://lore.kernel.org/oe-kbuild-all/202504261456.aCATBoYN-lkp@intel.com/
  use FIELD_GET() macro
Changes in V5:
- Added a delay after timer enable, it needs two clock cycles.
Changes in V4:
- Daniel suggests to encapsulate IER write into a separate function
  that manages the enabling/disabling of the LP timer. In addition,
  DIEROK and ARROK flags checks have been added. So adopt a new routine
  to set the event into ARR register and enable the interrupt.
Changes in V2:
- rely on fallback compatible as no specific .data is associated to the
  driver. Use version data from MFD core.
- Added interrupt enable register access update in (missed in V1)
---
 drivers/clocksource/timer-stm32-lp.c | 61 ++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
index 928da2f6de69..6e7944ffd7c0 100644
--- a/drivers/clocksource/timer-stm32-lp.c
+++ b/drivers/clocksource/timer-stm32-lp.c
@@ -5,6 +5,7 @@
  *	    Pascal Paillet <p.paillet@st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
@@ -27,6 +28,7 @@ struct stm32_lp_private {
 	u32 psc;
 	struct device *dev;
 	struct clk *clk;
+	u32 version;
 };
 
 static struct stm32_lp_private*
@@ -47,12 +49,46 @@ static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
 	return 0;
 }
 
-static int stm32_clkevent_lp_set_timer(unsigned long evt,
-				       struct clock_event_device *clkevt,
-				       int is_periodic)
+static int stm32mp25_clkevent_lp_set_evt(struct stm32_lp_private *priv, unsigned long evt)
 {
-	struct stm32_lp_private *priv = to_priv(clkevt);
+	int ret;
+	u32 val;
+
+	regmap_read(priv->reg, STM32_LPTIM_CR, &val);
+	if (!FIELD_GET(STM32_LPTIM_ENABLE, val)) {
+		/* Enable LPTIMER to be able to write into IER and ARR registers */
+		regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
+		/*
+		 * After setting the ENABLE bit, a delay of two counter clock cycles is needed
+		 * before the LPTIM is actually enabled. For 32KHz rate, this makes approximately
+		 * 62.5 micro-seconds, round it up.
+		 */
+		udelay(63);
+	}
+	/* set next event counter */
+	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
+	/* enable ARR interrupt */
+	regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
+
+	/* Poll DIEROK and ARROK to ensure register access has completed */
+	ret = regmap_read_poll_timeout_atomic(priv->reg, STM32_LPTIM_ISR, val,
+					      (val & STM32_LPTIM_DIEROK_ARROK) ==
+					      STM32_LPTIM_DIEROK_ARROK,
+					      10, 500);
+	if (ret) {
+		dev_err(priv->dev, "access to LPTIM timed out\n");
+		/* Disable LPTIMER */
+		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
+		return ret;
+	}
+	/* Clear DIEROK and ARROK flags */
+	regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_DIEROKCF_ARROKCF);
 
+	return 0;
+}
+
+static void stm32_clkevent_lp_set_evt(struct stm32_lp_private *priv, unsigned long evt)
+{
 	/* disable LPTIMER to be able to write into IER register*/
 	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
 	/* enable ARR interrupt */
@@ -61,6 +97,22 @@ static int stm32_clkevent_lp_set_timer(unsigned long evt,
 	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
 	/* set next event counter */
 	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
+}
+
+static int stm32_clkevent_lp_set_timer(unsigned long evt,
+				       struct clock_event_device *clkevt,
+				       int is_periodic)
+{
+	struct stm32_lp_private *priv = to_priv(clkevt);
+	int ret;
+
+	if (priv->version == STM32_LPTIM_VERR_23) {
+		ret = stm32mp25_clkevent_lp_set_evt(priv, evt);
+		if (ret)
+			return ret;
+	} else {
+		stm32_clkevent_lp_set_evt(priv, evt);
+	}
 
 	/* start counter */
 	if (is_periodic)
@@ -176,6 +228,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->reg = ddata->regmap;
+	priv->version = ddata->version;
 	priv->clk = ddata->clk;
 	ret = clk_prepare_enable(priv->clk);
 	if (ret)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
