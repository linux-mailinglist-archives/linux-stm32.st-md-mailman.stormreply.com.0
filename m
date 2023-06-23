Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F8473B984
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 16:11:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBEC7C65E4F;
	Fri, 23 Jun 2023 14:11:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5780FC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 14:11:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NDEZCt004204; Fri, 23 Jun 2023 16:11:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=zLkUeXmL+Ow+eXO/4Kk5UPFmY47fOCK359xSbjwsIEE=;
 b=Qdu1MOMXtdPoz1WyVmRnGhYiRajVMKK2eslEUyO/ReiXGux03z/2GGzN3/JDCRRexU1y
 83rTc+q/qijDOsaLFHWkH2LkSraGiCGIfRJw6TFPXPDByFxiT8YgaBLhBm4+6Dh2liT9
 Xkzn4Szdf7jnfwMlwzLyolY2DZE0+0k+XHitFhcor2bMXcix3W8G7W890BeBoHbECXc2
 9g9iFqf7tOBmOCGE02uT/AKsquR1hvQHjX0blJ82xmnmLCNmnQABETIFm4hdBkqoVPaF
 +a9F+53jfxfykTE/AR2PmtJjPOK/KAADLGp8r0aPK8s7lP4EMHl1kxngDO9faO559ivu 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rdc3w0ddf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 16:11:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51C9A10002A;
 Fri, 23 Jun 2023 16:11:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 472DD22AFEC;
 Fri, 23 Jun 2023 16:11:25 +0200 (CEST)
Received: from localhost (10.252.5.198) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 23 Jun
 2023 16:11:25 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Frank Rowand <frowand.list@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Fri, 23 Jun 2023 16:09:36 +0200
Message-ID: <20230623140944.2613002-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.5.198]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_08,2023-06-22_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH 0/7] iio: add iio backend device type
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

This RFC re-opens an old discussion regarding channel scaling
management in STM32 DFSDM driver [1]

The DFSDM is a peripheral provided by the STM32MP1x SoC family.
One objective is also to prepare the introduction of its successor in
the STM32MP12x SoC family: the MDF (Multi-function Digital Filter).
The MDF driver will have the same requirements as the DFSDM regarding
channel scaling management. So, the solution proposed here will apply
also for the future MDF driver.

[1]
https://patchwork.kernel.org/project/linux-iio/patch/20200204101008.11411-5-olivier.moysan@st.com/

As a short reminder of our previous discussion, the two main options
emerging were the following ones:

- Option1: Use the DFSDM as an hardware accelerator and expose the
scaled channels on SD modulator side.
Drawbak: this solution is leading to an very complex datapath, especially
for scan mode.

- Option2: Introduce a new IIO device type (so-called backend)
Retrieve scaling information from SD modulator scaling to expose a single
IIO device on DFSDM side. This solution is derivated from rcar-gyroadc
example, but with a more standard approach.
This was discussed in 
https://lore.kernel.org/lkml/20210919191414.09270f4e@jic23-huawei/

The patchset proposed in this RFC implements option2 (backend) solution.
These patches provide a minimal API implemented as a template.
The intented use of this API is illustrated through the DFSDM channel
scaling support basic implementation.

For sake of simplicity I did not include the related DT binding
in this serie. 

Below are some use case examples.

* DFSDM with SD modulator backend:
  -------------------------------
This use case corresponds to the example implemented in this RFC.
The channel attributes are retrieved from backend by the dfsdm, and
the resulting scaling is exposed through DFSDM IIO device sysfs

- Single channel:
+-------------+  ch attr   +--------+  sysfs (compound scaling)
| sd0 backend | ---------> | dfsdm0 | -------------------------->
+-------------+            +--------+

- Scan mode:
+-------------+  ch attr   +-------------+  sysfs (compound scaling)
| sd1 backend | ---------> |   dfsdm1    | -------------------------->
+-------------+            +-------------+
                             ^
                             |
+-------------+  ch attr     |
| sd2 backend |--------------+
+-------------+


* Voltage divider in front of an adc:
  ----------------------------------
By way of example, here is a comparison on scaling management with
a iio-rescale device, and how it could be managed with a backend device.

- iio-rescale implementation
Scaling is exposed both on ADC and iio-rescale IIO devices.
On iio-rescale device we get the compound scaling

+---------------------------+  ch attr   +------+  sysfs
|     iio-rescale (div)     | <--------- | adc0 | ------->
+---------------------------+            +------+
  |
  | sysfs (compound scaling)
  v

- Backend implementation:
Compound scaling is exposed on ADC IIO device.
No scaling exposed on backend device

+---------------+  ch attr   +------+  sysfs (compound scaling)
| backend (div) | ---------> | adc0 | -------------------------->
+---------------+            +------+


* Cascaded backends:
  -----------------
Backends may be cascaded to allow computation of the whole chain scaling
This is not part of this RFC, but it is identified as a potential
future use case.

+---------------+  attr   +-------------+  attr   +--------+  sysfs
| backend (div) | ------> | sd0 backend | ------> | dfsdm0 | ------->
+---------------+         +-------------+         +--------+

Olivier Moysan (7):
  iio: introduce iio backend device
  of: property: add device link support for io-backends
  iio: adc: stm32-dfsdm: manage dfsdm as a channel provider
  iio: adc: stm32-dfsdm: adopt generic channel bindings
  iio: adc: sd_adc_modulator: change to iio backend device
  iio: adc: stm32-dfsdm: add scaling support to dfsdm
  ARM: dts: stm32: add dfsdm iio suppport

 arch/arm/boot/dts/stm32mp157c-ev1.dts |  62 +++++++++
 drivers/iio/Makefile                  |   2 +
 drivers/iio/adc/sd_adc_modulator.c    |  92 +++++++++++---
 drivers/iio/adc/stm32-dfsdm-adc.c     | 176 ++++++++++++++++----------
 drivers/iio/industrialio-backend.c    |  59 +++++++++
 drivers/of/property.c                 |   2 +
 include/linux/iio/backend.h           |  29 +++++
 7 files changed, 336 insertions(+), 86 deletions(-)
 create mode 100644 drivers/iio/industrialio-backend.c
 create mode 100644 include/linux/iio/backend.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
