Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E39AA6D29E9
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:23:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1DA4C69069;
	Fri, 31 Mar 2023 21:23:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05877C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPpS0jf20+V6Jbacjuf44G0H27iJ2y+mzBGvwe6LqvXb2MANE9AlFzgxT2yI1UQOzwMHCP3eUIbNUnCHbqqwR2ufV5YgTYf9I80uG7OTvHWnb3cSnKKtwegQOYQ+5PKC9+sL8UKa5DF8zZW0msC3V7EYItoSfkzj1oW4N7Staj73pspjPe+PZHlCImUeM32wJfW0jJneoleL1U6c8AQBNhnT74eNG4ci6uaOrlbnZPQ9EJNfO5GIWv+1P/wVnWNr8399KDL+45BNZ0lO0T4e6RbOFuOYlrT+e+6iSn/3OBrN6gwmg4OP2Y9/JSPkmY0SUQarb9+YeF/wjKhCrRHKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzX5IizI2Jc4ZZs9cujs/cT91HuZ7dWYYHToIHfm538=;
 b=kHUgdMaOLWieu5oAJjxnGEN7su/CjyL+5EhenfASr91v7EdNmimiwj9vXbVq/WiFlkGqzYJqvyIdiEHkh6vdmukXYyOxlTAxB7F6sTqh+aW23NMJydivo9Hp0j/xBaBK5Hi3/WKq22dUksPw//xHppXWB0CYIlq+QgpDicaOMQApz1BVKsqLedCCqJqDORrxFDPKP9UeSjdhocpY2RM7K5pQnsXqgEHZhyOasv0+Py8Y9CHXdE+5dB42A7oLZ/dzeOcQW+n+ub8zTiwTtA+p4UxK2ISC6CQFS0vvA6K+TtfGpR9r6HVnOTH2jVJ0Aqxq7bOduk7bOe5M/Gd7c6Ygfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzX5IizI2Jc4ZZs9cujs/cT91HuZ7dWYYHToIHfm538=;
 b=BQze+ygGNrWoDpCDNZoq0meKAoTcg0W2uW94GOsTSuRryFJAC1uZih/+45bl6gePaPmRLMA/5vxOrlEH0k2NDV80npjaTx+DSOu4OomiYkeU01WXjMQZeeLqL53wo+MvGbtEyDERN6fuAc0kWMaUqERdlBQrqCza9iPDH7BjO0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB9992.eurprd04.prod.outlook.com (2603:10a6:10:4c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Fri, 31 Mar
 2023 21:23:00 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%3]) with mapi id 15.20.6254.023; Fri, 31 Mar 2023
 21:23:00 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 31 Mar 2023 16:22:49 -0500
