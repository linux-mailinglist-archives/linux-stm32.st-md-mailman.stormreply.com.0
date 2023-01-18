Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EE6724EF
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 18:30:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEDBBC69049;
	Wed, 18 Jan 2023 17:30:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14A49C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 17:30:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IDK3iJ020807; Wed, 18 Jan 2023 18:29:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=SdOetiYgPcMw3qvd+XPDduke2B2OTvZvs1GFc3/68Eo=;
 b=nyRg+fUxWXpgd81vKVUIM0oRMBSzkK82st4SUaQG8dmtQBmNGd6DWIeczaxhzVESlyAo
 Te3r0y72DJ6kBCGsuEuJ7X7fOHGHAPqrQOllScLnBgkT8cB0XDmaR9P/dhOPNREhAjeF
 cmV0F+rG7iPJMht+9rDdgbK4R4mII2XIRlAB6/nY0jSTCwc6DuRpy76B1Mj7scmmY1Si
 zxpPwLVFCzkWXwHDdvF+7LK2a9zdsJvTZvzs8qDWf7WbdMq6MmIPZ6jrxiDi/liYyTRW
 s/50pY8sX34zCdob5eoxa0Wa5vzkqDhsE+OFU3mfxIr8BKWU96YhEqKar4IWcaBVsa2W MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n3jpr9hnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 18:29:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE3C5100034;
 Wed, 18 Jan 2023 18:29:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7321A228A21;
 Wed, 18 Jan 2023 18:29:48 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 18 Jan
 2023 18:29:46 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Date: Wed, 18 Jan 2023 18:29:36 +0100
Message-ID: <20230118172940.841094-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/3] nvmem: stm32: add OP-TEE support for
	STM32MP13x
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


The v5 patchset is rebased on next-20221226.

This serie update the NVMEM BSEC driver to be compatible with STM32MP13x
SoC and the trusted application STM32MP BSEC in OP-TEE

This serie solve issue in initial support of STM32MP131
(using BSEC STM32MP15 compatible) and so it break the STM32MP13x DTS
compatible.

I create this serie for more efficient review, including support for
STM32MP15x.

The first patches of the V1 series is already merged:
"dt-bindings: nvmem: add new stm32mp13 compatible for stm32-romem"

This STM32MP13x DTS break is acceptable as
- the STM32MP13x SoC is not yet available outside STMicroelectronics
  (not official)
- the same patch is already integrated or modifications are in progress in
  the other users (arm-trusted-firmware/TF-A, OP-TEE and U-Boot) of
  stm32mp131 device tree.

It is the good time to correct this issue before the real availability of
the SoC and before full support of STM32MP13x SoC in Linux kernel.

Regards

Patrick

Changes in v6:
- Add reviewed by  Etienne Carierre review
- added reviewed by Etienne Carriere

Changes in v5:
- minor changes after Etienne Carierre review (comments,
  change %x to %#x, remove goto to out_tee_session)
- update the BSEC SMC detection logic in stm32_romem_probe()
  after Etienne Carierre review to support NVMEM probe after OP-TEE probe

Changes in v4:
- fixe warning reported by kernel test robot for 64 bits support in
  drivers/nvmem/stm32-bsec-optee-ta.c:260:18:
  warning: format '%d' expects argument of type 'int',
  but argument 4 has type 'size_t'

Changes in v3:
- add a separate file stm32-bsec-optee-ta.c with STM32MP BSEC TA
  communication functions to avoid #if in romem driver.
- use of_find_compatible_node in optee_presence_check function
  instead of of_find_node_by_path("/firmware/optee")

Changes in v2:
- rebase series on linux-next/master
- minor update after V1 revue

Changes in v1:
- update commit message to indicate DTS break reason.

Patrick Delaunay (3):
  ARM: dts: stm32mp13: fix compatible for BSEC
  nvmem: stm32: add OP-TEE support for STM32MP13x
  nvmem: stm32: detect bsec pta presence for STM32MP15x

 arch/arm/boot/dts/stm32mp131.dtsi   |   2 +-
 drivers/nvmem/Kconfig               |  11 +
 drivers/nvmem/Makefile              |   1 +
 drivers/nvmem/stm32-bsec-optee-ta.c | 298 ++++++++++++++++++++++++++++
 drivers/nvmem/stm32-bsec-optee-ta.h |  80 ++++++++
 drivers/nvmem/stm32-romem.c         |  84 +++++++-
 6 files changed, 472 insertions(+), 4 deletions(-)
 create mode 100644 drivers/nvmem/stm32-bsec-optee-ta.c
 create mode 100644 drivers/nvmem/stm32-bsec-optee-ta.h

base-commit: c76083fac3bae1a87ae3d005b5cb1cbc761e31d5
prerequisite-patch-id: 5aaa8fffbdd16871143808180b3932d80f4045d0
prerequisite-patch-id: ae711dc528e191e4751cbb7402041fc5f185d6b3
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
