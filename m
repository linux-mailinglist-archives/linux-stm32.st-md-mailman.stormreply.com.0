Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35784901C4C
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 10:05:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE66C78006;
	Mon, 10 Jun 2024 08:05:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48D97C71286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 08:05:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A7jaH3009359;
 Mon, 10 Jun 2024 10:04:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=IEtb4KLuy/9rGMriSQ9JkQ
 yG0IXoKUzi25O4/LQFtO8=; b=EKlc5Pgy67pFTY7YxSLbs6/5yrQv1S+vhYh5vB
 LJlrC/eG08VIPRwFPDVRUoEt1FGPpDRaFNoFYK/zZJpGzVPGHrhTBENAw/pLUwcv
 iDxw/qdw7U71jRjBAQWeDOGYaP09P957DxvwjQRB3U0G4WNPooXljE2G4LucP3Eu
 X3Y89juXdKn7LDaS9IFDFExLIHx7bqmVD223SQdFFTRiadUVKWQlRRiToGTnQYsh
 B1IATxlxp5SijUys3MZr0VCtq6DVMpCFSEUdzn4b+/fMxPdp+z6FW7AVXuMLNw7p
 CQQX7D7vh9cYX8CK/E6nAsfYi/gCqRe1/cyTckRsKgAJ26Jw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ymemxnp94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 10:04:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 12DD140047;
 Mon, 10 Jun 2024 10:04:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3C6B621197C;
 Mon, 10 Jun 2024 10:03:34 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 10:03:31 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Mon, 10 Jun 2024 10:03:06 +0200
Message-ID: <20240610080309.290444-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/3] Series DTs to deliver Ethernet for
	STM32MP13
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

STM32MP13 is STM32 SOC with 2 GMACs instances
    GMAC IP version is SNPS 4.20.
    GMAC IP configure with 1 RX and 1 TX queue.
    DMA HW capability register supported
    RX Checksum Offload Engine supported
    TX Checksum insertion supported
    Wake-Up On Lan supported
    TSO supported

Christophe Roullier (3):
  ARM: dts: stm32: add ethernet1 and ethernet2 support on stm32mp13
  ARM: dts: stm32: add ethernet1/2 RMII pins for STM32MP13F-DK board
  ARM: dts: stm32: add ethernet1 for STM32MP135F-DK board

 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 71 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp131.dtsi        | 38 +++++++++++
 arch/arm/boot/dts/st/stm32mp133.dtsi        | 31 +++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 23 +++++++
 4 files changed, 163 insertions(+)


base-commit: 28f961f9d5b7c3d9b9f93cc59e54477ba1278cf9
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
