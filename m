Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F1095B074
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 10:32:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84649C6DD9D;
	Thu, 22 Aug 2024 08:32:49 +0000 (UTC)
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010040.outbound.protection.outlook.com [52.101.128.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2CDEC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 08:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoWtSaT8WGhOXFaCrPaJgokPRaveNVLp0eK/A49rLA0yaACGLWLORsFcIAUR5OeBIewSKtETHNoK1OS9sZ4IZQu4T72v6UAV6riQUado6LWzSVEj1prCkUDH2P26StVZqplBH3XEcl6EgQHm1wijByTrPIVaAcPVjxtqm9UXV0UD/EoTVYetKF9ODJXxMqyB296hS4E0jToTOL84+25kSuePZayv4F356NT7vi8ojUZRq/1GU33iERKoM8Lvre1DGIWkNiBqCxL2a3pEs7aVj5q6tC7T8OZeY0XEBTbpt655z6ETmAAP48kUAFjmVYZ7sfwr3hZMMVF9WXrB1cLJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMmonx2gw5I7WxVOfe6AGrYQQJHztGNtVqTJhsek1pA=;
 b=qiLdImxrj/Uc9EvcnJb5PIMTdAAaW2s3h5gv2BJTBi994l4RxmLwVZ1cc8IltPqf5CsmkX/1JNs10R9cjN5s4sa52p0UdBrJOx6EWJOi9y0g8Vek4w1pWk+zgvUcv+zwq3OATFgoI5fUgwY8zT6FTg83MVtg2SQKghtOEelkXJSi/thNoU0rgTlYBpOD/IeFxVk1eICCAQR8Xs+c4QI4YjZhFiO1Zk/Nr92xeJyTyQoYSo8GrZm9HBLmo3uXbBCie3qo7MgejkXjZN0aMXfderN0hPI83b5FO5kCeL49tWCjiKsW/1G5O8dEL1jYin84HWeHv8MvzWLNdGpOrYabVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMmonx2gw5I7WxVOfe6AGrYQQJHztGNtVqTJhsek1pA=;
 b=mcTy04d6zXzIRFnBcOV4ouWOBINLXBBpoPg4luVr1tRDvfq7Kv2GrD1ucSnnP3EzFoi9rn6wE1nwnSfKmH1vic20tvp+ReEba7ljtaX8A+pDkDKjLVP0XGXA3YIUeHtjGvKiPtoOSg7cGYFS9NFiSXIbCsQu2+yupQ9ut3CsQjVOMKy+59TUZSjFeFTN/cEsn9uNysARdD1zpqXEoFlcmkWmx4nXYAeTJOzu7VeUNmPNIPWWoarRxMsUQqyka8GWdD777n/YjFU1A7nOkVa57nApn97BY/lrGlg/6zXQWdUfVI91AtsuRlm0SiIpCbsK+2sNBslA6RWgquPSk7XWRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 08:32:37 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:32:37 +0000
From: Yangtao Li <frank.li@vivo.com>
To: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, marcin.s.wojtas@gmail.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, justinstitt@google.com,
 kees@kernel.org, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 horms@kernel.org, shannon.nelson@amd.com
Date: Thu, 22 Aug 2024 02:47:24 -0600
Message-Id: <20240822084733.1599295-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SGXP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::17)
 To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a98884e-03f3-4851-3e53-08dcc284fa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FBxba8nAY0o7Ln2B+ZJqxJNDO7vFlrRzI30T4b/TF/LcFhGbB4aNnOTMyiPR?=
 =?us-ascii?Q?i2pWhegDCrWwodeRfHjqmdG4ZnF4BpGbWBl6IKm0kLqqdLFgZlfCMXNoWSX8?=
 =?us-ascii?Q?bhqTRghc32Pz8rScSV+7JzOA5YFug+mFgIafy/VLNSYA+Vjgv4mobIOJ1vr1?=
 =?us-ascii?Q?eeE+GOmK2lYDca9uVezIDcs4VppqvR9pObs9/nBOtlQRKWZHXqPYhkqLbnOa?=
 =?us-ascii?Q?yQXDs75IrITV8MPlB5YvkGrSzPkhEx8zpWC6o5ouZ9XkYnF4VUNuTlswM7WC?=
 =?us-ascii?Q?Tki1OuPoxBouiyKzH87IHh7mq2E79PcmqprsWJW3MuR7ZfXoAG9Omp2pHRLO?=
 =?us-ascii?Q?/TFbCEaSUwxr97qOq5C5A1hu6QQTmI/xAzwTdZBSnsQzD4iyx8W7Dlf5pcON?=
 =?us-ascii?Q?6T8qjgDwPFNGHUXmF0Gmp8tyEXOcNHASBBOWpb50keo25zqaUXCKhDZc4c9r?=
 =?us-ascii?Q?IBx1YlcTDYqeskNPSt9QNE8vsoJq06hEoKhiiwOdyBaQ2FsPS9XHHU/8yf9X?=
 =?us-ascii?Q?JNK44TAQMH/QTiVRggdWlCjYa8oSsNny8FpqvkKOFyDpCOT00OND2FicrDLp?=
 =?us-ascii?Q?8fVhGojFIQWkAZvkOQj6izUMbrHiac/5EUi7y1tehHPikTKgFnx89oc8LbHP?=
 =?us-ascii?Q?/pbTGEkzEl+6PKRvtvL41BvM8lffh5n3FaDxs8JdrxibEs/RTTm1g+waK6uf?=
 =?us-ascii?Q?BQbLciSRPNj9CLnqIfUXvT6R+BYFSLplbA1bShShUjSm5FsqlZmAmxUs0ZaM?=
 =?us-ascii?Q?yanH7g5daLIYuf67CiG8z943c+Sjro26HFvLkuRiFWi6GrfmX1C5cFVcQDYF?=
 =?us-ascii?Q?sfHnGVxO+AAOYB7sYd/v0d8eFe69EkbgoARMK6eRSt+0kQMmoGkk12oXP43g?=
 =?us-ascii?Q?zhzqh73kCURRKAWfl9h2ViKyt22s+w43uWfGRerX6b4guPcV3qS6KpcaVVfM?=
 =?us-ascii?Q?afj1kttgRcRJzJ75gnlM9Y0+zAf/hManAyS3F71eb48ebgXujV4zPxmyWCIX?=
 =?us-ascii?Q?vpWTpjbm4kLWGM7MO76n9pALiYuCWiWlZGeepbqroLo8ESfWojCI/JR2vhNh?=
 =?us-ascii?Q?v850bexLPdW4kq7vudl50Ou+kS2/+GMHKanXvsCOVACLJlUzHtwktoSLrUHM?=
 =?us-ascii?Q?WIwMnFE8EQ9YZ1KAiPJaoWUT6KcCh7rwDcZ7JmGb/FpdEndaep8Cm3xo/dW5?=
 =?us-ascii?Q?iT8amGWHl2oO4o3B5F7bx93tOoUV3zQ1tFXESvOVBqEoVE9CRoaE4Arks3SR?=
 =?us-ascii?Q?rOLm6IWTlrGo8F/j0Qls+6Y31z9NVTGXj9BjESwR1/1u1jpOBVEIVCqmTrGc?=
 =?us-ascii?Q?EegLN2UbcappBlJ3ToFmX3LA8SCNw0t25zQJzJQjwz+9ig7UbdMnLUpPL4yL?=
 =?us-ascii?Q?SAPoUC1l6NX97U8BP/npA+AyGc7C/CaeFVPZ2/G2UiZuKrvHEfgE8CpRhb99?=
 =?us-ascii?Q?qqEuwGv9UNI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uSMKhdufzinX3DyEcKogWNoO0+1ySwAu9PRCZZAIvTMlBvYg94FULd1AQ4L4?=
 =?us-ascii?Q?pVNteop/KRE2AdUMo7v+W5e4jOXQwOUDaZc0SIdktgluCLFqOv46k0iaHQkc?=
 =?us-ascii?Q?tVJG5744mKoJpQ3w1P7dw/s5Q8h5jR7+EAvkvyPKhqvKI+hXLca3wMLT80Sb?=
 =?us-ascii?Q?vaRfSe9z/44nBLOXxSB9qcjTNhh6MmR5SvQ3F7sqZVHYLrC684ASdJQhFA7H?=
 =?us-ascii?Q?tLrhjNEzt+A4o+VxCLTf8PKIhhM1ph+8340QvZE0VypQb+Rp9oh7M7RqIFDJ?=
 =?us-ascii?Q?avMQeB/S4FaIm8F9Z9pIVW/4H9xLkxwll992BkAEqxQ5zcTrEsAgu2ZreTUL?=
 =?us-ascii?Q?yANjEIJMte/TVAaUvzk/ZwF7f+QGuy/alP79HuBCZ/cpRhPsaxAPz6Bs6kCf?=
 =?us-ascii?Q?ruaWbq9s550hIsfZEIyb3rRsaSAnZuui6vBvhHG/wDGzsl8TG47KohiIZwUf?=
 =?us-ascii?Q?krNsvC4fZ7mYrk/a8rtqIlpgtO6KdIPqc5SEFdS90BipVr0TtR3dVLtxegX5?=
 =?us-ascii?Q?adBAbCo32ORC3yjKayT/D2K03sAnAqWtfJLyK6IX3eO2375MwHVPIDTOT3wb?=
 =?us-ascii?Q?vVeHjGAN7CAenxemMEAnsUlCQg1eIKPdNnALJPXZRPEucKSNIQbqSkBelAao?=
 =?us-ascii?Q?MaLZGzibR9FXCoWEIF5LbzC9Qud4tQrvAhdg9xzMrbjY9CxztgOPwl4F8DMR?=
 =?us-ascii?Q?5ELAhfvK6nfTL73/Nuy02yL3Iopt+3PNxhQNUI9FWmULGQBARQFbJcuoR5AI?=
 =?us-ascii?Q?OvFwI56JPxu4VCoXcMs4Xit2EEN/s9FsBSl7f+U0oGSpXC6lmg0w2BHvHFe4?=
 =?us-ascii?Q?fPWILbHgpM8AH0TiMRuBfZmjkFmhtke1QjbmjkNpwrkiB8gDc3Pshxe24Qd1?=
 =?us-ascii?Q?hTvg9+Eg8oev74tyKCtV3ebQJkLF0iWrNKFB6rL7BtKX5h3SLQkf+BEMPFOD?=
 =?us-ascii?Q?ynMPuMP79vZe1Gikij6vzE+Fo+1J6hOnpSuT409euiQacnlDRHCskWqRR+FQ?=
 =?us-ascii?Q?gC5kHCoGrRQghrhr1grqI+B1TiDXC0mKRwFtG9qIOZ5IyUiwnDuhcV20vZo/?=
 =?us-ascii?Q?BaHc97mStvmyiB1jDan6YYi8+Y7R6BIM4svpZQLSg+SQmiYraD82EWAvZl9q?=
 =?us-ascii?Q?PBoLZY19HuWC363Yhfab10hNP7cVgClqGr1X0I/Hw86T3GIo7FlTlIIv8c/Q?=
 =?us-ascii?Q?gPp7DbK83qsLiKVvO2Ta8qR5lNwyN1vzNhNvvyw+e07hAm/udl+2ZvikAhSS?=
 =?us-ascii?Q?GkMy0SkeaPWPmklezHTRfrxsftMoxKxvESCZCo5BZjnbkOKEFqR0gKnBJbjv?=
 =?us-ascii?Q?p8WY8if4LEdIzsVU2tARJ7Ekqu3ZJOY65DBxvmU/P+J74bmhSnbyl/2tXQH/?=
 =?us-ascii?Q?CPP1u2hzN+3BdMcXcVUhC5Im2zLpgTagLqRzmwrfqDqedQwCBGK27sAeAtem?=
 =?us-ascii?Q?C5RsrK/olBn0Lb2flH9QpqEWn4aQZksTGiI57711fxAHHd/SroI7n+8DZRDp?=
 =?us-ascii?Q?BJkThFa/9nSElY5qoHqgO5BBusr8Lj7lHNZJgLnUz0b+mgySNB8ydfraURZW?=
 =?us-ascii?Q?53/WNqKGgXXRqpfDGiWM8i5Z4ka8UIEIjKyMuPbE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a98884e-03f3-4851-3e53-08dcc284fa63
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:32:37.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwtgUmaF2ws+9clcf8Rzedcq/4/rl0j6AjYqDjpq1DjN10NfGYW+lrpEW/g4+blBjuuDZgqcrczVKq0DCR52bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259
Cc: Yangtao Li <frank.li@vivo.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next 0/9] net: convert to devm_clk_get_enabled()
	and devm_clk_get_optional_enabled()
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

