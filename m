Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E13063D415
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 12:12:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20FF2C65E58;
	Wed, 30 Nov 2022 11:12:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BE5AC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 11:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfNqcpo4O+0r5PXVr64ASeGvHjyFLzdM0Y8GxuwS66kR7s9WMUPO3+RH0iAH3WRAoR9/gdb/U6YTBfIVUzgEl1RRsJpOdYdMfO82tMar0BnM8aBRTBIaJgOh4OmGYUJFz4lZSiItsPgRJkFggbhY23okcNSJ/PRdlpQE6pmC3n8f+bYDlQgAfJF3gBp6pbw6d1yPq2nN0CfkvmO6neVxXdVVMzDj38MP22RpZLbu2p9izYRrxRf+BB9PJtYmCXq3gUcBz3ePjiRANZTv6+sM76j89ZWkxD3kui0ryU9YnV+Ims1gbGbxdH1MeefMIC68Rox/33uFVOIV0WU5FDN+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keFPfRXhz652HAqSXUZZ6yOs8zHEl/+iFNN9xix71EQ=;
 b=djyosSewk9ksmE2tyQeiKTO2StJq/JbqpiFytx7eSayc3ppGa+gyBmEpR/NSMZDGKykER8W8T3Ey9qMRzlDU1M3ui1Mw8OD1J+CEAQkN7o31bbT3jf7/FRqPYM4uif/kxpNGWE4YI5tQUfhXKK0LG6uyNc8TpjonilgcnmDEBToo1ouqih1pIrkdGYUkp2vRrxVkgqCiOz6+h/bhUjKS5AXB8wFFLCxXwMXXXsv1F/WvfJF09VbUtKKEFxbK1GUUx2fdkZ7QzUeu/QY709bmAzBBr/fo3qkFBCC+4OPyNfYWldMQAV/1LQnjzByxRvF4O2nVSRbUaJfwZPalGWvZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keFPfRXhz652HAqSXUZZ6yOs8zHEl/+iFNN9xix71EQ=;
 b=iF/gFgWoC3UCdfihLQI9r0P50RpAf0HJIGSpI9diXHzpg8aZit9KHMRA1JW2QVs4tlBtsl8RqkVEivMdXZnsN5vthw+PzSHXa8kQv2evnJMJQ92NQLTNHXdq/ScSIZF/Y6dHjMQ8uhXEYYDVNw9kreETTd6jz/bRRXi3RGAUnv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by VI1PR04MB6783.eurprd04.prod.outlook.com (2603:10a6:803:130::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Wed, 30 Nov
 2022 11:12:45 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::7682:a2e6:b891:2f4d]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::7682:a2e6:b891:2f4d%10]) with mapi id 15.20.5857.023; Wed, 30 Nov
 2022 11:12:45 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: linux@armlinux.org.uk, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, andrew@lunn.ch, hkallweit1@gmail.com
