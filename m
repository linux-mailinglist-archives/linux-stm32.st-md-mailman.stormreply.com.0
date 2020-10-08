Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C83928713A
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Oct 2020 11:10:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5BD7C32EA8;
	Thu,  8 Oct 2020 09:10:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9755AC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 09:10:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 098988QE020349; Thu, 8 Oct 2020 11:09:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=jXqH2UDOby99d4qrNiPaX/nj3Vx3ew8x+EOd0UDJu8g=;
 b=dMJroOBtEk4LKhs71+0vuMln0FbG6WS3sBLvWzCpgAT3rvVxLqDB3ijZuqQBg2yR4U/R
 op/71VIZm+MpKDFhwUgXr5qpi9odKGXdEPEndv7449ufwwPBQAGbJwx43dzTFUjwgZfY
 buwgiMKrtzz6G+TtPz+18vVEyNWD4YnV3vKmkeBzRBdPSZMeNkHH4hWVvUluuhJM2ib3
 KC8DX4DyRt/qEqY2r0skTZmGNudHoZhL/TWm9lL1X1PCmAWSa0of+5/DIli/12chTz65
 k8p287bNs7hxtLw1LV4FbIN2q4TnEsJ4rd645B7is4yYHdK1ToHQYkRvaBt8GnEueH7k OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tk9wf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 11:09:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A4CA10002A;
 Thu,  8 Oct 2020 11:09:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25F5F2AE6B1;
 Thu,  8 Oct 2020 11:09:51 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct 2020 11:09:50
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Thu, 8 Oct 2020 11:09:42 +0200
Message-ID: <1602148182-25869-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_04:2020-10-08,
 2020-10-08 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alain Volmat <alain.volmat@st.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix DCMI DMA features on
	stm32mp15 family
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

Enable FIFO mode with half-full threshold.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bfe2902..cfba9a1 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1091,7 +1091,7 @@
 			resets = <&rcc CAMITF_R>;
 			clocks = <&rcc DCMI>;
 			clock-names = "mclk";
-			dmas = <&dmamux1 75 0x400 0x0d>;
+			dmas = <&dmamux1 75 0x400 0x01>;
 			dma-names = "tx";
 			status = "disabled";
 		};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
