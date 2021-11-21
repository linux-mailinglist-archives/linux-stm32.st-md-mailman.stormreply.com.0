Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC874585B6
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Nov 2021 18:57:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 699E5C5C82A
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Nov 2021 17:57:33 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30058.outbound.protection.outlook.com [40.107.3.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BB57C597BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Nov 2021 17:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUXMJaJHy+JSReBbguQOx6/Hl0HRbzLQwksCBKgrrddanrfzFJd9iNSMHZdetOXb994/g9zENO02UfDYTYD06TcU3PoAMq5ZzEqvjL2BqxMCZn0cUAcO/qjEvfABqZFbN5pNDLIDN50HNuPA87rJ3VsOX+w+jaoBIK9W5cbfnwjuZSAqGK6uNCId9HNlaNB7/Wp5Gnu7mfAJ3lum/MAZSj5UR1mbQ/q5s1r2H3cctats2wFXRDdBmrcTaIpI7MzGOYQ9F+ZWBSRim8nWWIyUtrMAXxBFfiHaVXBlrIFTdH2nAJzY8CWzTS0zRZ5C7fDyClVBE/Z8FObmBZUwxeXD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kYAqNHqPIasxe/bLEtdMBt1O1iwW+sCVmi7gXqxLrk=;
 b=GncmWqnmH14A2Ua6RhJRWeLzGUbLpHw997TcdtzXjv0zciaLLzU3ZylOo9VZHDIiOQMsUuNwb6pHwIlCQeoFohvzhVKyqGDfE/R+4A5OATviVaDHhKNao2CD9NRCMIlgAZ8RcDg9cmOBJEr4cftw5ZPDVaZxly39k9NlTy+IYLBJla1SjCxrX5Nc48h5ekw3cLbQgLHw01cT5RQ2qKyDgU3y+5kxvm5fdTpo1S6Xdr6nMhBfyzEXqY6XfWWPWoNLkkOe7mj028zkvfyBT6z4j/cwSGzjPH8fODxjPdlXIzX4kITPcCrrX3sH16/aNRZ012kTdjGnJbhLyjLjofowiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kYAqNHqPIasxe/bLEtdMBt1O1iwW+sCVmi7gXqxLrk=;
 b=VZyLBI7VExBj1zID00j3x8olZFnRtBFcK1evJtQa0IknCURjPZE1zytvM6Zpb/tQ3K51QyHolL60Mc76CQ3VewbP/Vn6kw7EsV8mBGzYcI0VNB78uxpSdMBQXqJJkxhE6Ocv57jWtsDX8FTA1nmHeCfjs5lQtyWK8i32Eec5ykQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR04MB5693.eurprd04.prod.outlook.com (2603:10a6:803:e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Sun, 21 Nov
 2021 17:57:30 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::e4ed:b009:ae4:83c5]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::e4ed:b009:ae4:83c5%7]) with mapi id 15.20.4713.024; Sun, 21 Nov 2021
 17:57:30 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Date: Sun, 21 Nov 2021 19:57:04 +0200
