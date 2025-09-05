Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2852B45084
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 09:57:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A58CCC3FAD8;
	Fri,  5 Sep 2025 07:57:21 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012060.outbound.protection.outlook.com [52.101.126.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F8FAC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 07:28:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVasdk1B6LkAMbKSSalo/eXd5QEeTPmeUgBqrAuiXhabSMnwfIcZpRNv3yX6ggrxGvSTQlWH/5Yu46QelBXAJC9yG4uIK8mdKvFsDhpo/uVquiKIhwGUEEn9b0L9Ts7VoGAw3pLtPzlQUCGP5XAL+jDB04fi13IcBM53Rrldc1IBWfGgzxgBpOWCraEez1ZNkXEylmQ19ycKQEu4Q3e6v/s1dCgXygYdi1jBbf2zhro7iApwbM/QVm/aLnE/PrK6kzj8qsfJ2hzZY8pL2KCf0B5Phe5sDgaWQLQP++WGDGR6z9whr5M9INIQ8p5x/bvcP1AUpiHmPdCwnwoqifYtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x5BdNGWySFkJRsZWTnTXPpw0i56q89McRLYTraf5Uo=;
 b=Rmvskj9VUzn3Pmwxkn2/VBHcKpAf1tIF/tj9xajj5i607trbF1OS7fPu0RGHr1aZeFlI0FLfNuSIJt3+vJ3CQAdhFRz712jK43IgX0QWWOKwC61zUdwiOn3aiBKId2nxgtF8A0GydfAH6pHi3Ufl/V/SCWr3zCTMrQfM6gS1W0syJ9iP/ehMDGqcmYtWbfJ0+sEoBqqb4Mt1sqdiOiid3CdHsCoJyLAfoWLmdtLE3pzXCqYAVBCCRh0y+LBBtNXgUT2SGpGGmzAyhAkzldQ38ci+3GNM/AiCW1aCA61pgYPNB6XObdqoIyCSyZyGUlKbqlGVpVETfilSIEOKYTx6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8x5BdNGWySFkJRsZWTnTXPpw0i56q89McRLYTraf5Uo=;
 b=I2OXnHd6qHWWzEhGMxJX4LQ8GAO5PI0KFBv0S7fR+W3++TMGK/HrYwBglbjUCNYLMyrM6EiOD6DciuYdQf+vGkeVb1reR/aSDE96AWzE6sGYUn1h7YX1DMcS71wQAWcJ1na2DuwreT46+5VyXglYtb2SEc6b5vcjgadVFQbRjFeXErzOV/XD9BzE+tEn914F4ghDf5SANhP9xXhF8spdU0Y9wsG4mfNK08x2hSio+xZnH1DqW2xJmBHVUbjT4cYDVjmJMoEBCGkIaepW3tvlGwL2WZyaN/TtF3jkNzzqoPUybJDmukPgpH3jRxvp+dc9fnt45nzUWY+wtZAu2GWosQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7)
 by KL1PR0601MB5837.apcprd06.prod.outlook.com (2603:1096:820:c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 07:28:12 +0000
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5]) by KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 07:28:12 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
 linux-kernel@vger.kernel.org (open list),
 linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC
 support), 
 linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
 linux-pm@vger.kernel.org (open list:THERMAL),
 linux-amlogic@lists.infradead.org (open list:THERMAL DRIVER FOR AMLOGIC SOCS), 
 linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835
 ARM ARCHITECTURE), 
 imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
 linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
 linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL DRIVERS),
 linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
 linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
 linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER)
