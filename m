Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 577F186705E
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 11:16:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E2A1C6C859;
	Mon, 26 Feb 2024 10:16:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D672DC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 10:16:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41Q734wL012481; Mon, 26 Feb 2024 11:16:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=jgDPDFK
 XvFbmudeTey1D/baBegkXRr3OBNhaAR0TYBo=; b=ShUMdVFrFFSAFax/Yk11wVu
 OnGxfuDZBm0CSqma9WBae/qb58XWND0yh2+Y3h67QzJRFtECXxvIIANACF6GDz0k
 TDW4k0vec0gr85ZfQmTgOVTFIr5HcwWj0Xdvs+GPWGggKorUX3rQSayrtb/a7oni
 RqEcWbP06KWRov3vhfiwbeyA5ht5G2831w06a0IZwlD1d1tASxT0RLmE7iZKVHlh
 /13HM6F0KhbIiC8jEmKai0keCTT2cubFtc2r/X22WZ3lSRiXk2DPkX9Xp02huVMx
 rtKxhzg2SRHLJhJKRKRdKNYKpcKdBrC7MLFpP+C1LF9p468ItZXYNvyqyNTy6cg=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wf8p26eqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 11:16:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 08F9440044;
 Mon, 26 Feb 2024 11:15:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0819925ED80;
 Mon, 26 Feb 2024 11:14:52 +0100 (CET)
Received: from localhost (10.201.21.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 26 Feb
 2024 11:14:51 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Date: Mon, 26 Feb 2024 11:14:23 +0100
Message-ID: <20240226101428.37791-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_07,2024-02-23_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/5] memory: stm32-fmc2-ebi: Add MP25 FMC2
	support
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

On MP1 SoC, RNB signal (NAND controller signal) and NWAIT signal (PSRAM
controller signal) have been integrated together in the SoC. That means
that the NAND controller and the PSRAM controller (if the signal is
used) can not be used at the same time. On MP25 SoC, the 2 signals can
be used outside the SoC, so there is no more restrictions.
    
MP1 SoC also embeds revision 1.1 of the FMC2 IP when MP25 SoC embeds
revision 2.0 of the FMC2 IP.

Changes in v3:
 - Simplify stm32_fmc2_ebi_save_setup function in patch 2.
 - Do not check non null ops in patch 3.

Changes in v2:
 - V1 patch 1 and 2 have been squashed and commit message has been updated.
 - V1 patch 3, 4 and 5 have been squashed and reworked.
 - V1 patch 7 has been renamed and associated commit message has been updated.
 - V1 patchset is split, one for memory, and another one for NAND. 
 - Regmap_read API return value is checked everywhere it is called.
 - A platform data structure is handling the difference between MP1 and MP25.

Christophe Kerello (5):
  dt-bindings: memory-controller: st,stm32: add MP25 support
  memory: stm32-fmc2-ebi: check regmap_read return value
  memory: stm32-fmc2-ebi: add MP25 support
  memory: stm32-fmc2-ebi: add MP25 RIF support
  memory: stm32-fmc2-ebi: keep power domain on

 .../memory-controllers/st,stm32-fmc2-ebi.yaml |   7 +-
 drivers/memory/stm32-fmc2-ebi.c               | 729 ++++++++++++++++--
 2 files changed, 686 insertions(+), 50 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
