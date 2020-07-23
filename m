Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C4422AD3B
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 13:07:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 148DBC36B27;
	Thu, 23 Jul 2020 11:07:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5CC2C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 11:07:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NB7eMT021070; Thu, 23 Jul 2020 13:07:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0vmigRJKSKCaaUgNfAUdO/lMA3zem7APyAy+GcZjtNk=;
 b=OfxOU1nXwxafRPK1I1CeoWexuLiwfeVd0E6lEUHtqXjpA/WAq0IPWDNIFOKEkuMac8jm
 X3LkXRG3jY2Ic55tKOuqnQbvpMX67iF/Yi0sGkdk+X+qpkqR12tqoy5pksMn7yWQ46ph
 gwChLb/p0ogDsDZe/p4nFa8OH/YNH/aYFwWTU34D2LmbcB1bxqDku7wWHAMRFh5z5Igk
 mtP0g03VdKtQhfWd87IQ7i4gFuAcnaXYUqrU+AOQiTwTuFlDgtYEVvvIa3ONv3rnG60G
 dRJSZsRJUIksnUWqOqoCvPWaSUI9o0kK7vmYIARwbUae3F3PYQnIaobldQJB7VmEEGsf /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpt7rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 13:07:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BCDD100038;
 Thu, 23 Jul 2020 13:07:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D9F32AD9F6;
 Thu, 23 Jul 2020 13:07:34 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jul 2020 13:07:34
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Thu, 23 Jul 2020 13:07:17 +0200
Message-ID: <20200723110717.18699-4-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723110717.18699-1-amelie.delaunay@st.com>
References: <20200723110717.18699-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_03:2020-07-23,
 2020-07-23 signatures=0
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/3] usb: dwc2: don't use ID/Vbus detection
	if usb-role-switch on STM32MP15 SoCs
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

If usb-role-switch is present in the device tree, it means that ID and Vbus
signals are not connected to the OTG controller but to an external
component (GPIOs, Type-C controller). In this configuration, usb role
switch is used to force valid sessions on STM32MP15 SoCs.

Acked-by: Minas Harutyunyan <hminas@synopsys.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
No changes in v2.
---
 drivers/usb/dwc2/params.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index ce736d67c7c3..d6690ee7af01 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -183,9 +183,11 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
 static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
+	struct device_node *np = hsotg->dev->of_node;
 
 	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
-	p->activate_stm_id_vb_detection = true;
+	p->activate_stm_id_vb_detection =
+		!of_property_read_bool(np, "usb-role-switch");
 	p->host_rx_fifo_size = 440;
 	p->host_nperio_tx_fifo_size = 256;
 	p->host_perio_tx_fifo_size = 256;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
