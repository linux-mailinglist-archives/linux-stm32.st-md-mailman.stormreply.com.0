Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4675FDB13
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 15:39:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E9B4C64112;
	Thu, 13 Oct 2022 13:39:56 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2083.outbound.protection.outlook.com [40.107.247.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A652C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 13:39:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPMgTb0Z7iHcB66Jwxar3ESVenzqdWMq54PQ48Ruly2MbJnIw9lnGDIGyN6nVwex3aUWfx1Mm9k01MAFz+iMki/U/F+HPRWI2NDMTkzZqQOU7BdxSImWwqgZM2ir0d9zQRkEf7tLEnRW9hM4mUSWXTBo0QfZBlTbJwIA3SMPI2Xi13Uw2clGUj0Uki15CbQg9UTqUiLzpci28Zu/KuKFXxL7YWEri4aAM27RzAAUlcTFRYN2DI/2ShvhFYExnFtI4EYT+8HCwAjK9BzQTp8V8CKcbHrq0htKpV1Id2egrSOfsl799vSFKUQAvOdZd6BLQiKCIKESmDD+qzyIVulh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH8r14OM/hw+NJpMxsfRSvMp2Z+Iiw6xbFrTZpBbZ20=;
 b=JI3lWMCggxclrKYHv9GXIXM6mg0xsRSMkSAuQAFpK17+myTOS5z9kgUfkrAtoGyHyF1pyQXsLOIpD8nBvQ2IhEN5YftDyNuxdSt8sK2OEHGs+pNn8DX/r/If8gPEqCLx8ACFP/tKxBUemRkdic3f+S14Jl71z5G9yzsEnTivyBeKFaLEcC5xB+Z2N2Pc+mdMKqwgNVTTWmgBVWFc5djYuscBcyAH03Zz93UB+Bxeqd2qHFDWylfINa6u1hRe1Vxt3HuLc0NQofwnKDItImHwqYkVaPzcJNkndMEWhfAvkOA4CNb88VUMyf9yzsAFg1k39/+LamLiJUxbn73GgS11Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH8r14OM/hw+NJpMxsfRSvMp2Z+Iiw6xbFrTZpBbZ20=;
 b=fvrwW0vhc66A3CQR8ZZaTlteP1cmbfOTamgUyUaqJQ1DneGO40cKANCujEO7QLWBD0Bgjem4qzwW0sXPFEc4gU2vpj7NYaFeAzgw2C6dnNHH2+QuB91+DuHmLhNy8IE8tQ6Ks8Dpc1n+CdnZETqjmKnNa8WWD5FrGRKuV63r+dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM7PR04MB7141.eurprd04.prod.outlook.com (2603:10a6:20b:11d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 13:39:53 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563%5]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 13:39:53 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Thu, 13 Oct 2022 08:39:04 -0500
Message-Id: <20221013133904.978802-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013133904.978802-1-shenwei.wang@nxp.com>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
X-ClientProxiedBy: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM7PR04MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e2a5b8-3ec9-48f8-3672-08daad20684b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2SeIp2WO1doc+N7yB6hw+pcq6Xzo0jdpTj1Zk4+ZukuHl4Gxs06kBqvXCdmu4i1ngDTkufOPwCUFHDcXA+slVN1Twr1PMvp8IJq7Xtpf0irDzQ+YDP+Oz0TYGRtyla3VMJhQY/eiCPHDUM0c55xtqjWMEZMU2wiir7HMuGwoIGKXEn/AwXfXSZ5nptG9+FwKMX6e/XQyPfp/eo+/Kyji/vqZ2hG8lSKGJdj4N/nOgDbM3QJVHW0OVxalizTDJQGv2nIlh7DCTCmQ67kuOKB6EJDKhfCrxffHeI5bAYcbaFR7XsJcvQaKn9RBhJJTo9MH8A9zZ3i2OJMpldLSZbaYUFe/Tr8C2HIThI3dZChlhFLNURW13ng83h+P6mYVWuTL0dH3miarhrkjLhiiQvEQeGyONl0Ur3nJup2ZzPPWFGIb9n+f02rs/uho3xrvF07fEnq0PQNsTbPwIWfqlWXCKXvdn9ASdlTmGGhqWpBiTlB4/NXnohDjfFOK9mjy7Vzk4RVH5dqYO/FdLW2MbVhHy46Gap8TfQl4PvUDQcv4sUros714HhMv4EmJPVth+49UoNgzVQHmDYcUDoHJHU4ob3xo9XhQwjK5JWZYP6SpQ8iT6jOrKHTWeDRzwd24fJt/RCwcUJAoQ6BRTuxSv3YmFtHtSPEbPv5Dj07miHQaA7vlsIxpfktVshOoRMUWc0NA3yjY6yKqPyC5T440t32MLu1HBTvS3My1DGeE/DTThGnCx2GxJgw9Lj7KQNKUKmY2UWSz1cT3rjJyYsM1xFSL3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(6486002)(478600001)(4744005)(316002)(110136005)(54906003)(6666004)(8676002)(41300700001)(66946007)(66556008)(66476007)(6506007)(52116002)(5660300002)(26005)(6512007)(55236004)(8936002)(4326008)(36756003)(7416002)(44832011)(86362001)(1076003)(186003)(83380400001)(2616005)(2906002)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F7GcmMCTy7qNqcef8NCA2av8veuDr27ytk7ijZ++SMMKODAK5jA3ZiAqw/eG?=
 =?us-ascii?Q?pcdhYcghIfULqUVCJUmg+KvmKlnALb4JPqQfDrI17qoIei3ZuRBAXHkMslg6?=
 =?us-ascii?Q?DnR/thE+ZHY4Kv9fvJyi5reS4dF7q7zBDTWuQgJZsg5CE1Fzv/RMicT+1yQn?=
 =?us-ascii?Q?5p2CynLtwsbsJSEvXR5nBEQ+QSZph/mf21lTTcamd2lA9JmDWb0K8Z70UeSF?=
 =?us-ascii?Q?hYQMaLhVTkD3oDZupMzsUFPH0XOMdxM5czHz/MTsAz6+JEr8dm7iIuVBbXHf?=
 =?us-ascii?Q?qNpOnC+rmuJfWvkKvgJYB731ZhGmvW8ZmYxnJuBffc2UScXkhFt/9RWsPbA6?=
 =?us-ascii?Q?KC3RbBFP5PoeWph2We/vCoka2oHIyKLxXOd1S5xyPXVElOwSnknbMTORhR7M?=
 =?us-ascii?Q?dtL5lKGeI+NzkUNb/9wFKE/0Nmvu7T5NliqZ3MrEo79SLn/a3wbkX5xff5e/?=
 =?us-ascii?Q?bnkzYD55wvUMvSXb7HCeO5UgCtnS0tVBpxBH6+ZIf294m95GdH87CsyII+D8?=
 =?us-ascii?Q?TbdqvlzIcg6RlMpGQZUYziMdqkF/TW6AbSF5qdmJkc3Qdd1u1ceTE1fL4Vy5?=
 =?us-ascii?Q?BabFRMMhN7lT9LmU/Bi38/Vyu3atRRRjTbnd1ViyfDa2ARFOiynfpAhqYiDj?=
 =?us-ascii?Q?YNGDL0Lx2+4cRthAFq0ZpVghQQEFfCoVEu57KDYQJ29SzUP5QxrY6wimGtJc?=
 =?us-ascii?Q?iRv6532ArCkgjAPgtLg3y88M6F0fMrmb+F0WMnhWAfM1/GMFNW+NseUFFLje?=
 =?us-ascii?Q?/RInbRnv45hkHfhR5Mo4QyJHiZBDe88oOtMsvByGVcN1cYWyZY+XRE4C/nKM?=
 =?us-ascii?Q?kEN63E4ZuQCDuodrH3HTVHBNk+2Ql/fJibdTTFBAo9DSVaapDKoYgapkG3Ho?=
 =?us-ascii?Q?pQVBgp52iFDHqk6/eA5m1XaX/g8xFSNg0TyEfyp9BPklbgF11VQHujPD//rU?=
 =?us-ascii?Q?L+rO5d0IZkzYrBlNvkZmi3ucGR2hf0SltXiSHBdCdZA3dshul+MWFOGcyzzy?=
 =?us-ascii?Q?V2oOE2CNuzKMOJm14Jpv4rYL/BtUGrC9ma41TddO161o83BIGHV3nZcOOGlw?=
 =?us-ascii?Q?X5uaZKA8qeSRIlr+pWBotEJ7eLcxAhA6OU4BH6SNSt12y0rn/zncsff7Vms4?=
 =?us-ascii?Q?AWlUaakvuHvgcB5URF2+YfRYiC9FLiyLuu2cb0N67H80u6q25+tufz4EXc/6?=
 =?us-ascii?Q?YGsefpOzcpw5L+fz5uTHHVrNp5cO/ANt42sARyO581b7ODZlRtbbC2nyRQwl?=
 =?us-ascii?Q?3XhknBgyXyus5d69cdhOB5Lrfp4vmr+C6lChvTscPOFsrIdymV2HRLZx3FLq?=
 =?us-ascii?Q?7uKtbMU9KKIaHrIkdii/XsdI4WV8DJcZkK919/A5bE+IYhO4+BovZV1SmhjC?=
 =?us-ascii?Q?9bvlPrIbITnsPTA4USEzRw3uMw//B9dmIS6Bjl51YFnTKumPznJUNI1HJVs7?=
 =?us-ascii?Q?49J6Ts7WueD6dXrGMRS+e8NXznlERv7c3VeKjjXuHnEAfNMds0lWl36ZMeBf?=
 =?us-ascii?Q?D6pY+Cl14300rWUB+lTXUhdyER8RaaQn47cZ8eNeUMJesj5vIwJLFCuEOzsJ?=
 =?us-ascii?Q?G7rPhln+YMkYMGsbC8gpuN26u/+Tu4g4pBIGzWF8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e2a5b8-3ec9-48f8-3672-08daad20684b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 13:39:53.3087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fHfTCn3RhsOWsBJVpJekV3f9VvNoWjFdNhXwlLwZHBHZ1LPL/bS36iifdnUuAW5h9O/U9P6VADwyA356jhUlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7141
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 2/2] net: stmmac: Enable mac_managed_pm
	phylink config
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

Enable the mac_managed_pm configuration in the phylink_config
structure to avoid the kernel warning during system resume.

'Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect
mdio_bus_phy_resume() state")'

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 65c96773c6d2..8273e6a175c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1214,6 +1214,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (priv->plat->tx_queues_to_use > 1)
 		priv->phylink_config.mac_capabilities &=
 			~(MAC_10HD | MAC_100HD | MAC_1000HD);
+	priv->phylink_config.mac_managed_pm = true;

 	phylink = phylink_create(&priv->phylink_config, fwnode,
 				 mode, &stmmac_phylink_mac_ops);
--
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
