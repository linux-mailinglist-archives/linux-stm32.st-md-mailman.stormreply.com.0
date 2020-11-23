Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 979972C0209
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 10:09:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53A8CC56635;
	Mon, 23 Nov 2020 09:09:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA0B3C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 09:02:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AN8vb9P024874; Mon, 23 Nov 2020 10:02:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bY3Gi76L0pJYGKWD/yORpPP0H2/iyGpFzjwdkCphzbQ=;
 b=fCnOyjvhrKCTM9dLel3EgXc8BVIrhDrk1bMB0gu0U758FpX8I+g6yh8Ew7bs8t+QOMK7
 OGtH9awWPJummUfDqs7blPQ5ZN1y/Iq6FTPPnI3JFQCAEpJwpCm857Oa9Inw5NZRAuDd
 +VaDGxZzsjdmJ/g3JpljOV/pv8LJHaHPwtLf2+MECZw3ZJiXhL1VAlN9vhDZYhg4mazr
 HUN8DnDBEvfQWerLmLdom0J02bB0/Jhuktr6zW4qofA0inm6tfP7CoyfqpXsuYufO/KG
 may3HmcnSM1apdOkNNbaRUq6SOTyrofNemDPjpTCFOmGqE1L2id9VJeJduZv5h/iojLD 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hj15a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 10:02:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E88C10003A;
 Mon, 23 Nov 2020 10:02:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3ABAB231F82;
 Mon, 23 Nov 2020 10:02:10 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov 2020 10:01:20
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 23 Nov 2020 10:01:13 +0100
Message-ID: <20201123090114.12641-3-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123090114.12641-1-amelie.delaunay@st.com>
References: <20201123090114.12641-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_02:2020-11-20,
 2020-11-23 signatures=0
X-Mailman-Approved-At: Mon, 23 Nov 2020 09:09:03 +0000
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] usb: dwc2: enable FS/LS PHY clock select
	on STM32MP15 FS OTG
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

When the core is in FS host mode, using the FS transceiver, and a Low-Speed
device is connected, transceiver clock is 6Mhz.
So, to support Low-Speed devices, enable support of FS/LS Low Power mode,
so that the PHY supplies a 6 MHz clock during Low-Speed mode.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/dwc2/params.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 0df693319f0a..9e5dd7f3f2f6 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -179,6 +179,8 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
 	p->activate_stm_id_vb_detection = true;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->host_support_fs_ls_low_power = true;
+	p->host_ls_low_power_phy_clk = true;
 }
 
 static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
