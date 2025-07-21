Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35859B0C2AD
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 13:20:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5378C32E92;
	Mon, 21 Jul 2025 11:20:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2EDAC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 11:20:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LBF4uV010018;
 Mon, 21 Jul 2025 13:20:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=QoQzhe6ekd1hJ/ZaGFBf7S
 uWNDyQBUmJcxHnIpw3sJo=; b=f+MNoPkA81GS0ddC+vRkWKScn7mJWfwYPUyRW7
 XZJmRdGSwTMUE5uvYHglUdBFeVAhFVGXAbuILaIcG+hyScev0nWbGxGecVIx5RiI
 8cLwbfUiotFU7Ps6qYpabzHGtkubsNLnVSYwX6OcrCfMtXF/8pjyxnfUlBx+OXZl
 lH2u9kn+2/UE4tuo3ZDFUbPA/j6HQ1icM1WxzJ2twf2YHevb+IClmcIH9emng2cd
 KyiS5scrri0zbfnGxmP9pRO0dTdirw86qHN6Ts/tgCE4nfG0oW64qcto+cK9YEaj
 nv99cq/rqBYlMZcA/Dy/8lOR9a8jDiEI2CvVGPo5OFj9s+cg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028g06fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jul 2025 13:20:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 829A34005A;
 Mon, 21 Jul 2025 13:18:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31CEA7A16C6;
 Mon, 21 Jul 2025 13:17:46 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 13:17:45 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 21 Jul 2025 13:14:42 +0200
Message-ID: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACMhfmgC/x3MTQ5AMBBA4avIrE1SRTSuIhZ+pkxCSUeoiLtrL
 L/Few8IeSaBOnnA08nCm4vI0gSGuXMTIY/RoJUuVaUzvLYFZZUB9/lGa/O+UKYwptQQk92T5fD
 vGnB0oKNwQPu+H00czfVoAAAA
X-Change-ID: 20250721-wol-smsc-phy-ff3b40848852
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Tristram Ha <Tristram.Ha@microchip.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=tdvpUOKEzaCuWOlkS6WWclQSY25kc0lUfypoOsiSomo=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBofiHXy5WQo9qc1HiPHV335Rofl8r2vNOuoDj9F
 zaycVnIc9SJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaH4h1wAKCRCq90auhvHD
 KEoyDACpQVS5/Izrchq3yuy2z2bCLfPWIGikxbq7ATHBiU+P9gSlnbZGyf7i6NVMoNzKpO5pMbM
 MUfCKhHbWFK3hUTf03KEejPD9xFPir09Se0oxxSlWb1EvWth5tLq9ggZrKi+Qbyi6G4fBLYQyO2
 UkBVYClMWPeH9oBQY+9XLH2oT27hKzOX/R1P5F53EmzylJdOj4VoX4IszXNHKsU/BHoNi2j2yuC
 iXRKns9uhl2LzqG6MCxxRxf+IQ6cdxxwbVy9DOHFjzP3vRj+4/5yuTAOWTtt4zKzTwtwHEGU2+V
 JjJQazacVp/t8PhugNingGDOQnl/FkA9A0QpCammNBF5UODs0ulrQOLvASf6AabV2bp4I4FXyaP
 t+wESNtmNix3gC/DyrZL7CahvvXuynI5/3sBHgSuNr0jvq1ThWpVx96nj5Iu/rNLKaIo+B0Wc6f
 keGvnelxrUzjdZzN/bfbRqta/U7m6mGiuPYp5AZxdUcHv/yks4EyQt6Bq9wuaUIN2U3OE=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/4] net: add WoL from PHY support
 for stm32mp135f-dk
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

A previous patchset in drivers/net/phy/smsc.c introduced the WoL
from PHY capability of some PHYs. The Microchip LAN8742 PHY is
present on the stm32mp135f-dk board and posesses this capability.

Therefore, add the possibility to specify in the device tree that,
for a MAC instance, we want to use the WoL from PHY capability
instead of the MAC one.

However, when testing multiple power sequences with magic packets,
the first one succeeded but the following ones failed. This was
caused by uncleared flags in a PHY register. Therefore, I added
a patch to add suspend()/resume() callbacks that handle these.
These callbacks are only implemented for the Microchip LAN8742 as I
have no way of testing it for other WoL capable PHYs.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Gatien Chevallier (4):
      dt-bindings: net: document st,phy-wol property
      net: stmmac: stm32: add WoL from PHY support
      net: phy: smsc: fix and improve WoL support
      arm: dts: st: activate ETH1 WoL from PHY on stm32mp135f-dk

 .../devicetree/bindings/net/stm32-dwmac.yaml       |  6 ++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  |  5 +++
 drivers/net/phy/smsc.c                             | 42 +++++++++++++++++++---
 include/linux/smscphy.h                            |  2 ++
 5 files changed, 52 insertions(+), 4 deletions(-)
---
base-commit: 4701ee5044fb3992f1c910630a9673c2dc600ce5
change-id: 20250721-wol-smsc-phy-ff3b40848852

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
