Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D7C51A026
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 15:03:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E9C2C6047D;
	Wed,  4 May 2022 13:03:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D87AC60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 13:03:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244A6Oxs016063;
 Wed, 4 May 2022 15:02:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=thMF4CPlkTsnZstfuDPh8HVl0o2Yyz4DhhVhNaGVUps=;
 b=2qokIaFqOEp/FXAivRHLXQwfKtxNjCCZENfb4vNYvO/+VzMxONx79mBqLl3SMjLaGaGE
 mP3Fc9FLIUNTzD5ePCe9yefrHAKFfrEnrUnpKBC7KHFvjezEsLEkfGjys50xJHnUQklD
 HMP5KoJ5tuLTcP6OkKXwu4jgPIV1GQuhP2OJ9kzkAP+NMawrCgIcIZ1zsVyJcslKqsGr
 yLkDPyNW+i2TYAg1jxuTofrbZCLPUrUaZw7MczHBKKBHHE1Y1mGF2jTSyDMIsgEijErp
 3TqNf2ZzhGT41UpLkR6VPTnXU0erM80zilESEUNqB+UxWN5pamwsmHuh/wM4ZuywMXmp Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf0m4ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 15:02:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DEE810002A;
 Wed,  4 May 2022 15:02:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A50B21FE9E;
 Wed,  4 May 2022 15:02:40 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May 2022 15:02:39
 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Wed, 4 May 2022 15:02:27 +0200
Message-ID: <20220504130233.330983-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_01,2022-02-23_01
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] rtc: stm32: add alarm out and LSCO
	features.
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

On STM32MP1x SOCs, RTC is able to output some signals on its own pins.

This series add the possibility to select two of these signals on
RTC pins :
 - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
   On STM32MP1x Discovery boards this feature is used to generate a clock
   to Wifi/Bluetooth module.
 - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
   expires.

Amelie Delaunay (2):
  dt-bindings: rtc: stm32: add st,lsco optional property to select
    output
  rtc: stm32: add Low Speed Clock Output (LSCO) support

Gabriel Fernandez (2):
  ARM: dts: stm32: add RTC LSCO support on stm32mp157c-dk2
  ARM: dts: stm32: add RTC LSCO support on stm32mp135f-dk

Valentin Caron (2):
  dt-bindings: rtc: stm32: add alarm A out property to select output
  rtc: stm32: add alarm A out feature

 .../devicetree/bindings/rtc/st,stm32-rtc.yaml |  37 +++
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi      |   6 +
 arch/arm/boot/dts/stm32mp135f-dk.dts          |   4 +
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      |   6 +
 arch/arm/boot/dts/stm32mp157c-dk2.dts         |   7 +
 drivers/rtc/Kconfig                           |   1 +
 drivers/rtc/rtc-stm32.c                       | 210 ++++++++++++++++++
 include/dt-bindings/rtc/rtc-stm32.h           |  14 ++
 8 files changed, 285 insertions(+)
 create mode 100644 include/dt-bindings/rtc/rtc-stm32.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
