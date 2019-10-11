Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E59D4069
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 15:07:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47135C36B0C;
	Fri, 11 Oct 2019 13:07:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F861C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 13:07:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BD6lwL021879; Fri, 11 Oct 2019 15:07:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=klfGUH5dxwRvx6PXzWgeW52/ZQWuSqdDdFx4SGnAlS4=;
 b=RZB1+1VtH8UvSPqj7nDzvpZlumAZiVIzoig/VFcxT54qxXkZWDZON8vjwBaTLhl5PlGJ
 WDWaMKcgESwxdVae5WLci4JjHy5lB8wUTumrgkEHc1xRJ3PWE+r4tmjPxckHkIUuhYf9
 5TK0GxjGBS912OgSj9qSUli+xSB2IyM5KMpRghBRfIkNw5XRDJBuBciZzdjbe3TNUspc
 GUKxKsMMGusLEhzzc8obDfM6Gz7l0Qr3pA612YQ24qYXwo9JFTxJwc4ktPl53anyEyLw
 BouNE3Oxaiq/wF87KVUr3WZOonHy5YInEJVYit9LFLJe7C+tepsJtPs07FwqgjPxgTaI WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegxw9x0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 15:07:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B3D7100034;
 Fri, 11 Oct 2019 15:07:01 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 781192BE25F;
 Fri, 11 Oct 2019 15:07:01 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct
 2019 15:07:01 +0200
Received: from localhost (10.201.20.122) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct 2019 15:07:00
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <alexandre.torgue@st.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Fri, 11 Oct 2019 15:06:58 +0200
Message-ID: <20191011130658.23670-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_08:2019-10-10,2019-10-11 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32f469: remove useless interrupt
	from dsi node
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

DSI driver doesn't use interrupt, remove it from the node since it
breaks yaml check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f469.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f469.dtsi b/arch/arm/boot/dts/stm32f469.dtsi
index 5ae5213f68cb..be002e8a78ac 100644
--- a/arch/arm/boot/dts/stm32f469.dtsi
+++ b/arch/arm/boot/dts/stm32f469.dtsi
@@ -8,7 +8,6 @@
 		dsi: dsi@40016c00 {
 			compatible = "st,stm32-dsi";
 			reg = <0x40016c00 0x800>;
-			interrupts = <92>;
 			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
 			reset-names = "apb";
 			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