Date: Wed, 30 Nov 2022 19:11:48 +0800
Message-Id: <20221130111148.1064475-3-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130111148.1064475-1-xiaoning.wang@nxp.com>
References: <20221130111148.1064475-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To HE1PR0402MB2939.eurprd04.prod.outlook.com
 (2603:10a6:3:db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2939:EE_|VI1PR04MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: d66d1edd-d4ef-4123-94aa-08dad2c3ce32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsmGA6ROotjjhSMzuqFg5tabDXx6W2j9bZub3nbk7s4fhrjR6x5ykA459tix3WiKFZQOkTkTtoaprphsq3fSvVJUaFE0K0WkJ+8Wrf4AtKqMqKLM3r50mAi12QvuBj4WbjYQaRvyiw7RHySzQwJ2RcgOL7MARMNhBjunVDVlb524+Bn5wa9vEjWXy0OmTPBx/PccMcLYpTEfoun6DVnu5Z6hZWi0ISgCI3vIXy/w2ha+AkvvY2rtQZBsTcvjWlupcwPQXQFJ4LK9XXKnSNuu4o+Jg7qoxhUjzvcS2Yrps1KtSd/4l+3eQLXj0snShAYpz7sLvgS/9usLNeIRXQtWcVpAnsQ4qjhmP4zoBqjaPNVqJtu6OdeGar/NYKq5Lu3nDaACoU2OHv0PF5kmmBpE13LVGpstQx9yz0shIKbTHbQs4s+jpHDVzSswiqC43DIw7fUG5SjpJ+c/X47QYDShHfDM1oiFKFbWNb7HP3v8f3U2FJS7zjnwsmKb/3rZ2bxN/TdGJp5uZ4I+5UJlCCbsCDZhR7U/+mhIQkr9jxMTGMX3rdw3NrQ9k46GYkKaG4yZ/BP694BTMgWWADw0BTT3mozZ7XZPllkjFo6mwPFDR+65sBf0KcqVexmNbzOe8p0AmiY/3gGLguuoxGya7VVTtHQN44L/leHvMKyMa2n1KdZ3uy10ew/13opQg4h+GMB3RyrZJADDwsM4tBpd3/jPOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB2939.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(36756003)(921005)(41300700001)(7416002)(2906002)(38350700002)(15650500001)(478600001)(38100700002)(86362001)(83380400001)(66556008)(8676002)(6486002)(316002)(2616005)(66946007)(66476007)(8936002)(5660300002)(26005)(186003)(1076003)(52116002)(6512007)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hlefEeRjjOrrPxl3Fy0lXn+440W37x8iEKjwR6TQJ8S9ipa4tmfSTMA/JRP?=
 =?us-ascii?Q?UdIo4E44XA6rSj3z2mcAonJNp2y72zeqfs57KRo9BUlo8VRWrW15YmPjoCFH?=
 =?us-ascii?Q?72ZivFETZJ72GBiztuBArlKoGFR/ZPe8Il6u4UoX8yitL2YZitBJRghT9l0k?=
 =?us-ascii?Q?HAbS/GcWxnn02iyfaKy7edVved6ubIqC3G7ZOTccuN/ijMgRrpPnF5qRrW8z?=
 =?us-ascii?Q?w5F2pmKj3zRB/TPTJC4KRnVhYzTxLNTxI1bFqRumrXP8TzZ/xtlRhcCJKAvR?=
 =?us-ascii?Q?zy7POkvrWWEQZVfGPb0oprwTvvyJXQYKuIOSv5aF2AIqz5d8FV+MFjncnhak?=
 =?us-ascii?Q?jHfsg85hYa4JSqqVWj74+eTXJ7nAJBA2HeZkaDKHEp6EArX9DFSszGxAFKNe?=
 =?us-ascii?Q?8xEV1lbkl18jgfizQ3WUpKLToeItZRPvSqIO8CeJMaPcuJXB6MMMm33386jt?=
 =?us-ascii?Q?RsG1nxunADG8XJ+GpUEPS1PilFa31TmETGSKwMv05+JR9e9K2fT0Wkprs3j9?=
 =?us-ascii?Q?MfSjOxz7RDMD+A2wigTIHnZ8pH7MDOJ8UbuTIZPVgzK8coOsrz6YgbxJu8X5?=
 =?us-ascii?Q?EH/vObmlvRWzIaJ4iHSQVQv0a82MGzlFZDfq8KJ2+UiKoAasLoCojnvkNBfB?=
 =?us-ascii?Q?EU7rjsz2XA4Lbg7mnhFMUb7TbjZ/ecQ3/ToeuYpQnVilb4IeNMP57lFnzign?=
 =?us-ascii?Q?NUfC2K4p8SSnzMkRhMUmsgTzR/IIC5/gdE9fnXFjwt+MjUnSWZ/tmK3Iig5M?=
 =?us-ascii?Q?1c1M+N0nEfpw9uJo4MQfcAVsLAZRpXavVM6rltiIGG4JPQB72g7iNtdbSeNC?=
 =?us-ascii?Q?PgT/xcGJJbZX5dxCzM3/S9D+ebsNtvrE9XApXsiYjV3+5QZEEIDwnLwL+1Lh?=
 =?us-ascii?Q?DzP5SRAHXm3K3XxbAn3SfeUyp8x+6Wi7K3oFJfwnMKFL8zmOY7c67XQW/bLx?=
 =?us-ascii?Q?s1uhMCCDIka2UDFlvoI+0yJlNwKP205tg3+6zGUIsJTuTb8rElThVA1KMwfE?=
 =?us-ascii?Q?6ErAQ6IGFkmnE+Of3Cdf3DEC8XVrBRzujE/bHrDYVwznhUUpjCM9xjON9rxl?=
 =?us-ascii?Q?Sg5IzblCL6CmWsAkTqqwYpGrGtM+vFnTmW59AXINF4ovT98VGLtkM+ltbSMY?=
 =?us-ascii?Q?Yxy480ZXzXf/A2rrqujS6patxNKjbsbKR5FQ+bpNjKvUxWPcs5yLurHAEN62?=
 =?us-ascii?Q?r7FAeWbUk4MXisIYUqDDrfRsn/Gja1JS6RnWS2SgPakpmckW9n8A58uFQzTL?=
 =?us-ascii?Q?lbL0vQu4oku2jdbiuwqKb8/CqlA1+wRfN8L5PC6QaefZWmyHNhqvJovTrk3+?=
 =?us-ascii?Q?LsQZX4x46SJCHy7r1DKpW1Rqqz/RS6hgHTeKKyxRm2whBhLHoMul1Gsb6uz6?=
 =?us-ascii?Q?LXQpPd2I/moWTFp8bcal+rghmlWfUEoidebWVSz7VVPYBtnzmASXdtbXeswH?=
 =?us-ascii?Q?C/ADsOVlVsOf1mEAC3rxYOkbgqQKNSJb6VffXVIlgTtrBf67gB78/MuXTfLn?=
 =?us-ascii?Q?LJw6BF7JEmbngxdavfvV6AuWYz9KPHkCQezDW43lKV6a247DQ5B0QN4YPjir?=
 =?us-ascii?Q?Z4xLirXb3Ri/qj6Lp2ln3i9ZNopjddqtIAIYllS6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66d1edd-d4ef-4123-94aa-08dad2c3ce32
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 11:12:45.0129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4m9Ztt3IXY+hZ4t/+GCW7FJwl0lII70o9zwkhUcoqtXrA7Lv09cYM/C0rhaEcLdOKrl1fcvT8WlMXrdfnvJZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6783
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] net: stmmac: synchronize status with
	phylink via flag during suspend/resume
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

On some platforms, mac cannot work after resumed from the suspend with WoL
enabled.

We found the stmmac_hw_setup() when system resumes will called after the
stmmac_mac_link_up(). So the correct values set in stmmac_mac_link_up()
are overwritten by stmmac_core_init() in phylink_resolve().

So use the flag added in phylink to keep phylink_resolve() is executed
after the stmmac_hw_setup().

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 18c7ca29da2c..4f89061cc537 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7432,6 +7432,7 @@ int stmmac_suspend(struct device *dev)
 			phylink_speed_down(priv->phylink, false);
 		phylink_suspend(priv->phylink, false);
 	}
+	phylink_clear_mac_ready(priv->phylink);
 	rtnl_unlock();
 
 	if (priv->dma_cap.fpesel) {
@@ -7545,6 +7546,7 @@ int stmmac_resume(struct device *dev)
 	stmmac_clear_descriptors(priv, &priv->dma_conf);
 
 	stmmac_hw_setup(ndev, false);
+	phylink_set_mac_ready(priv->phylink);
 	stmmac_init_coalesce(priv);
 	stmmac_set_rx_mode(ndev);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
