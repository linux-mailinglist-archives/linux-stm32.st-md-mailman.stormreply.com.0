Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C84756FE
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 11:56:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AC8DC5EC6C;
	Wed, 15 Dec 2021 10:56:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45457C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 10:56:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BF9KU8m011417;
 Wed, 15 Dec 2021 11:56:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=aMhAYRQEwPa+LO1VPGFEvP3hcutpAOtxndPpd2jAOSc=;
 b=Dh9yftgbbOlZcwkq19CSIFyLoB2uZW7zzKq6UvIBwMfVF77rBRSarSs9SF8TyRUiyKnU
 pw5k7BFwdn9b+V0CFu2vu+JvJQ/hIFkQcEib3OMWaa5+eatnK1kSJ2DMJhj+OdfRCLYc
 cUOMz7HIwwXtqTsk0uj/rDshFWn6w646lCGoVnRTBDEksK7xwOpSiye5tBRE0lNguSWR
 py6U+Rj9P2oVx/PXKYDv6qBpr8HtOfZL0xJi0GRYzITVuFehp8ys7QAnql1n3Gwqbiae
 3dV4If0VXvTGARBZ0N3fxSK8/yOZ44ZSgHH03qqN1qmWpAPazDqoNKVfHl1UWHcTJhoi dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cy79j3018-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 11:56:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB9FF10002A;
 Wed, 15 Dec 2021 11:56:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B6832354DF;
 Wed, 15 Dec 2021 11:56:30 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 15 Dec
 2021 11:56:29 +0100
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "Kevin
 Hilman" <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <dfe942db-5af7-bb82-22b6-3bd866c9017d@foss.st.com>
Date: Wed, 15 Dec 2021 11:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_08,2021-12-14_01,2021-12-02_01
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v5.17 #1
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


Dear ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.17.

Regards
Alex

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.17-1

for you to fetch changes up to 3ff0810ffc4793bfde454a452837484d0815aa14:

   ARM: dts: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1" OF 
(2021-12-06 09:31:05 +0100)

----------------------------------------------------------------
STM32 DT for v5.17, round 1

Highlights:
----------

-MCU:
  - fix ili9341 for dtbs_check warnings on stm32f429 disco.

- MPU:
  - ST boards:
   - tune HS USB phys on stm32mp15 EV1 and DKx boards.
   - add pull-up on USART3/UART7 RX pins on STM32MP15 DKx boards.
   - use correct pinctrl setting for STUSB1600 on STM32MP15 DK boards.

  - ENGICAM:
   - enable LVDS pannel on i.Core STM32MP1 EDIMM2.2.
   - add "i.Core STM32MP1 C.TOUCH 2.0 10.1" OF" support:
     EDIMM compliant general purpose carrier board with ETH 10/100,
     WIFI/BT, CAN, ...

----------------------------------------------------------------
Dillon Min (1):
       ARM: dts: stm32: fix dtbs_check warning on ili9341 dts binding on 
stm32f429 disco

Erwan Le Ray (2):
       ARM: dts: stm32: add pull-up to USART3 and UART7 RX pins on 
STM32MP15 DKx boards
       ARM: dts: stm32: clean uart4_idle_pins_a node for stm32mp15

Fabrice Gasnier (3):
       ARM: dts: stm32: tune the HS USB PHYs on stm32mp15xx-dkx
       ARM: dts: stm32: tune the HS USB PHYs on stm32mp157c-ev1
       ARM: dts: stm32: fix stusb1600 pinctrl used on stm32mp157c-dk

Jagan Teki (3):
       ARM: dts: stm32: Enable LVDS panel on i.Core STM32MP1 EDIMM2.2
       dt-bindings: arm: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0 
10.1" OF
       ARM: dts: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1" OF

  .../devicetree/bindings/arm/stm32/stm32.yaml       |   1 +
  arch/arm/boot/dts/Makefile                         |   1 +
  arch/arm/boot/dts/stm32f429-disco.dts              |   2 +-
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |  32 ++---
  .../stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    | 132 
+++++++++++++++++++++
  .../dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts    |  85 +++++++++++++
  arch/arm/boot/dts/stm32mp157c-ev1.dts              |  22 ++++
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |  16 +++
  8 files changed, 274 insertions(+), 17 deletions(-)
  create mode 100644 
arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
