Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F42C020A
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 10:09:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60E64C5663C;
	Mon, 23 Nov 2020 09:09:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FE1BC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 09:02:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AN91lRi022168; Mon, 23 Nov 2020 10:02:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=urZWggzuIM/HzomXlAhlMtATZKXhBngJV7lZxpM9LLo=;
 b=AAWcjokkJJteNl+v3CKyu3eLPpbeD4ILeeHRWxLudP51mUbgtVTvIzVAOFI9x703VjuZ
 EfQv+deCS0Au2eXlczPukBnhiStNT9AaaKImZSyh3c3KInIhSfIL8/oljkJ5DSg24z0F
 ddDD6foHl2GcQFD820gkU63fDnU69ujI34nZyw+V5qSyldT0412wHTsN9fixFcGwJ1vj
 CnnBApxxgvk3pvokQu4linB5OBbH9peoEwcIlCAK1c2d5+ARoln2FD0SlBKD9+mFuUep
 cmPE/6zukq24Qby49sxj6aO/g/uTvFPIdEUjniBJl+2PMx5nHVF1WHD4iLbwI/zOjzjB rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01c86eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 10:02:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5909910003B;
 Mon, 23 Nov 2020 10:02:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45D24231F85;
 Mon, 23 Nov 2020 10:02:10 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov 2020 10:01:21
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 23 Nov 2020 10:01:14 +0100
Message-ID: <20201123090114.12641-4-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123090114.12641-1-amelie.delaunay@st.com>
References: <20201123090114.12641-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_02:2020-11-20,
 2020-11-23 signatures=0
X-Mailman-Approved-At: Mon, 23 Nov 2020 09:09:03 +0000
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] usb: dwc2: disable Link Power Management
	on STM32MP15 HS OTG
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

Link Power Management (LPM) on STM32MP15 OTG HS encounters instabilities
with some Host controllers. OTG core fails to exit L1 state in 200us:
"dwc2 49000000.usb-otg: Failed to exit L1 sleep state in 200us."
Then the device is still not enumerated.

To avoid this issue, disable Link Power Management on STM32MP15 HS OTG.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/dwc2/params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 9e5dd7f3f2f6..92df3d620f7d 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -194,6 +194,10 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
 	p->host_perio_tx_fifo_size = 256;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->lpm = false;
+	p->lpm_clock_gating = false;
+	p->besl = false;
+	p->hird_threshold_en = false;
 }
 
 const struct of_device_id dwc2_of_match_table[] = {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
