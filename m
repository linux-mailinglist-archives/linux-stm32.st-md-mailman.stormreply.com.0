Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A052157A
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 10:42:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C271C5F1F3
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 08:42:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81D31C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 08:42:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4H8bpvT025572; Fri, 17 May 2019 10:42:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=s7I1bjiMwL3TR988ztsOG22VK5hebk59T4O+tHV5tM8=;
 b=kqr2KWTVCs+bp7uOcvrNKToT5YR3GR5XrY935KDnA2QaSyHk4eFFQHiEaqlHBDic1Ld1
 ch7audgRWdsLJLVci6wneUAtTBWoQl6ZaKYk1fRAjI9GehvNGbs266aqrAPK4V+Yu26c
 G4tOyUu1wGEhjXn4DUx3pqzfYDHWrsaD7sBB5NfWSRc2Is5WtbkXv8BK6W6bRIuP7hRo
 TxuIYjKIySq7lgMVShodiHxaP78GaW6Vz7WgHsqeFZKy1vuwaC0TKYv96MRAgpOjeOj5
 LOMGNOWDLjVIqdFt98BdGrCEA+CovHStVkWYuOtoj4xIn7kUeOchZVJhQsjNiZQpBw01 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkv0cf0k-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 May 2019 10:42:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 572AE43;
 Fri, 17 May 2019 08:42:12 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3EE52473;
 Fri, 17 May 2019 08:42:12 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG5NODE2.st.com (10.75.127.14)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 17 May 2019 10:42:12 +0200
From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Lucas Stach <l.stach@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 17 May 2019 10:42:06 +0200
Message-ID: <1558082528-12889-2-git-send-email-pierre-yves.mordret@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558082528-12889-1-git-send-email-pierre-yves.mordret@st.com>
References: <1558082528-12889-1-git-send-email-pierre-yves.mordret@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_04:, , signatures=0
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [Linux-stm32] [RESEND v2 1/3] ARM: dts: stm32: Add Vivante GPU
	support on STM32MP157c
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

Append Vivante GPU DT configuration.

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
  Version history:
    v2:
    v1:
       * Initial
---
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 6ce75f6..3310aba 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1136,6 +1136,16 @@
 			status = "disabled";
 		};
 
+		gpu: gpu@59000000 {
+			compatible = "vivante,gc";
+			reg = <0x59000000 0x800>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc GPU>, <&rcc GPU_K>;
+			clock-names = "bus" ,"core";
+			resets = <&rcc GPU_R>;
+			status = "disabled";
+		};
+
 		dsi: dsi@5a000000 {
 			compatible = "st,stm32-dsi";
 			reg = <0x5a000000 0x800>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
