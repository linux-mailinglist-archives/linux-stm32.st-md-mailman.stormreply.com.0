Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49695C61D
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 09:06:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 106B6C71289;
	Fri, 23 Aug 2024 07:06:52 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072.outbound.protection.outlook.com [40.107.215.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AC82C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 07:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlPhJ8L4Gzzvb9SJ955JgBnShzbf8Hchz5vzGN4XQA9mm1QC030LNVTy9iGTOXpJGxZ9m5JKubi1Ljgu2CR5cYfaDvOG0nqCFSwQG1tryaBxobeXcETFrL4bQALLr/bAVONDGCsdo3bmCOxn7SfLF33G+rAzQr/qQcRNODL719tbEN25E5/mzohEBTSV3W+Ob61dypg4x3insIprl1FxCtgx1I2lLSdzMX778VkaTSbVk8XHLXucuRo27785+hd1lBOXOxYiVxzp0prBTtXaoDVfF2oWLDuSweuw+U+cTSIALxJWwIlN4zdwRtmbAwzUdppzKhvDkY+08mp3dJO/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wKdpf+etVGbdks0u7PTUFK7xQGU2Gc9tVtz4VzV9uM=;
 b=wcWcWPClike3g0pupVw67JkZTgKOqAdNReCIB7rMH8UKWKMBdrInFd0vWCdBkyd3e4CnwNg+ZBWNDD6HB5Oy5C6jCo0uAb8cuPL0XBmgp3SWCc9ZwOIiBi3AhwjqnPnJMpV883aC7o7uC1eijdxrmAJR7WY0vOI6JSRIQLAm8XhkeXpda0dnFaIh7HtrMqL6Y93jZHU/eyTDq3n32lNNwD5VxouQIIcz5wChOny8QzLp8wrvyIXXc/ZaWstzLP8zS90SGyBeRKnr1HBtgRvt1pXVxpvtVhuKJCVNRssognDOket28q3MTGhvaD6IXbra/i7jlLpmAK6mRxQXJN9xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wKdpf+etVGbdks0u7PTUFK7xQGU2Gc9tVtz4VzV9uM=;
 b=EfLXmJt8C7wSI/wMbmwd5zrkI/vIqK9QGG0RBYNXVFHWb1EKSJPfmt2Ic1tFqouAV1iBsr7x/CBZH5lQxat4TZywJKaBJmpIiY+Kz2oKak78RHQGrBJGI2w7+Fwt+miyFY5M/7OLaURbiyd66m4/svRW5rLaz6j1/VSjWst7thW6QCFXaZOC+IIsMfqJzv0ZytDLEqJF0cZQCYxy0sMZkkYqTCTug2iqFj3j0nwp8ImiOy02dS+nlZyc04qjSTVOrlCxVmQ+k+rWBe6xPHlGXRVWuRstxXjv6ETY20FuS4OXrnmIgUcZg5Stbpuz1lQkk5pbH8V8CW8InTCbHsrzzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB7069.apcprd06.prod.outlook.com (2603:1096:101:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:06:46 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:06:46 +0000
From: Yangtao Li <frank.li@vivo.com>
To: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, marcin.s.wojtas@gmail.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, kees@kernel.org,
 justinstitt@google.com, u.kleine-koenig@pengutronix.de, horms@kernel.org,
 sd@queasysnail.net
Date: Fri, 23 Aug 2024 01:21:16 -0600
Message-Id: <20240823072122.2053401-5-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823072122.2053401-1-frank.li@vivo.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a28efc4-a126-4de6-43b0-08dcc34226b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kFmXydhXfPqk1siDk7NX9SkxTmjXNJEqYn5pp2kQJjqYOIbM5VaxVw0QpY/H?=
 =?us-ascii?Q?Jakj/761brMD6kKdrTvrA1mmUMbTzRGg+Bg6JcoUmNCk7+Upj6GXA9Zq/+si?=
 =?us-ascii?Q?ztWscI0USLxkGdnvLyo9w4YemgVNp5rp0XpzRJWm9vIu5YRaO1OyyxsVHTn3?=
 =?us-ascii?Q?HLmKh8dnbxQ6EG52wYVTJ6xKFINEwFQxiORx+aZHCTTGlmd5KVGGMWOzK/Y4?=
 =?us-ascii?Q?UEcP9hokOj1bLBd8rMJA3z5PcxkKxbKFKfp0/5Lc3DOsUYtFax22aeEumL0w?=
 =?us-ascii?Q?6NJmQlgewL3HTZnLPXboIS0qZtY6AhjWnaa3o+vrTYf8yEiYlN4yDY+rVOFU?=
 =?us-ascii?Q?gz9FmogeUGoderw+goW4H9lHqRNYa5TUv5+A3h5Y1Q8L/XH9j0NiDTiuzNZu?=
 =?us-ascii?Q?tuuHHezarKww+qK8+B9ySzpkPjkWpO5NkZhgD/rZpbDJcrp+vNkKhlySCcSs?=
 =?us-ascii?Q?Avn5rwQi0M/KzjX7KgqL7B7eHglcl8kuPrvqij/cWvbi1t2gSesoMraObny0?=
 =?us-ascii?Q?K+JdHYQOfQvqI5biEZUmJk7LDDi/jzm/9C5tVfU0n3Q0wX+WqhJt/Rzx6QHP?=
 =?us-ascii?Q?j/V78WUvj0nIiiHtidGKGPSl/BpfODU1n7Hz6xtIASxlnEDLov+7M3fIvUKe?=
 =?us-ascii?Q?A+0YSiRWOZj/V/9cgLeuIoMwMFOUjyLvAChcnidlsQ+SzGm2zvyE9Mv0rn7k?=
 =?us-ascii?Q?uqJlKSTF2yahidyjYdniStZPS2DkBHrN4UZjMvkOcR4OOxB04bIJH/Ocr+qR?=
 =?us-ascii?Q?SppVu8OaPJ93JEm0HpwHaHSHehONQjx04f3p4oz6vwVTmUOgvY+Mw+mmO4cr?=
 =?us-ascii?Q?iYuElXBGqRhCixxHlWvR7Y0uygFlwAKzwLGHHRHhYk5tvqPGHV7IQX/nSPu4?=
 =?us-ascii?Q?G53f3lHMRz1OMQDqtAqkLR3UoyD4Y/XsO11PLU6ARY15dSwpCpiSxjvP2lt1?=
 =?us-ascii?Q?o1D5ba4beWaVHvL0JG5UMwHqQuMw5/QZln02pS5ZQCJDI7XsyYVjJECnW6Ts?=
 =?us-ascii?Q?//+e44+gIBJSUW6cWTEPhvDHZSmHxw5nlm7NIYXl+zEEj0BQlxbjmIS9I4Jx?=
 =?us-ascii?Q?uNVq/BQaPIvMe+ZZT73V9hWiN3eoHb+Bnh1MOcWUBsrGBg5aaDJqHBe18xnL?=
 =?us-ascii?Q?Q2D/dAhTzXFBNIJu+5pK961afEMlfMoSLbetsGMVhMZ9REWaENHokpM9jsPN?=
 =?us-ascii?Q?3Wb2lQ4ld1Tphj+nYK38sjXydvuEMvbDTCfhEVsX0Ir99ccjFQc9MTpLJcdQ?=
 =?us-ascii?Q?T9f1VLnluZ5vkaobvcRLtyR3+FLHADMEPLoWg3fk9qmAKmIE0u14LWi5rU8F?=
 =?us-ascii?Q?umyrtWaMfjmedM4bpd0k84iI0bz6evtLWuuDFcbPW7hg3g9kJyLyeKtyGd4z?=
 =?us-ascii?Q?0jzDTa/S71vinDvlSHQzit1EKLlSd6/YjO6uSW89bwcuIPDQrHt3Tic/QbUF?=
 =?us-ascii?Q?vpdu9hCwq2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7x5U5qteOabPxMyq2giawSvLV32FTJg4VJGchDyfKBpCyNrZsN8KWMv+4hu?=
 =?us-ascii?Q?TjmAv2aRBJ6Rn06fC1MAqpIY/mSWQP1cNiOWX5HXrFzuZJGFAx1oy1+h1Exo?=
 =?us-ascii?Q?cFoltBa7847zJgj2ORMTYHsVzLVKte1j/0VpiDSqYD3NpYDlO9DRHc3ZenOt?=
 =?us-ascii?Q?gw6QaTSC8QNd1T//sqKRyQVYTakOI0+Ikn4eUPeCEBjo4Dxo4DPg1Uslrz3w?=
 =?us-ascii?Q?nE34/yifaLmt+kSML+r+wTE/lW8MpRNaRtES1rTI/zLdECSwRldbHe1Ki1KX?=
 =?us-ascii?Q?7Ijc5kmqsL7ENOskat0+OrO1xyT4mZWJkR+sTuv2coiB9PYvDfBT2DAbPl61?=
 =?us-ascii?Q?rlDLQjNJHdBCnSaeE9RCxmzgqf8HF22sebgW7HQ1+gUW3OXXuNUviSpQWBW2?=
 =?us-ascii?Q?gn0ooshr4ieKjM7GNTJ3u7hqIAtxrz0cL/qNwegMmgIHei58PPI9KFt+iyiv?=
 =?us-ascii?Q?U7W+oPBzsE0ylPK3v0SPDc82rBRZfba0/Lkkn4+6JcNeOWnfHNv9Ujrlo9UY?=
 =?us-ascii?Q?vi4JCw/Ghgt3GWTnTtq4Sra6h6HA6an6jhqTn4mKKVw6vh+N0YUdchfgfPRV?=
 =?us-ascii?Q?/bSvQvQQboU+x7p6a6EZuwUjX1VUiZDM7tncNO71wnobksAvX36c1WSqLf2d?=
 =?us-ascii?Q?8JRzi0T8Zk43xLgRljWXeKv4edf6nTVpKCFi53eNHDKvwTtbWjoic3FK8tXI?=
 =?us-ascii?Q?9Ti1hhGMTRpLXbIQwyaWfbSAaYNS9+UBRlW5toprvzIrRy1P+mmBi5EWdGYA?=
 =?us-ascii?Q?dC7KUukfFeg8HMXUfP7KEH5uJTJJn0s4XSIttAle0vuGXw7fUFIrlGHYcFiz?=
 =?us-ascii?Q?6e167Lzj1G/EtaLnQGljJeI8x2wCZU3OOWxd+uf10eXhceHAjj7iaUfDRAJh?=
 =?us-ascii?Q?i4x3OSJjnXtlAGOdOPJN0py/dFwRE5ob4OUP0U9yIqgtam96gpWOsat3hzoX?=
 =?us-ascii?Q?xw78jUrjWtPOPHQN+LQf2dAbKbdnnAcpiMGHLOniEpIcyVCe18RW/Jhp+nMd?=
 =?us-ascii?Q?3xcHPBJt/2v04h/lA9DjWRRMiOCuN4abyu8yRo/weRld4rIuZV5J5TRVfpIi?=
 =?us-ascii?Q?KoC8/NWv1Qrsn88Lxu/KI2SXUJ7Ti6sz+6UXMUYFceAKDvXlYlx1xfVKfMuw?=
 =?us-ascii?Q?IwXycNPBH7Xun96HyxR7izHYceUbOgV13DDZJGmrtpUWIhAG3xePW6cNOrII?=
 =?us-ascii?Q?70kB5igA/+SOWIR8FAZkVsVufZVnKleMFN5/I4CwTX+4C+CXcO6ynm2mHbEg?=
 =?us-ascii?Q?U1Jq+exDv00ZLsHrEIKwlo1odtSyaufW3C/Sui66HxKeo90eY35RYNQPBd6J?=
 =?us-ascii?Q?PMLiSZyu14hcmf5Be5mit0g2TIvV8MPSirJILSFFBDl0qmz1tMToOqwXz2Pe?=
 =?us-ascii?Q?fkzYh9XqlkjnxdvhimN1FxAaXTc+33tWQsPQ3U/I7YdcdVy3WGdZfT2dYHu4?=
 =?us-ascii?Q?TBtFLQgWlia9LNtbXucWTAfGnAErkabFocGoNi3gqSoTDs03w8YFevOBrqBr?=
 =?us-ascii?Q?XI7SNXx4Tp6YTC6b3DkawO+iFxUO++0AR8KD5aPTU9Jm4paCg2/zK/i+a5il?=
 =?us-ascii?Q?+aayMB9xyMbb5cfQ89Lb3AJnwlGm9eJ8eNsIvviI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a28efc4-a126-4de6-43b0-08dcc34226b4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:06:46.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jED3dyZosRlGHG4NYO8ODC3Xe+XJKdYaAgQ9p/yZy7rnVj+M8wrhMLpNjiSOtXCMyaQAKk9Lmcti1siSwntHwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7069
Cc: Yangtao Li <frank.li@vivo.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next v2 4/9] net: mdio: hisi-femac: Convert to
	devm_clk_get_enabled()
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

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/mdio/mdio-hisi-femac.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/mdio/mdio-hisi-femac.c b/drivers/net/mdio/mdio-hisi-femac.c
index 6703f626ee83..f6fcb9e11624 100644
--- a/drivers/net/mdio/mdio-hisi-femac.c
+++ b/drivers/net/mdio/mdio-hisi-femac.c
@@ -21,7 +21,6 @@
 #define BIT_WR_DATA_OFFSET	16
 
 struct hisi_femac_mdio_data {
-	struct clk *clk;
 	void __iomem *membase;
 };
 
@@ -74,6 +73,7 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct mii_bus *bus;
 	struct hisi_femac_mdio_data *data;
+	struct clk *clk;
 	int ret;
 
 	bus = mdiobus_alloc_size(sizeof(*data));
@@ -93,26 +93,20 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 		goto err_out_free_mdiobus;
 	}
 
-	data->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(data->clk)) {
-		ret = PTR_ERR(data->clk);
+	clk = devm_clk_get_prepared(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		goto err_out_free_mdiobus;
 	}
 
-	ret = clk_prepare_enable(data->clk);
-	if (ret)
-		goto err_out_free_mdiobus;
-
 	ret = of_mdiobus_register(bus, np);
 	if (ret)
-		goto err_out_disable_clk;
+		goto err_out_free_mdiobus;
 
 	platform_set_drvdata(pdev, bus);
 
 	return 0;
 
-err_out_disable_clk:
-	clk_disable_unprepare(data->clk);
 err_out_free_mdiobus:
 	mdiobus_free(bus);
 	return ret;
@@ -121,10 +115,8 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 static void hisi_femac_mdio_remove(struct platform_device *pdev)
 {
 	struct mii_bus *bus = platform_get_drvdata(pdev);
-	struct hisi_femac_mdio_data *data = bus->priv;
 
 	mdiobus_unregister(bus);
-	clk_disable_unprepare(data->clk);
 	mdiobus_free(bus);
 }
 
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
