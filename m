Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62683D2B1
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 03:45:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21761C6B444;
	Fri, 26 Jan 2024 02:45:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A244FC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 02:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL4ZQrly0e5UJfHSZNG2QKqIO5z/M+5MuiDGxFSHS+GMX3+f1jGbCQsg8CnUlP4wpqggZ8at5iIdBmu7CnmdXwkLDeqaCMg7p14AneiQYj3GFVJbWKgjZ0o2xAcmuq+iWyCxBg1PssK5nigGLUGjihDCYCnWe7bFdwhEXK5EmducTNZZrCEXn8UOILQepCD+Y2VoKUESpqRNoMuIq9cneMF4QqVXsmh7CMWbDi60VjR7JWoFv6mkdnIJtTX46Jt6qqkCf5yjvpXoH96Z5vN1jeuSbpajDNrLcapPlcp3cVLH3yQB4nVtO9G9meSXpEylWV3lODdoR9koVavYPtpJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTQAJptMBVMS40i341Gq90GdAQxLaX97DhYbIXZe3M4=;
 b=ixU57lmBTWJqABaVgUpw0yBb3I3/zmCxMOPyDoJ7l0vIr1maQdLpBxSxL9WCrpGRRxy0uSaK3D71OGxV49YaTEF3NdJ535IM1Xljncoj+Anuhss0cPZLdJUDToLzL+YbIeLgszOirnqIdZKv5nrAFDJKHr12FyTvwnigNPrYzrpfbjlUCOFeCzJy09AgkdXFaEXCJ+qJ7G1c1OM5MH3K8Nt7zGpy5ZWZpd4ZASUHEXgzzeIYt1J4kAK5UxxEy/esHrzqyLBaiMOyGzbVHBLRbb34WA6/HUaZw4Gz8vS0+QneSwP+egA55Soo+cl0UFyjY/uP2FRZV+e6l3kIQwAnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTQAJptMBVMS40i341Gq90GdAQxLaX97DhYbIXZe3M4=;
 b=op5N1CY1UEBcn7QtTfcWB4l24nnZhktVsGPM6xD5aqEQUJzc+gbCwt7ZeggNJ3TWIAUIoGhmSRpsiQQSLwb2N7YAh2kvVQw4+L+8SQ0NYrNHBsEEkEWMFisIhCddoeJdzKq5hEGvq15//3TH7G3qBhqdNoWdFPawJesKNfIwXsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8382.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::11)
 by DB8PR04MB6811.eurprd04.prod.outlook.com (2603:10a6:10:fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 02:45:34 +0000
Received: from AM9PR04MB8382.eurprd04.prod.outlook.com
 ([fe80::708:ff6d:21e:71ae]) by AM9PR04MB8382.eurprd04.prod.outlook.com
 ([fe80::708:ff6d:21e:71ae%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 02:45:34 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com
Date: Fri, 26 Jan 2024 10:44:33 +0800
Message-Id: <20240126024433.2928223-2-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126024433.2928223-1-xiaoning.wang@nxp.com>
References: <20240126024433.2928223-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM9PR04MB8382.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8382:EE_|DB8PR04MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cecfafc-422a-419b-d8a6-08dc1e18de97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6R1pYUFRK38RJtkYx7PzJwh75JttvlqeSXsKb7FlRVhUnY1Td1uiFvisFW4kVw+6w0VluP8Vp/h67MzEon7wQaJt/7OWoQ13AsBiF2v9kY0SkFw2nMd/JMuHxnpKKOELaV5QwPION87IgucUj7lrNaOXticsUcw61+mxGB66Eietln9dmD0aaB9nRO9p4zXGeOuKE3BNzumD2ar51iNz2nERiIsAWsT9I/DUVrp3psy78AUVQYIlctZ/9kYNDYsyDTRLAsmvYeJmwhzkGyEaOPDPtoJxxi1udZwq3HhYzfL/JwakFQGTarPvF0LSvXnPSxd7/TIqbe5O/BP3v5rDJWlF1rlE4wGkuGUA9tMgYua13xbChBBSaViDNa8z2kbCWcXcd0xPgisSolLx4TYdfn0BRviUPCjGWGVVS+OqDrzP8FV496EI1JGSliO86pUPPLef8cM47OuNhAuVTaBDxCmpzA9G5v4m0hg278Qq3KUeKBQHiS9LhObpufZdjmmiXc+9MZPuVv/KMb3KBqIlBb6A6hwiRev6JytqgvFSNzNrEVM9SFF8jQqStxDd39Cp8ajd+TlnnPd/vEAKvNGYoeQyar8e9QThDgNA9vJXSGP5L4QhBl0OJ7J/cQKg8WwPCRmEahilWjmMdMfD+i5Rwb5tKHqdG8alLQnd26ts2RBypLmXUbAR6urEVpZjzG4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8382.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(451199024)(64100799003)(921011)(38350700005)(6486002)(8676002)(6506007)(6512007)(52116002)(66946007)(316002)(66556008)(66476007)(478600001)(1076003)(83380400001)(7416002)(5660300002)(2616005)(4326008)(26005)(8936002)(38100700002)(2906002)(41300700001)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0WkQB5wz2Jg+z40H++xqP/azJcq8w0XvhH4OsjPVwcwJdSqIT1cJ7crzt2kH?=
 =?us-ascii?Q?WySw7I75UPn94CDdFOFLWvBGXTQB5/3tb3NCE6IZfWOoPgbbyBVGYhYmzxYv?=
 =?us-ascii?Q?75gVIIoS6XEaGqL1tPOUCBObOvLUJpeuBiHC3vHKrMqF/a/9rm+YK6bqeNra?=
 =?us-ascii?Q?HGcE5d59Z4C1LKBkD4aC/ZeQIJ4NeeiKdkFy5W/0CiiZgikXLyzUgMF0bnHX?=
 =?us-ascii?Q?lF9uYeC0x8OTZADnQSAGnC2WqkczMRXqQ3gW9CJm5DjkjMNqioMN4L33oDY3?=
 =?us-ascii?Q?wFZ6kATREOr2wDv/vwFv+7eccUR/deDl0qemkETeem5aXAvi85gRxFMhWh0g?=
 =?us-ascii?Q?VEEIjo5i6D07kPS4aXIA9p6l1cAPhfo/OYaSF6L8Olg/5FVU0A2cabb+YvgP?=
 =?us-ascii?Q?/vwAj2DxedSkLFWD4eqRz7UXmKP5ZVoWAtTJaHXl00OfR2KeOgfcdTusfM8j?=
 =?us-ascii?Q?STYsQs1quyZbxZPrMAVyavKNbX2tn1dTR78uhoJ0FbaGzbGeLCQ6cNbdNUml?=
 =?us-ascii?Q?zqe5fDvnYk7tq/XiIMEmlTI40NjyUGy9yKN6afO7/jmJeW2qb36l1gXAkCoM?=
 =?us-ascii?Q?REFGeKhB2vxli6yLTGDLn4UGttpKRn80Dfa+zuZYw5phGiAMsFq/LZxewF5M?=
 =?us-ascii?Q?GKDn/VSdGEGxbyH8Wh1eQZmXj7q6JibnmVKvWrKpTh2jhcmYJBU3vqnsuvbe?=
 =?us-ascii?Q?6IKFxjj2RE6wwjYzGdK4Tbf/nU9I4QYmadX4KYUy8xNdA/GrRhU69VULeZ/L?=
 =?us-ascii?Q?AbLzeS2oi1ecjlGtyESK1ogQ44JGSkWidNQF3bU0D8RZtOOf7E1mkYCnIiBF?=
 =?us-ascii?Q?E/Da5fcb/iVo4sUpDf0DZF28ZDP8grQkArdewKOtz2m3N3Os6MkuSl3/Joh7?=
 =?us-ascii?Q?i3T+0Gwn+hoNnKgwS9o3gKKXknEmbcReDqwMn5bhZDXurQ/ApHZut7oBeaJs?=
 =?us-ascii?Q?iC9Q6J1cse3OvIALvyD7BC+CswgTVNl9AGak2wJnrctjktgzhDmlUF6OpAAM?=
 =?us-ascii?Q?WUhmmsIyDaeADCdolrKkPqsp5Up5l4VCbKRjHyXSWRfKD+jhTnpTS3R7ZrdG?=
 =?us-ascii?Q?QaaW7keyvyJXqmk+Eo86cjW+cX69+xyHjEvtdoLuyX4RFSiCqLytiLdR6Rhf?=
 =?us-ascii?Q?zjoZqDsw270NGL11EjB8P+Cji1zO7zunaP/G/QxGY5F9OSQorzl5Awf7T+aa?=
 =?us-ascii?Q?1+ApQOdAA/nQN6E73JAQvLx2Efd6lnj4HaXA8tCEHbz/oVB1PdyFljw+0DT2?=
 =?us-ascii?Q?1TpKHTBWgTd2xi8yHthdllh5TRRDQl1TGUj+KTraZoCb70igEBhiiUh1dHCP?=
 =?us-ascii?Q?EEDZrKvGAxLBibjgmMgd/bs0ER0pG+JtnW/+5d3hucrhQAfhjv/vbSt/dcIv?=
 =?us-ascii?Q?zoEgO1u/weBT8JSUk3i+dIFzGQJGkfl4dY85pINvlv9Cr+1v49paHCSGWu5B?=
 =?us-ascii?Q?sMWgc1I+NEW3kJeN35qbFDRuwjjsKrez/yX+0gomUQESBSR1zrJHS6iCEP/4?=
 =?us-ascii?Q?0r9LGpcyQJi2g5CmFQmY2J6tyC+EK/cEhzbRLrXFyexxwAOUKglkk8YOxA2v?=
 =?us-ascii?Q?9EfydMa+860kRkwpQIUB80BmKRZ5anNyR57PW0R5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cecfafc-422a-419b-d8a6-08dc1e18de97
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 02:45:34.4803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXHNMBgltCLEUUkkgKNITCbycSq+fmBvruVtr9qp3QaZP9F+pBnPiDevcpyvWIlcGqMQNy3LLiJNSX6nVLaCsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6811
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-imx: add clock input
	support in RMII mode
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

In RMII mode, the default setting is using the 50MHz reference clock
from SoC. The ref_clk pin is output.
If users want to use external or PHY to provide the 50MHz ref clock,
it needs to config the GPR register.
So, add the code to config GPR register to support the clock input.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 8f730ada71f9..64c5277895e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -36,6 +36,8 @@
 #define MX93_GPR_ENET_QOS_INTF_SEL_RMII		(0x4 << 1)
 #define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 1)
 #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
+#define MX93_GPR_ENET_QOS_CLK_SEL_MASK		BIT_MASK(0)
+#define MX93_GPR_CLK_SEL_OFFSET			(4)
 
 #define DMA_BUS_MODE			0x00001000
 #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
@@ -108,13 +110,22 @@ imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	int val;
+	int val, ret;
 
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = MX93_GPR_ENET_QOS_INTF_SEL_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
+		if (dwmac->rmii_refclk_ext) {
+			ret = regmap_update_bits(dwmac->intf_regmap,
+						 dwmac->intf_reg_off +
+						 MX93_GPR_CLK_SEL_OFFSET,
+						 MX93_GPR_ENET_QOS_CLK_SEL_MASK,
+						 0);
+			if (ret)
+				return ret;
+		}
 		val = MX93_GPR_ENET_QOS_INTF_SEL_RMII;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
