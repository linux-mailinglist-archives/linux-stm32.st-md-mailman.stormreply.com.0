Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797846A039
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 16:58:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F120C5F1EE;
	Mon,  6 Dec 2021 15:58:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 168F8C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 15:58:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B6DBspb016754;
 Mon, 6 Dec 2021 16:58:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=tvsWt/WajNW/cDfhB+hHbcbDBrmdVc3RwtncRhs+lpY=;
 b=oqhoHEiaddEry9YI/kn67OgIkaHZngu2HGdOYe1wHwbjeEfluXP+8Nua0ysnyGkoiENl
 yoaUceUhp6ZXRtgV6IM420nSyVpGFHdYkUm6Oj13mrR+i5B1gMigF15PvUc9ayBylkEV
 FTyjrY7cBynTcAb2Pqx0SYVgWU9qa+PmlPQNHrtPUpztQC/gB2KKirl//2uVspYW95/T
 No7EzPmBI7A1pkSHeNvB7QpQ1A/HDF1ck7QN0O93iXEDkhlM35mr2zlpZi1nXXcBea0G
 a+VqmEfXxURhS6YesEAOZlKziTV5Hm368m2VjX6DnXEx86/kdqbKik0el15FzRmgoziY mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cseqrjfah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 16:58:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FDD110002A;
 Mon,  6 Dec 2021 16:58:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67C3120930D;
 Mon,  6 Dec 2021 16:58:25 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 16:58:24
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
Date: Mon, 6 Dec 2021 16:56:43 +0100
Message-ID: <1638806203-6624-4-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638806203-6624-1-git-send-email-fabrice.gasnier@foss.st.com>
References: <1638806203-6624-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_05,2021-12-06_02,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] usb: dwc2: drd: restore role and
	overrides upon resume
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

Override enable bits may not be restored when going to low power mode
(e.g. when in DWC2_POWER_DOWN_PARAM_NONE).
These bits are set when probing/initializing drd (role switch). Restore
them upon resume from low power mode (in case these have been lost).

To achieve this, the last known role is restored upon resume. And the
override enable bits are always set when configuring aval, bval and vbval.

When resuming, forcing the role should be done only once, or this can cause
port changes in HOST mode for instance.
So, only restore FORCEDEVMODE/FORCEHOSTMODE when role_sw is unused

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/dwc2/drd.c      | 38 ++++++++++++++++++++++++++++++++++++--
 drivers/usb/dwc2/platform.c | 10 ++++++----
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 4f453ec..1b39c47 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -13,6 +13,10 @@
 #include <linux/usb/role.h>
 #include "core.h"
 
+#define dwc2_ovr_gotgctl(gotgctl) \
+	((gotgctl) |= GOTGCTL_BVALOEN | GOTGCTL_AVALOEN | GOTGCTL_VBVALOEN | \
+	 GOTGCTL_DBNCE_FLTR_BYPASS)
+
 static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
 {
 	unsigned long flags;
@@ -21,8 +25,7 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
 	spin_lock_irqsave(&hsotg->lock, flags);
 
 	gotgctl = dwc2_readl(hsotg, GOTGCTL);
-	gotgctl |= GOTGCTL_BVALOEN | GOTGCTL_AVALOEN | GOTGCTL_VBVALOEN;
-	gotgctl |= GOTGCTL_DBNCE_FLTR_BYPASS;
+	dwc2_ovr_gotgctl(gotgctl);
 	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
 	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
@@ -44,6 +47,9 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
 	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
 		return -EALREADY;
 
+	/* Always enable overrides to handle the resume case */
+	dwc2_ovr_gotgctl(gotgctl);
+
 	gotgctl &= ~GOTGCTL_BVALOVAL;
 	if (valid)
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
@@ -63,6 +69,9 @@ static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
 	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
 		return -EALREADY;
 
+	/* Always enable overrides to handle the resume case */
+	dwc2_ovr_gotgctl(gotgctl);
+
 	gotgctl &= ~GOTGCTL_AVALOVAL;
 	if (valid)
 		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
@@ -196,6 +205,31 @@ void dwc2_drd_suspend(struct dwc2_hsotg *hsotg)
 void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 {
 	u32 gintsts, gintmsk;
+	enum usb_role role;
+
+	if (hsotg->role_sw) {
+		/* get last known role (as the get ops isn't implemented by this driver) */
+		role = usb_role_switch_get_role(hsotg->role_sw);
+
+		if (role == USB_ROLE_NONE) {
+			if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
+				role = USB_ROLE_HOST;
+			else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
+				role = USB_ROLE_DEVICE;
+		}
+
+		/* restore last role that may have been lost */
+		if (role == USB_ROLE_HOST)
+			dwc2_ovr_avalid(hsotg, true);
+		else if (role == USB_ROLE_DEVICE)
+			dwc2_ovr_bvalid(hsotg, true);
+
+		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
+
+		dev_dbg(hsotg->dev, "resuming %s-session valid\n",
+			role == USB_ROLE_NONE ? "No" :
+			role == USB_ROLE_HOST ? "A" : "B");
+	}
 
 	if (hsotg->role_sw && !hsotg->params.external_id_pin_ctl) {
 		gintsts = dwc2_readl(hsotg, GINTSTS);
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c8f18f3..e6a7fc0 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -748,10 +748,12 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 		spin_unlock_irqrestore(&dwc2->lock, flags);
 	}
 
-	/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
-	dwc2_force_dr_mode(dwc2);
-
-	dwc2_drd_resume(dwc2);
+	if (!dwc2->role_sw) {
+		/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
+		dwc2_force_dr_mode(dwc2);
+	} else {
+		dwc2_drd_resume(dwc2);
+	}
 
 	if (dwc2_is_device_mode(dwc2))
 		ret = dwc2_hsotg_resume(dwc2);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
