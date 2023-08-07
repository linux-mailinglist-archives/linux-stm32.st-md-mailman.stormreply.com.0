Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BE4772A20
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 18:07:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04E3AC6B45C;
	Mon,  7 Aug 2023 16:07:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB1A0C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 16:07:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFDDIqDyY4dF8+17febcrvAM5Zn1/fsIwrMJ8gCTsjx6rMVNfIMfj6nVFPNxVUODuMI8bLXvNeg0GKXeXmzk/BbzS4afoIbAQXRVhfYF9BJ0rcnpWNwEqCnLdIkk1dcMKrxRJJqBF9qEmETXVorz9shNxj6sg56q6k1z9j7OfeztZ2eObnduE6L5dZ59N1rdYFKvhOYfBedzUypyYuUO+j25Ohl692jx85jT3Ezuqm3DUN0qTNpMVosb6ZBi+oISmYKzjIU2OgwYryGhB7f6rgCqa6rLnFEAAXAH7s9ShYZgPWxp2vr8URiLXAR0GON6gXkrx/zE0bH4SGbVYWcSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNwscRqk0C84Eiv7FBgS2HeeMiXLLIpx31Vkbxie2PI=;
 b=WThKdAtF2jXj8kr/eOoWuNZP37Y4R/Uk5E68irg4KCghig3gzDWZWJQBSR3DbBbypcsfaeXxxIW2oRvx1qIxeex2MsUImN1XDUw3ra4OOUNyiEKaHSZ07B0OH6Fxbd/in2Ii2lZbTBgxPr9Jn2rwen6NKHbmqrvxncmueAwn1sBogtEDpUcKaqYbRDaH/2/8P1iIBONmIgz96bIPc0UVsdHfgbPfRbkd6RRBVC76eCjK2UmFOSjtQdEX1PqB3C0Zg/ZjTRz3kSk7dPE+ebbrZGZU25/KDpgJsxN24ZHSYOG8S60R5pV15qi+LKPHwKA18OwbvY7oXFtgV8XxBQGOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNwscRqk0C84Eiv7FBgS2HeeMiXLLIpx31Vkbxie2PI=;
 b=Aw7BDk4yUfuBcMseEHzFGYL5SJnu+f13MpX+kXOBwUlbSPGHbeyVkMfXs+k+HSViNjhGq//CKdpen7bfyiB9gTRydAYE+gmNjgeAwDpZdba1trQSmbmfykyCUDH17wFiZRyjYSLqKA7BB+NOPn+fT4tqbgLitzpBpL+Epzuc3Io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 16:07:43 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671%3]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 16:07:43 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Date: Mon,  7 Aug 2023 11:07:14 -0500
