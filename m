Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAF65EC14
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jan 2023 14:06:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0706FC69069;
	Thu,  5 Jan 2023 13:06:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31EC1C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jan 2023 13:06:48 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305A3jOn006259; Thu, 5 Jan 2023 14:06:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=/6mkw2rHwAZCXr7ruUELgsQrAc5HjLhzO3gPgeBT10o=;
 b=bdBQ4igboibobTG9aMcwCfYEIHsFGpFSVu7KMI4R4Kw9MQXCDk8xqzopNcMtZNI8RCiA
 z86bmU36F1VeCi0DPmTkCX968Gqb/Csp82Y9c2mJSYlNgC5FgAyOdGNPeI+8BaNlXY5Z
 V4uZwd93OKPbGWofAFQEVb6fjRWmCbEKU4wS/cqojb8AWTC4PuWcghKzvJ7wsLhFCldr
 tvEQXSQfrsylTAp9QGrvgJ82Go1jC4Il5wT2sOIFx0mbhN5EQMQOG0k9hL6fuyMHewe+
 10HTihaRasd2qyn3F7/taAbbRI1BRgybvToopabLCD3Djf1ExUY9uq31jiYUZyK0jxms rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtbcq94x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:06:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E432C10002A;
 Thu,  5 Jan 2023 14:06:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD6E123BDE9;
 Thu,  5 Jan 2023 14:06:35 +0100 (CET)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 5 Jan
 2023 14:06:35 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 5 Jan 2023 14:06:08 +0100
Message-ID: <20230105130612.330155-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-04_02,2022-06-22_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/3] ARM: dts: stm32: add timers support on
	stm32mp13
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

Add STM32 TIM and LPTIM support to STM32MP13 SoCs family.
Add also support of timers available on DK board RPI expansion connector.
These timers are configured in the DK board device tree, but let in
disabled state by default.

Olivier Moysan (3):
  ARM: dts: stm32: add timers support on stm32mp131
  ARM: dts: stm32: add timer pins muxing for stm32mp135f-dk
  ARM: dts: stm32: add timers support on stm32mp135f-dk

 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi |  60 +++
 arch/arm/boot/dts/stm32mp131.dtsi        | 557 +++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp135f-dk.dts     |  58 +++
 3 files changed, 675 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
