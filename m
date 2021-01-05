Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 552AD2EA7DC
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 10:49:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A59CC56638;
	Tue,  5 Jan 2021 09:49:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 047BBC56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 09:49:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1059kvJA005754; Tue, 5 Jan 2021 10:49:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vYfqQLYQirAYyccNfjfHJ4bB+gtWVjtxynejUYP/4KE=;
 b=CXw6QxPX6uFlICw8Z/fMkIRJwdmEptQryiNERbLF1od7E3pnGXBlXzvVGVWzDFoNCZQC
 Kzv4z3Qi0mvWKcPqClureL3tPX7RFmeW3e0iLr3l1JKJzwk2ZbPSPvg2eXT3dd9hIX/Q
 O9zXeVildwSIj+ZcHJSHLpmw6KmDcicN7fSg+3bydJTEXasEpv+cyagtHLWLNoEItxJP
 6G0sGxuFKup2LQYghNkL66eq6aLVe2ncEmROVvsov1I5x42K73P6avjO5EjxlfIyS0Pk
 QM7BNtso8A6oTT28pN5J8tgFWxm79MlPKlwpkx9gCSFv9x6S/3x6NEWr3sldD+LzbUtQ Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35th25ky83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 10:49:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D4E1100038;
 Tue,  5 Jan 2021 10:49:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E435230519;
 Tue,  5 Jan 2021 10:49:07 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan 2021 10:49:06
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 5 Jan 2021 10:48:53 +0100
Message-ID: <20210105094855.30763-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105094855.30763-1-amelie.delaunay@foss.st.com>
References: <20210105094855.30763-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_01:2021-01-05,
 2021-01-05 signatures=0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/3] usb: dwc2: set ahbcfg parameter for
	STM32MP15 OTG HS and FS
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

STM32MP15 ahbcfg register default value sets Burst length/type (HBSTLEN)
to Single (32-bit accesses on AHB), which is not recommended, according
to STM32MP157 Reference manual [1].
This patch sets Burst length/type (HBSTLEN) so that bus transactions
target 16x32 bit accesses. This improves OTG controller performance.

[1] https://www.st.com/resource/en/reference_manual/dm00327659.pdf, p.3149

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/params.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 267543c3dc38..0df693319f0a 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -177,6 +177,7 @@ static void dwc2_set_stm32mp15_fsotg_params(struct dwc2_hsotg *hsotg)
 	p->i2c_enable = false;
 	p->activate_stm_fs_transceiver = true;
 	p->activate_stm_id_vb_detection = true;
+	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
@@ -189,6 +190,7 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
 	p->host_rx_fifo_size = 440;
 	p->host_nperio_tx_fifo_size = 256;
 	p->host_perio_tx_fifo_size = 256;
+	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
