Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6B6D3F02
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 10:32:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F07BC65E70;
	Mon,  3 Apr 2023 08:32:33 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2047.outbound.protection.outlook.com [40.107.249.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08C9AC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 08:32:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTjq4CCfy94yjUKkrq3yOBX/rjwZQdu5oiUBVpfr9ZXpsg77V9UyFKnoKZDF+akWsBUShyS7iV+abKPfEcDP4qk0AoVC6f5X2KAJz6O43AIz5ANlEoyDRj0wSa4M5mBgo5v0VUjWHntfH7NxDURg/LyjlIOTcGW+Bmse0v+iKV39S4e6evEPBNleSp1BfPx4lHgTVf6khEjSMUBCNyBG/qV/7R8CMrMKjL+hw6rVcLTFQZIlMPx7V6/2qbNjgpMaCI13t1Sg6ciigpWYdKSCuPhavED/hlgH09sQgAVR9UO1RVgQwkd03CwhmMOHFo65fE4734TK9zb4+YgTR8C68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUe9QkzdVyBtd5SVBObUM7F15wGudJIp4/sbyA5kOz4=;
 b=CHkgSjHZpKgVUN7GwVBMz+BbaNZeZn2B8tE87fsUqM7LGPlF7td0dW6P15Pap0aNT5EfSxLz5skBYNk5b71/2zuhkGf31e8i4VLZ6nlBdYaMCYAicaSMt84G0Uz7vn60rGAQ+ygtDDdz0Jfg/sEnlGNHBNa9YYYvnlsYas0ANVqI4HF4ei6AUFaYiHOnYS4WG3RQ4Ar8xmVH7xzT3CEneaCtPRe7Qmv1Hm0zmziHF8sEXlB+dTa5c5+igACYnpbU1OeT2gh6o7Fe6YW2EaojCanisBs2GDL8OwUM8XlaQmFJYWuTIxFTIEgt2FY/EXDuwOTzW9bPbEkIM3GsPxH6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUe9QkzdVyBtd5SVBObUM7F15wGudJIp4/sbyA5kOz4=;
 b=rjmfrCXLitADkTb+tu9cmx6sS6wRdln0SLKM5+ze7cL9++xRi7Cdqd9NXeH2DMiebcoW+3+GSrSqC1tZ60WX266yJJeRnG3NEA1wPGaonfbGC+b0pdnk5LgBdG+Td2cSxYISBQtddctSkGcydR827p+i1VffXYg8ZT5tnOiuqK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5089.eurprd04.prod.outlook.com (2603:10a6:208:c6::21)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 08:32:30 +0000
Received: from AM0PR04MB5089.eurprd04.prod.outlook.com
 ([fe80::88b3:4064:f8d1:67bb]) by AM0PR04MB5089.eurprd04.prod.outlook.com
 ([fe80::88b3:4064:f8d1:67bb%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 08:32:30 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com
Date: Mon,  3 Apr 2023 16:17:17 +0800
Message-Id: <20230403081717.2047939-1-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14)
 To AM0PR04MB5089.eurprd04.prod.outlook.com
 (2603:10a6:208:c6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5089:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 498d2df6-9eee-49b2-b39e-08db341df6eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xl7mGhZH4LMD4et8aLAtCEjP6WtdFIm2oZshtKo1/+DrDsLZIqwC2547eZqrK19isvBCZ+FAAf1QGHh3GJNS5QtS2ldVTGic4T47kg8NOAf6jox5Hxd8kwE5C7QtR8iZ8JB6xSyOk+kvVFxWN3GobX3iTEJSZFmwelBxEJ74FERBuNd8Z+h+mCh774SQJDryzbbTzjOcTjPggCce2m99EkFWHwenciS8FEVMgkYmcHLWBoJIJtoYzMVhtDZgI40RTRsZ96rLsD82wN/BhLVtf0tI6vb+slQuvhMSjtlbrWtgdf0oGFjI8GJnoBUFX2+USzLwPP8AeNE9/Eouogrr4LNcoDQ4fCL4Fca8dPtPDsA/86N8g92oKPehXLe+/xaSYuYfNhaTBrQhHifY9PJMztNpmkRkGyECL43cycynU5/LEO3Aw/0Df1sG4/p/8fy0qdCmbVVBzkEXdmWI5dQw1lZjWEYWlAuibfuRoCOqd6qOWcpFa3I2NPzEq3P+8RAFaX8Z00XnWeJt8JZVnG/4pPETgVWyLV1BtJodU/Agh89BSW7JGHf2EJd6WxnY+Tw2ufjdwky5qL/TLDyY5yCpz+REtrhL3So0QqNxEiq9iYuo2Yggogso8g7RkacTGuMC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5089.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(6666004)(36756003)(2906002)(6486002)(41300700001)(4326008)(6512007)(1076003)(6506007)(26005)(186003)(2616005)(66476007)(66556008)(66946007)(8676002)(8936002)(7416002)(5660300002)(316002)(478600001)(83380400001)(86362001)(38100700002)(38350700002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tczwPKdOFtF+vtKN4uADmcSo/RbF2QHQvP2SrSEDcWVaw1SquTr1Mjc8pSzt?=
 =?us-ascii?Q?Z7mwCP6gUL5Es/VeOkkXNf7hGgj1u/gQE5CwxOH/QFAWoB5iHHZRtx5TFD7R?=
 =?us-ascii?Q?lXh3FtKLWR+UJkBKT5J1l1KIPcuEjQuHc0Zhn9CsXBL0VNKgaCdmjdvTrJlA?=
 =?us-ascii?Q?Kb3iry/fp0iQhlJOdSwdb00xy+N/Q7QGMLm5Mzp9WXUSHDFoZZTmkDYyHM3M?=
 =?us-ascii?Q?A134o2ZS3V+7oUG5TGTUDkI2S9VcdmUU3g6+onOG7pXhO+zJXV8cjlqOyNMp?=
 =?us-ascii?Q?/3Tg8633LbF7VK1FIjrf/8wrg7KRf4YNdeEm/8+AfGZTx13mQC0l0gkCSyDm?=
 =?us-ascii?Q?RhroxZ/c8S6FmNV0/XIlkb/XdJK2oksGn/SZu7MCzhg5jC+BN03+fh3aFPHs?=
 =?us-ascii?Q?ArhNcbav98aQnj26uS+r5iSBSSHvglpRHYqR6OHdtnuJImSGt3KzUF1RRcj2?=
 =?us-ascii?Q?1v4SpMl+/t+marRYckk/e7H+lo1QPOtNw2W06BxBLeOEIFqW33e4RW/PT05c?=
 =?us-ascii?Q?uPbe6oCOtTalp7EnD0TZ1dK8fy6DTwHZqCURWzaRraTy1xcxTUM1kxhTZ16Q?=
 =?us-ascii?Q?26jfE8tqoTLQSqKPw1Q+B0DjGYWOVPE5Tf93IiEkdIt+3WLirg0Dlcyamsrm?=
 =?us-ascii?Q?2VgCMiJy4zszhcVxYeMReD+IcVz0OiA6N9Y9j6J39CYuI2tTXOwZqoULtvvA?=
 =?us-ascii?Q?JwMUQRKF4QiqHq7uHsM8X6326UkDSu/hKazlTf9WSbFpKZJiryPqfizRuHD5?=
 =?us-ascii?Q?mhVSAc8rtGPz/GZwrNn05VPjTODcpJG3LL6I8R23JkmZKYC4Z/RxVZ5BRl4C?=
 =?us-ascii?Q?Rg0yxH3wjKDVLSEq/VuoWN+8PQnMMZL/bWc/Kc2vLcF2djqsHiIu+Yas20Dx?=
 =?us-ascii?Q?hdCr1D3p5jxVVBAL5/OH80Qh8a2LDXeigqUkhWSl4WOFzAKuwb1Jb2wj9TTo?=
 =?us-ascii?Q?T6SB2qo5hueei+V5Fhv7JCE1eSOukeU+6PiRzX9AMnMoR1qwjGYnhEc1QeBf?=
 =?us-ascii?Q?e49ZF3D5VzyF9Sp/TYsCN8mbB4RSIkTETDEkrITRXSaFKYOKtRY06ZAmwxH4?=
 =?us-ascii?Q?3Rt9EqF7Frf8VIX7wYfb4m6Rk/vcdjI8NCgUhUO+sJHYqXCKdhZ8uYljlHZk?=
 =?us-ascii?Q?lLNKj18/OXaNDDQPUErVbPEowFlSaEBmzvxq+xqGpPph4sGAX7ikMFSGQE25?=
 =?us-ascii?Q?kVSxSr8oVgkIL15rGjQ6d2rN1xwSGdBkMbTap+TjU89rP/oCYEITh8pMRh0V?=
 =?us-ascii?Q?mLpB/SMiyKgPXrZJLLb7ldKahESk8VHGje6MZ8Mh21eajvorgksiZf/fL2H9?=
 =?us-ascii?Q?3XcJdbma/aJe6cKKuUG/G28hErGVp+iEUmPmH0bKNa5W61dnHhA4ciBad6v3?=
 =?us-ascii?Q?y1AV1Qb6w81nc181rueurB+Hqlgk4XNRwS4suthMPqAdznu9IvtRSLcxMxIH?=
 =?us-ascii?Q?UphGOwtlnE016zONkhrc2z7Z9VuSdSAczP0nBezvpYlgZlyBh5neBZps6e1f?=
 =?us-ascii?Q?NRBxDc+KmOI/0Roem7b0z90JObWReND0SmCl0JikVhZuuVP/+2CG98Mn7+kL?=
 =?us-ascii?Q?AFzlje8yfe0EKGgHnj7wZiuOCQ8ytlsoPEs9mwvL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498d2df6-9eee-49b2-b39e-08db341df6eb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 08:32:30.7209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzPYr5ZTi3nNCcimlnM28mwNx5IGPQKUDcTBTna/toU1LLTiWIB1iYG0oe8AfR6Tg4eHqNm6Tixo3MVYQtbXtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: remove the limitation of adding
	vlan in promisc mode
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

When using brctl to add eqos to a bridge, it will frist set eqos to
promisc mode and then set a VLAN for this bridge with a filer VID value
of 1.

These two error returns limit the use of brctl, resulting in the
inability of the bridge to be enabled on eqos. So remove them.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 8c7a0b7c9952..64bbe15a699e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -472,12 +472,6 @@ static int dwmac4_add_hw_vlan_rx_fltr(struct net_device *dev,
 	if (vid > 4095)
 		return -EINVAL;
 
-	if (hw->promisc) {
-		netdev_err(dev,
-			   "Adding VLAN in promisc mode not supported\n");
-		return -EPERM;
-	}
-
 	/* Single Rx VLAN Filter */
 	if (hw->num_vlan == 1) {
 		/* For single VLAN filter, VID 0 means VLAN promiscuous */
@@ -527,12 +521,6 @@ static int dwmac4_del_hw_vlan_rx_fltr(struct net_device *dev,
 {
 	int i, ret = 0;
 
-	if (hw->promisc) {
-		netdev_err(dev,
-			   "Deleting VLAN in promisc mode not supported\n");
-		return -EPERM;
-	}
-
 	/* Single Rx VLAN Filter */
 	if (hw->num_vlan == 1) {
 		if ((hw->vlan_filter[0] & GMAC_VLAN_TAG_VID) == vid) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
