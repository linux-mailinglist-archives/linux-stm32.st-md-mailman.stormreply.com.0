Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D673122C546
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 14:38:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 858E2C36B2B;
	Fri, 24 Jul 2020 12:38:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B588C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 12:38:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OCbOKm029988; Fri, 24 Jul 2020 14:37:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ISBLyDTPf2HfIUmPPuAqhoT7vMfRrg71RmS3R2cEeZk=;
 b=WQsvr9hJhHJMC5YSb0+4SNKoUnpUlDaJoQrpDhnEJFVurwTgF74FEb/hZy23v0AhcnEw
 yVS6dlTN1hcVpTLbAM3vxdKaAP6DC6tVa6Y3cxcMFkT17/UlGu9yXsBIeuS29bjeKNfL
 /cEp+F2KOEiHzcAzO1oIFob55TwH21oVPy60rFskkl6BkguiBkRbMZP/ycIJdsqVToQE
 vZjW+Z+RXVgH3VyHBD/OHAYmpYT5LuLimpDrBqIB9ttuDn3kh5fKs5z9o/wP6YnL6bOn
 OwNafZBdQZDUJQbG+ZVLpxfNIK+veqs1OyUJwRxtqwGdNFUAnkYOmuHXoGNFqFneWXlB aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsahgcgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 14:37:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B947100034;
 Fri, 24 Jul 2020 14:37:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA9782AF334;
 Fri, 24 Jul 2020 14:37:54 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jul 2020 14:37:54
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Fri, 24 Jul 2020 14:37:47 +0200
Message-ID: <20200724123748.25369-4-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724123748.25369-1-amelie.delaunay@st.com>
References: <20200724123748.25369-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_04:2020-07-24,
 2020-07-24 signatures=0
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/4] usb: dwc2: drd: fix sleeping while
	spinlock atomic context
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

If GINTSTS.CURMODE is not yet reflecting the expecting mode after calling
dwc2_force_mode, we enter in the dwc2_wait_for_mode function while under
spinlock atomic context.
To avoid this situation, move the call to dwc2_force_mode after the
spinlock atomic context.

Fixes: bc0f0d4a5853 ("usb: dwc2: override PHY input signals with usb role switch support")
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/dwc2/drd.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 5099841b1417..2d4176f5788e 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -70,6 +70,7 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
 	unsigned long flags;
+	int already = 0;
 
 	/* Skip session not in line with dr_mode */
 	if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
@@ -88,26 +89,9 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	spin_lock_irqsave(&hsotg->lock, flags);
 
 	if (role == USB_ROLE_HOST) {
-		if (dwc2_ovr_avalid(hsotg, true))
-			goto unlock;
-
-		if (hsotg->dr_mode == USB_DR_MODE_OTG)
-			/*
-			 * This will raise a Connector ID Status Change
-			 * Interrupt - connID A
-			 */
-			dwc2_force_mode(hsotg, true);
+		already = dwc2_ovr_avalid(hsotg, true);
 	} else if (role == USB_ROLE_DEVICE) {
-		if (dwc2_ovr_bvalid(hsotg, true))
-			goto unlock;
-
-		if (hsotg->dr_mode == USB_DR_MODE_OTG)
-			/*
-			 * This will raise a Connector ID Status Change
-			 * Interrupt - connID B
-			 */
-			dwc2_force_mode(hsotg, false);
-
+		already = dwc2_ovr_bvalid(hsotg, true);
 		/* This clear DCTL.SFTDISCON bit */
 		dwc2_hsotg_core_connect(hsotg);
 	} else {
@@ -120,9 +104,12 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 		}
 	}
 
-unlock:
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
+	if (!already && hsotg->dr_mode == USB_DR_MODE_OTG)
+		/* This will raise a Connector ID Status Change Interrupt */
+		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
+
 	dev_dbg(hsotg->dev, "%s-session valid\n",
 		role == USB_ROLE_NONE ? "No" :
 		role == USB_ROLE_HOST ? "A" : "B");
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
