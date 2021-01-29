Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8584530871B
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Jan 2021 09:42:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 432FBC57183;
	Fri, 29 Jan 2021 08:42:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 228C4C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 08:42:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10T8XPjO011614; Fri, 29 Jan 2021 09:42:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=IqJU5WTFYVxYg64ikp2SjE9H3c+g+ahecAqCnFEQUro=;
 b=ZAgTj3SWPtME85E8/2MxHMzHSB68Cdm8PqgenpmIN2I7vv9IToXa6O3ZQzBW+JlegSYv
 aatLo3RxESSjqoTe99leCc+lbLgjZibW07jwhnj6ZZa+RanK8/RM0zXcwUscFvxj3VPc
 p37aXmDWBbvvD30Oa7m+P+v0BxdxT1p8+3bqQto2qP7dqN3GAYrPUJQcrHJ3e+KdnjYc
 wtjoY8Jhs/849ptKKZR5S0LVflXvYJfM0zy1Tm4r/UkTuT6Jw5YwI1enMW/lEZRqbDDO
 IX8CcZYavwcMOnNF9vpwlcPYERznOOcqsi5axPvbEUBIRgiKv6rGTmhZXHbDKOW/tHyh tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368a57463r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 09:42:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44F5710002A;
 Fri, 29 Jan 2021 09:42:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F37F2296D5;
 Fri, 29 Jan 2021 09:42:39 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 09:42:38 +0100
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com>
Date: Fri, 29 Jan 2021 09:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-29_03:2021-01-28,
 2021-01-29 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v5.12 #1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.12. As usual 
main changed concern MPU part. Main changes concern DHCOM SDMMC1.

regards
Alex

The following changes since commit 83d411224025ac1baab981e3d2f5d29e7761541d:

   ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02 (2021-01-14 
18:17:26 +0100)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.12-1

for you to fetch changes up to 36be90f5362a3174071a543fa73eb0f6d66bdf52:

   ARM: dts: stm32: add #clock-cells property to usbphyc node on 
stm32mp151 (2021-01-29 09:20:01 +0100)

----------------------------------------------------------------
STM32 DT updates for v5.12, round 1

Highlights:
----------

MCU part:
  -Rename mmc nodes to match with yaml validation.

MPU part:
  -Rename mmc nodes to match with yaml validation.
  -Move vdda1v1 & vdda1v8 (used by usbphyc) from boards files
   to SoC dtsi file.

  -LXA:
   -Fix leds schema for yaml validation.

  -DH:
   -Enable SDMMC1 internal pull-ups and disable CKIN feedabck clock
    on DHCOM.
   -Add SDMMC1 init state inorder to use some gpios during probing phase.
   -Disable KS8851 and FMC on PicoITX board.

----------------------------------------------------------------
Alexander Dahl (1):
       ARM: dts: stm32: Fix schema warnings for pwm-leds on lxa-mc1

Amelie Delaunay (3):
       ARM: dts: stm32: add usbphyc vdda1v1 and vdda1v8 supplies on 
stm32mp151
       ARM: dts: stm32: remove usbphyc ports vdda1v1 & vdda1v8 on 
stm32mp15 boards
       ARM: dts: stm32: add #clock-cells property to usbphyc node on 
stm32mp151

Jagan Teki (1):
       ARM: dts: stm32: Add STM32MP1 I2C6 SDA/SCL pinmux

Marek Vasut (6):
       ARM: dts: stm32: Enable internal pull-ups for SDMMC1 on DHCOM SoM
       ARM: dts: stm32: Disable SDMMC1 CKIN feedback clock on DHCOM
       ARM: dts: stm32: Disable KS8851 and FMC on PicoITX board
       ARM: dts: stm32: Add additional init state for SDMMC1 pins
       ARM: dts: stm32: Enable voltage translator auto-detection on DHCOM
       ARM: dts: stm32: Rename mmc controller nodes to mmc@

  arch/arm/boot/dts/stm32f429.dtsi                   |  2 +-
  arch/arm/boot/dts/stm32f746.dtsi                   |  4 +--
  arch/arm/boot/dts/stm32h743.dtsi                   |  2 +-
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           | 40 
++++++++++++++++++++++
  arch/arm/boot/dts/stm32mp151.dtsi                  |  9 +++--
  arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       |  4 ---
  arch/arm/boot/dts/stm32mp157c-ed1.dts              |  4 ---
  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          | 13 +++----
  arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |  2 --
  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |  4 ---
  arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   | 12 ++++---
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       | 20 ++++++++++-
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  4 ---
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |  4 ---
  14 files changed, 84 insertions(+), 40 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
