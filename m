Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F0769C27
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 18:20:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B696C6B44B;
	Mon, 31 Jul 2023 16:20:16 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2068.outbound.protection.outlook.com [40.107.105.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6D5AC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 16:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClwpKWaB1PvkqaPXyQGgDQ04TNvoZeJoK3S6Rftq5nX1VwlEpCwtgclhdJqBIJVWQdC2T4P45uvqgj82O/WQdMqj8L54Zd+J2GEymg5WSxMHEJzwTVe/r1tI1wl48cgHLy11eR+AQSmO+4frze73oGBVBr8KVlT+8lXs5Hs0+xBGHedtpt3AB8edUoBiAQl9hih/FmRm8SYj5ULLjPIgER9TYwiMe4HX/1PQs/nzkiw9g8NDQKGtLcifcJIblOpOguAFUaSQr0q4/DFckdBooA9yyMJvoW+i/fReR0v99G/etD7Ns/DGYAtneaNZhPnSQ9Db+uxwhPV6VKT1iJw5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDGmTrP/vi6PX7zWrra9P+c1wStIN1/iPet5V3AK6Ns=;
 b=MaHvRjnTWuyRg/3V7qHiAzDLDLmQbH3kgq3bPdQKL+R+Dzxc/Lvg6LK5rxMn1SWjff9dcYiWB5plupU2k19ivBEXK7kzoFG21HaYfFpVT2xAhmsWOCzCYyRIAMuK58q0nKvin7LDQSJL+e/Ch+I6eOJ/XLfiSq+Lqidjbp/j864VFfnbmgy3ewuwem95/GEMqkqojtbOCqfWCrRsyMm5uoQuVmwCuiPCM0c8oZLmC70jnUFrsc+J8GFd2ZlZYtSK/PYPnYhYXCjwFbHGz0VbPjnAruch2KM7YvkX6H0gDq3Y8iQD22vsPj6dUtMbbHGv1BcYdlXjKNhPh0xuSm/JRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDGmTrP/vi6PX7zWrra9P+c1wStIN1/iPet5V3AK6Ns=;
 b=cbnJ5gk2CnqlXRqymTF2kRdt4xv0D9yO/d0ivYZowNT6oO30NBxbDvbQ/1nygKNMifrqu0pBwGpuVbajA7tn8uT7XP/zzE/jdc/8swsMUGx2kSVtGN0smOa9+iDe9VSwyc9Lh0o2wKZA2XMrAhxcESqK4u7phbsXtomErfSvYj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS1PR04MB9237.eurprd04.prod.outlook.com (2603:10a6:20b:4d1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 16:20:14 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 16:20:14 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Date: Mon, 31 Jul 2023 11:19:27 -0500
Message-Id: <20230731161929.2341584-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS1PR04MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d00cbd-c558-4da4-90e2-08db91e20562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/fjkui/I3EC+imyDuVYUcThp/ipupJC5VuJw7zDVo2M/kgIJo7omMkPNhVXsUGh0ecxVTtavLb3rvOTSrZqTeNJPNCOuG+iZcqB1wQl/UUoSIN7A6tXLiQgy/bajQw4tJlMeToYB0Eq1MYzaxeLx2qXZjH0JEY65sljwpHdYC9ZOOpLGBtXGbaODCgrMYohxbt43Q2tHmv8HRqK9gWyx+sqaI3h1Pst1+8PcnO1o+0bPOYiSvXNnOW1umkiyZykMveGWh/U9GFBbTQ4BgDfCR15B9PXQwWyWEmbejnMOEpU3WXPWDBDOReQsgpk1OrbOOfD6yz6qb3fH8RE3xvty0HDwPrcrFU7kGTDp3hBdbgkFc4s/1M8L19quAmTCzTBiPdCXDm6XAWTPFPISOqW/WBtwdVUupC27I/eWIf0tsbxn2+6dm+EPWj8gs85YpLNT0hd++Pwxg5dUjzPxU8ABxrMRtnIE1c1Eqp30YO1NZb3LgbEB8iN2Kk3NEcHKtB9/8UP3/yqBxgugEfe8K+aW6OKSubAgreLAIMg7nnq167QMM3JtoWdjWE4oeDUUUFYkpLJyI1Rd1BaCWTg33WSYY52t/4JUz8iGMNMLHF0oBrPp1+74JGIY5ycljdjpMv6UQgbEmZ6VcCtvqjMSAQfNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(6512007)(52116002)(6666004)(6486002)(186003)(83380400001)(2616005)(36756003)(86362001)(921005)(38350700002)(38100700002)(26005)(1076003)(6506007)(55236004)(5660300002)(41300700001)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(7406005)(316002)(7416002)(478600001)(110136005)(54906003)(4326008)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cEJqXDrb+3yaikgEMJCxGRXkR4Cl6j3JCqdSLuBsQBuobb7YGZp++xS/6hC8?=
 =?us-ascii?Q?dN0bMwYDeMia0S+03z+ET5fuXkLHCGmDqIyyJHZyM0HfHMIjHbXSB5naFfBP?=
 =?us-ascii?Q?SPYRSjdDDBdCWbibpMz3AeKzAUh5TXJp4/ggkr3Tm/iQ8eXXf/D+k5Boiphp?=
 =?us-ascii?Q?qKh4cfq7tnYDSwbhtLBP14CQfRtoQUcWMcNaBvm3IWqPu+Ag99LgZjI99viS?=
 =?us-ascii?Q?xAN5x4E2hAJC+0lcJ6wTstBB+G9GMdJFixkR0vpgF+cODt2X+1J6NIdbPvfs?=
 =?us-ascii?Q?PBkNlbNvloBYhJeXtY14askmBhRagjxTUzaesF5/ww8nRlyNs1U6g70aox01?=
 =?us-ascii?Q?E6B4zE8FDEU0lwt4fNmXoMLgHM60FBIiXQtunfM4hsPm54ubo4NQtty6UxOY?=
 =?us-ascii?Q?AzIL+Ef6FEBuEItJjDnfcCE369tD1WVyjVD1bzS2Kk5y1n+NFoeZCeyQFKnF?=
 =?us-ascii?Q?l/XdApWc020fJsBrdO3St3D9TLfln8gbN2GxeFsaPxD+X4Ob6ACMWllFRzlv?=
 =?us-ascii?Q?pX2C8b0Qg1z/vYAB0YZumRIiiRS9ZOQOx/26GlC9D9kao6oPqIwfkw6FVUC6?=
 =?us-ascii?Q?svqXHV/vja89jsdZ8jaFHPoASh/SygT4phDL/UJ5fkJ3mXLS7p0QotIY0orn?=
 =?us-ascii?Q?Q7y49TdXEWWgjkTkNClZV6MmJNTXnk4hhOyqfSxGTpeyGbOjM1XRlVPVj1nP?=
 =?us-ascii?Q?CdwhK7KnvAxOvF4R5SVFsQSrc4CzZNbvGmz23lDiemOjHigQTb+zGONciJJ7?=
 =?us-ascii?Q?982AB7V8sFkCJPWUnwx4BD9/zATF97TGLI/smJjkKBLYTBBUg7JEgZvTK+b9?=
 =?us-ascii?Q?i8thS3wQ1keNhUMVaC6y1LHutkeV9B6aKh5XTcm/aJ/HTF/H/qCBntRjXEZA?=
 =?us-ascii?Q?ZzRjfN3m+55AIdxUlBZisLEiQjnu3g8eLLkwgaxLf3LaXP4yXeNvFSsHTabB?=
 =?us-ascii?Q?QV4UQv548FewTLsSrUZAPumnX2XHpMYS5dXFoGnCCsncmdTXoI7ThTLFe+T0?=
 =?us-ascii?Q?RTEyb1fj1xE60KnILWaF8OaAqtqNm8SQ4JKjJ8k6PrxqNCfMHPvjgLaTAibX?=
 =?us-ascii?Q?QKPWRmn0ahe5E/dPRYfu1uCaH58Yz4Z0Facfe8QsYDR8RIeiyuzB3lXdD7iQ?=
 =?us-ascii?Q?Tksd4cR+XIw5re2njIt8+UAaXDj1BckT92/fD8mlJGIIiYyohzckvZVx4md/?=
 =?us-ascii?Q?3GZIFQJbBuEOBizN4pPcnXgnNVjVjWO9Er3dJfb9kjA6dVEUiRvOUZRxBVs5?=
 =?us-ascii?Q?LdTdmK643wJo7BZEULjo3t0dh4lUP0Kdgm5+UpZNKP3EgMemTetUKBpEHyRr?=
 =?us-ascii?Q?UXtjSQVM5zH57DGb/JTClIKLQeGUap+LYG/qlpgBmiKnuOzcBFo8b6dZuYDq?=
 =?us-ascii?Q?UZNZdvaVPmMzJw+bWmvzpCigjxYliJ3/HojyTAnf2uMVLANALnX3tnIIiGPc?=
 =?us-ascii?Q?dyesiE0i1AvC+rweKxsCumJf5MUOuwywoEIgUSiefoi6xrKpiZOwJebXA3cj?=
 =?us-ascii?Q?8TGrtpjKA2miSMPfawJrpxlvbhEJYFlcsA3m8wEsNfqSZHSlEj+9bGv9Ev4W?=
 =?us-ascii?Q?QT0jq4FY2I0Fmq2J2LiBbOWU1tjCxU6fBoFKVVdI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d00cbd-c558-4da4-90e2-08db91e20562
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 16:20:14.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynztgGIy2YQPtfbEZaBjAqwWyvwCrBaw0G9nLAnVtAuHCVCrba27h1QBwd7nAEpls5hy01qX79qw1xXPU71j1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9237
Cc: Jose Abreu <joabreu@synopsys.com>, imx@lists.linux.dev,
 Simon Horman <simon.horman@corigine.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Wong Vee Khee <veekhee@apple.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Andrew Halaney <ahalaney@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [Linux-stm32] [PATCH v3 net 0/2] update stmmac fix_mac_speed
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

Changes in V3:
  - fixed the build errors reported by 'kernel test robot'.
  - Only perform clock pause in RGMII fixed-link usecase.

Changes in V2:
  - Call fix_mac_speed() with new mode parameter added.
  - reorg the function of imx_dwmac_fix_speed_mx93 by using the
    mode parameter.

Shenwei Wang (2):
  net: stmmac: add new mode parameter for fix_mac_speed
  net: stmmac: dwmac-imx: pause the TXC clock in fixed-link

 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 44 ++++++++++++++++++-
 .../stmicro/stmmac/dwmac-intel-plat.c         |  4 +-
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-meson.c |  2 +-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 include/linux/stmmac.h                        |  2 +-
 13 files changed, 56 insertions(+), 14 deletions(-)

--
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
