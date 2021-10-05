Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA44222BE
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Oct 2021 11:53:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92ABDC5AB80;
	Tue,  5 Oct 2021 09:53:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EB2AC5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 09:53:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1957xYTJ021079; 
 Tue, 5 Oct 2021 11:53:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=wweka5+rm/iZxNVCavZNRmcqK0qefYrjFKhGZb/g97Y=;
 b=5Pqdj2/SmeSPMe7zFG/kAqPWpdJJePsriVkIqXr/UlhaOYy0RtpGzhOKsPp/oJ1zMdFG
 h1vdGyQz7E0zK/29J6/pRU2O9gPXdO+q8cAPZ7JUjHvypKZkyGvTPpWjvCFh+S6+py11
 N7YGuaL0t0C/vla+4xVH31rgB8WglUxOS8ZpUwitfBzML1eSjZcGVVsy1r+x3eEeyvDD
 zY7ggSX3gdoqDJqfea9edmb/G+CnKsgk8BJugkI/5TMOXGfub5QQm5n9swBOYGe44JQB
 vf2GdtGawoJLVauImZb0dgozVNxC0Jo/+5IIDDY3yR0XuI94qBj+3fNy8Z94mtSSVtFV ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bgjt8rq5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 11:53:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F5C310002A;
 Tue,  5 Oct 2021 11:53:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37BF8226FA7;
 Tue,  5 Oct 2021 11:53:27 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 5 Oct 2021 11:53:26
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Tue, 5 Oct 2021 11:53:04 +0200
Message-ID: <20211005095305.66397-3-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005095305.66397-1-amelie.delaunay@foss.st.com>
References: <20211005095305.66397-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] usb: dwc2: drd: fix dwc2_drd_role_sw_set
	when clock could be disabled
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

In case of USB_DR_MODE_PERIPHERAL, the OTG clock is disabled at the end of
the probe (it is not the case if USB_DR_MODE_HOST or USB_DR_MODE_OTG).
The clock is then enabled on udc_start.
If dwc2_drd_role_sw_set is called before udc_start (it is the case if the
usb cable is plugged at boot), GOTGCTL and GUSBCFG registers cannot be
read/written, so session cannot be overridden.
To avoid this case, check the ll_hw_enabled value and enable the clock if
it is available, and disable it after the override.

Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/usb/dwc2/drd.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 80eae88d76dd..99672360f34b 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -7,6 +7,7 @@
  * Author(s): Amelie Delaunay <amelie.delaunay@st.com>
  */
 
+#include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/usb/role.h>
@@ -86,6 +87,20 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	}
 #endif
 
+	/*
+	 * In case of USB_DR_MODE_PERIPHERAL, clock is disabled at the end of
+	 * the probe and enabled on udc_start.
+	 * If role-switch set is called before the udc_start, we need to enable
+	 * the clock to read/write GOTGCTL and GUSBCFG registers to override
+	 * mode and sessions. It is the case if cable is plugged at boot.
+	 */
+	if (!hsotg->ll_hw_enabled && hsotg->clk) {
+		int ret = clk_prepare_enable(hsotg->clk);
+
+		if (ret)
+			return ret;
+	}
+
 	spin_lock_irqsave(&hsotg->lock, flags);
 
 	if (role == USB_ROLE_HOST) {
@@ -110,6 +125,9 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 		/* This will raise a Connector ID Status Change Interrupt */
 		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
 
+	if (!hsotg->ll_hw_enabled && hsotg->clk)
+		clk_disable_unprepare(hsotg->clk);
+
 	dev_dbg(hsotg->dev, "%s-session valid\n",
 		role == USB_ROLE_NONE ? "No" :
 		role == USB_ROLE_HOST ? "A" : "B");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
