Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB712277E
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 10:22:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 377F6C36B11;
	Tue, 17 Dec 2019 09:22:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57B48C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 09:22:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH9I2CL021245; Tue, 17 Dec 2019 10:22:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XY+AO+ijtCwD9TA8XVIFqwXUmtOGb8Yzs2oMpr88O8M=;
 b=N6zOeVrAP7mt0YIYyWW2DIBsgJm5IzDQIJj+rfzumUbRlOsEbOp8D+qwTKTT7mFKJSWe
 3+I5XNsGGVOVHvnA2liZq0fbGdnO5l96nuGYND4bPXU+PNl0jUhT94XYZNuqw/dSoZOo
 kdjtF8zVeu2+awx1/v1eNtpCH7HXEjzm5qJdW5hraQS6lpYVc/ujHmgPcrYsmr20szmv
 y/zd2GEdUehJquFmsu711PepSGGd3uR+AFQA9g46TCpufUyAsWz4y4BYIqe8WmYWK1HD
 K2x1+ZEA7dzgRL+HtZd27q9uUvvbf/4/QDNiKByAfpnoPI82QkkaoBkOXVdnl9Qh5Bn7 Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvp36x07q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 10:22:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B003310002A;
 Tue, 17 Dec 2019 10:22:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A42902A64E4;
 Tue, 17 Dec 2019 10:22:33 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 17 Dec 2019 10:22:33
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <vkoul@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Tue, 17 Dec 2019 10:21:59 +0100
Message-ID: <20191217092201.20022-5-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20191217092201.20022-1-benjamin.gaignard@st.com>
References: <20191217092201.20022-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/6] ARM: dts: stm32: fix dma controller node
	name on stm32f746
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

Modify dma controller nodes name to fit with the standard naming.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f746.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index d26f93f8b9c2..ed222577f6da 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -587,7 +587,7 @@
 			assigned-clock-rates = <1000000>;
 		};
 
-		dma1: dma@40026000 {
+		dma1: dma-controller@40026000 {
 			compatible = "st,stm32-dma";
 			reg = <0x40026000 0x400>;
 			interrupts = <11>,
@@ -603,7 +603,7 @@
 			status = "disabled";
 		};
 
-		dma2: dma@40026400 {
+		dma2: dma-controller@40026400 {
 			compatible = "st,stm32-dma";
 			reg = <0x40026400 0x400>;
 			interrupts = <56>,
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