Message-Id: <20211121175704.6813-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: AM6P193CA0062.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::39) To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
MIME-Version: 1.0
Received: from localhost.localdomain (188.25.163.189) by
 AM6P193CA0062.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.20 via Frontend Transport; Sun, 21 Nov 2021 17:57:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 470123c9-61e8-458e-4c5f-08d9ad1862e3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5693:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5693FD3EE30CCADCF1F7D8F3E09E9@VI1PR04MB5693.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YYKfZpZIoJ3qmuS6bn1O5Mgg47dy3glfjbsiVpDL1k+jsz4ExLbaKKjB+Pc/HuHbhURJshmLAlGyz9TjRQWstOM/3nsMwHkWSpmy2Lzb/lw+2WNNfFqbhpTRGmXhghXBWp0baS0C9XwjxT9C1RuveM3+hfQH//QYbdlHsobWsa4nELSpfMZkEO9YY93WxUfyDOIMmAuqbsz8lnSWCN2uHCgq+KaDyfA1x47gnGnTWSMiS5xwdW+OL9U6F5AnCOc3eRkyFXHLmok5SmDwFH9CyA+u37R8vLgV/NXssP+ZANl2OUcjVLAl65nPYOaczXBkhPwhaU+BQyXw26t5ymT9fAafG5khjZ7OYZTcTD3ZND7yXeIYyS+Ly+nL5iOFVdrpU2bAaManUF0RWj6kZqXX9jJ00tQz74T8osWHW+4rtBlB7X53nqbb6rI7oUD75te2cDdUlGLo1VkAl9agnn4E50KG9GAIOyrzY4rxCePCskFVayPlhtsXPSajyBnCBm2gsnYnhHjOAotVl3tBGA2fB+Qn8Qbajky9PKG+X/MFBLxifssvdjSnP5T8B+J8V/16YHO/AfiO97CyhMY19bxZQhdXI8cPXXdO+RGOo9L4c9fKRvoFSv47C5TiKcotPVahH50TFgcJcR36se3ZBilioA/E2DeEO3hZLkGvMxlUN3TnW8cKzHZUL+FwSKFvQHmSFCkRAjFPQ70DioMjtALq1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(36756003)(2616005)(38100700002)(38350700002)(8936002)(6916009)(956004)(4326008)(6512007)(2906002)(6506007)(86362001)(66476007)(66556008)(8676002)(7416002)(52116002)(54906003)(5660300002)(26005)(508600001)(83380400001)(6666004)(186003)(44832011)(66946007)(316002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y8jyx5n6kQso/NwC0dnOK+HoUJ4HnzvpOZ5mQVZJ1hGSQUf5UJc0F5kVqbO1?=
 =?us-ascii?Q?9x0aujImP5nlxw1myTbSdroviKtQ7recEuxr8ZT2eS+3E6TX5GbBMQxUkp9X?=
 =?us-ascii?Q?oXPTeNp5iGXyDlOIkM6DExkh/4xdND/tZnGht35qtNFv5dKh2hKvXsAlVrl4?=
 =?us-ascii?Q?WkOhYdie7eYIJdmfoZRblwvObkglkSFsHMo6n3YBJryObGu9hoP5jssvPK+B?=
 =?us-ascii?Q?CAlQl2bEalIplJs4Ijp4OQfRhPLHP/FHAmdF/YAZUJj+e8xCiNjWPSEpMWD3?=
 =?us-ascii?Q?3yovy+tCRgLvOqdaMiTnbI0UIRRM8rMtiIFbim+2C9yiRGU4EVkei81RIRNd?=
 =?us-ascii?Q?dGHvLlj7Y8XUIpO3XcSVTNyHupNtqOpv4UQDkWJ+Mw0DY5gFN3Gz5/dx0l9L?=
 =?us-ascii?Q?PWlv/GWfbBcgqRE0DbyQfct4Tn7IXRDq0LCK1mrCUtIfOf3ptyca//I+3hUk?=
 =?us-ascii?Q?nmoRF8//uo3XlopmRkYvOG8i9aXWom2l4TSIBQkeeWxjMF4CWTL360HD/4VE?=
 =?us-ascii?Q?qwVb85llUC3aYPZPXjeRUGZpnkWs58vWrU6Ixb0OxHzZRfag4x8njC9f36My?=
 =?us-ascii?Q?Q5CjG13yjx4LlFqAoIcTWI4Lu68aDq8OrhdElcTCnekjk2s/fQtrGGKtSaoU?=
 =?us-ascii?Q?gwXkulpWTs9KfclUEz1f5CRB2oBfV8ukqMuU/JH8d/wHkpg5eJYwzYBTMzUc?=
 =?us-ascii?Q?SzZed2LaKl0u46Zy8qCpjDsqHFFr/ZBMB8l4TBwRLBkNcWnJ4eZTXNjbYpao?=
 =?us-ascii?Q?OK4LGAmD4RQT4J8fxWdnT9avKkK/cXfGiyIrbVF+wJtS6iTqDWip2seKyBVP?=
 =?us-ascii?Q?Anwt6QWWvBwTbTfFs5eH4OvOxNWHsugXHMGWC7hTMKpSgYcCuE4+gH9xpWcH?=
 =?us-ascii?Q?N67bYna70EYw88wzr3kqut6XsWKhUJl/IZh+1oRhbWSPMdcLOy6MwXZXTzHK?=
 =?us-ascii?Q?YUl99CQCj14fKB2ibGRtt5xuxL2xcEoO6bQHJpI6HvS0M2rzSS3vDlDX5nqb?=
 =?us-ascii?Q?gle33IxyS16WrWdR37W3ytyz4WtgliPaI1CKCZ958eDaErBUdHyFknv1AHeq?=
 =?us-ascii?Q?4yzHXDTLBrAwF3Fhj/0Ti37BesRAc8vFL5f9OBvQenvR7cKwpHk9S/wyF/4f?=
 =?us-ascii?Q?A5r1uEcCQi/L/ybEVkrCEVyaXUa8kfKtGcnWkHQEaJBp0azPanS6iW85TGkr?=
 =?us-ascii?Q?o2gqhXi+va5u5k3y2KrpWCH3bVGLkHhpLj/eYeuRIoG5lgcphNPKm7LCuxxp?=
 =?us-ascii?Q?3tV4NCC13Rhfq7QIm9zvzR7Ty+4acJXItwzq6TN/tEQ60MqHfNcIKo9TGNt1?=
 =?us-ascii?Q?5LLT1BfZlFd/irn4C3WJVusI3lLej7+VXdS3PTYwr0XDLE3erFDjgw6WsjX5?=
 =?us-ascii?Q?SnzdDOfmRTDlQr4lShfy83G3/OGXy+xlV/r4tdy6ZWGaLpVL/88nTyhCoQLr?=
 =?us-ascii?Q?IE5qmYFI+AATDXayyrrU5kWZKLwaBPR/9p7YVthVxwMuGY6Ue0yGchbrOUg3?=
 =?us-ascii?Q?edYeJJ4mCbvMIFI+wicAWpn11oFJdRwP8LouMmK3Oah2pt9MvM6s85LCiP0k?=
 =?us-ascii?Q?a1IyztcWs00aCJmlnFvyvbhDdDZN+QVX+rvIqA2kLBuTfujP4Y2oSMVIMFfK?=
 =?us-ascii?Q?M9iLzVG6dni59v+ofNQbuqc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470123c9-61e8-458e-4c5f-08d9ad1862e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 17:57:30.1898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jL7+K80VXzBzZB1vDLBBnIu0pOfhdBBTiy3TcEHnEMNJHZQWeKPHqEZTDXoubkULbvLdSiZLRT0vcranxNmNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5693
