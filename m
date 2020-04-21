Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5B1B2620
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 14:33:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2C71C36B12;
	Tue, 21 Apr 2020 12:33:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28859C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 12:33:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LCMRxo023343; Tue, 21 Apr 2020 14:33:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0hET9m9U8HNjSCYqn7p/h2ZCXaeqDDYalebZRnWlOT0=;
 b=b3QneW5N9a4sAQW94ax4zdlhJBaO/Co186+VagX9ucAasAeOpCXA2Ly1LV/BsNvxrXuU
 G5V0VbiInVKGmMVmIpPGg/HewSZsO2r2D8LBxYEjocKoT2wVU4jHe+POWOyHZfPgSD5K
 fX05RU6ehCvcGv/czJEZKD9UK580QVbdAurFPHlOFrh4lJb3eKeaAPwke31b5Te07i8H
 CfF7dm2m9UrN2cR8z7I/aaxae15WCmkeZbs3RgJy9oGCV5SK/BPOVd+99YSLbjK/sxfH
 77la8hWrIglCRBm0+6YN0BGD6Od0kX+uHIqDnpyvurW0GTq3doaulTQuWfLUQKxH02GX tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregfxse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 14:33:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5970B100034;
 Tue, 21 Apr 2020 14:33:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CB152B0FCB;
 Tue, 21 Apr 2020 14:33:11 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 14:33:10 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <hminas@synopsys.com>, <balbi@kernel.org>
Date: Tue, 21 Apr 2020 14:32:18 +0200
Message-ID: <1587472341-17935-2-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
References: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/4] usb: dwc2: gadget: move gadget resume
	after the core is in L0 state
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

When the remote wakeup interrupt is triggered, lx_state is resumed from L2
to L0 state. But when the gadget resume is called, lx_state is still L2.
This prevents the resume callback to queue any request. Any attempt
to queue a request from resume callback will result in:
- "submit request only in active state" debug message to be issued
- dwc2_hsotg_ep_queue() returns -EAGAIN

Move the call to resume gadget after the core is put in DWC2_L0 state.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/usb/dwc2/core_intr.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 876ff31..b8ebda5 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -404,9 +404,11 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 	}
 
 	if (dwc2_is_device_mode(hsotg)) {
+		enum dwc2_lx_state lx_state = hsotg->lx_state;
+
 		dev_dbg(hsotg->dev, "DSTS=0x%0x\n",
 			dwc2_readl(hsotg, DSTS));
-		if (hsotg->lx_state == DWC2_L2) {
+		if (lx_state == DWC2_L2) {
 			u32 dctl = dwc2_readl(hsotg, DCTL);
 
 			/* Clear Remote Wakeup Signaling */
@@ -415,11 +417,13 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 			ret = dwc2_exit_partial_power_down(hsotg, true);
 			if (ret && (ret != -ENOTSUPP))
 				dev_err(hsotg->dev, "exit power_down failed\n");
-
-			call_gadget(hsotg, resume);
 		}
 		/* Change to L0 state */
 		hsotg->lx_state = DWC2_L0;
+
+		/* Gadget may queue new requests upon resume to L0 state */
+		if (lx_state == DWC2_L2)
+			call_gadget(hsotg, resume);
 	} else {
 		if (hsotg->params.power_down)
 			return;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
