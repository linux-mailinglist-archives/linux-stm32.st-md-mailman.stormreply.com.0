Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F23B0C2B1
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 13:21:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20781C32E92;
	Mon, 21 Jul 2025 11:21:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2FC9C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 11:21:05 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAtLFJ014258;
 Mon, 21 Jul 2025 13:20:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 955QZJHfhcEley/vJbyCk7ZcWkD2UeHWiE0C8+nVSe8=; b=IT/Qd6YL0yhFQr90
 Ad7QitA+nQRWf0JYQ6bq5TSzBWusWarlglO0ksdJ/dQvgaktP08woBGYJFfyqW1M
 +ucQd3wm5G3E2YmjjVH9RDqBeUiYxc8FhS3qNFl1aaTzzjx5T9BI4MLjajILN0U5
 CCbpwzRJuvfnzDZplV59rPbWLVcapiwvaqmsC3rg0n6EGPySnfwslakpXyijc9LS
 BNEF0SXbO0Es8oon8eCF4dyWeNaGm6TWU3ZhdZtStBYq6yFG+YgEEk+yykg7mcmp
 vSgwUokbiWdNRZECr46oA4wnbmgAq89xIJHO+neI+a6b4mY4ak2ExBTca/KhOiEY
 Ue7zBA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4dmgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jul 2025 13:20:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D2A5740051;
 Mon, 21 Jul 2025 13:19:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CBB27A3215;
 Mon, 21 Jul 2025 13:17:47 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 13:17:47 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 21 Jul 2025 13:14:44 +0200
MIME-Version: 1.0
Message-ID: <20250721-wol-smsc-phy-v1-2-89d262812dba@foss.st.com>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
In-Reply-To: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=UZ1RGzROAmud2oPQYSiD/41Sq+zS8ABh3mzy3oknNcw=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBofiHYj6YyxaVv8otNTm2Mztbpey5EI//ckipQF
 9t9jgv7BFOJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaH4h2AAKCRCq90auhvHD
 KGYjDACgwcoyexhsHPQo9j18Ul30qI4R8V8lv+2yu3w9IOp5s/BFrHzwHViVrApaih7L5bFQu0i
 KmSJHACNrFAztqF+dqD2KzcbeW2pgoMwIPrKSSMXh8sI6BWM349trNyQoXZ2HKj9TxzQ/SuvlVh
 jyAXrLTdm2DhIbrQEDsxpUvBoNGoQrjh1kfwgQvUeBadQAzTibZZuSiSUKN8W0wcBD9o3g7Oxfv
 vjntTF3STWL6a8bOsTwwr3KgFvB6cOVpze7wL66yY8GPYA9pTJgRsXc1Y/LRvZ7ZtZEv5F8K3He
 Um54/2kI8V8jrkyvtejbJc+7JAANpoGq8lQGiF4wY00R+SGpwTnGwGl278WAeul7JYxo6MrYNG8
 jLv1ctTQHKHSKhzMtJqyIzWxiYyyXFbr6Y5IHFZT4xTMLezRHkECAPDkVWlVktbMedJCMnwooNF
 KlgH7Q4aTmBcQ5ZuiNQdwq+ZpiXX8RjFap0xI5qH6EeEuU7jfV8qLEYTszqowIwTc1+RI=
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
Subject: [Linux-stm32] [PATCH net-next 2/4] net: stmmac: stm32: add WoL from
	PHY support
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

If the "st,phy-wol" property is present in the device tree node,
set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
the PHY.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1eb16eec9c0d26eb21238433a77d77b4486f4ac3..443d4cec5d8c6bf074c2fabc75b97997b1020fe8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -106,6 +106,7 @@ struct stm32_dwmac {
 	u32 speed;
 	const struct stm32_ops *ops;
 	struct device *dev;
+	bool phy_wol;
 };
 
 struct stm32_ops {
@@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 		}
 	}
 
+	dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
+
 	return err;
 }
 
@@ -535,6 +538,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 	plat_dat->bsp_priv = dwmac;
+	if (dwmac->phy_wol)
+		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
 
 	ret = stm32_dwmac_init(plat_dat);
 	if (ret)

-- 
2.35.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