Date: Fri,  5 Sep 2025 15:23:59 +0800
Message-Id: <20250905072423.368123-8-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905072423.368123-1-zhao.xichao@vivo.com>
References: <20250905072423.368123-1-zhao.xichao@vivo.com>
X-ClientProxiedBy: TYCP286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::16) To KL1PR06MB7330.apcprd06.prod.outlook.com
 (2603:1096:820:146::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB7330:EE_|KL1PR0601MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: b3bc7e0d-d547-443b-88ea-08ddec4dc56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o4CxCtlat7lbWP86JjVka2Ko6vI/A2zbdqz62LFXo07Q0VSZOQ6GELgqgWr1?=
 =?us-ascii?Q?yavdLlFOiAm05SsT/PIEvPALmGlxYd8fD5D9RzP9mFTLfk7hvWt/rVM6sc3m?=
 =?us-ascii?Q?kvWRmsHsn6fJe8tCFx9bwABALfy4EvwRb70DkUSnmPy+iUmjpVCOWxooN1Wj?=
 =?us-ascii?Q?wcuJlRbMxUXQlQQAis8/ruCoFrrxSCdiizPiQG5iNRLYKm1uZrxMNVpWpWzj?=
 =?us-ascii?Q?c3L3QfU1PvRZfN6GGuA2OAW4/ayTVriP6Yfl1xGdbFpy79xeJyJDEXRTJf46?=
 =?us-ascii?Q?+WLEbu7+yp05HHlA+WmKS3q6xwFWTv01zy9aBZ9ekl9YKCfPw2WO8Ee+4IWk?=
 =?us-ascii?Q?AEIqi2emsFVm2HKHosNi25xdG8MF6mtlLW+jInAK05XEtD7WCBf0Txe/dMdB?=
 =?us-ascii?Q?SVjRRA19K9RaJTSGdQl7caU6kKUeOVejGEpAvIyd8zNR6RaoLBsyk9i/sIx8?=
 =?us-ascii?Q?vhlSqAeDaLSAWN1BxVdrjOs+0+OtoXq9/BSWTLcjYj79V+aNWt8LKOCHRB4O?=
 =?us-ascii?Q?DAsYLISIOAziYVLF4VV9kDzTssVyhK2q5bh3jSDqJM9Igb3FqnrSY933MmrU?=
 =?us-ascii?Q?aF/Kuk2MIcF52HwbOjvPqLeNhUqYqvdYnnmIcWC0uFik5cL4uJeDVVe0HM+7?=
 =?us-ascii?Q?HPXwaVZBWFb+oxnaLkSopxvdta+lkGjGynqzPlyjHjnmGbIebo6rngyle5po?=
 =?us-ascii?Q?SeCh3RzvoK13OUW7VjLCDgNqp7qUtV/ly4R+DeT7GY4MxSj9Wwc9tlnB3LAD?=
 =?us-ascii?Q?hj8yGTXMhlNFGY5llZqiYNU3E2/c+AmSj+58feTpahfuQsbolQAHBPDtqhHH?=
 =?us-ascii?Q?biTmcML2ztftLhZpXE+RsxAYJ+X9kRIrCwZRWEy5cKXNP9L41inJ4seHRyvU?=
 =?us-ascii?Q?o5eMCv46p/XfWzR9NYx38Veat3HifPFdFd7ZFsgwIS3yHarZqfJNPW3rV0+/?=
 =?us-ascii?Q?5FzmLmFQ3T/XKDO8EyFB9y4na5wpeTlu2K/Pn2q+5RSLrSeIQEvOHQQwyCpX?=
 =?us-ascii?Q?fHx8HmvaXGAM/6xtciV7QiFncyq8LLvSuKoCPaF9s2TNZEn0nb0QkdPtLPyK?=
 =?us-ascii?Q?HdI4lHciMtHMjKA03p6sEDpRTzTe7D/DHQJuxhLsiw57g5OVekn4wZ0xKbgX?=
 =?us-ascii?Q?OGIvs5e/nUh0l4adWQOPXhy5GoXFbREL15GSfcxKxf9LvWMLck/Bb1f0v7cK?=
 =?us-ascii?Q?ZTOfZ0wDRcDYyDthCRysdk6hgETCVyN+P3IKZ+UcDEFMhXaL1+9tHWcntZ15?=
 =?us-ascii?Q?cISIiwjDTmVQerIjrzq9Jg2fiCnYYyTwKchp/VRiI/KNsFkkCJdgwWGpBLrV?=
 =?us-ascii?Q?FeVSfreqtt2gXi3Dfd8lLXShYk3gqcm1pHjNK1Jf/0OjOxPyRf3PbBjTHAFj?=
 =?us-ascii?Q?GuLkkN4GXM0xNUXzqiYU6we+fSUtEFLU732yuPkrw+yCW/HYAweBhZc4Mkx/?=
 =?us-ascii?Q?BkFn7UYC6+TuqKNICQsRll00EQTjbelON7kcEIaleN9ibo9BhA5hsq41498C?=
 =?us-ascii?Q?pp7JuXHOVQc2vfs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB7330.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?35tRTrI7eAlsVB0n/eT76tWdPsHyJeGh+GwcSMj42mhR9dyTZo0JvZPLobpm?=
 =?us-ascii?Q?MjcuTdni2NGsEPiq3ekP9LyWmcLJPkfeeUTh6oKLQlKHKcZmlmEmZ/BftwEW?=
 =?us-ascii?Q?/m7RWTMyPcy8f9WAebn8qkbaIjIZCKjBDN6Y7ToK5GpgflOJONW77Rw+0GZG?=
 =?us-ascii?Q?QAt3U7pvzMw7VjzQrDIsWdBVjTDBelj2/LMOn1KEgfTKFvyrCx5DHEeNLF3R?=
 =?us-ascii?Q?igRu8OC3VP9pGK5fFCsIObrw6g7VqFjdq5AsaYiFnvVq8Ba5UXZu9T+N8ZTB?=
 =?us-ascii?Q?GfejnOZEs3ZEmGTDfh+ih2kP1J3TK2dp4hRO3ZAggKsCYWTQbxX3bbGu/kQU?=
 =?us-ascii?Q?w8/7crj24E7KwpkKQwgAVbvjDmWvh9aBh0QHCFkidutOaZMlT3x0CDnZ2Moj?=
 =?us-ascii?Q?dO9Wh5+czO1jrjjAFgaqzepZP1XhC1THjLs7S9wSEZcCGuEapAFX/g3z6Jw7?=
 =?us-ascii?Q?EC9YCSwxtVkQ9pvvUS6/FTxZ8TMtfkJxCTNcX8UexI/Nb3UZFpJkpFhPPlGF?=
 =?us-ascii?Q?oliovPdC+wp/I9d8WNMFtzEPaGQinlTcN7JONT1CVQMOlkW8Tsqs9UI6LnuJ?=
 =?us-ascii?Q?ASvL6ZE+bSWqueDeoyuv3RKpwaPZ4MkyY6qSEMbASZSgRfDf61Vuax2nR8OB?=
 =?us-ascii?Q?DzuBbK4KbiZoQqLXOHXjrGf3mL7YHi+VmLfdrd8l1NKYW+2birQ7JCCjO40K?=
 =?us-ascii?Q?7DmZP6S2EfVqEM3QoT/B3SI1p1uYmJ7u4h5Wuea2C4Ocs53CKXioSsHJNgg5?=
 =?us-ascii?Q?VrRXZnC5IkYTx2I/XjGKuAqxYVlS7wvnILAw+wOSgw71HiXdu/PeiZvE50PO?=
 =?us-ascii?Q?uDWOBgEBIwLGMVZy5LnRWW7pvBQDqK9SEA2aGyHBWWy+bS2L20VA+yEyRBJc?=
 =?us-ascii?Q?jijBpFS1pxy4sv+gSLhJsWSfDuQn4ANDE/wLSauZc4Z8sTb8TCIIzKvVyBhv?=
 =?us-ascii?Q?fezRqqAbOGQtoHo/dyRTSEJwO0NubGvpAq1nPIEDFgK9ig+X+11AHMbn44yf?=
 =?us-ascii?Q?cX88dJUQ8+eLMMtlZYkmHfGN7YKeHDCmRClbEfHKSsd6tKVi9iypiLPH849n?=
 =?us-ascii?Q?x3F4FtuuRr4ONapmF5jBAlUiJXsChMcgx2JJO24dWh7u5U1ZcjXhQYBEXLA6?=
 =?us-ascii?Q?w3q4WHm465BZdE9TXukK1EyNaHDXGBAbcFFDsOuKOHuK+zEM5xRHajMekoOP?=
 =?us-ascii?Q?6bZ/Gcns5MiLEk+C0mkPxY9xstiicIPmqxhLg4F9eK7Un3t9oSmAZdGpWsho?=
 =?us-ascii?Q?SkM2eONoV+U4nguELVbIW1zfsTAeqCty6eNiUNRdd2rW3T+qkk1ETQAwlqgL?=
 =?us-ascii?Q?BiwIrM4IseUFEgxo9i6waCJLJeyvaSJnECfldCbDIWeQ7fxcbXl5ii6JTDjf?=
 =?us-ascii?Q?PYTczGk0U6Vnb2DTlv32V44FZfC7hXqVtZe680J22trljQ2kVCQVl6oGBitO?=
 =?us-ascii?Q?hIJruONlAHklu3JGhVNLdoPPePYEpSe/BcX1h/59zsFGg2bTKRBpQt4B5q9D?=
 =?us-ascii?Q?cSVzVt3E9iRs+P09WNsXmEF2YGW50K4HAAyILlIJ3xVcW6thzjjGZBNQAuAX?=
 =?us-ascii?Q?Ag3y29pv3CSeVPZe99pRKxZTofmTShlR8xX7SFy/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bc7e0d-d547-443b-88ea-08ddec4dc56e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB7330.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 07:28:12.7749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5F/dTrXv+HnKnMmHQNJQAUnToMU0nO95t4Urb//dcsIpYQFm2sheQBP80eiGlXjV6VIv5MLRa90kiG4kW26crw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5837
X-Mailman-Approved-At: Fri, 05 Sep 2025 07:57:19 +0000
Cc: Xichao Zhao <zhao.xichao@vivo.com>
Subject: [Linux-stm32] [PATCH 07/12] thermal: qcom: Remove redundant error
	log prints
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

devm_thermal_of_zone_register() prints error log messages when
it fails, so there is no need to print error log messages again.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c    | 7 +------
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 3 +--
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index d7f2e6ca92c2..0ab14153e74d 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -677,14 +677,9 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 						    &adc_tm->channels[i],
 						    &adc_tm5_thermal_ops);
 		if (IS_ERR(tzd)) {
-			if (PTR_ERR(tzd) == -ENODEV) {
-				dev_dbg(adc_tm->dev, "thermal sensor on channel %d is not used\n",
-					 adc_tm->channels[i].channel);
+			if (PTR_ERR(tzd) == -ENODEV)
 				continue;
-			}
 
-			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
-				adc_tm->channels[i].channel, PTR_ERR(tzd));
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index f39ca0ddd17b..96f254f8816e 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -867,8 +867,7 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	chip->tz_dev = devm_thermal_of_zone_register(
 		&pdev->dev, 0, chip, chip->data->ops);
 	if (IS_ERR(chip->tz_dev))
-		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
-				     "failed to register sensor\n");
+		return PTR_ERR(chip->tz_dev);
 
 	ret = qpnp_tm_init(chip);
 	if (ret < 0)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
