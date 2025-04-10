Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8EA83A31
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:05:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DEF8C78F68;
	Thu, 10 Apr 2025 07:05:11 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2117.outbound.protection.partner.outlook.cn [139.219.17.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ED42C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 07:05:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJRLwtZvaC9muYtMgLrcTDAPXSKZPlM76hc+sV+FD2Ohrvd1eZGHzV08KLPf1HAnOBO70X8sw3xRjef1ChmSp6B14Un3ZYR94g4It72DvgfgfUD7vJ51V3RJgbHf9QYIYgUPlVSsln5wZRhPe2w+hzBtFmI0F010XSQYWnXWBN1OGoraZo8TGHPF79mP5mlp3K1T1dAVlKGnMXB1zBlq1RmiJRwkpy58oM84aGFP0WsQkYk7hcQBzWbXdyJ7oGwm6Wr62K5A1Iehm4fNqjb9aOYnPrUv7aDpZw26+7tFzL8tfzEjbnQK01XCO2DOMMYTB6CS9L0E0XBC5FaeCCVQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rolDulr1iNlIPf0jBVjAa0V7GWrnZ+bUIlQe5KPSFsI=;
 b=D/xXu4fDvvQ0A91/ifums92huKi+JPLSn1SRrtJ0Oy05dWd6ZQAjOdDMTojYFJzw83dOHl0dq9A9BBEEuOQOdYYU/18MDjI6d+akBx5Oi+Iy3dXf835htQP93SoOyFJX18pGU3BvJd4/8TpJOsbSAPusHBYDNujHq9exC7iIp+nz/SkyNCrR0IsKVsUKr5L+Wzqow5feP5mcznfP2HybMlmc7WE16QQR3bX2nIHUOM7LYZ1Tpqo3qea2ESBfbBCL5cz8Go1Xtx8MmF5ATGaAOwyCPcjmYDmPIwYdpL3LXEHHwz0TLwKCBcOTN6bICNq5PYXjDnYaZxiV5Gxw3yLCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0637.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 07:05:03 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::3f35:8db2:7fdf:9ffb]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::3f35:8db2:7fdf:9ffb%6])
 with mapi id 15.20.8632.021; Thu, 10 Apr 2025 07:05:03 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org
