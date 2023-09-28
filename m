Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7957B1C55
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 14:27:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A57A1C6A60C;
	Thu, 28 Sep 2023 12:27:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45347C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 12:27:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38S8F5w3017039; Thu, 28 Sep 2023 14:27:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=zemeS+BhI32ZF8QdJ+UdBB3Jn6cezmIxj3rwJwlzC0U=; b=y5
 pbBMOy/hgkjB7Pu7dCU5UnBQI2yzPT4j3PJf1QYrbHhILPFT3M9wJAtr35JBnQQg
 fNQKjKEvCfH8XwK66OpYBdIbHQ5r9uoHpYxlogP5+rHHrxQR5o1x022uItlinxeR
 kr+x+vYrFVjFKtTeb+6gL3kUf3nSHy7p0nNlnqMZmdu10OJINgerP0x4I3R3rA+l
 cXsXQ3CyQtFWqC+Bg18/Q4YUv4qgDIXUCL2MWLBRz5L9BnJobVqTySoTGGovD/Of
 YyqDg3Pmb8mSHPKniQU8Q780jOLzq/ZsfbZ9C98ZOSACgQOCy33UukxEvKqalE0Z
 s15xU7KHEtAM78Y9wUhQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9nefxq7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 14:27:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30F38100058;
 Thu, 28 Sep 2023 14:27:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 292012309ED;
 Thu, 28 Sep 2023 14:27:02 +0200 (CEST)
Received: from localhost (10.201.21.249) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 14:27:01 +0200
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
Date: Thu, 28 Sep 2023 14:24:27 +0200
Message-ID: <20230928122427.313271-13-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928122427.313271-1-christophe.roullier@foss.st.com>
References: <20230928122427.313271-1-christophe.roullier@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 12/12] ARM: multi_v7_defconfig: Add
	MCP23S08 pinctrl support
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

Need to enable MCP23S08 I/O expanders to manage Ethernet phy
reset in STM32MP135F-DK board
STMMAC driver defer is not silent, need to put this config in
built-in to avoid huge of Ethernet messages

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 23fc49f23d255..373f58f2d5b98 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -458,6 +458,7 @@ CONFIG_SPI_XILINX=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_AS3722=y
+CONFIG_PINCTRL_MCP23S08=y
 CONFIG_PINCTRL_MICROCHIP_SGPIO=y
 CONFIG_PINCTRL_OCELOT=y
 CONFIG_PINCTRL_PALMAS=y
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
