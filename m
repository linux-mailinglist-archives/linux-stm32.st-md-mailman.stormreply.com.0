Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE718F7D9
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2020 15:59:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7504EC36B0B;
	Mon, 23 Mar 2020 14:59:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E72CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2020 14:59:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02NEbU8j023776; Mon, 23 Mar 2020 15:59:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=yoIK90tuRPwC25Pp82+brJU/Ki+zCwsNgXSgRHpTEmE=;
 b=Kw3F0Qfj9wlZpMlmthXNy16b7cAByjyv0hCtOmt2Vsd0LTpUkldMQtGiZfNnLmwRd0/y
 NjI3EiWmbJ7L5Ou2DGpPjx22IWML4GfSKi4y8Z3eVvUXrd1APMe9MCib1Lh4RrGfZgHE
 b3v6mf1ImKY2r4hPPKcZ4tONCXTprb9rFKMpP1fQgfVBLwky0SiyMIlGjhysdw3jpBEL
 sfTpWzF9+gH+CrawxPi2FU3yHTv0Zl+f+G1bsuUwt/6l6+BeTIT1tdAj9kjYTSvpj2cp
 PBogZxVkcemvcm5Dxt+iiQ92/ynA/cZz5G00YFJ9OUaCd4d4UBvcSRv+XM3kW/1b3qdf ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995ajb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 15:59:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2E8910003A;
 Mon, 23 Mar 2020 15:59:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA321220F81;
 Mon, 23 Mar 2020 15:59:18 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 23 Mar 2020 15:59:18 +0100
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <tony@atomide.com>
Date: Mon, 23 Mar 2020 15:58:40 +0100
Message-ID: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_05:2020-03-21,
 2020-03-23 signatures=0
Cc: marex@denx.de, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [00/12] add STM32 FMC2 controller drivers
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

The FMC2 functional block makes the interface with: synchronous and
asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
peripherals) and NAND flash memories.
Its main purposes are:
  - to translate AXI transactions into the appropriate external device
    protocol
  - to meet the access time requirements of the external devices
All external devices share the addresses, data and control signals with the
controller. Each external device is accessed by means of a unique Chip
Select. The FMC2 performs only one access at a time to an external device.

Christophe Kerello (12):
  dt-bindings: mfd: stm32-fmc2: add STM32 FMC2 controller documentation
  mfd: stm32-fmc2: add STM32 FMC2 controller driver
  bus: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
  mtd: rawnand: stm32_fmc2: manage all errors cases at probe time
  mtd: rawnand: stm32_fmc2: remove useless inline comments
  mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS for timeouts
  mtd: rawnand: stm32_fmc2: cleanup
  mtd: rawnand: stm32_fmc2: use FIELD_PREP/FIELD_GET macros
  mtd: rawnand: stm32_fmc2: move all registers
  mtd: rawnand: stm32_fmc2: use regmap APIs
  mtd: rawnand: stm32_fmc2: use stm32_fmc2 structure in nfc controller
  mtd: rawnand: stm32_fmc2: add new MP1 compatible string

 .../devicetree/bindings/mfd/st,stm32-fmc2.yaml     |  370 ++++++
 drivers/bus/Kconfig                                |   11 +
 drivers/bus/Makefile                               |    1 +
 drivers/bus/stm32-fmc2-ebi.c                       | 1093 +++++++++++++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/stm32-fmc2.c                           |  120 ++
 drivers/mtd/nand/raw/Kconfig                       |    3 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             | 1273 +++++++++-----------
 include/linux/mfd/stm32-fmc2.h                     |  226 ++++
 10 files changed, 2407 insertions(+), 703 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
 create mode 100644 drivers/bus/stm32-fmc2-ebi.c
 create mode 100644 drivers/mfd/stm32-fmc2.c
 create mode 100644 include/linux/mfd/stm32-fmc2.h

-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