Date: Thu, 10 Apr 2025 15:04:53 +0800
Message-Id: <20250410070453.61178-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: NT0PR01CA0034.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::11) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0637:EE_
X-MS-Office365-Filtering-Correlation-Id: 91611e45-5b39-4563-0f60-08dd77fe03fa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|366016|41320700013|38350700014; 
X-Microsoft-Antispam-Message-Info: UvmIHG/DFABKe10ZvULLK1NDn6iGro1MQyTMw19qXPkF4QYno8MjokWlgRoyLx/tiznfiY5YAtGmrbhbXQW2fTjHak/4aysYyI8RK9Xjb5SVkYidqZ57CPwk/+ILO8/rMMx41VBQcsQb8h3tEWhyYOcplw5wI74lPwyji+iO+lUpDrbN1H9i738qIpjlF578BFdwquEisbO1it4+lniPN7JWiyBQNb6jMJoM8rEqVlefRCA6lY1koGU1cw1L4e29jLal6gX8SnryEuRnKn96xZxSS3LLoH45FLM5gGJnkMTWdQUApmVuGdP5x4M2A9DwiDNbcVezuMLkLNVc0hr8j6/TqFbRDopuWahRWDZwsML5yt2mI+4IzPXtPH3aFnCJocaRkrjHFZXoF4R5m1tGnPnac+5dWYd7gpbYbXeKNSRywMG0EPo1CE/G6zWjpq3L3aqldOJHc/eMw/8F3sYCHldwqOq+HDUEjM+BV+qcOkevbLozqK+GzKJ6N0FpgmMky/gNDuc7n4MK1Vz8e00ZUP26bneHfnOFsxiMg8y5LeP89RUEf+5TUlLNsyBrLz8/2g3uJp2/TICBk7SWaYCY5Hinoo0mswLudFCqjmvruvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(41320700013)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rZNSx6W73C6Nl4Ngs79CCf+wXHOsGwupaDhDOSbk8uI4YojZ/CmS9IYRZs83?=
 =?us-ascii?Q?P6yhVGdM0X3HmRDMOLL0ymK3kBUXxlmKb9Kr161QTO/2LbigjDHUn7U+NcJ/?=
 =?us-ascii?Q?mcHPwVgeeIXL6pt3kxw54Vmy33wTyaS1yMvgsPCsMjURKInAnSNrx3w7Zwy5?=
 =?us-ascii?Q?Zbru49+NhRWbsJ1IuLtyiYmw6RZur4alRR5f2yGLltXr7VsfcLyHn0n90Nab?=
 =?us-ascii?Q?u2v/lUun/x/c8iYNTg1J3TVMWDf3EXECKE+mYyvnjBhRrvuSZVYUpJFWVH7i?=
 =?us-ascii?Q?RmVaKjbC/mU/qZbOsuEdaOb5z3Aebj2ofugyfgGPTKUkElF2Drz07wF5uPA0?=
 =?us-ascii?Q?0z3YXYJ+Wey388GzeEmnAAcO+WFNQRWwSLGy8oUKSxLIoAGyyFOoXH70/VMn?=
 =?us-ascii?Q?2VecAKYwLm1JpaDQiqE6TML7k/4vZVUWJ3sE/nYLJhHI5y7Ye9m87tCLC/JB?=
 =?us-ascii?Q?qcQ7n/c2OcuXg//0/n4W2T7aVInshO+fRUf4QxU6xahVKm9BTMLhaP5a9y4Y?=
 =?us-ascii?Q?SKE/oqdg6UNt7M3B8+aGfycNSTb3c5TFwbnJ+vKstrN66AxsqVnoGpgFz/GL?=
 =?us-ascii?Q?BGacB5K5fF6vsvtvjHBQ2AC9WQGBJfb5DNBx0d2C+nJ/xbcQPV0yfqKANNx7?=
 =?us-ascii?Q?zweRSrtg6Tvrc/3KdEGHx2ptfAoLI0fI3BIpbTejiZNe7481ZZBRW3z716Wk?=
 =?us-ascii?Q?B6Db4po7c8ZD7M/p3Q+ovuFfqvK+TD7dHyccFQ/JOqkcnip/zjws4CrhAgRN?=
 =?us-ascii?Q?yokMKnVbPvcj5yw0swfgBfg4x9oPpreg8i1Ts4ABUwEcE7oDII0EiEsrcVR5?=
 =?us-ascii?Q?2nJHzKqDkwA6H8bCUQhyUk5xsWirlMTJbzyiJk8oKhLp43QPP0/RWpDbSaMo?=
 =?us-ascii?Q?u6YQiqpIpKONNrQPQ+ObwvJV11YvNoEVXi0D5se9EpFJ1Is1WoBFY+kwhcdW?=
 =?us-ascii?Q?G9bYWr4eamUJb8Z8dGTqIicYz/2yGRPoFWt06dusB1Lv1cgP0IteqEvKSkD9?=
 =?us-ascii?Q?Acn1uPBA8cj0+uG/7hI6fmDQAnAOEq184fUcrQ0D3oimxc+H+Ymo9pxZvFud?=
 =?us-ascii?Q?JUec2VqgkuTNMi8XRkF+vS3KFt8tFN6I9HXU1Ib6tkcEBr8A+DM9bGxwN0Tt?=
 =?us-ascii?Q?b2DXc65qlDBvQ7E6n38r/bRstXnm3Hip1Ngr+qtnelWhLFKowJGrt9hg0isC?=
 =?us-ascii?Q?InHBAvZAkpdYfBEvaKZRpdl9+D0zZmLSztBixQB21nrX7wgFn11q0VWGEnPP?=
 =?us-ascii?Q?x3aW9j909uTZPr6fUvQphDQ2jkV5tPC4IW/w7ncxIiFObi80fhUpniVO77/r?=
 =?us-ascii?Q?ciTEuHmLxYamoAhGVdqtp5Y6SIT2c70PkYeE4G1shB6bPtXZ2yY15NbJBCqz?=
 =?us-ascii?Q?iQ5vowpJuziS0F1/sjE1dJ5e9EJCFf2NmaW0l1HO4s+IV3CCcGBm5YrQt8B2?=
 =?us-ascii?Q?Mfc6Et4lIFHl9yyNnVOPe7732r7Whl99wmbCedXunxKAAEUq3mlqKYPG0k2N?=
 =?us-ascii?Q?qhnNA/id8uZRp4n6P7PIpA+328xz+rWEYC4FMo+WdWBtTZOGCas5S/gJTKvl?=
 =?us-ascii?Q?ZNlgA2J/4P+bVCXkHm+m5F1Rp0WGuFzdjT5uBVzlzNi9x3eEL96jBddr6yYE?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91611e45-5b39-4563-0f60-08dd77fe03fa
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 07:05:02.9642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lFKZCnb52DnKm3x5lc8BAhS1N5LOQKKHpgEj3TqTQlxO93wqJLEjBix7OotTJUIRc1VpdSOHX+VsMblh5uSXV8RvliZPH2nhE5WaxiKDhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0637
Cc: Minda Chen <minda.chen@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v1] net: stmmac: starfive: Add serdes PHY
	init/deinit function
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

To support SGMII interface, add internal serdes PHY powerup/
powerdown function.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 2013d7477eb7..f5923f847100 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -9,6 +9,8 @@
 
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
 #include <linux/property.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
@@ -28,6 +30,7 @@ struct starfive_dwmac_data {
 struct starfive_dwmac {
 	struct device *dev;
 	const struct starfive_dwmac_data *data;
+	struct phy *serdes_phy;
 };
 
 static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
@@ -80,6 +83,26 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return 0;
 }
 
+static int starfive_dwmac_serdes_powerup(struct net_device *ndev, void *priv)
+{
+	struct starfive_dwmac *dwmac = priv;
+	int ret;
+
+	ret = phy_init(dwmac->serdes_phy);
+	if (ret)
+		return ret;
+
+	return phy_power_on(dwmac->serdes_phy);
+}
+
+static void starfive_dwmac_serdes_powerdown(struct net_device *ndev, void *priv)
+{
+	struct starfive_dwmac *dwmac = priv;
+
+	phy_power_off(dwmac->serdes_phy);
+	phy_exit(dwmac->serdes_phy);
+}
+
 static int starfive_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -102,6 +125,11 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
+	dwmac->serdes_phy = devm_phy_optional_get(&pdev->dev, NULL);
+	if (IS_ERR(dwmac->serdes_phy))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->serdes_phy),
+				     "Failed to get serdes phy\n");
+
 	dwmac->data = device_get_match_data(&pdev->dev);
 
 	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
@@ -132,6 +160,11 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (dwmac->serdes_phy) {
+		plat_dat->serdes_powerup = starfive_dwmac_serdes_powerup;
+		plat_dat->serdes_powerdown  = starfive_dwmac_serdes_powerdown;
+	}
+
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
