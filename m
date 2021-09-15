Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9F40C0FB
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Sep 2021 09:54:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 549EBC5A4F9;
	Wed, 15 Sep 2021 07:54:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E07CC5A4D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Sep 2021 07:54:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F1m92H027500; 
 Wed, 15 Sep 2021 09:54:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=8i3hBtzLNQhkieaRtodJdXzLd4sf/xumeF8JyE2+oEA=;
 b=JX3YSiFXpCodryRlFlBtdbuC+gNxprY5jyoC/wLEYJTU7ZO9nh5YpBB6t4oRF9rI3lVD
 hdWQ9kpRPmnuWRWt/Xq11XVFYdmJSX3KhX1qHY647DeSzTre/NEsQMUQLZHJdKquoiI9
 tlH1phsBlyHVQ6xu1Edc9hQvxuuvgRfO1Ad3lik088+bvF4oHwMgyrPBPsLwfPlwJnG0
 +ZJAKSsZM+UbnCOk7NAbFVP4mLtHppQ4x97bfdqcxY4cqeIE/HUcPqxValj6uXwfuw7v
 cRUG+me5IVAxyfxJaLL83IswAeSzB6VgWXSr+1xT0BSinQdw2Z8XxvBv5o3B+3eOLEU+ RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b37g39nq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 09:54:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AA79100034;
 Wed, 15 Sep 2021 09:54:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49FA421C7BD;
 Wed, 15 Sep 2021 09:54:41 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 15 Sep 2021 09:54:41
 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, 
 <alexandre.torgue@foss.st.com>
Date: Wed, 15 Sep 2021 09:54:31 +0200
Message-ID: <1631692473-8732-2-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631692473-8732-1-git-send-email-fabrice.gasnier@foss.st.com>
References: <1631692473-8732-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_01,2021-09-14_01,2020-04-07_01
Cc: balbi@kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] usb: dwc2: add otg_rev and otg_caps
	information for gadget driver
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

Currently the dwc2 doesn't fill in the 'otg_caps' of usb_gadget structure.
When registering a gadget device (e.g. via configfs), the
usb_otg_descriptor_init() checks the 'otg_caps' and 'otg_rev'. It defaults
to HNP and SRP bmAttributes if unspecified. There may be a mismatch with
what's being set in dwc2 params structure. This result in the descriptors
to be miss-configured in this case.