Cc: Richard Cochran <richardcochran@gmail.com>,
 Yannick Vignon <yannick.vignon@nxp.com>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Olbrich <m.olbrich@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net] net: stmmac: retain PTP clock time
	during SIOCSHWTSTAMP ioctls
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

From: Holger Assmann <h.assmann@pengutronix.de>

Currently, when user space emits SIOCSHWTSTAMP ioctl calls such as
enabling/disabling timestamping or changing filter settings, the driver
reads the current CLOCK_REALTIME value and programming this into the
NIC's hardware clock. This might be necessary during system
initialization, but at runtime, when the PTP clock has already been
synchronized to a grandmaster, a reset of the timestamp settings might
result in a clock jump. Furthermore, if the clock is also controlled by
phc2sys in automatic mode (where the UTC offset is queried from ptp4l),
that UTC-to-TAI offset (currently 37 seconds in 2021) would be
temporarily reset to 0, and it would take a long time for phc2sys to
readjust so that CLOCK_REALTIME and the PHC are apart by 37 seconds
again.

To address the issue, we introduce a new function called
stmmac_init_tstamp_counter(), which gets called during ndo_open().
It contains the code snippet moved from stmmac_hwtstamp_set() that
manages the time synchronization. Besides, the sub second increment
configuration is also moved here since the related values are hardware
dependent and runtime invariant.

