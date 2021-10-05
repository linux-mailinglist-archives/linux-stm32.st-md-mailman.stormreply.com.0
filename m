Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8914222BD
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Oct 2021 11:53:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0304EC5AB7F;
	Tue,  5 Oct 2021 09:53:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5A97C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 09:53:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19590IE0032013; 
 Tue, 5 Oct 2021 11:53:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=JAXwqB5HK1E8ItueEN8Uxnz5FlQC9k/N0Fkbz50Nw1g=;
 b=bchS67CF3IQuoVv70DLkWTaFpWNcuBasZC0NbitThI8nFcyj4VS1X58+oP+PSmh0Vtjt
 Pju4HaB+Sq3KlBxg7BqqQxMdToxpZ5//VjlL6s7vkBxDCe8oxkbv0nGHt32JVzW/znUh
 mhMIOZH2IN8VR+S+sOcBGWL1Nx7llksDbuX6KLF0K8SW+/cVNp6LSa8pLPHCCe1ZLUVX
 fPbJJu+P+DTl+Agdufg0rV5zKyphsI6q5I2KSA7aqFv2/SaRzLjrXCuoBtKR9M6GkYC7
 omyw0FnCAmJJjpmUUjtlAB/XxSOYqoB8aSAIYpOH57zKnZDEM6VNBvoGaSrN6u4+BC8P 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bgdt9t5h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 11:53:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A33910002A;
 Tue,  5 Oct 2021 11:53:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3481F226FAA;
 Tue,  5 Oct 2021 11:53:26 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 5 Oct 2021 11:53:25
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Tue, 5 Oct 2021 11:53:03 +0200
Message-ID: <20211005095305.66397-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005095305.66397-1-amelie.delaunay@foss.st.com>
References: <20211005095305.66397-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] usb: dwc2: drd: fix dwc2_force_mode call
	in dwc2_ovr_init
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

Instead of forcing the role to Device, check the dr_mode configuration.
If the core is Host only, force the mode to Host, this to avoid the
dwc2_force_mode warning:
WARNING: CPU: 1 PID: 21 at drivers/usb/dwc2/core.c:615 dwc2_drd_init+0x104/0x17c

When forcing mode to Host, dwc2_force_mode may sleep the time the host
role is applied. To avoid sleeping while atomic context, move the call
to dwc2_force_mode after spin_unlock_irqrestore. It is safe, as
interrupts are not yet unmasked here.

Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/usb/dwc2/drd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 2d4176f5788e..80eae88d76dd 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -25,9 +25,9 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
 	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
-	dwc2_force_mode(hsotg, false);
-
 	spin_unlock_irqrestore(&hsotg->lock, flags);
+
+	dwc2_force_mode(hsotg, (hsotg->dr_mode == USB_DR_MODE_HOST));
 }
 
 static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
