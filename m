Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 388D17B1C2C
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 14:25:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEB16C6B476;
	Thu, 28 Sep 2023 12:25:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32C9FC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 12:25:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38S8XGKb001847; Thu, 28 Sep 2023 14:24:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=IsFOOmi
 4nAml8fnkKfJtzI5xW/IzPa/vkIZenzUzEzo=; b=Imdoxsn0sCo1H1Fb875VIQ8
 kf7YpDaFQFVWgWc6Axv7A1tKiWoHRuqADFYRSnm0ISlm4PUUdom0CUOmOZkpOS56
 ZwroG/Olne2a5aO0WLzs7ujteJtQ6m5a2UROidfKc7NZN2M7vf8drwQyiBI6kgFF
 yovU2ibHC4MiyLOeOPhSvuM/EJbEdEGFFCWccGlF47Brq56pcRv5G9QXgOXbiBxE
 eRlxcQLtMafS2QflvRw8Lk6bsFvIfrKI8mLPErCczhWPYNM5PeMqcrvMgHJTwLGu
 72kXDA2lSQKne0kf2Fy6aQiJhA2JwG8jAKcYf4qQ0hqF+4j3UlokRcWWlaFNpEQ=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9pwdf438-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 14:24:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E787C100067;
 Thu, 28 Sep 2023 14:24:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCCC62309DA;
 Thu, 28 Sep 2023 14:24:34 +0200 (CEST)
Received: from localhost (10.201.21.249) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 14:24:31 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
Date: Thu, 28 Sep 2023 14:24:15 +0200
Message-ID: <20230928122427.313271-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.249]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_11,2023-09-28_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 00/12] Series to deliver Ethernets for
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
This board have 2 RMII phy:
  -Ethernet1: RMII with crystal
  -Ethernet2: RMII without crystal
Rework dwmac glue to simplify management for next stm32

-V2: Update from remark of Andrew Lunn (split commit into a number of smaller patches)
     Update from Conor Dooley (yaml documentation)

Christophe Roullier (12):
  dt-bindings: net: add STM32MP13 compatible in documentation for stm32
  dt-bindings: net: add new property st,ext-phyclk in documentation for
    stm32
  dt-bindings: net: add phy-supply property for stm32
  net: ethernet: stmmac: rework glue to simplify management for next
    stm32
  net: ethernet: stmmac: add management of stm32mp13 for stm32
  net: ethernet: stmmac: stm32: update config management for phy wo
    cristal
  net: ethernet: stm32: clean the way to manage wol irqwake
  net: ethernet: stmmac: stm32: support the phy-supply regulator binding
  ARM: dts: stm32: add ethernet1 and ethernet2 support on stm32mp13
  ARM: dts: stm32: add ethernet1/2 RMII pins for STM32MP13F-DK board
  ARM: dts: stm32: add ethernet1 and ethernet2 for STM32MP135F-DK board
  ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support

 .../devicetree/bindings/net/stm32-dwmac.yaml  |  90 ++++++-
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi   |  71 ++++++
 arch/arm/boot/dts/st/stm32mp131.dtsi          |  31 +++
 arch/arm/boot/dts/st/stm32mp133.dtsi          |  30 +++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  48 ++++
 arch/arm/configs/multi_v7_defconfig           |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 229 +++++++++++++-----
 7 files changed, 425 insertions(+), 75 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