Furthermore, the hardware clock must be kept running even when no time
stamping mode is selected in order to retain the synchronized time base.
That way, timestamping can be enabled again at any time only with the
need to compensate the clock's natural drifting.

As a side effect, this patch fixes the issue that ptp_clock_info::enable
can be called before SIOCSHWTSTAMP and the driver (which looks at
priv->systime_flags) was not prepared to handle that ordering.

Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
Reported-by: Michael Olbrich <m.olbrich@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 125 +++++++++++-------
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   2 +-
 3 files changed, 81 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 43eead726886..5f129733aabd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -314,6 +314,7 @@ int stmmac_mdio_reset(struct mii_bus *mii);
 int stmmac_xpcs_setup(struct mii_bus *mii);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
+int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
 void stmmac_ptp_register(struct stmmac_priv *priv);
 void stmmac_ptp_unregister(struct stmmac_priv *priv);
 int stmmac_open(struct net_device *dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4caf66898c51..3727619ae925 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -50,6 +50,13 @@
 #include "dwxgmac2.h"
 #include "hwif.h"
 
+/* As long as the interface is active, we keep the timestamping counter enabled
+ * with fine resolution and binary rollover. This avoid non-monotonic behavior
+ * (clock jumps) when changing timestamping settings at runtime.
+ */
+#define STMMAC_HWTS_ACTIVE	(PTP_TCR_TSENA | PTP_TCR_TSCFUPDT | \
+				 PTP_TCR_TSCTRLSSR)
+
 #define	STMMAC_ALIGN(x)		ALIGN(ALIGN(x, SMP_CACHE_BYTES), 16)
 #define	TSO_MAX_BUFF_SIZE	(SZ_16K - 1)
 
@@ -617,8 +624,6 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	struct hwtstamp_config config;
-	struct timespec64 now;
-	u64 temp = 0;
 	u32 ptp_v2 = 0;
 	u32 tstamp_all = 0;
 	u32 ptp_over_ipv4_udp = 0;
@@ -627,11 +632,6 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 	u32 snap_type_sel = 0;
 	u32 ts_master_en = 0;
 	u32 ts_event_en = 0;
-	u32 sec_inc = 0;
-	u32 value = 0;
-	bool xmac;
-
-	xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 
 	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
 		netdev_alert(priv->dev, "No support for HW time stamping\n");
@@ -793,42 +793,17 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 	priv->hwts_rx_en = ((config.rx_filter == HWTSTAMP_FILTER_NONE) ? 0 : 1);
 	priv->hwts_tx_en = config.tx_type == HWTSTAMP_TX_ON;
 
-	if (!priv->hwts_tx_en && !priv->hwts_rx_en)
-		stmmac_config_hw_tstamping(priv, priv->ptpaddr, 0);
-	else {
-		value = (PTP_TCR_TSENA | PTP_TCR_TSCFUPDT | PTP_TCR_TSCTRLSSR |
-			 tstamp_all | ptp_v2 | ptp_over_ethernet |
-			 ptp_over_ipv6_udp | ptp_over_ipv4_udp | ts_event_en |
-			 ts_master_en | snap_type_sel);
-		stmmac_config_hw_tstamping(priv, priv->ptpaddr, value);
-
-		/* program Sub Second Increment reg */
-		stmmac_config_sub_second_increment(priv,
-				priv->ptpaddr, priv->plat->clk_ptp_rate,
-				xmac, &sec_inc);
-		temp = div_u64(1000000000ULL, sec_inc);
-
-		/* Store sub second increment and flags for later use */
-		priv->sub_second_inc = sec_inc;
-		priv->systime_flags = value;
-
-		/* calculate default added value:
-		 * formula is :
-		 * addend = (2^32)/freq_div_ratio;
-		 * where, freq_div_ratio = 1e9ns/sec_inc
-		 */
-		temp = (u64)(temp << 32);
-		priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
-		stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
-
-		/* initialize system time */
-		ktime_get_real_ts64(&now);
+	priv->systime_flags = STMMAC_HWTS_ACTIVE;
 
-		/* lower 32 bits of tv_sec are safe until y2106 */
-		stmmac_init_systime(priv, priv->ptpaddr,
-				(u32)now.tv_sec, now.tv_nsec);
+	if (priv->hwts_tx_en || priv->hwts_rx_en) {
+		priv->systime_flags |= tstamp_all | ptp_v2 |
+				       ptp_over_ethernet | ptp_over_ipv6_udp |
+				       ptp_over_ipv4_udp | ts_event_en |
+				       ts_master_en | snap_type_sel;
 	}
 
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
+
 	memcpy(&priv->tstamp_config, &config, sizeof(config));
 
 	return copy_to_user(ifr->ifr_data, &config,
@@ -856,6 +831,66 @@ static int stmmac_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
 			    sizeof(*config)) ? -EFAULT : 0;
 }
 
