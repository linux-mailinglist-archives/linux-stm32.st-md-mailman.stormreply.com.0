Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0122901B9E
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 09:17:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93759C712A2;
	Mon, 10 Jun 2024 07:17:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D14A6C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 07:17:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459Lv4or018093;
 Mon, 10 Jun 2024 09:16:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=ywgMJ0d2V3+vIlguLKK9it
 AB89YC4L19ERf/9tF4bzM=; b=VeBkoF70/fwECtDm4mHRr0Zb2ky3B6Yvxu6Rj/
 BVbEoElFZzv1eAOAYlfs5z6718PeInL+KrTc7o1TOkKScQFd6pH1wNfhg2EuCxFF
 NzZMR+bUqseslvwu71xf0PJzXpe2qE8zdAWXZAHXyusuMcMX+199nWP/XHN8ZLke
 Y4JsajJzcWgxvM7a+qCUy67pzhRzWBKJtX2dFRvHg7b0YxgKGeXmJXkpUrpX26OE
 kD3Uy8xYQADW2zeIFbfGDwm0T7t+/Zx677yd2iLspK2S+Bl0u9PLCpU4YHAI0IMd
 Rkt8n3NC8nHd04kzVRyMEQ59R5ixRIfP7f9WTLCuhoyoPpDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yme6d5cb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 09:16:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B42D40047;
 Mon, 10 Jun 2024 09:16:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75074210757;
 Mon, 10 Jun 2024 09:15:07 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 09:15:07 +0200
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
Date: Mon, 10 Jun 2024 09:14:51 +0200
Message-ID: <20240610071459.287500-1-christophe.roullier@foss.st.com>
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
Subject: [Linux-stm32] [net-next,
	PATCH v6 0/8] Series to deliver Ethernet for STM32MP13
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
Rework dwmac glue to simplify management for next stm32 (integrate RFC from Marek)

V2: - Remark from Rob Herring (add Krzysztof's ack in patch 02/11, update in yaml)
      Remark from Serge Semin (upate commits msg)
V3: - Remove PHY regulator patch and Ethernet2 DT because need to clarify how to
      manage PHY regulator (in glue or PHY side)
    - Integrate RFC from Marek
    - Remark from Rob Herring in YAML documentation
V4: - Remark from Marek (remove max-speed, extra space in DT, update commit msg)
    - Remark from Rasmus (add sign-off, add base-commit)
    - Remark from Sai Krishna Gajula
V5: - Fix warning during build CHECK_DTBS
    - Remark from Marek (glue + DT update)
    - Remark from Krzysztof about YAML (Make it symmetric)
V6: - Replace pr_debug by dev_dbg
    - Split serie driver/DTs separately 

Christophe Roullier (3):
  dt-bindings: net: add STM32MP13 compatible in documentation for stm32
  net: stmmac: dwmac-stm32: Mask support for PMCR configuration
  net: stmmac: dwmac-stm32: add management of stm32mp13 for stm32

Marek Vasut (5):
  net: stmmac: dwmac-stm32: Separate out external clock rate validation
  net: stmmac: dwmac-stm32: Separate out external clock selector
  net: stmmac: dwmac-stm32: Extract PMCR configuration
  net: stmmac: dwmac-stm32: Clean up the debug prints
  net: stmmac: dwmac-stm32: Fix Mhz to MHz

 .../devicetree/bindings/net/stm32-dwmac.yaml  |  43 ++++-
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 174 +++++++++++++-----
 2 files changed, 169 insertions(+), 48 deletions(-)


base-commit: 28f961f9d5b7c3d9b9f93cc59e54477ba1278cf9
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
