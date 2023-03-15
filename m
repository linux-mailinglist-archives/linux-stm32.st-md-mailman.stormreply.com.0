Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7276BB9B7
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Mar 2023 17:33:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1787C6904A;
	Wed, 15 Mar 2023 16:33:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A823FC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 16:33:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FEwbcE009904; Wed, 15 Mar 2023 17:33:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=U/2twFIRyN37bROnR4GXkdaHaknzfdj1TTXP5h5YqfQ=;
 b=RU3NneOhYTjBMSOozU/hbGYLwFEmaJe/l42AhKQBwXQgAWwvvcqHnLyFbrygHYzi7M7O
 O8fdZ0h/u/473hnSl9uACzJ03k3Ekrb98sajF5TnGux3bW7T0koinEkSCZ5L58dVWoo+
 V3Aj5ZIx9HmPueEb9E68KqtvE5sHOZW8mqS4SCsaS90ztYIWxA+l0cwJaYYUZK0IHvNG
 qJ7iTwbhRazBhjdK0V+AnkBzm5LyKY+M61qmquvwWHhqejKlxPsQHw1H0AOCPuoOZAyY
 PzUfHgDSNgAs4VPYpI0rz6nnrgnOrRoxcEKHzBw+PGKMAwoZrwc1dDWx700BtRz8DxGJ 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pb2aw5wnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 17:33:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12D2710002A;
 Wed, 15 Mar 2023 17:33:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02D6521D3C0;
 Wed, 15 Mar 2023 17:33:07 +0100 (CET)
Received: from localhost (10.48.1.102) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 15 Mar
 2023 17:33:06 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <maz@kernel.org>,
 <m.szyprowski@samsung.com>
Date: Wed, 15 Mar 2023 17:32:46 +0100
Message-ID: <20230315163246.3848102-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_08,2023-03-15_01,2023-02-09_01
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] usb: dwc2: fix a devres leak in hw_enable
	upon suspend resume
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

Each time the platform goes to low power, PM suspend / resume routines
call: __dwc2_lowlevel_hw_enable -> devm_add_action_or_reset().
This adds a new devres each time.
This may also happen at runtime, as dwc2_lowlevel_hw_enable() can be
called from udc_start().

This can be seen with tracing:
- echo 1 > /sys/kernel/debug/tracing/events/dev/devres_log/enable
- go to low power
- cat /sys/kernel/debug/tracing/trace

A new "ADD" entry is found upon each low power cycle:
... devres_log: 49000000.usb-otg ADD 82a13bba devm_action_release (8 bytes)
... devres_log: 49000000.usb-otg ADD 49889daf devm_action_release (8 bytes)
...

A second issue is addressed here:
- regulator_bulk_enable() is called upon each PM cycle (suspend/resume).
- regulator_bulk_disable() never gets called.

So the reference count for these regulators constantly increase, by one
upon each low power cycle, due to missing regulator_bulk_disable() call
in __dwc2_lowlevel_hw_disable().

The original fix that introduced the devm_add_action_or_reset() call,
fixed an issue during probe, that happens due to other errors in
dwc2_driver_probe() -> dwc2_core_reset(). Then the probe fails without
disabling regulators, when dr_mode == USB_DR_MODE_PERIPHERAL.

Rather fix the error path: disable all the low level hardware in the
error path, by using the "hsotg->ll_hw_enabled" flag. Checking dr_mode
has been introduced to avoid a dual call to dwc2_lowlevel_hw_disable().
"ll_hw_enabled" should achieve the same (and is used currently in the
remove() routine).

Fixes: 54c196060510 ("usb: dwc2: Always disable regulators on driver teardown")
Fixes: 33a06f1300a7 ("usb: dwc2: Fix error path in gadget registration")
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Change-Id: If038db394ae43cbbb40279b2eca4cba021644a6d
Reviewed-on: https://gerrit.st.com/c/mpu/oe/st/linux-stm32/+/291408
ACI: CITOOLS <MDG-smet-aci-reviews@list.st.com>
ACI: CIBUILD <MDG-smet-aci-builds@list.st.com>
---
 drivers/usb/dwc2/platform.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 262c13b6362a..d1589ba7d322 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -91,13 +91,6 @@ static int dwc2_get_dr_mode(struct dwc2_hsotg *hsotg)
 	return 0;
 }
 
-static void __dwc2_disable_regulators(void *data)
-{
-	struct dwc2_hsotg *hsotg = data;
-
-	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
-}
-
 static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
 {
 	struct platform_device *pdev = to_platform_device(hsotg->dev);
@@ -108,11 +101,6 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       __dwc2_disable_regulators, hsotg);
-	if (ret)
-		return ret;
-
 	if (hsotg->clk) {
 		ret = clk_prepare_enable(hsotg->clk);
 		if (ret)
@@ -168,7 +156,7 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
 	if (hsotg->clk)
 		clk_disable_unprepare(hsotg->clk);
 
-	return 0;
+	return regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
 }
 
 /**
@@ -607,7 +595,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	if (hsotg->params.activate_stm_id_vb_detection)
 		regulator_disable(hsotg->usb33d);
 error:
-	if (hsotg->dr_mode != USB_DR_MODE_PERIPHERAL)
+	if (hsotg->ll_hw_enabled)
 		dwc2_lowlevel_hw_disable(hsotg);
 	return retval;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
