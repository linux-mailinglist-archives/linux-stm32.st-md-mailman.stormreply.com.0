Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8309E8C56
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 08:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51C79C78031;
	Mon,  9 Dec 2024 07:40:44 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDF1FC78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 07:40:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTGuUuoYxz0yn7c3Cw/J94hRFk+uBdhaM0zK6lye0vuzYk9DCPKKdcZzCKbspo6lo5CX+pzQSgDsR8nJCxWcuTr4PuvR8zSC88UaObObNq5WOPEGbKnuO8CXO7vTsK2XCNRxQyBhwjvLOa3wOJBJf0p0BV2e3xwNymCMJl+PBAVWC/v2gHpOb2HNr5RkUjjm5jvRubD6Myj53Lzv4gBTZmk2H6jFN3bfYMqPsbYmKDuyyrMSExHPwXAlZB1fTW1TvqhSKYL69rNWJ25xzr+Op+7ULSnh5yHYiV5wa+tcX6oLM0aXP4PuSeU7Jo+oxZwFJ5Nw4JL0MHEn2udiUaJi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HyQknMTeb76d4PRMGEOX1kqYJhvW1OMzkTTBONvr1E=;
 b=CiXXpq4AFOHJBt/D4nIFJ/GkgCn0A5PC3k5M/WDxstGdBZx9fC5tvpwKqxIYQu3KTAMdefx/AWeMder2Y/YmJ6e+Ds0xzfXLwFeTKOLOvTdFvFa2o8yatM+a0Rb2gOKziR+KAp5ETbkdAZpN7WuWI534rSCrSx6npdeGWYRBufrhFZbzF5ghss7ciL0tRUOfwHY11WCTVqB6nCd8o/I0a1S4A63zaFq/9RpXneyEAB+JDlRsxy1XWSXJdCUe3n51etS2b5WipZy5q4k9NdRkjJ5tOEmdYiixpTrQPVXSnO6pe0aTi3hPC3hdemFEiozwKWt9BoOiW5xiM/hqsd4XAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HyQknMTeb76d4PRMGEOX1kqYJhvW1OMzkTTBONvr1E=;
 b=XY4Hl4/xecRPK/28/Z76CHSNfxZrMCmhv0UBsc8PA5+6bjWli5PdY2GwTs6GoLiu6bzDpg3BMocZo+s/n22J5Ie5Lw0FlM+1tRNRwsYWcWm4zb3JJomdJ+ziCa1f2dtuLdIh6YaHGV4weDW3H8iqGn65pHB3dH4YmkvOcE/ynLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5479.jpnprd01.prod.outlook.com
 (2603:1096:604:87::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:38 +0000
Message-ID: <87cyi1mhhl.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Daniel Mack
 <daniel@zonque.org>, David Rhodes <david.rhodes@cirrus.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter
 Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Dec 2024 07:40:38 +0000
X-ClientProxiedBy: TYCP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5479:EE_
X-MS-Office365-Filtering-Correlation-Id: 65501156-0d6b-4480-67b7-08dd1824c68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TcLSyH7JHedUWzlnTEHWARU6P1vpslFSoaum36b+uNRzeFukKcQs12+5kL0/?=
 =?us-ascii?Q?NTaybclAwsk2nNnjRqKiDo65cK75VPyCvCLfeL0zHlVUQAecUO3HkgmBNfef?=
 =?us-ascii?Q?Db2yo+JiWOBWCIiGs6E2jJ2V3hYYSoDqYZz5rZiNfLlddpWVgB5HsCRTWLLs?=
 =?us-ascii?Q?F9M5Lgx1rSG1y3VQDN2JoGw5cV3OUTE6PwMrn3IfAqHGo0srPVDTTNizB284?=
 =?us-ascii?Q?JvkYL1zge6agd/v2xLE4E6E3S8/kDxeWW+LqUtV5CjuhUFrUKLkC46pywFLS?=
 =?us-ascii?Q?Ism0RMDGomqSO4nsUAe28021LKKjfu91vXcaIVHzjINg0v2rtwJWJkICpW2i?=
 =?us-ascii?Q?WgV9IKyd2QNhA1z4KdOD6gp+MnGsb8ORacH4IVJhbeQDV+eoEE6BGD0I4GUn?=
 =?us-ascii?Q?gCc/bKfMbMbn6e7mBDG7Jkivu05KdyYi/KfIU6THRvEbOQI49wVMzZ5Pqy9K?=
 =?us-ascii?Q?8VueZdOz2P1cJkC8lH8/BbUObIn1o+KPGANHdXdP0QurFaIuqg8/tbNeY3UO?=
 =?us-ascii?Q?4hu5Xv4Zz9EjDxrVPHDxOwyrzoSyJnzVCNXwtvEPNEmGJeh1bOdvx9n1m953?=
 =?us-ascii?Q?DftB0Nv3k8HZXWKK7qZTOpobebf+XzKJnyxX8FaxV17/d5VhGJwuN/cEgiVY?=
 =?us-ascii?Q?3/82F7klhPwQ/TDZpgouRde6pPE+BGHwOL5YracedZKZ8vvbeGfN5EtbjeA3?=
 =?us-ascii?Q?iwiQJWK6Z7pydnR1aP3pFMRNwHR32R5THE2C0iCjIqIzlD2geIbD1t53OzWl?=
 =?us-ascii?Q?LaKjO1qjr51MYDj9fTUsnEalVi0Jo258Ne/y2oR2e/AbxS11Dzpo6Xdzp7Wk?=
 =?us-ascii?Q?SwRdn2xo0ImFirIIeKJwKTToiKRNp/jP6HMVXzzhi9UP/k5fH3vEH4hOXNca?=
 =?us-ascii?Q?PvAS8zCFafwdYjvrGu5Bjhhltyh1/tWBjZgq60u5LRHjPWPhEy4V5Jj6sAP7?=
 =?us-ascii?Q?DCmtlzpUB8wDvxiBxrGfCdp6I+lUqT89ss/1ktQbrpRNr9wgftivNVlObwbz?=
 =?us-ascii?Q?kTwrBApCuMMd6Itggre9Smw7AaPGNEYXjQTG9SmsA1Y+w/ZMZ7sOYDmHSrt+?=
 =?us-ascii?Q?6wLYSQnwFdhgZp1eVreEVpSNcaixiCAimudH4SbX7uWQxMy6iWqQtqtytULn?=
 =?us-ascii?Q?AZv9RXa5wQWeOD5kw3vbSMRiZdza9ztUA7A9WXoluB3uN2j56KXwPygGvNC7?=
 =?us-ascii?Q?rO7xrIa2olxq0Ne9Yf/u46teBpGFxG7aoaigOgNy4iLCx5V3X72smWNgouGW?=
 =?us-ascii?Q?grFX6lIvQaYaNfXH/fKPO65WnEoyU/6pch+9DFaHVZRsCFqRMVqW0oCLWErK?=
 =?us-ascii?Q?g/dQ1KyFEWiLSqwfNDytQqJXI9QgbjOghWTnBPl8cdMX8XIlmE39JNyFOkJ2?=
 =?us-ascii?Q?mt97HvLvqFtHAQqxBpZ2yBHAhEYb6J3wDDYMe/tAUOYo4pza/Aaeu/HqOZWN?=
 =?us-ascii?Q?sij2Bn17BK5FSJ6UR3So7JB1hUYbENGG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G40UKSJXEmt4rAqQJSumXhzhEbgYS4VtjpY+eVaP9myv2VqOaH5LqhTx6swA?=
 =?us-ascii?Q?pUYVBBBryMvTSXXHv6wjFfCTJE08hN9o29twBv8losA5aSaLFR7LTN3aIDoy?=
 =?us-ascii?Q?dByY5psm+i+1U8qqKXudGe3MV1m0Th9cQDRzkd8Nyy7k2n93pSEuoU7mi7S8?=
 =?us-ascii?Q?9cj8Cjwn0NVcIi2EezCluByXd9ElKm5xiqE93wCIxzRRV0Mh7gJpoDE2hyCX?=
 =?us-ascii?Q?9KP6jb2STEmSwTINZvR9eMErd4OUmvM1/sSQSyxh1dACwuM/Uz/9PouOQeBL?=
 =?us-ascii?Q?XbmRJ0tj6jo58/tQTaDApplcVz6zMz8GJ5lFqSmPqTpt3RhLMHorXbCZUxQ4?=
 =?us-ascii?Q?+u4Lo7EqkMB4wAgI3uQyfp5Y0wWWAAJO3LInl6hI3TVx3FiFUL8zZJ7LALH6?=
 =?us-ascii?Q?421oz33UURDukB36GcWH3MCEBcYthCdicA9U4SD3qdsO66i2kYi5YgpRp1Rb?=
 =?us-ascii?Q?abNmjmUJIfxPJwoQKXLjJg3uhMNsYayV/UN7JuxQze5eweskF+zcmnvMCbjt?=
 =?us-ascii?Q?VGPrk+zeVtTteDRZYMw00qsdC7OGuSRSsH2RJ8PyWr6uqgxt/qJZ6H/UFiYd?=
 =?us-ascii?Q?+S99ECIjz7pjy9866ALStkbNKwqv+owvYgl9ibnDRAGjaHPyXIBto+EMIddO?=
 =?us-ascii?Q?a4GAChJifUcDkj3lTOk67DWUXmAtsc38pQutn2NULcUHRIajB5myrvSC/Ice?=
 =?us-ascii?Q?Urvh/zE+z81XndWU5e7Qm5dFVS9UnTiNKX3mAvVApBZ1Jz2Th7BS+UiRk/UQ?=
 =?us-ascii?Q?bXCMy4Ra7gY38pEJRVJLc4QUVGTNkP+mNr9u548S7/da8nE22AmAT/Y7+xTB?=
 =?us-ascii?Q?W23ulUioyBQbNomNoUw6nlc3gLEbhE3Nozvnysdsf9VdPkZdKaf/3ZjJOv58?=
 =?us-ascii?Q?nB3Z1hzi9+/0LRgkjDVsL8qH8WmQlYWiEKtzkWQolGBC0FzaXsuvcjEJ0JF5?=
 =?us-ascii?Q?bnC9+Oqd3wXJ8km6ogtO8oLaTT6IhaaQNAFTxm9up7/dWkkFd9y/n22E16sT?=
 =?us-ascii?Q?IuKTuldHah8y1wz/0Wu/KbN99XNcf28cNtXZAWkKzXOA6SPxdShlnUbCNwjw?=
 =?us-ascii?Q?qLgzU9Vrw0UdVcgDXIp55Ho0EiJKyW0lspQFGjarQuJjW35CcYuyaMwIrtmT?=
 =?us-ascii?Q?TVH8LPtuwTgQpIiiOBQbSFztc1yOiEpGdohwtvA0sev6G5NKAQ3SrMiwZ5PP?=
 =?us-ascii?Q?oWdV05E+zJkTSKTLgudE5/0DLo4N18YNo5AdvZ8jlcwnGneHVPGKS2E1p1Q0?=
 =?us-ascii?Q?2HzXD0GDv1NxwP5xYWLsxEg+FUJ2E82QESuhmtDSjt8htRrhyU2fsFJRy6+w?=
 =?us-ascii?Q?orKZqJBBaCIlEFOdBOJ2IJ5gxUlrhj0aBTFu79nWGVqUEsxNs63snJaMKk0y?=
 =?us-ascii?Q?WTVl2aDn5PT1GzVG8Uh19cXMCRC7zKpMTBFpS4C8i5Sn0GvbRmIDzsGW6wuf?=
 =?us-ascii?Q?gmZpd9gMDc+icwpjDhtAAN5d3ZHrU4h4VSRh2ezlVtZF4WgMvO2JAV49QB5v?=
 =?us-ascii?Q?Ra6w6n42EdYq+fGrUyiR+yOoNo1NrUpkLT39L5PM4msGt/NpZWbxnlNOly3K?=
 =?us-ascii?Q?/wv4MHHXJ/fv3P3R76ljI/Yn60TVtmZqZSk0J2yB7u6dCjfZB4R0ui6dDHYt?=
 =?us-ascii?Q?2orGVTDvMgDiZRCCbw/GCt0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65501156-0d6b-4480-67b7-08dd1824c68d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:38.6587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjoDx4i4c6yWU+SK9MnTfd3H9Z5I0R+4LjkDDMexXom6Q5dSKFay/tys8GCVcKt9AotwaBzeLNKxWjNq8vmUaI/KcG0NADUGaUyGOnbXPqNdIILPpKPg9lfwP86GZ9Wj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5479
Subject: [Linux-stm32] [PATCH 14/17] ASoC: codecs: madera: remove
	snd_soc_dai_set_tristate()
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

snd_soc_dai_set_tristate() has never been used before.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/madera.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index b24d6472ad5fc..92457b4a908bc 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3285,27 +3285,6 @@ static int madera_dai_set_sysclk(struct snd_soc_dai *dai,
 	return snd_soc_dapm_sync(dapm);
 }
 
-static int madera_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct snd_soc_component *component = dai->component;
-	int base = dai->driver->base;
-	unsigned int reg;
-	int ret;
-
-	if (tristate)
-		reg = MADERA_AIF1_TRI;
-	else
-		reg = 0;
-
-	ret = snd_soc_component_update_bits(component,
-					    base + MADERA_AIF_RATE_CTRL,
-					    MADERA_AIF1_TRI, reg);
-	if (ret < 0)
-		return ret;
-	else
-		return 0;
-}
-
 static void madera_set_channels_to_mask(struct snd_soc_dai *dai,
 					unsigned int base,
 					int channels, unsigned int mask)
@@ -3364,7 +3343,6 @@ const struct snd_soc_dai_ops madera_dai_ops = {
 	.set_tdm_slot = &madera_set_tdm_slot,
 	.hw_params = &madera_hw_params,
 	.set_sysclk = &madera_dai_set_sysclk,
-	.set_tristate = &madera_set_tristate,
 };
 EXPORT_SYMBOL_GPL(madera_dai_ops);
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
