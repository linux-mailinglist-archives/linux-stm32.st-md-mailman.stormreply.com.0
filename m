Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0870F7CF
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 15:40:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70B8EC6B45E;
	Wed, 24 May 2023 13:40:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0090AC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 13:40:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34OCgXXO015679; Wed, 24 May 2023 15:39:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=7VfyEEAa30A1jqe6julvnk2zzbBmOw5sbxPXbLc2amo=;
 b=diyWMK1Ah/qKQOCijwPMHzdUqVrX+QshNbb8cOoc8I3uhuw52iN4MCZj6lWmtIiJZIcw
 Wqh0/2hFts2aNtCv4Ue2yQEoGlp0wbrdFjVtJR9P7Dg3H7uQDUEZUFEitGbW2O+/SCST
 qNSNO4ZK4/uZeN6tLOdWq5uinHZow0BkrpnE/sqX29iaw6Ava3hfZoQtsA9VzACSTHs8
 B2Get2qRV/gFITNqDQH7mX0fN766B0m8NIE1KjkjNToD6nmR24EEVFW1EAglxGHpHNlH
 pnXUvuweb1Au6fI70uF5TNXwc3ZuHetgJx5UlchGmD8reBbuX1mmmkW5S7hjFhCCkeL3 CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qrthk930h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 15:39:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6CD4C10002A;
 Wed, 24 May 2023 15:39:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F1A3229A88;
 Wed, 24 May 2023 15:39:48 +0200 (CEST)
Received: from localhost (10.252.20.36) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 24 May
 2023 15:39:48 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Wed, 24 May 2023 15:39:09 +0200
Message-ID: <20230524133918.1439516-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.20.36]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_09,2023-05-24_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/8] ARM: dts: stm32: add adc internal
	channels on stm32mp15
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

Add STM32 ADC2 internal channels VREFINT and VDDCORE to STM32MP15x SoCs.

Add support of vrefint channel by adding access to vrefint calibration
data in OTP.

The internal channels are defined in STM32MP15 SoC DT according to
generic channel bindings. The STM32 driver does not support a mixed use
of legacy and generic channels. When generic channels are defined,
legacy channel are ignored. This involves that the board device trees
using legacy bindings have to be changed to generic bindings.

Adopt generic iio bindings on all STM32 boards implementing the ADC.

This serie does not update stm32mp15xx-dhcom-som and
stm32mp15xx-dhcor-avenger96 DTs. These DTs have to be updated also, but
this change is already handled through the following patch:
https://lore.kernel.org/linux-arm-kernel/20230518020547.487670-1-marex@denx.de/T/

Olivier Moysan (8):
  ARM: dts: stm32: add adc internal channels to stm32mp15
  ARM: dts: stm32: add vrefint calibration on stm32mp15
  ARM: dts: stm32: add vrefint support to adc2 on stm32mp15
  ARM: dts: stm32: enable adc on stm32mp15xx-dkx boards
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    stm32mp157c-ed1
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    emstamp-argon
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    dhcor-drc
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    dhcor-testbench

 arch/arm/boot/dts/stm32mp151.dtsi             | 17 +++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts         | 16 ++++++++--
 .../boot/dts/stm32mp157c-emstamp-argon.dtsi   |  6 ++--
 .../dts/stm32mp15xx-dhcor-drc-compact.dtsi    | 28 +++++++++++++++---
 .../boot/dts/stm32mp15xx-dhcor-testbench.dtsi | 28 +++++++++++++++---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        | 29 +++++++++++++------
 6 files changed, 102 insertions(+), 22 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