This patchset simplify code w/ devm_clk_get*_enabled() API.

Yangtao Li (9):
  net: stmmac: dwmac-intel-plat: Convert to devm_clk_get_enabled()
  net: stmmac: platform: Convert to devm_clk_get_enabled() and
    devm_clk_get_optional_enabled()
  net: ethernet: cortina: Convert to devm_clk_get_enabled()
  net: mdio: hisi-femac: Convert to devm_clk_get_enabled()
  net: dsa: rzn1_a5psw: Convert to devm_clk_get_enabled()
  net: ethernet: broadcom: bcm63xx_enet: Convert to
    devm_clk_get_enabled()
  net: ethernet: marvell: mvneta: Convert to devm_clk_get_enabled()
  net: mvpp2: Convert to devm_clk_get_enabled() and
    devm_clk_get_optional_enabled()
  net: marvell: pxa168_eth: Convert to devm_clk_get_enabled()

 drivers/net/dsa/rzn1_a5psw.c                  | 22 +----
 drivers/net/ethernet/broadcom/bcm63xx_enet.c  | 47 +++-------
 drivers/net/ethernet/broadcom/bcm63xx_enet.h  |  6 --
 drivers/net/ethernet/cortina/gemini.c         | 25 ++----
 drivers/net/ethernet/marvell/mvneta_bm.c      | 16 ++--
 drivers/net/ethernet/marvell/mvneta_bm.h      |  1 -
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 86 +++++--------------
 drivers/net/ethernet/marvell/pxa168_eth.c     | 17 +---
 .../stmicro/stmmac/dwmac-intel-plat.c         | 11 +--
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 34 ++------
 drivers/net/mdio/mdio-hisi-femac.c            | 18 ++--
 12 files changed, 71 insertions(+), 219 deletions(-)

-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
