Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64B9C1817
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2024 09:35:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F301C6DD94;
	Fri,  8 Nov 2024 08:35:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0CD5C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2024 08:35:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A880ZTr004018;
 Fri, 8 Nov 2024 09:35:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=Gw/cXB3ASlDBZf3s8ILK10
 q8vesO8K3OAc6jVmHR4dk=; b=lUDuL5xnXsIgvcuX2AjocajlconDBdKqr2fhCq
 buzrmhcpsb+LMMkk98yprpa4vchuWPfp3OtclclnN6p9PLwbk6d5vQzvRw5tK5OT
 T5KDu+5cXBJZuPMoElMarev0UXVKVqgqev92Fj1cMxyhHLQ3p4eMc78QpfsE+smx
 GocWCJB+9sPB6gt65khHWk2hcNgcmIdFsVwXSjUJeasettC8Og4hIoxDy2CfKO8g
 fcFbeDq6jpEhzGCHTFoM2+54rlRRjS6CM1KJvnZPgCt0bctkF4uvmxydqhbn8duO
 VX5NYtpFvJzc+qK8QvCGh3+fRnF4201OZrRfTT8q5L9Wi7ng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42s6gbt200-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2024 09:35:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD3D54004F;
 Fri,  8 Nov 2024 09:34:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD4F228C10A;
 Fri,  8 Nov 2024 09:33:51 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 8 Nov
 2024 09:33:51 +0100
Message-ID: <92d2d6df-cc5c-488f-8ebd-550b1903db12@foss.st.com>
Date: Fri, 8 Nov 2024 09:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, <arm@kernel.org>, <soc@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.13#1
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

Please consider this first round of STM32 DT for v6.13 cycle.

Thanks
Alex


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.13-1

for you to fetch changes up to b0191a5cbc222fc7af3f9511b44d1f330ef980e9:

   arm64: dts: st: add DMA support on SPI instances of stm32mp25 
(2024-10-29 17:07:05 +0100)

----------------------------------------------------------------
STM32 DT for v6.13, round 1

Highlights:
----------

- MPU:
   - STM32MP13:
     - ST DK board:
       - Add support of WLAN/BT Murata Type 1DX module.
     - DH SOM:
       - Add M24256E EEPROM suport.

   - STMP32MP15:
     - Use IWDG2 as wakeup source.
     - Add support of WLAN/BT Murata Type 1DX module on DK2 board.

   - STM32MP25:
     - Enable RTC.
     - Add DMA support for U(S)ART, I2C and SPI instances.

----------------------------------------------------------------
Amelie Delaunay (3):
       arm64: dts: st: add DMA support on U(S)ART instances of stm32mp25
       arm64: dts: st: add DMA support on I2C instances of stm32mp25
       arm64: dts: st: add DMA support on SPI instances of stm32mp25

Christophe Roullier (2):
       ARM: dts: stm32: add support of WLAN/BT on stm32mp157c-dk2
       ARM: dts: stm32: add support of WLAN/BT on stm32mp135f-dk

Gatien Chevallier (1):
       arm64: dts: st: add RNG node on stm32mp251

Marek Vasut (2):
       ARM: dts: stm32: Add IWDG2 EXTI interrupt mapping and mark as 
wakeup source
       ARM: dts: stm32: Describe M24256E write-lockable page in DH 
STM32MP13xx DHCOR SoM DT

Valentin Caron (6):
       ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp15
       ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp13
       ARM: dts: stm32: rtc, add LSCO to WLAN/BT module on stm32mp157c-dk2
       ARM: dts: stm32: rtc, add LSCO to WLAN/BT module on stm32mp135f-dk
       arm64: dts: st: add RTC on stm32mp25x
       arm64: dts: st: enable RTC on stm32mp257f-ev1 board

  arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi     |  7 +++++++
  arch/arm/boot/dts/st/stm32mp135f-dk.dts         | 52 
++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi |  6 ++++++
  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi     |  7 +++++++
  arch/arm/boot/dts/st/stm32mp151.dtsi            |  2 ++
  arch/arm/boot/dts/st/stm32mp157c-dk2.dts        | 51 
++++++++++++++++++++++++++++++++++++++++++++++++++-
  arch/arm64/boot/dts/st/stm32mp251.dtsi          | 95 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts      |  6 ++++++
  8 files changed, 225 insertions(+), 1 deletion(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
