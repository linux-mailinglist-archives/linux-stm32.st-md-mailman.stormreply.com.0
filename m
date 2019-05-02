Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DAB114F2
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 10:10:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED27BC0B796
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 08:10:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF80BC0B794
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 08:10:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42862RU006167; Thu, 2 May 2019 10:10:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=R4ti5gteNcBki+KcCZxNtPlE39G37YfOCdhQ1hFnO/4=;
 b=eNxlwstRAn08phkcWqAvf2F8iKl3xDJ4Y6ZI1feZB7HPwNdaDWwHjMAEl8yeTeYUpd8F
 CGa44tuNVPHxgZ+znx0PIhUe5Qd3dVAxFnnqhTuFiApyCkjCY6RB7oc3H+dpovlyINFp
 Wzx3KkaRmwFg1LrewL98IKgwSWd6ABVRygSeZ50VA68/g/Yiu9hdRXorkcACQ0x7qa3D
 Ew2FNDonBa/kSg9tP+eLzYF1Yiz9GfFvjsj+NGmY1TCfm2yzKo8W38Zg0mMf3CvkiT0Y
 4dIBwsnezr0oZTy2M9PLgfWxqTTbIGWztwOmxJKTxbbEJcl6i+8vITrbAAvSwengrrV+ Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s6xgcq48t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 02 May 2019 10:10:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 216373F;
 Thu,  2 May 2019 08:10:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3FCA12E0;
 Thu,  2 May 2019 08:10:13 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 10:10:13 +0200
Received: from localhost (10.129.4.86) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.361.1;
 Thu, 2 May 2019 10:10:13 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>
Date: Thu, 2 May 2019 10:09:58 +0200
Message-ID: <1556784606-3016-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.129.4.86]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_03:, , signatures=0
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH v3 0/8] stm32 m4 remoteproc on STM32MP157c
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

STMicrolectronics STM32MP157 MPU are based on a Dual Arm Cortex-A7 core and a
Cortex-M4.
This patchset adds the support of the stm32_rproc driver allowing to control
the M4 remote processor.

Changes since v2:
- Clarified "reg" description
- Change m4 unit adress to 38000000
- Renamed "auto_boot" in "st,auto-boot"
Changes since v1:
- Gave details about the memory mapping (in bindings).
- Used 'dma-ranges' instead of 'ranges'.
- Updated the 'compatible' property.
- Remove the 'recovery', 'reset-names' and 'interrupt-names' properties.
- Clarified why / when mailboxes are optional.

Fabien Dessenne (8):
  dt-bindings: stm32: add bindings for ML-AHB interconnect
  dt-bindings: remoteproc: add bindings for stm32 remote processor
    driver
  remoteproc: stm32: add an ST stm32_rproc driver
  ARM: dts: stm32: add m4 remoteproc support on STM32MP157c
  ARM: dts: stm32: declare copro reserved memories on STM32MP157c-ed1
  ARM: dts: stm32: enable m4 coprocessor support on STM32MP157c-ed1
  ARM: dts: stm32: declare copro reserved memories on STM32MP157a-dk1
  ARM: dts: stm32: enable m4 coprocessor support on STM32MP157a-dk1

 .../devicetree/bindings/arm/stm32/mlahb.txt        |  37 ++
 .../devicetree/bindings/remoteproc/stm32-rproc.txt |  63 +++
 arch/arm/boot/dts/stm32mp157a-dk1.dts              |  52 ++
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |  52 ++
 arch/arm/boot/dts/stm32mp157c.dtsi                 |  20 +
 drivers/remoteproc/Kconfig                         |  15 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/stm32_rproc.c                   | 628 +++++++++++++++++++++
 8 files changed, 868 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
 create mode 100644 drivers/remoteproc/stm32_rproc.c

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
