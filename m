Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB5D42C1E1
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Oct 2021 15:57:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8525C5C837;
	Wed, 13 Oct 2021 13:57:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31FA5C5C834
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 13:57:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DCcwex013621; 
 Wed, 13 Oct 2021 15:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=c6EaOVGfb8Sa8HSlE1ms6Xot8j3nZXJs3bVkNF7A+D8=;
 b=pUqda/VnJg8+97jZZU/JDtAxf111B9t9AoWFu3I1uo49fgks6eJq3FR1tpn7AXkcqI1b
 9e9lJppo0TR/qY91UK3YFU91O1DiovWI2mqFey8mew+mJgGhwtlNYahee6oeiT1n8xtm
 +dBbQH42Id6nYrhzPZ5oApOPOdIc+0T+e4fuVZ6+iDakDfkTyS4Bon9JebethxinoK14
 mf59++9Vvt0H3azZVkw4E1O/uzToKKgPo+AFsgI09FBvhFHWMw4g6CNPlpPgIoFU6CDi
 LtjHecohh3pvSGogzXkEVavgWON9lxOEtlFiSG7WJ6WsZW50qapwkxuK0A5XWEuDsdaY Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bnumjace8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 15:57:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7621D10002A;
 Wed, 13 Oct 2021 15:57:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E50B22F7CA;
 Wed, 13 Oct 2021 15:57:28 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 13 Oct 2021 15:57:27
 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
Date: Wed, 13 Oct 2021 15:57:05 +0200
Message-ID: <1634133425-25670-5-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634133425-25670-1-git-send-email-fabrice.gasnier@foss.st.com>
References: <1634133425-25670-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_05,2021-10-13_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 4/4] usb: dwc2: stm32mp15: set otg_rev
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

STM32MP15 complies with the OTG 2.0. Set OTG revision accordingly. It is
useful for the of_usb_update_otg_caps() routine to check and update
otg_rev to the lower value between DT and provided params.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- set otg_rev in otg_caps structure directly
---
 drivers/usb/dwc2/params.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 99d3b62..d300ae3 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -176,6 +176,7 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
 
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
+	p->otg_caps.otg_rev = 0x200;
 	p->speed = DWC2_SPEED_PARAM_FULL;
 	p->host_rx_fifo_size = 128;
 	p->host_nperio_tx_fifo_size = 96;
@@ -197,6 +198,7 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
 
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
+	p->otg_caps.otg_rev = 0x200;
 	p->activate_stm_id_vb_detection = !device_property_read_bool(hsotg->dev, "usb-role-switch");
 	p->host_rx_fifo_size = 440;
 	p->host_nperio_tx_fifo_size = 256;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