Message-Id: <20230331212250.103017-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB9992:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b99af03-1f2f-4cc0-8f81-08db322e1aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2v/2h5jUhoHDJfCA+AU358Gc2DLDy+JXAR18maKfbbhU2lDPurHEsTEK6Q3ofc+qz0zR4BlWSKTLaZsLCzKkLBtFbH+xpjaaMAfOS3biQX+1I9jtT1kWq7a/rWhypovJLXrDqmK5yBFoNPuzjDi6MzwS5OM+j+AxGx/Xn+MgALQMfgIGPt8V9/z59wF6fOTs6zjYb9RC/rqaPxWN7wlhAQyYYA/pYIGV/asQwGiasqRcn/k2h4LNzli5I+xFFe92RARihFT0FC8TDr8K/dHqAzzce4P7pX2nR1YDcj0CDg8zdqXLVa5zdtQux6ffpRdw69N0N3NTq+pzkxv9pIbzXlbgLPZQwKsYv1J98+fWOdOuxUblItXAhI6mH+s+ucKCpbz6y4Sz56tB7nqKvHVYr6KgVug/tKB5StxP/80eyNvk79tct6MGx7Uze1FFRCyVtSgHZ1JQ6A0vZbwyBeuFvOrKvmRjrsN3nZjxIymsm6zDOFwBlBBxsnqaFsDxUPQ+ahYbuReSzSHwrmfxrqQC5VEG7W/O8mOnRXY/PDwfRbF73I5B6Elv8IXrGyg2mULAS8kNZIHliX7PI5lj/WGrSH4Tx+wm20aRAYocwoHsPaKPiLL/ZV4E9aD0PgvPspJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(110136005)(44832011)(6666004)(316002)(55236004)(6506007)(6512007)(1076003)(54906003)(38100700002)(4326008)(36756003)(66476007)(26005)(8676002)(66556008)(66946007)(186003)(38350700002)(478600001)(2906002)(7416002)(83380400001)(6486002)(41300700001)(5660300002)(86362001)(2616005)(52116002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CacxmvYwAqXMnML8W/E0brNVTWXjNd7/rmPUV0tBgjg8onF3lgwyljWpdekP?=
 =?us-ascii?Q?A+2jIzCQRIg39TdMD0ghCAXZY965ZxbrYp0OWOvC3udXGeKd+HAiPRzu6bXd?=
 =?us-ascii?Q?1wkrCkxVtZV484entNAPL9eAa5A6qNFSzjrdOdR/wOhk47KDiy8qK7nEI0RK?=
 =?us-ascii?Q?x4juSdWSwX/NgXvqDoB88icN5zbc7m2NSPLg+8HJ4r5lEqB8hQswJHjDTpfC?=
 =?us-ascii?Q?Qs660vkno9io/6NWXPuXGD1OI7J1FtxXQ5K1T3p9iPA0Np+/vFV+8mVaKWZx?=
 =?us-ascii?Q?HK2CSu5mamJ1ufYpmFKWkW79Tn4wmDB/UUz7iUVovz/KUP78ooo9pYeZu8kG?=
 =?us-ascii?Q?4inNdpD7hNFHN8RiJRrrUXnmr1mfzotAmG36TkRkiT5NkYYSsk9OVgs95NZ1?=
 =?us-ascii?Q?oVZWubfepGK6UVW7t34WC66N020+7RiTFLDhQ3KIip3mQXcTdFzv91f2itfV?=
 =?us-ascii?Q?VahLSDN2tap0a4tUquNTT1y+irWfTExQS43RngnjMNVZz5qXc5qfWgBaxmD6?=
 =?us-ascii?Q?5GBH7/VE/mc7z5Hav30YonYtg9ShvUM+n97TKt+xzmoRGE01y1Orpexo7nlm?=
 =?us-ascii?Q?MoNywZkAHg79p2uqqk9zbP8ad5IqW+K3V9IbA0TVPDZWg6OHumNHfG00Epb1?=
 =?us-ascii?Q?v9DZ6zPXnDtSJQxB3lg+iuvnF2BQ5LSw94jMKR+vtIhwNIayyvOVHaauOr4s?=
 =?us-ascii?Q?ttuqjgIf9anzdB/Ec1Rf5cEy37jugLT6LEs1MOX16DGZXhzReh//aZyc6dSe?=
 =?us-ascii?Q?Ct++BHMqHJZ4NERAiE5ASuB8Emcc7KYBvXYbb/6RevTzMW+ykYqWAJmFMLKo?=
 =?us-ascii?Q?lJl2/Uq/Xz5XmgDcg+6m8/OZOlhlNOCZgkxFHZ97rY634wz3jxg7IqH3t1k5?=
 =?us-ascii?Q?C4u0EA6gd+O5hdPttFxi2i8neADV7Hm4eHMhNSwfPnFN0H704KFRMBz+u/Kl?=
 =?us-ascii?Q?uxOqoIMR2rPO3QdmHj6TLP59H7xSxVViaf7Cg3DjKf5CLs2XZZGWtRgAQF9d?=
 =?us-ascii?Q?bDoQOLABR6LXJFyhCdjZ3WeXahVeHF1BPo262WLtw6ZESRXNQ5Ubyvay1ujM?=
 =?us-ascii?Q?/WqNWbalJzkF7wszoclUpAgnumkn5ISNVw47xGEwba+wfoXzF1pYb6Gpgs0g?=
 =?us-ascii?Q?bP8/uys8cVeShV7K1eHgszTnalzzTDjQ5fNB1+mpl8CvOSYQVoG20M7Bs0Jp?=
 =?us-ascii?Q?wFpVC1Aj/j5v6CHjwt024WofOT0KqF9Ms0NkRKjNcD+rc7FncW+/nBLhoHuo?=
 =?us-ascii?Q?VNi4uG7T0/Re0pkTQ9nbNXV1a2IPuO0ouLVwHGzBS6K8rEwL1UGsrFeDmB+r?=
 =?us-ascii?Q?dqhGwVXoxJnXsviUEPtu0uFcm/ZjpqrQue+e8klDrdwz2BayQ+2ijvuBWrz0?=
 =?us-ascii?Q?+pMU156XTecL2UhT9l71pN7U+VbgJAh3sQjznROCVBu3nNV+bqXgjKtFAmVd?=
 =?us-ascii?Q?NpRluzR9XzrQlFAl8MRxSgt1UgJ5SttJ+NeeI9oq8CMUc/A9zX1IMfaVes/F?=
 =?us-ascii?Q?NiR3FYePj6xtStq4zyacQtYk6oLOF1k0L0O52xwofEU9ZZaICVIAkL9uEjXY?=
 =?us-ascii?Q?rzkFQF8ZQu8s75KJj64Yxhj3K4Lll+7ZgFvLDV2Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b99af03-1f2f-4cc0-8f81-08db322e1aa2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:23:00.2941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mvnVJYlTKlCxVsnzoEGy2NF0kck8DenSh2aQNq66lWv/bHquJb53jUp51tIz8a64juTstgyVClRT7P3ebHqcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9992
Cc: imx@lists.linux.dev, Tan Tee Min <tee.min.tan@linux.intel.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Revanth Kumar Uppala <ruppala@nvidia.com>
Subject: [Linux-stm32] [PATCH v4 1/2] net: stmmac: add support for platform
	specific reset
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

This patch adds support for platform-specific reset logic in the
stmmac driver. Some SoCs require a different reset mechanism than
the standard dwmac IP reset. To support these platforms, a new function
pointer 'fix_soc_reset' is added to the plat_stmmacenet_data structure.
The stmmac_reset macro in hwif.h is modified to call the 'fix_soc_reset'
function if it exists. This enables the driver to use the platform-specific
reset logic when necessary.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h |  3 +--
 include/linux/stmmac.h                     |  1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index bb7114f970f8..0eefa697ffe8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -87,6 +87,16 @@ static int stmmac_dwxlgmac_quirks(struct stmmac_priv *priv)
 	return 0;
 }

