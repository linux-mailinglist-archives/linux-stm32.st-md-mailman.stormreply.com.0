Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99164851BFD
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 18:49:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DAA7C6C83C;
	Mon, 12 Feb 2024 17:49:55 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D7F8C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 17:49:53 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CBflad027664; Mon, 12 Feb 2024 18:49:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=iG9lTCL
 5x6tc33cbUiqDXTjCZznE1C2VEmTB9j9Cvs0=; b=QEG6TZ6HWjBuHT1COxwVc/y
 B2AAMbrvZNHVl3zs8mqxcOSbPuydF4pEuJQoT2OwoDOp6QFtn7pmPugAjPyW8uBv
 L3t5N/5BKibv6CLVWPqjAdhpuCDn3YQ1KpBNLlmPx3B1K8nNNtOxDP+N7crSg2DI
 e+iKUvoZs3nZzv60K8TcyKH0eeXSkJ9WzXh1JOJbz1bzCmLlu/bDfFp9eW1/Uc8f
 8Rk9B/ptw1ZH6Rv73vHCQKhX8WbujlQpgxjcsTCIvtxYR8Ir4smWxSUWnJaH3I30
 r9PfTuiV4eAZi8ZmI/KmTqmR5uEX/qwKDrO5Qqzli6+cft7oaXs4x6Fi2gBDpIQ=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6mynd420-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:49:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CAA840045;
 Mon, 12 Feb 2024 18:49:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AABF427B40C;
 Mon, 12 Feb 2024 18:48:39 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:48:39 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Date: Mon, 12 Feb 2024 18:48:10 +0100
Message-ID: <20240212174822.77734-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_15,2024-02-12_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 00/12] Add MP25 FMC2 support
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

Add MP25 SOC support in stm32_fmc2 drivers:
 - Update stm32-fmc2-ebi driver to support FMC2 revision 2 and MP25 SOC.
 - Update stm32_fmc2_nand driver to support FMC2 revision 2 and MP25 SOC.

Christophe Kerello (11):
  dt-bindings: memory-controller: st,stm32: add MP25 support
  memory: stm32-fmc2-ebi: add a platform data structure
  memory: stm32-fmc2-ebi: add MP25 support
  memory: stm32-fmc2-ebi: update the driver to support revision 2
  memory: stm32-fmc2-ebi: add RIF support
  memory: stm32-fmc2-ebi: add runtime PM support
  dt-bindings: mtd: st,stm32: add MP25 support
  mtd: rawnand: stm32_fmc2: use dma_get_slave_caps to get DMA max burst
  mtd: rawnand: stm32_fmc2: add a platform data structure
  mtd: rawnand: stm32_fmc2: add MP25 support
  mtd: rawnand: stm32_fmc2: update the driver to support revision 2

Patrick Delaunay (1):
  dt-bindings: memory-controller: st,stm32: add 'power-domains' property

 .../memory-controllers/st,stm32-fmc2-ebi.yaml |   7 +-
 .../bindings/mtd/st,stm32-fmc2-nand.yaml      |  58 ++-
 drivers/memory/stm32-fmc2-ebi.c               | 445 ++++++++++++++++--
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 108 ++++-
 4 files changed, 547 insertions(+), 71 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
