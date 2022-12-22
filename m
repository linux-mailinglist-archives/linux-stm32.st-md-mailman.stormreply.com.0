Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D75653DF4
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 11:07:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B36C6904F;
	Thu, 22 Dec 2022 10:07:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16FA9C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 10:07:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BM7iFlx002029; Thu, 22 Dec 2022 11:07:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=IgLmAV6fRiLd9Kh4FHmZvH9Hn9uAcFwNz/c3//3EHJw=;
 b=VORtJu2cDyZ+DMvZ80HmN8Dai31ux3AqTdHn+Ds8smVYV+LQWkOq0KAHcChi26Baj6t4
 lWVdMgDuc10S4V2GcYZfWOLICBuPSAfNvBmsCT98v87PCBd6zrQNzU7Pk9eVk0YjsYp1
 93yd4Pc9IlLvUlIPDx8BDQBd2HgQrouc8gZR9nFYvWds4/BqUTIt5WCrbCOjRBlIoHLt
 N7keSxFEHwPSJiNWdP7kMKGvjhvYP2lNMPJ1ffqfHTcs+pVaOV25tS6OEWO/Xj1Fm2qF
 W41SwNy5BBMgq+mfpp9kVz0unbuKJbOkjkf3TPVFPytyWEzArTHdQnSe1jy+TDUnokh8 OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mka9xfdjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 11:07:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 874B110004F;
 Thu, 22 Dec 2022 11:07:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BF8721D3C8;
 Thu, 22 Dec 2022 11:06:06 +0100 (CET)
Received: from localhost (10.201.21.217) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 22 Dec
 2022 11:06:06 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <Oleksii_Moisieiev@epam.com>, <linus.walleij@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Thu, 22 Dec 2022 11:04:57 +0100
Message-ID: <20221222100504.68247-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.217]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_05,2022-12-21_01,2022-06-22_01
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, gatien.chevallier@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH v2 0/7] Introduce STM32 system bus
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

Document STM32 System Bus. This bus is intended to control firewall
access for the peripherals connected to it.

For every peripheral, the bus checks the firewall registers to see
if the peripheral is configured as non-secure. If the peripheral
is configured as secure, the node is marked populated, so the
device won't be probed.

This is useful as a firewall configuration sanity check and avoid
platform crashes in case peripherals are incorrectly configured.

The STM32 System Bus implements the feature-domain-controller
bindings. It is used by peripherals to reference a domain
controller, in this case the firewall feature domain.
The bus uses the ID referenced by the feature-domains property to
know where to look in the firewall to get the security configuration
for the peripheral. This allows a device tree description rather
than a hardcoded peripheral table in the bus driver.

On STM32MP13/15 platforms, the firewall bus is represented by the
ETZPC node, which is responsible for the securing / MCU isolating
the capable peripherals.

STM32MP13/15 device trees are updated in this series to implement
the bus. All peripherals that are securable or MCU isolation capable
by the ETZPC are connected to the bus.

Changes in V2:
	- Corrected YAMLS errors highlighted by Rob's robot
	- Re-ordered Signed-off-by tags in two patches

Gatien Chevallier (6):
  dt-bindings: bus: add STM32 System Bus
  dt-bindings: bus: add STM32MP15 ETZPC firewall bus bindings
  dt-bindings: bus: add STM32MP13 ETZPC firewall bus bindings
  bus: stm32_sys_bus: add support for STM32MP15 and STM32MP13 system bus
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP15x boards
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards

Oleksii Moisieiev (1):
  dt-bindings: Document common device controller bindings

 .../devicetree/bindings/bus/st,sys-bus.yaml   |   88 +
 .../feature-domain-controller.yaml            |   84 +
 MAINTAINERS                                   |    6 +
 arch/arm/boot/dts/stm32mp131.dtsi             |  242 +-
 arch/arm/boot/dts/stm32mp151.dtsi             | 2737 +++++++++--------
 drivers/bus/Kconfig                           |    9 +
 drivers/bus/Makefile                          |    1 +
 drivers/bus/stm32_sys_bus.c                   |  180 ++
 include/dt-bindings/bus/stm32mp13_sys_bus.h   |   60 +
 include/dt-bindings/bus/stm32mp15_sys_bus.h   |   98 +
 10 files changed, 2062 insertions(+), 1443 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/st,sys-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
 create mode 100644 drivers/bus/stm32_sys_bus.c
 create mode 100644 include/dt-bindings/bus/stm32mp13_sys_bus.h
 create mode 100644 include/dt-bindings/bus/stm32mp15_sys_bus.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
