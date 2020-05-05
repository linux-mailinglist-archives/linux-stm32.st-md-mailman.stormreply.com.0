Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AE1C5E75
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 19:14:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB4E6C35E2B;
	Tue,  5 May 2020 17:14:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00395C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 17:14:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045Gvi9w012978; Tue, 5 May 2020 19:13:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=saX4lP2HLA+Ud4B3Z1FOStFfoSHeb14YlpgoOtNGAF0=;
 b=vXlbdvLtyJIimTN46SAZTQ6jBEY9Z6ResaovlEBOFBaRlGGoXHxYZ+qNczOsGQxJ96jV
 rVYfnsDjHJZI5Q4ZOBWZtvQhAn5faghP1BAZYKgiG7/p6VCSArYauJVutVa6kCUflWbV
 GRhUCesqGIQWPAsJLyEfsvrx/I6ctpvw5QPSz2QJgv2syRtfT+L/65JkvzuzsfPPBrYq
 OeG9+tG/BKYmWqxQyjL8vrTyJ3Y8zU2ZcJYPUi965/PGZS3ekltf1a2cJt7ibsZebqHv
 6uk4Kvtcbjgockox58d1dj5hXZWBlJ1mBYPg9byE+GGLj3Sv5bbqtbniDgx2gukh39Rj 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30ryrj9de1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 19:13:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8975D100034;
 Tue,  5 May 2020 19:13:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DF032B5A79;
 Tue,  5 May 2020 19:13:36 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 5 May 2020 19:13:35 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <gregkh@linuxfoundation.org>, <boris.brezillon@collabora.com>
Date: Tue, 5 May 2020 19:10:58 +0200
Message-ID: <1588698668-25288-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_09:2020-05-04,
 2020-05-05 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 00/10] add STM32 FMC2 EBI controller driver
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

Changes in v3:
 - NAND:
   - rename labels used on errors
   - add in the commit log the reason to increase FMC2_TIMEOUT_MS (patch 3)
   - add Miquel reviewed-by tag (patches 2/4/5/9)
 - EBI:
   - move in memory folder
   - merge MFD and BUS drivers to avoid a MFD driver
 - bindings:
   - pattern name has been modified
   - vendor properties have been modified
     - s/_/-/
     - add unit suffix (-ns) on timing properties

Christophe Kerello (10):
  mtd: rawnand: stm32_fmc2: manage all errors cases at probe time
  mtd: rawnand: stm32_fmc2: remove useless inline comments
  mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS for timeouts
  mtd: rawnand: stm32_fmc2: cleanup
  mtd: rawnand: stm32_fmc2: use FIELD_PREP/FIELD_GET macros
  dt-bindings: mtd: update STM32 FMC2 NAND controller documentation
  dt-bindings: memory-controller: add STM32 FMC2 EBI controller
    documentation
  memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
  mtd: rawnand: stm32_fmc2: use regmap APIs
  mtd: rawnand: stm32_fmc2: get resources from parent node

 .../memory-controllers/st,stm32-fmc2-ebi.yaml      |  261 +++++
 .../bindings/mtd/st,stm32-fmc2-nand.yaml           |   19 +-
 drivers/memory/Kconfig                             |   10 +
 drivers/memory/Makefile                            |    1 +
 drivers/memory/stm32-fmc2-ebi.c                    | 1206 ++++++++++++++++++++
 drivers/mtd/nand/raw/Kconfig                       |    1 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c             | 1176 ++++++++++---------
 7 files changed, 2061 insertions(+), 613 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
 create mode 100644 drivers/memory/stm32-fmc2-ebi.c

-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
