Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D2765699
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 17:00:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F25BC6A603;
	Thu, 27 Jul 2023 15:00:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15034C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 15:00:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RAH1wh027816; Thu, 27 Jul 2023 16:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=doC1Pd1d3NibZb37WWHiE70DKjD6XTr1B8pDdUXXdeU=;
 b=kXoqR2HH0CWHQ1GPMt9yevGGyieem0U7ABUHEI8AmP2jQ74X6lp+4e/m9W1c3cfgJAlG
 I9c66gZAgkGwIQpL9H1UMF6EvN2OQyzcIKohIHp5uPysjh9skOJA39QRfRDtdPNjiJ86
 35aaX6kA73vd6cJ3jOBIMVozJ42aY33abrMRiPWyrxkc+HKv7Hz1VyMxUf9aAo7Ofssm
 x8zFgTbacmiCB70yHXShcna0D9XLE3G1WcNJEQX9vOVqOvUoR5pMZmlTkhWWUHxMqmmh
 2q7paXg/5Tdm9VbdmYqn7lIrdtqf1wdL0hiRKK2E3uNbGyWhhyjFDCDqpyMRbN+5i0WF 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s3kn2b15h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 16:59:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D66C710002A;
 Thu, 27 Jul 2023 16:59:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 787F2209721;
 Thu, 27 Jul 2023 16:59:44 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Jul
 2023 16:59:44 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Frank Rowand
 <frowand.list@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Thu, 27 Jul 2023 16:59:26 +0200
Message-ID: <20230727145939.1157607-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC v2 00/11] iio: add iio backend device type
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

This v2 is an addon to initial RFC:
https://lore.kernel.org/lkml/20230623140944.2613002-1-olivier.moysan@foss.st.com/

Despite the "IIO backend" naming has to be changed (as pointed out by
Jonathan previously), it has been kept here, for time being. The
appropriated naming still has to be discussed later on.

In the previous RFC the "IIO backend" concept was proposed through
a set of template APIs.

This v2 implements a functionnal exemple based on STM32 DFSDM,
to bring scaling support to this peripheral.

Olivier Moysan (11):
  iio: introduce iio backend device
  of: property: add device link support for io-backends
  dt-bindings: iio: stm32-dfsdm-adc: add scaling support
  dt-bindings: iio: adc: add scaling support to sd modulator
  iio: adc: stm32-dfsdm: manage dfsdm as a channel provider
  iio: adc: stm32-dfsdm: adopt generic channel bindings
  iio: adc: stm32-dfsdm: add scaling support to dfsdm
  iio: adc: sd modulator: add scale and offset support
  ARM: dts: stm32: adopt new dfsdm bindings on stm32mp151
  ARM: dts: stm32: add dfsdm pins muxing on stm32mp15
  ARM: dts: stm32: add dfsdm iio support on stm32mp157c-ev

 .../iio/adc/sigma-delta-modulator.yaml        |   9 +-
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 189 ++++++------------
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   |  39 ++++
 arch/arm/boot/dts/st/stm32mp151.dtsi          |  18 +-
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      |  68 +++++++
 drivers/iio/Makefile                          |   1 +
 drivers/iio/adc/sd_adc_modulator.c            | 106 ++++++++--
 drivers/iio/adc/stm32-dfsdm-adc.c             | 187 +++++++++++------
 drivers/iio/industrialio-backend.c            | 107 ++++++++++
 drivers/of/property.c                         |   2 +
 include/linux/iio/backend.h                   |  56 ++++++
 11 files changed, 561 insertions(+), 221 deletions(-)
 create mode 100644 drivers/iio/industrialio-backend.c
 create mode 100644 include/linux/iio/backend.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