+int stmmac_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
+{
+	struct plat_stmmacenet_data *plat = priv ? priv->plat : NULL;
+
+	if (plat && plat->fix_soc_reset)
+		return plat->fix_soc_reset(plat, ioaddr);
+
+	return stmmac_do_callback(priv, dma, reset, ioaddr);
+}
+
 static const struct stmmac_hwif_entry {
 	bool gmac;
 	bool gmac4;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 16a7421715cb..47a68f506c10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -214,8 +214,6 @@ struct stmmac_dma_ops {
 	int (*enable_tbs)(void __iomem *ioaddr, bool en, u32 chan);
 };

-#define stmmac_reset(__priv, __args...) \
-	stmmac_do_callback(__priv, dma, reset, __args)
 #define stmmac_dma_init(__priv, __args...) \
 	stmmac_do_void_callback(__priv, dma, init, __args)
 #define stmmac_init_chan(__priv, __args...) \
@@ -640,6 +638,7 @@ extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */

+int stmmac_reset(struct stmmac_priv *priv, void *ioaddr);
 int stmmac_hwif_init(struct stmmac_priv *priv);

 #endif /* __STMMAC_HWIF_H__ */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a152678b82b7..9044477fad61 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -223,6 +223,7 @@ struct plat_stmmacenet_data {
 	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
 	struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
 	void (*fix_mac_speed)(void *priv, unsigned int speed);
+	int (*fix_soc_reset)(void *priv, void __iomem *ioaddr);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
--
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
