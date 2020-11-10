Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E83352AD721
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Nov 2020 14:11:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A69EAC35E2B;
	Tue, 10 Nov 2020 13:11:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B1B1C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 13:11:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAD6jQR001164; Tue, 10 Nov 2020 14:11:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=dz3uy1uS3yrC7MAuzXgVSQsUS5/oZbhpsYzOyu9fKxg=;
 b=giYuP6bYJvvgeeNMHgvaF/lU1UrIPrf8hdEOOuoe9D11fWdBo1iEhRj0TPKpad16vM5U
 lZeLqWJPdU9dJNSAEnlQu3RMUnbbro0VqqtiJ8tOoMCuHywDrTtCadODCqMBzXleee9X
 e6Y0ALEnxXJdHmUSPRDWW9e0v0VGjKiNwMvs5FgJd2dIPFNuH7ObgM3lw+kUyD3Tea4D
 L6GYbHkVJqOVfrcTGKC6Rm9/5FrhfFj8Z//OTqmbaX4CvNvbDzJJJsBrrKGE9/Co6Tq2
 yGdsD+L5L/NQWtRgw3foW7GbART0WpKO8QbnGqwPPaOhPAYrMLdaBQqTUnOfc1fX2HCK Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nkbn0aua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 14:11:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A106E100034;
 Tue, 10 Nov 2020 14:11:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FD1425E09F;
 Tue, 10 Nov 2020 14:11:00 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Nov 2020 14:11:00
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 10 Nov 2020 14:10:59 +0100
Message-ID: <20201110131059.7826-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_05:2020-11-10,
 2020-11-10 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: adjust USB OTG gadget
	fifo sizes in stm32mp151
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

Defaut use case on stm32mp151 USB OTG is ethernet gadget, using EP1 bulk
endpoint (MPS=512 bytes) and EP2 interrupt endpoint (MPS=16 bytes).
This patch optimizes USB OTG FIFO sizes accordingly.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 6ffcf06dc0e8..928e31db1526 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1070,9 +1070,9 @@
 			resets = <&rcc USBO_R>;
 			reset-names = "dwc2";
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			g-rx-fifo-size = <256>;
+			g-rx-fifo-size = <512>;
 			g-np-tx-fifo-size = <32>;
-			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
+			g-tx-fifo-size = <256 16 16 16 16 16 16 16>;
 			dr_mode = "otg";
 			usb33d-supply = <&usb33>;
 			status = "disabled";
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
