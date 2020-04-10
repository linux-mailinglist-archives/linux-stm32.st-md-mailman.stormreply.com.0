Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA5C1A4776
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 16:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F074C36B0B;
	Fri, 10 Apr 2020 14:32:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CC04C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 14:32:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03AESH4r027085; Fri, 10 Apr 2020 16:32:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=TShubh2H2AdHxwazjuLdxZIzK8knwtSXhUp0llm02dE=;
 b=KcUnmzdoIgmrNUbeA646O6mMfPVdoUJRFXLOILsSVLUcs4HtevWuhAkCB2RRDGGp8wjV
 gBiafiVe1fOH6swpMuwQ10bwUSFe1xg1UlVQ93Q6QRqS17FN9Y8GgEihedhL0Q+EdYOx
 utWD+GjTOYpt+U3K7gBymXmomDcpf2+MQjEUAY8/gExEi+yTr82nENT1kgIQXkdwNS8o
 PAuvyL2gKxioB2k2WVoA88lFzUIiqtEb5K6bSKphThxp6t5d+UpkMQBhFNs66TLGWtc9
 8gVvDy+NcoFAQjkWHUHTCUWZ975HrPd9jkpU6twa0lrps5efDvYn5u1F2jaamH8IaIe/ hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091k78xah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 16:32:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 344EA10002A;
 Fri, 10 Apr 2020 16:32:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19BD82BF9C5;
 Fri, 10 Apr 2020 16:32:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Apr 2020 16:32:21 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <hminas@synopsys.com>
Date: Fri, 10 Apr 2020 16:31:54 +0200
Message-ID: <1586529114-25211-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_05:2020-04-09,
 2020-04-10 signatures=0
Cc: gregory.herrero@intel.com, johnyoun@synopsys.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, balbi@ti.com, Grigor.Tovmasyan@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] usb: dwc2: only prevent new request when
	power_down is possible
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

When controller is suspended, registers mustn't be touched. This is not
the case when 'power_down' is set to none. In this case, power saving
routines are skipped.

This fixes a case where gadget driver (f_acm) gets opened (cat /dev/ttyGS0)
but the bus has been suspended by the host:
- configfs-gadget gadget: acm ttyGS0 can't notify serial state, -11

Fixes: 7ababa926c66 ("usb: dwc2: gadget: prevent new request submission during suspend")
Fixes: 88b02f2cb1e1 ("usb: dwc2: Add core state checking")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/usb/dwc2/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 92ed32e..45a8782 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1375,7 +1375,8 @@ static int dwc2_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
 		req->zero, req->short_not_ok);
 
 	/* Prevent new request submission when controller is suspended */
-	if (hs->lx_state != DWC2_L0) {
+	if (hs->params.power_down != DWC2_POWER_DOWN_PARAM_NONE &&
+	    hs->lx_state != DWC2_L0) {
 		dev_dbg(hs->dev, "%s: submit request only in active state\n",
 			__func__);
 		return -EAGAIN;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
