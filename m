Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4D65C17D
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jan 2023 15:08:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C648C65E73;
	Tue,  3 Jan 2023 14:08:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18169C65E55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 14:08:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303AaKiI020960; Tue, 3 Jan 2023 15:08:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=JvnhIL5oAgmZkSvjtm2o52Uw3QrIZiofYAehETdAz6A=;
 b=8ZsumrgGQyHXjFoCmYfLFRZk9oYXaCC2MCshXMjR5ZRmCs+pt7YHqsmeschXDS0bXEP6
 nGm1FBCfGM6vGdKdP9PsWcueoLZ+zzF3GC4NYZEmT8i8dWqE0yru6ENuB/bAsWCuk1FR
 f+J1A7DCaKYHLMtzvLLNs+InrY3h/u9DJ/AcReBgz87h6CB5bylJtodwkvatMS3fav6W
 vOZURgGqZYz+GXckvzLOjxwJkt1zLL5mcHZgdXv1EwkRjpJsusnprOFNiZbfG0Bkk7bX
 33Bpiv3xBzrWHGK38pn05qvkPvCfFUR45gluM/ghjpa+i6/Mcss26erou9Lt5zF+DUpr oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtb3e5hax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 15:08:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59C9010002A;
 Tue,  3 Jan 2023 15:08:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50595224401;
 Tue,  3 Jan 2023 15:08:03 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 15:08:03 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>
Date: Tue, 3 Jan 2023 15:05:18 +0100
Message-ID: <20230103140521.187678-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_04,2023-01-03_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/3] nvmem: stm32: add OP-TEE support for
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


The v4 patchset is rebased on next-20221226.

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
 drivers/nvmem/stm32-romem.c         |  83 +++++++-
 6 files changed, 471 insertions(+), 4 deletions(-)
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