+/**
+ * stmmac_init_tstamp_counter - init hardware timestamping counter
+ * @priv: driver private structure
+ * @systime_flags: timestamping flags
+ * Description:
+ * Initialize hardware counter for packet timestamping.
+ * This is valid as long as the interface is open and not suspended.
+ * Will be rerun after resuming from suspend, case in which the timestamping
+ * flags updated by stmmac_hwtstamp_set() also need to be restored.
+ */
+int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
+{
+	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
+	struct timespec64 now;
+	u32 sec_inc = 0;
+	u64 temp = 0;
+	int ret;
+
+	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
+		return -EOPNOTSUPP;
+
+	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
+	if (ret < 0) {
+		netdev_warn(priv->dev,
+			    "failed to enable PTP reference clock: %pe\n",
+			    ERR_PTR(ret));
+		return ret;
+	}
+
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
+	priv->systime_flags = systime_flags;
+
+	/* program Sub Second Increment reg */
+	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
+					   priv->plat->clk_ptp_rate,
+					   xmac, &sec_inc);
+	temp = div_u64(1000000000ULL, sec_inc);
+
+	/* Store sub second increment for later use */
+	priv->sub_second_inc = sec_inc;
+
+	/* calculate default added value:
+	 * formula is :
+	 * addend = (2^32)/freq_div_ratio;
+	 * where, freq_div_ratio = 1e9ns/sec_inc
+	 */
+	temp = (u64)(temp << 32);
+	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
+	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+
+	/* initialize system time */
+	ktime_get_real_ts64(&now);
+
+	/* lower 32 bits of tv_sec are safe until y2106 */
+	stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stmmac_init_tstamp_counter);
+
 /**
  * stmmac_init_ptp - init PTP
  * @priv: driver private structure
@@ -866,9 +901,11 @@ static int stmmac_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
 static int stmmac_init_ptp(struct stmmac_priv *priv)
 {
 	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
+	int ret;
 
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
-		return -EOPNOTSUPP;
+	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE);
+	if (ret)
+		return ret;
 
 	priv->adv_ts = 0;
 	/* Check if adv_ts can be enabled for dwmac 4.x / xgmac core */
@@ -3276,10 +3313,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 	stmmac_mmc_setup(priv);
 
 	if (init_ptp) {
-		ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
-		if (ret < 0)
-			netdev_warn(priv->dev, "failed to enable PTP reference clock: %d\n", ret);
-
 		ret = stmmac_init_ptp(priv);
 		if (ret == -EOPNOTSUPP)
 			netdev_warn(priv->dev, "PTP not supported by HW\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 232ac98943cd..5d29f336315b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -816,7 +816,7 @@ static int __maybe_unused stmmac_pltfr_noirq_resume(struct device *dev)
 		if (ret)
 			return ret;
 
-		clk_prepare_enable(priv->plat->clk_ptp_ref);
+		stmmac_init_tstamp_counter(priv, priv->systime_flags);
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
