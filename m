Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C5667010
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 11:45:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FA51C65E4C;
	Thu, 12 Jan 2023 10:45:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C46C0C65E45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 10:45:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30C7vmS9020522; Thu, 12 Jan 2023 11:45:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=WjBj1qZ/+9wZWePmbKSPXuaTeMxTwjgMwHfpXwQM5TE=;
 b=zRRZ6QMkf0S85FD8/1LFg9yEwcN0h43jNL91x0/Zq03GoDHgeGQfu5hxP5/Tgh80lL2L
 br+u5NOpm0j/XKpInPbqczZFiVf1Ob33MNeHwy0MNqAk+gJjzNYu4oNq/4GReKSMBzl2
 MGNOD/VjntKJyB2DJ9eXP6hLJ+9RCHJZUrdPv86mGL5RLVBFPjmCj8uG8qln9hgvxwi5
 /Aoh3RrXTXhd/K0rsteaZ+wIHXfo2F6cEU2AG8vnC6Fod2Wr9tFGeOzhts7ZxK1swDFw
 K+Cks6ZrkvvdPPfd7RJ16VtPvNDCkb2Phgx1dZiU/jREaPnkac2ycRfEjU8w96yTdmvZ YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k5s1y2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 11:45:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED65D10002A;
 Thu, 12 Jan 2023 11:45:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE81A214B11;
 Thu, 12 Jan 2023 11:45:03 +0100 (CET)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 11:45:03 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marek Vasut <marex@denx.de>
Date: Thu, 12 Jan 2023 11:44:35 +0100
Message-ID: <20230112104446.1140551-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_06,2023-01-12_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/10] ARM: dts: stm32: add adc internal
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

Olivier Moysan (10):
  ARM: dts: stm32: add adc internal channels to stm32mp15
  ARM: dts: stm32: add vrefint calibration on stm32mp15
  ARM: dts: stm32: add vrefint support to adc2 on stm32mp15
  ARM: dts: stm32: enable adc on stm32mp15xx-dkx boards
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    stm32mp157c-ed1
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    avenger96
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    emstamp-argon
  ARM: dts: stm32: adopt generic iio bindings for adc channels on dhcom
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    dhcor-drc
  ARM: dts: stm32: adopt generic iio bindings for adc channels on
    dhcor-testbench

 arch/arm/boot/dts/stm32mp151.dtsi             | 17 +++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts         | 16 ++++++++--
 .../boot/dts/stm32mp157c-emstamp-argon.dtsi   |  6 ++--
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  | 12 +++++---
 .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 28 +++++++++++++++---
 .../dts/stm32mp15xx-dhcor-drc-compact.dtsi    | 28 +++++++++++++++---
 .../boot/dts/stm32mp15xx-dhcor-testbench.dtsi | 28 +++++++++++++++---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        | 29 +++++++++++++------
 8 files changed, 134 insertions(+), 30 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
