Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F0D151B37
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 14:26:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FB67C36B0C;
	Tue,  4 Feb 2020 13:26:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FA71C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 13:26:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014DN8pc018480; Tue, 4 Feb 2020 14:26:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=P0O19dVNFkEtZ9n15KyWMo1KjYvKtsJrmOpSkOaeAtM=;
 b=fYZdzA3e/39RPkICu4+JFfAkKwu9q/CnSeoF7oBE40U1c8tok4MzjYWBpsDTE7RtMQCU
 3fZvUmsrGQ1BnUp1dwVxaUkbnr+H0nyn3VkreT4RdUN+5ta44bILGYvNJiRh2ZjPwaKi
 5m/7RPMBhwQECf7cGcC0z6xCBKGf03OM1aCwgUeQ7sbue4mGgzN9JzlJGeN0LdOXkkT1
 /uvYl4F7NXjwjFXW6pO2YWrssEmBHr2kRq8+VBmFGYa8ul3t9AseF9Wcotp6xAl4dl/3
 YkWssuuRt0KaxTuEhDOL0zNwJfsFl04s5YyqVKWWy+i7yIVnpuGDkQda/NZfFlnk+vio XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xvyp61uyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 14:26:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98484100038;
 Tue,  4 Feb 2020 14:26:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 892B42B188F;
 Tue,  4 Feb 2020 14:26:13 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 4 Feb 2020 14:26:13
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Tue, 4 Feb 2020 14:26:04 +0100
Message-ID: <20200204132606.20222-2-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204132606.20222-1-amelie.delaunay@st.com>
References: <20200204132606.20222-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_04:2020-02-04,
 2020-02-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: add USB OTG full support
	on stm32mp151
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

Using the st,stm32mp15-hsotg compatible allows to use USB OTG with Dual Role
mode support.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index fb41d0778b00..53fa6ed82b34 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1044,7 +1044,7 @@
 		};
 
 		usbotg_hs: usb-otg@49000000 {
-			compatible = "snps,dwc2";
+			compatible = "st,stm32mp15-hsotg", "snps,dwc2";
 			reg = <0x49000000 0x10000>;
 			clocks = <&rcc USBO_K>;
 			clock-names = "otg";
@@ -1055,6 +1055,7 @@
 			g-np-tx-fifo-size = <32>;
 			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
 			dr_mode = "otg";
+			usb33d-supply = <&usb33>;
 			status = "disabled";
 		};
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
