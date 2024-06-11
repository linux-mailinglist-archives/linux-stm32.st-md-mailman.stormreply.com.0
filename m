Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B69036A9
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 10:38:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6982BC6C858;
	Tue, 11 Jun 2024 08:38:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70A3BC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 08:37:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B7gFLB011602;
 Tue, 11 Jun 2024 10:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=mKl1FJjv6aNsO+n3RrXdiV
 rleeoiVRhZbFPafOGKwOc=; b=yvWnJiDax/74lokVBoMoTIwioIsQ+Cuz8v1Bd+
 z0t/eo31ULnw08Y70XHpDkSXiALLMkp0aGwgk4G62iFOSvI51helcfF1ADiiykuu
 raVgsw+9q2tEoCcrLF6H2f5z/so61GMObQsGrcrDFjczpnhwrK0E1vzs99xSR6tN
 ZbBYbIifKMn5cNKQ3eTdMZwjI/kt8NN7YHdZlIQ7qD24xtdy1l3Se2MzNTI68m/W
 LLeZYFBoGdd/mZYUZcmsNZgKy/HfOaWoiNH+Mle0fDZPiSnLZ9+14l0SfIxYsGYF
 noI8XXiErUZKPqh0CcT2UOAlreCi3DCV1OuCsLSBJ6txWCwQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp3srxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 10:37:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D68440044;
 Tue, 11 Jun 2024 10:37:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2522E21072C;
 Tue, 11 Jun 2024 10:36:19 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 10:36:18 +0200
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
Date: Tue, 11 Jun 2024 10:35:58 +0200
Message-ID: <20240611083606.733453-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_04,2024-06-11_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [net-next,
	PATCH v7 0/8] Series to deliver Ethernet for STM32MP13
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
V7: - Remark from Marek (update sysconfig register mask)

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
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 178 ++++++++++++++----
 2 files changed, 173 insertions(+), 48 deletions(-)


base-commit: bb678f01804ccaa861b012b2b9426d69673d8a84
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
