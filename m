Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B136B1479D4
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 09:57:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A7F6C36B0D;
	Fri, 24 Jan 2020 08:57:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFA2EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 08:57:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00O8qWRa022445; Fri, 24 Jan 2020 09:57:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pTHPVX7/gaXr9zuXZ4ds+Q85JK3nKgeefdELPART7X0=;
 b=HNjl9N/J7l2hCuZlbTNtRTBHqnJ5tgJ7ZvWukjVm73s4MqeWaIxEw8qwQcrv9rxaGhZv
 1baVcM1PSf0fE9P1YBvaRQWlJMyiDRVGoXevVK/INT18medgTHZYVKz/i6jBoakY/gZQ
 /q2HoMszTvxrbbHB03am52hu1XKy4OHzm82pz8aruYujQoyGtpHi7pDMXSsq8lC3mMVo
 u9FWfZGf+St9dfqOn9AcwEIvB08f85iMKwwWOlTjuYpwVvSGd8NxjMbRVIe+11wkQB/5
 7wMS/a0C8yFQlp0uzwHuSbZwZup3JDWcpUSv3K57DFcQ9Hj1eMHphwMmxrliVZ5mXIsy zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1eey68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 09:57:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE4E110002A;
 Fri, 24 Jan 2020 09:57:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE96D210F99;
 Fri, 24 Jan 2020 09:57:21 +0100 (CET)
Received: from SFHDAG5NODE2.st.com (10.75.127.14) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jan
 2020 09:57:21 +0100
Received: from SFHDAG5NODE2.st.com ([fe80::1cb5:6767:370b:9af0]) by
 SFHDAG5NODE2.st.com ([fe80::1cb5:6767:370b:9af0%20]) with mapi id
 15.00.1473.003; Fri, 24 Jan 2020 09:57:21 +0100
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
To: Alain VOLMAT <alain.volmat@st.com>, "wsa@the-dreams.de"
 <wsa@the-dreams.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Thread-Topic: [PATCH 5/5] ARM: dts: stm32: add Fast Mode Plus info in I2C
 nodes of stm32mp151
Thread-Index: AQHV0ggGJuzCPj0St021atB5ZULrDaf5hHuA
Date: Fri, 24 Jan 2020 08:57:21 +0000
Message-ID: <c7e1ed1294894d5697c649a26f82f498@SFHDAG5NODE2.st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
 <1579795970-22319-6-git-send-email-alain.volmat@st.com>
In-Reply-To: <1579795970-22319-6-git-send-email-alain.volmat@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_02:2020-01-24,
 2020-01-24 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: add Fast Mode Plus
 info in I2C nodes of stm32mp151
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

Ok pour la serie

-----Original Message-----
From: Alain VOLMAT <alain.volmat@st.com> 
Sent: jeudi 23 janvier 2020 17:13
To: wsa@the-dreams.de; robh+dt@kernel.org
Cc: mark.rutland@arm.com; Pierre Yves MORDRET <pierre-yves.mordret@st.com>; mcoquelin.stm32@gmail.com; Alexandre TORGUE <alexandre.torgue@st.com>; linux-i2c@vger.kernel.org; devicetree@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Fabrice GASNIER <fabrice.gasnier@st.com>; Alain VOLMAT <alain.volmat@st.com>
Subject: [PATCH 5/5] ARM: dts: stm32: add Fast Mode Plus info in I2C nodes of stm32mp151

Add the syscfg-fmp property in each i2c node in order to allow Fast Mode Plus speed if clock-frequency >= 1MHz is indicated.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 2dbf32ca9b36..ecd0a932aa78 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -483,6 +483,7 @@
 			resets = <&rcc I2C1_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x1>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -497,6 +498,7 @@
 			resets = <&rcc I2C2_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x2>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -511,6 +513,7 @@
 			resets = <&rcc I2C3_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x4>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -525,6 +528,7 @@
 			resets = <&rcc I2C5_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x10>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -1477,6 +1481,7 @@
 			resets = <&rcc I2C4_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x8>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -1513,6 +1518,7 @@
 			resets = <&rcc I2C6_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x20>;
 			wakeup-source;
 			status = "disabled";
 		};
--
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
