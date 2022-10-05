Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 292EA5F558D
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Oct 2022 15:36:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB417C640FE;
	Wed,  5 Oct 2022 13:36:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C801FC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Oct 2022 13:36:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 295C19SN004643;
 Wed, 5 Oct 2022 15:36:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=UK8cv3Z7Vi2PsEmR/JMgWfQIL22uuQ2m+zMQDgVwZL8=;
 b=q++rgE560qAIcX3tKxmQL9thp4H9LEuQw15JlTa1QNfrYINjcyFqnSiIwV7lEECvMy4C
 ImKi7GmbxnFDy13PvHL7I4r2I6xwioQywnGjCXUpDBPXhqtdFzemarrhXE5mu/FDHXQ8
 Yy8yrrYBkWdhARmZp5JoIGvHpuasUSsK5sK/mJ0merrQgczcCvXCM/X34DBwJH8/TLpY
 LPx8NcdVpb3/psFytYp9qSaLZ5ESLeZ2R5DYoz7+uTTPwifSJQXqDy5qmcXVHr79nc7a
 xe6q12yFdZkulv9N+8EbrjNNx6RuvXhKxzjm90tWsjBdFr5onLHepFgOwuneG6HVgwCb lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jxaym7tkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 15:36:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12B0710002A;
 Wed,  5 Oct 2022 15:36:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC186229A9D;
 Wed,  5 Oct 2022 15:36:03 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 5 Oct
 2022 15:36:03 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <nuno.sa@analog.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Wan Jiabing
 <wanjiabing@vivo.com>, Yannick Brosseau <yannick.brosseau@gmail.com>
Date: Wed, 5 Oct 2022 15:31:12 +0200
Message-ID: <20221005133120.50483-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_03,2022-10-05_01,2022-06-22_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/8] iio: stm32-adc: add support of adc for
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

On STM32MP13 SoCs, each ADC peripheral has a single ADC block.
These ADC peripherals, ADC1 and ADC2, are fully independent.
The STM32MP131 SoC provides only ADC2, while other STM32MP13x
SoCs provide both ADC1 and ADC2.

The STM32MP13 ADC features and characteristics are slightly
different from STM32MP15 ADC ones, requiring a specific support
in the driver.

This patchset enables the ADC peripheral on STM32MP135F-DK board.

On STM32MP135F-DK board the ADC is connected to VDDA voltage
provided by the PMIC LOD1 supply, which has to be enabled through
SCMI regulator framework.
This serie introduces a fixed regulator to allow ADC probing,
while SCMI regulators support is not available. This does
not ensure ADC regulator enabling however.

Changes in v2:
- Rework commit message length
- Add missing spaces
- Remove useless defines

Olivier Moysan (8):
  iio: adc: stm32-adc: fix channel sampling time init
  dt-bindings: iio: adc: stm32-adc: add stm32mp13 compatibles
  iio: adc: stm32-adc: add stm32mp13 support
  iio: adc: stm32: manage min sampling time on all internal channels
  ARM: dts: stm32: add adc support to stm32mp13
  ARM: dts: stm32: add adc pins muxing on stm32mp135f-dk
  ARM: dts: stm32: add dummy vdd_adc regulator on stm32mp135f-dk
  ARM: dts: stm32: add adc support on stm32mp135f-dk

 .../bindings/iio/adc/st,stm32-adc.yaml        |  68 ++++-
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi      |   7 +
 arch/arm/boot/dts/stm32mp131.dtsi             |  43 +++
 arch/arm/boot/dts/stm32mp133.dtsi             |  31 +++
 arch/arm/boot/dts/stm32mp135f-dk.dts          |  34 +++
 drivers/iio/adc/stm32-adc-core.c              |  29 +-
 drivers/iio/adc/stm32-adc-core.h              |  30 +++
 drivers/iio/adc/stm32-adc.c                   | 249 +++++++++++++++---
 8 files changed, 444 insertions(+), 47 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