So add an option to setup 'otg_caps' and 'otg_rev' in the params. It's
then provided to the gadget struct. These parameters can then be tuned
for each platform. In case it's not set, it will default to current
behavior.
Also add option to setup these from the device tree by calling
of_usb_update_otg_caps(). This provides support for standard properties
such as "otg-rev", "hnp-disable" and "srp-disable" (see usb-drd.yaml).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/dwc2/core.h   |  7 +++++++
 drivers/usb/dwc2/gadget.c |  1 +
 drivers/usb/dwc2/params.c | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index cb9059a..68d0967 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -243,6 +243,9 @@ enum dwc2_ep0_state {
  *                       1 - SRP Only capable
  *                       2 - No HNP/SRP capable (always available)
  *                      Defaults to best available option (0, 1, then 2)
+ * @otg_rev:		The OTG revision number the device is compliant with,
+ *			in binary-coded decimal (i.e. 2.0 is 0200H).
+ *			(see struct usb_otg_caps)
  * @host_dma:           Specifies whether to use slave or DMA mode for accessing
  *                      the data FIFOs. The driver will automatically detect the
  *                      value for this parameter if none is specified.
@@ -458,6 +461,7 @@ struct dwc2_core_params {
 #define DWC2_CAP_PARAM_SRP_ONLY_CAPABLE		1
 #define DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE	2
 
+	u16 otg_rev;
 	u8 phy_type;
 #define DWC2_PHY_TYPE_PARAM_FS		0
 #define DWC2_PHY_TYPE_PARAM_UTMI	1
@@ -1054,6 +1058,8 @@ struct dwc2_hregs_backup {
  * @new_connection:	Used in host mode. True if there are new connected
  *			device
  * @enabled:		Indicates the enabling state of controller
+ * @dw_otg_caps:	OTG caps from the platform parameters, used to setup the
+ *			gadget structure.
  *
  */
 struct dwc2_hsotg {
@@ -1220,6 +1226,7 @@ struct dwc2_hsotg {
 	unsigned int remote_wakeup_allowed:1;
 	struct dwc2_hsotg_ep *eps_in[MAX_EPS_CHANNELS];
 	struct dwc2_hsotg_ep *eps_out[MAX_EPS_CHANNELS];
+	struct usb_otg_caps dw_otg_caps;
 #endif /* CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE */
 };
 
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 837237e..4dc2e9e 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4945,6 +4945,7 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg)
 	hsotg->gadget.max_speed = USB_SPEED_HIGH;
 	hsotg->gadget.ops = &dwc2_hsotg_gadget_ops;
 	hsotg->gadget.name = dev_name(dev);
+	hsotg->gadget.otg_caps = &hsotg->dw_otg_caps;
 	hsotg->remote_wakeup_allowed = 0;
 
 	if (hsotg->params.lpm)
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 59e1193..f8ab211 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -36,6 +36,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/usb/of.h>
 
 #include "core.h"
 
@@ -246,18 +247,25 @@ static void dwc2_set_param_otg_cap(struct dwc2_hsotg *hsotg)
 	switch (hsotg->hw_params.op_mode) {
 	case GHWCFG2_OP_MODE_HNP_SRP_CAPABLE:
 		val = DWC2_CAP_PARAM_HNP_SRP_CAPABLE;
+		hsotg->dw_otg_caps.hnp_support = true;
+		hsotg->dw_otg_caps.srp_support = true;
 		break;
 	case GHWCFG2_OP_MODE_SRP_ONLY_CAPABLE:
 	case GHWCFG2_OP_MODE_SRP_CAPABLE_DEVICE:
 	case GHWCFG2_OP_MODE_SRP_CAPABLE_HOST:
 		val = DWC2_CAP_PARAM_SRP_ONLY_CAPABLE;
+		hsotg->dw_otg_caps.hnp_support = false;
+		hsotg->dw_otg_caps.srp_support = true;
 		break;
 	default:
 		val = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
+		hsotg->dw_otg_caps.hnp_support = false;
+		hsotg->dw_otg_caps.srp_support = false;
 		break;
 	}
 
 	hsotg->params.otg_cap = val;
+	hsotg->dw_otg_caps.otg_rev = hsotg->params.otg_rev;
 }
 
 static void dwc2_set_param_phy_type(struct dwc2_hsotg *hsotg)
@@ -465,6 +473,9 @@ static void dwc2_get_device_properties(struct dwc2_hsotg *hsotg)
 		}
 	}
 
+	if (hsotg->dr_mode == USB_DR_MODE_OTG)
+		of_usb_update_otg_caps(hsotg->dev->of_node, &hsotg->dw_otg_caps);
+
 	if (of_find_property(hsotg->dev->of_node, "disable-over-current", NULL))
 		p->oc_disable = true;
 }
@@ -484,6 +495,7 @@ static void dwc2_check_param_otg_cap(struct dwc2_hsotg *hsotg)
 		case GHWCFG2_OP_MODE_SRP_ONLY_CAPABLE:
 		case GHWCFG2_OP_MODE_SRP_CAPABLE_DEVICE:
 		case GHWCFG2_OP_MODE_SRP_CAPABLE_HOST:
+			hsotg->dw_otg_caps.hnp_support = false;
 			break;
 		default:
 			valid = 0;
@@ -492,6 +504,8 @@ static void dwc2_check_param_otg_cap(struct dwc2_hsotg *hsotg)
 		break;
 	case DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE:
 		/* always valid */
+		hsotg->dw_otg_caps.hnp_support = false;
+		hsotg->dw_otg_caps.srp_support = false;
 		break;
 	default:
 		valid = 0;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