Message-Id: <20230807160716.259072-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fffd3e9-92ed-4c9f-56e7-08db97606e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WryyscnmZE38H8ojy+yVRaKt9f8qHj1iha8X4ILfITVwIcw6tU4aKO4pLFU/OomvluN5hQo+4ZpMNMGNhdvHU390m259uvHS98dvodv6bZQmMSr6C1J1omtYVAtguMMu8eVWfJsqXOHKr6OBi6LumQmIAtJtpdk/3MET8ZIV20VTCX6CEcMv6w1q5qYWHviQ1AyVNc1e0kf1Pub8J8XAyGMQnXUAy4n5++rumoctKmQeauuv76XJMzShzuQ4Mg+T7S/6rgcjMjwg/X1P22DLDNTNHeezkKSOsw6RUPGSqBnI9ogwuiHrXuO91mHkQB2aScdSgZY4KECsZ5wW8h2tU/s6cuTBhb8vvg8bkBLQFmNd1YVDBLhyCkjNwUQqH9XIUuOSy7+KwH/VKxbklg1tEPS2wNfaXuaA8hyxrruQeN4+Y2EMxMeumpSZK80iPg/WwHW7v4zMVu8EXU9X2fHy/c34dQrdtEtnDafxVztdLctMcWThBxPvLw4VLgAev4SjKA5DSmFQJgDbOgoM44S7noZpAGpmHzpy//7bpu+dou7CzKNPIk3ZMWkHhp5gSbN7TZYNY6keZU7bE/p+eo+M+lwiP4BMR3/KqvnmeiuXg/6CEz5dDpTDHY6fcsFvcia/5hqNtB3Ix9h6russhqpS7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(1800799003)(186006)(451199021)(66556008)(4326008)(66946007)(66476007)(2906002)(52116002)(6486002)(6666004)(83380400001)(5660300002)(44832011)(7406005)(7416002)(41300700001)(8936002)(316002)(8676002)(38350700002)(38100700002)(921005)(2616005)(54906003)(110136005)(478600001)(36756003)(26005)(55236004)(6506007)(1076003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wtY5Yh7kNwyPPUulk1/hcxiNFSDDrjKaTnPch9hiHkyeGPf5VG/x0DKu9Guj?=
 =?us-ascii?Q?LeOWNlRT29HMZOkjU+J51oiGXznV94c3cW9b2iOCCUd5d8XiyvbUX8AFn2oT?=
 =?us-ascii?Q?9Jm8ddZRgxOdpeptdkU2TXWjSgAXDW6jiXyG4//RDX0Er0dXAz+EI900s/TL?=
 =?us-ascii?Q?VP+ME6uv/Ebfn949hO59Dg4hqdC3XGVMePritFRyrXYCNixxMmbrXURw7wLR?=
 =?us-ascii?Q?4PW7TGLGHojolytdtTjejYxehunz55sAHD0D0CG+lhxe972fIOb4y32bSx1Z?=
 =?us-ascii?Q?qX/Y8F5o7BxDXHLfrYshWJzVwjTKaYN24pchZ9MNJ28y3qecc9XRdKmWreGC?=
 =?us-ascii?Q?VeeotfqsJ7kwulVQ2/bhJ7b8If5e8jhkgJbfUmGkC4goeimw7pHLqVESPlIc?=
 =?us-ascii?Q?OuLwmMiUR9jVfg7vA6AZn0DK5vA9pTYbYp6BoM+6o4mHXLgTLgIKZ44zr5YG?=
 =?us-ascii?Q?akqDspcEaFz49Gscy9g/GfRVOWkdcDl0yyPXLMOh5jgPrUtuO2RHsxCkTFbi?=
 =?us-ascii?Q?O7tExLCh6KS/PQAVOZK9r3v9qrV63il8dqN5Oide/nJ6AC4tzDetjjyci/v1?=
 =?us-ascii?Q?tOqUG6avCAEpAXDweG4oeWrhBzb9Z3czfjuCjyYSyIUh1uO0kURM78sftPkm?=
 =?us-ascii?Q?fASZUNJreZ6fJfS198bUDniVRyTaA2q5vE1DRxo6ln0pMzVuZsNMA2ciqRLO?=
 =?us-ascii?Q?4cn6G8ECDdSzMPj8USZIcoJyKiqJEbiP4nrlvCc2RgxikeRu9jS10w4uQuc3?=
 =?us-ascii?Q?jEl5DiyB1qhMrmeNvsispMm1lsJDu8hfFl7E5np0xlgcPviuSY8CDy41DZpg?=
 =?us-ascii?Q?MsFSy7pOLLPOlU6SY7rJzwdkNGr+bWNliRw9G1LxnMf1yiBlMzYTt7thOcMN?=
 =?us-ascii?Q?gpcgcy7KtVoM4NMJJW6fYo4/ACIBQGFm63EWx90q5RhaO0qjeafaXfQkBR1e?=
 =?us-ascii?Q?NE86OqZVG2r8VrogyB5urZZ42c1MMkeuOBmJdkG4sVBL4Sj/Ov5UFHHlV5J7?=
 =?us-ascii?Q?MULbMoppSb1ZuQUw5bEb6vr1+Q8Vpb4OfKsrwsI1liUmV047CjTHkpcLKtmF?=
 =?us-ascii?Q?CO00309CfNy86ark1HUxmRIA7gmtCBzRdRR4vi1b6/nDDEQxZx0EU4Gylfxa?=
 =?us-ascii?Q?QbKTbwMD9gEGa4NbMbiCaX/u5nIz5b5H+VZJVlcDUVCPU5Cm3fwENYht0Ib6?=
 =?us-ascii?Q?fwlgWQWZMRYGdrW8V+F7Xl1lK4I1S406ahuDkbDHrsQcmBBl70YAFBjXJXba?=
 =?us-ascii?Q?Vs8R13wCij2PSGE/RuMqIx4A/w9qxgWVPEVUxAXanncGiIzTIODHYzGU0JsS?=
 =?us-ascii?Q?HK9ov3UtkFeMoGc6a5HT8PSON3EyzKelZTpHobSjwQhO8gfT56aB5RFRQXqb?=
 =?us-ascii?Q?71SvvWy5CPPt33NzhVUNKdXTz2SyzoOVnOTR55tEEQGZjVTH9osA6rxCMi27?=
 =?us-ascii?Q?ONJIaLSsIEVmiYnwmIPxZc4T0vUSFuJrkzqLD/fpFNsSlDZdHbDDmmqV1ixc?=
 =?us-ascii?Q?7uPR0YddtBjcVYtcFvf4i9olgNDXGljetXI4vLQ3cQLOCtQDY2NVVYs15mkF?=
 =?us-ascii?Q?Y+LgDFnSSHiSFLx7I63NsdpbpmlDRkPrH8i55Nvu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fffd3e9-92ed-4c9f-56e7-08db97606e81
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 16:07:43.1255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUcXCMDmIKiid7gI9KKTIz6L4hySXKGXBhswUYvMcj3q9RsiwbLQrc2+0FwPbOEF5k63aSkcfN9y41YNW95v7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630
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
Subject: [Linux-stm32] [PATCH v5 net-next 0/2] update stmmac fix_mac_speed
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

Changes in V5:
  - fixed the typo in if condition reported by Russell.
  - fixed the build errors in dwmac-sti.c reported by 'kernel test robot'.

Changes in V4:
  - Keep the 'unsigned int' type specifier in the fix_mac_speed
    function declarations.
  - Move imx93_dwmac_fix_mac_speed into the SoC specific ops.
  - Use a read back to replace the wmb() instruction.
  - Correct the target to 'net-next'.

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
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 45 ++++++++++++++++++-
 .../stmicro/stmmac/dwmac-intel-plat.c         |  4 +-
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-meson.c |  2 +-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  8 ++--
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 include/linux/stmmac.h                        |  2 +-
 14 files changed, 61 insertions(+), 18 deletions(-)

--
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
