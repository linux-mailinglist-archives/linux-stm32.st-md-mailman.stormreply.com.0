Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA5591D83D
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 08:50:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC4FBC71282;
	Mon,  1 Jul 2024 06:50:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8346C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 06:50:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45UJksoG012549;
 Mon, 1 Jul 2024 08:50:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NQhzgLCE7X5eZ858QNKORAqLKmNLabnQ1nRwLmnzabs=; b=lvvNlN3erwy79GkA
 V8jJhO+cY2yGpDbDXRGU1PE9wThBtK4gAqh9J9X61toDKPfmI2eDqhep1e55HRUW
 6iQ7qRTnEOz6lJ2VbmnRGbcMUZX6xPQjDOSMRmQyHF8laEGfLvnpGzQS9A76pbj6
 6le5krawuLkh3PBkYOHoPfsoWf+31NeBWySk1GVs2iEePJf06qHOsnoyLhsLtoHO
 Zvwax2DHC1Wh9LnDu/GnewAq6cN9fRhgnkNpHjooi4PKrPfJ5zznu1Uxwn80fDRa
 WEaO7hyW8UfhdeqUqnIGRs38xTVhJN5pKx/AYBGT0MgxwGGgEbSje3rH3YJuDtW0
 IAjJqQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4029kwn8dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2024 08:50:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0BED140046;
 Mon,  1 Jul 2024 08:50:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF9B0214D0C;
 Mon,  1 Jul 2024 08:48:48 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 1 Jul
 2024 08:48:45 +0200
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
Date: Mon, 1 Jul 2024 08:48:37 +0200
Message-ID: <20240701064838.425521-2-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701064838.425521-1-christophe.roullier@foss.st.com>
References: <20240701064838.425521-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_05,2024-06-28_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [net-next,
	PATCH v2 1/2] net: stmmac: dwmac-stm32: Add test to verify if ETHCK
	is used before checking clk rate
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

When we want to use clock from RCC to clock Ethernet PHY (with ETHCK)
we need to check if value of clock rate is authorized.
If ETHCK is unused, the ETHCK frequency is 0Hz and validation fails.
It makes no sense to validate unused ETHCK, so skip the validation.

Fixes: 582ac134963e ("net: stmmac: dwmac-stm32: Separate out external clock rate validation")

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Tested-by: Mark Brown <broonie@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 23cf0a5b047f..d6a268237ca1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -206,6 +206,9 @@ static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data *plat_dat)
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	const u32 clk_rate = clk_get_rate(dwmac->clk_eth_ck);
 
+	if (!dwmac->enable_eth_ck)
+		return 0;
+
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_GMII:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
