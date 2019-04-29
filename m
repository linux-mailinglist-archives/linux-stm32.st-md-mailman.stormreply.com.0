Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD03E014
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 12:03:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD953C35E04
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 10:03:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFE2FC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 10:03:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TA2515025587; Mon, 29 Apr 2019 12:03:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=22Q4dOcM7XTrNOZYvE/T6BS+Fnv79Cx7eiAXNJdGtiE=;
 b=DpgqOeuIhrPeVUaaTeQ5B/opN5QNgu37ecK7ILXP9oj98s/mFxE0Z1ViwyRsYqtE/rnp
 FoskmRuzx+VOwwTUoHJMQicAehT5/TK39XrB6HsVUyvjiklvOPlKXUaBSInucT2g7lE0
 tXt+ygKoOve/8gMNVsf4nA91CnaI3UMF/n0l6+Ks7eGtiB/j6RGUQTX+uBAtALewHZgE
 tlx1/gbS617gS1bF5oV3nm0P3csptmm6+5CrCt+ndF0SLNwKzoF7nSHwrNjscbxNOXmq
 SjGmANpvhEpOlkLG93Ar+4DWFvRDXnIq4z1CtKmQRPU7Cer4zCfMgYPCRnjQ72fLa3SA ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s5u5d1cpk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Apr 2019 12:03:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 079FD31;
 Mon, 29 Apr 2019 10:03:40 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D195F1516;
 Mon, 29 Apr 2019 10:03:39 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Apr
 2019 12:03:39 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Mon, 29 Apr 2019 12:03:39 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net"
 <olof@lixom.net>,
 "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
 "arnd@arndb.de" <arnd@arndb.de>
Thread-Topic: [PATCH 5/5] ARM: dts: stm32: add ddrperfm on stm32mp157c
Thread-Index: AQHU/nLRxwgji6v2RkORmNtCUuK6Ow==
Date: Mon, 29 Apr 2019 10:03:39 +0000
Message-ID: <1556532194-27904-6-git-send-email-gerald.baeza@st.com>
References: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
In-Reply-To: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_05:, , signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gerald BAEZA <gerald.baeza@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: add ddrperfm on
	stm32mp157c
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

The DDRPERFM is the DDR Performance Monitor embedded
in STM32MP1 SOC.

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index f8bbfff..6883762 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1155,6 +1155,15 @@
 			};
 		};
 
+		ddrperfm: perf@5a007000 {
+			compatible = "st,stm32-ddr-pmu";
+			reg = <0x5a007000 0x400>;
+			clocks = <&rcc DDRPERFM>, <&rcc PLL2_R>;
+			clock-names = "bus", "ddr";
+			resets = <&rcc DDRPERFM_R>;
+			status = "okay";
+		};
+
 		usart1: serial@5c000000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x5c000000 0x400>;
-- 
2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
