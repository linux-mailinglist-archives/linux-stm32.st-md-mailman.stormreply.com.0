Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0C9E8C42
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 08:39:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F196C78021;
	Mon,  9 Dec 2024 07:39:39 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98309C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 07:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mA8cNqWtl3DAWxDP4Qs15q070XyV+i2xGBcY8eeFhmWeVcVP6VgKIIirAKNzv0tvpekeAIdTxYyWU9jtEUZhWjeqkkF4Vz6N5goTwQfad2PUL5k18O+rsAnjtmVKnNa1M4p5goobtiJAdPdbjlaqN+TkpV0nOtQAIRLWY/KEs5xgvgWHPcsHjdFZ835Z+5xVdblI/v5VpsX73BbsAFL79PxPcGSTLubwdw40aCErK7TitZ2x4BCaSOXZCreDimfFf6JPQ7ECPg95eldek+AdBI3RLWHaGJnL9tXT3/BZcKwYW6QgO7dZ4wdhkOI2k4ZHJ2X20xIvpx7Y4b91a05mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5HmWH/Cf6LPuqDOZT6MNvxQraeIjUGefr9rsl/vliM=;
 b=FaLWDQH42Yctwa2u+vYC6OhtnAcpl8+6WG9w8WUdKOY/y/u1zVnRtqrcHeJGDWGgvPisQD69qF9f+GSNz3W5rZxulOZ9qbhQsbdfzPoLoC2MeYsksXhA9NccVvh2A9fiNcFZWRAiFzmmqdX+au4lCxD+2Na5lh4bO3UW2L22Oqab07N3FlXXBcUMTE+AdAXvZUYcny7G7mDaFeDBP3I/6eDw1V5VsKcCfwiwdcsQoIy94HdR+pEg1WQU5hPS5bYVitm2rCYYTvn0NQsTv/vnIpMFmBxBtb87JN2BKRwmh1InFoP2xy3QzTruDbLfucY5r0fSS9H7DnnTLtb5xPpcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5HmWH/Cf6LPuqDOZT6MNvxQraeIjUGefr9rsl/vliM=;
 b=ZvH6RASMjkd2XHBMzJ3U5k7t56fQePr5ctNRAK2wbCpgl2amhY0a3lkuYAoki46vpfs5ipH0Djw6HcnegGL1W12kqWvz0D16ipEnSt+Op4+NUaaaJ71jy1BztO0Kf4GZOvoZLNjm3dGq6xQsFGnEqcPebuAjefurqJgJn7GFPYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:39:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:39:35 +0000
Message-ID: <87ttbdmhjd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,	Daniel Mack
 <daniel@zonque.org>,	David Rhodes <david.rhodes@cirrus.com>,	Haojian Zhuang
 <haojian.zhuang@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Lars-Peter
 Clausen <lars@metafoo.de>,	Liam Girdwood <lgirdwood@gmail.com>,	Luca
 Ceresoli <luca.ceresoli@bootlin.com>,	Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,	Richard Fitzgerald
 <rf@opensource.cirrus.com>,	Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>,	alsa-devel@alsa-project.org,
 linux-rpi-kernel@lists.infradead.org,	linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Dec 2024 07:39:34 +0000
X-ClientProxiedBy: TYAPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dab612-52b5-4368-9912-08dd1824a0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MLvvCWlDisjxi7htlLwWsCi3QL9OPjAJNmpwNeADLmu6/Hmng/ivlIa6vPnK?=
 =?us-ascii?Q?kulebF7AFgSgw1KSAQNGUuAaYGWQ+whgbo9eXsKzYKFZA/UMVhmvU5stUj2m?=
 =?us-ascii?Q?PgELZ7LNq7BeXh0KAgGwQlfMtGzLbWLu5m8paUGsMnZ775ZVDhWgNMU6bQxK?=
 =?us-ascii?Q?muGPJu7nkvsJhXzcOv+shSle9Es6MQKhI9wPdSHuk0aykmMiCx9I6QimYMwg?=
 =?us-ascii?Q?pzoK/sSHq7mH7E6nDF5TsgjTa6SrW4SFzf+hpywCgbQBjpBmFjjRAgTHmWSt?=
 =?us-ascii?Q?EwtePoOjo3nLNPcEfMy7vmYaBHB51DcU2hq1KJJBhdx9/QfE+8407Laib7AG?=
 =?us-ascii?Q?iEZjYxd6QeD0fsWM8mo9j86ykCWSEK0XcNr2zT9sJX17o91NSZIulP/H6S5j?=
 =?us-ascii?Q?Q5wPYtlcHliYd2Bx89h2AZ8u0W/r8JtET/uBDTiGbUBftSdR//KFF0OOJ0TC?=
 =?us-ascii?Q?xIAOuHRDnlhddJQfemkqPVJQi/6Ye9d8JWFk5pw+uvCw9QFIuOstEm7YrRYv?=
 =?us-ascii?Q?pJft/RhOgTHsZz1jXfs7+hD6JRUkc5V02uyExh0Lbw+Rn7EwdtalGdGio3/K?=
 =?us-ascii?Q?OFrVbnKBdqm4c2SYG458vLxy47zYRGFi1EjU3DWdyGCHCwi9UIMTNLSgpJoI?=
 =?us-ascii?Q?M5zqhODpsWJMfVFeH32e/d6zrc52tJ7GDVGnMkjS3mJb+RdzLGtdKx+3qN7x?=
 =?us-ascii?Q?C0X+MOeemxuZHMyTews+KTxID/2NA23hbVXs05WVeWSBezCXsUbdt/afU6v1?=
 =?us-ascii?Q?aSh694jo5BL+W/KKKhrDyHxWQ4q5kLcR29eYGSdscVQxa2Jy8EkFmqqlE7t4?=
 =?us-ascii?Q?O7Th+LgCSqGJtJA4Dfl9yaM4NXqFFBLy7yUFNEWCCIof2jUdVXT5ybVy4RSv?=
 =?us-ascii?Q?vr56fDb5D9bXqDVIUMIX4cL+rv5pD0DYhIQ/DjOT/GeflZLMeNwZ0iCCvtjc?=
 =?us-ascii?Q?zXBt3jVeelyLpAO62ZDiB3TcIEuTngVMDjTG8L1CSZQySMu2EXCIG1Kf5sMJ?=
 =?us-ascii?Q?QzO1reztwQY73KoQBulEU6kzEIqcEPdZaP0w7gjzAfTm7z+zmNGDhxWeletx?=
 =?us-ascii?Q?ty1YIWllBgLKj5sO34198xE6qxo5BNp8F4feHni1u76e0zeMxwfstYsc3JLV?=
 =?us-ascii?Q?68y566yj9oA/7T5hacviQf1dVrK0juScWGF3+oROmX7C4U0DgxjvA4fn8Zn8?=
 =?us-ascii?Q?HEcQMeHoyoOjkvP3TwZuBD3LRKkVz+Q71mfnchBvqf7Fln2/TJfzwxPvwGqK?=
 =?us-ascii?Q?uTIBvrRM9khqcVPQaqRQoosEl0nu4KwjCo/wEja+DIZzhcQGDsNNOKXlwq4f?=
 =?us-ascii?Q?ToMao0tlBmxQ14sDVN+dB0OZ6oesdfB7gK2WvpucfHwziCIR4EUPeEEYR0Xy?=
 =?us-ascii?Q?uH3CXZSL255qQIWIOqJG0FB19W+7VkbAV/Gi21lGwJVf5kgAeRfvhtlKsIH0?=
 =?us-ascii?Q?xWwFHAzsyo2Hh1aynSR0514QW7M7gBaC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YhWOgMkJFcar1zxTHxcGdTL9kI45lVzLvt51DHcT+pHHFtBMaJCkEPt7t4IP?=
 =?us-ascii?Q?pBVt9L1ICf2vj4YnE6hC5/GWc9PY4KxOdvZSMhBYmY6AdCvc56ReMNkBUzUJ?=
 =?us-ascii?Q?yN3ssmEw4p5RTaCEYtOUu400jxBLgHuBBNsMgEuXQqEe2oq1VqTB3NTlh99F?=
 =?us-ascii?Q?GxKbOpY2yZLBgS2dOBT+mkaFIBRwC9m/jt+iEgT9WprhLR+xMNrEZSeUoTaE?=
 =?us-ascii?Q?VmkIFnucwI69w3U4zxJF4mHDC/yciGiiQXY+quuTHl2Nzhne7TS4yRAB+DJA?=
 =?us-ascii?Q?i64+HoQXfTMPkyZcr9gYDvuyBqR/rvCB4uy6XaUEQjHHacuatYgn6CFZvsQu?=
 =?us-ascii?Q?DTetk3Rp0bjc1dWhE/cw9GB4DMJbh8c8c5a+TvHxyQqcDvqvY4IXkV8CGo8l?=
 =?us-ascii?Q?dbDjtTvLCUcNWAhNrf1MBdRiped9Og0Po1MtfqYCiKrvzvAIze0Yv/usdP1w?=
 =?us-ascii?Q?mFHS0+8LpJap/UvsLe3vpgEwPqwiaoKcd+80qiWPczWQMkFWz8ibGE7FqCnW?=
 =?us-ascii?Q?TPRjNeWOgkcCo/cmUQO4xEgX3fq/3B2jkeBQuZc2lnp01A2M9+PpbTrD0fjZ?=
 =?us-ascii?Q?FAki3nf8J6spHrpT0X2MMPW2neBgveDC6ecHbOrTkyF6NC9SuFxCKx8q+yRw?=
 =?us-ascii?Q?a/FmTOAEuhkpPTUlzAEp7kdL/LhhG1sSzJd2U5ZURZZegWhOc1ILRvO4sRy/?=
 =?us-ascii?Q?cL1g3y+/nXO+yKnSPFvDZf7pFJdBMPInqU7oV/ld53G+MfyPSHJ/pp8qemwj?=
 =?us-ascii?Q?6aytGzETSw7Rn+c2iRoHpyYWTclEw3AZT74whPj6UdP1yGXEN8gnKqu48VdB?=
 =?us-ascii?Q?IColkJsb3xwJLeuIfkI85UkKAof473d5nF9V6r3F/YZAT5tYEQe4Udxcfq7F?=
 =?us-ascii?Q?1B3tO6Lww8WtLme2Z6g7CXW3lTA8QC4wgEhl6EwjCvCHlZ9Pa6bfFhlMiBug?=
 =?us-ascii?Q?dZpcHMvGzAVzvEDjp8eu99nXpolB/i3e6zBxUWVbT9HDuhsUlyStFzRHDIJQ?=
 =?us-ascii?Q?XT0ZsYNi/0ya7OnxxgrY+EU7P8YVqy/43s8OXUED8kYyWq6zKKURifXpIGfk?=
 =?us-ascii?Q?BBfaQyvO8IxACYtYFe6qygJofnNoNHPjmbwyUqyzJge2yPX7atQ2UHuNkAog?=
 =?us-ascii?Q?r6AUwFpSTVoizFqhKdDjAgN8EmqiHMYD5jcZfe7v9HJthslb0SCkXhROwCRT?=
 =?us-ascii?Q?gPoOoxVAFkvOsP+i1f03ZvrXlDnATQFolUeIvho8BvjwrQqQYlU2FSnBN53T?=
 =?us-ascii?Q?jKiyHpIXGkIkIhRkTZlIn3Nl3EQiHsONLcyLlJn7tHZtyayygrXFYiDnTyex?=
 =?us-ascii?Q?sueOl8FGZlEt+ef+6a8Cu0uxwR59ZViX3mt+ImwkSLkOa4vP553dS+zc/H31?=
 =?us-ascii?Q?KZYZk6589OIvhkn41PqIoVsvUt0lGXB0ocbM9LtwwfgQ6wx9evl6lh3Zg4tl?=
 =?us-ascii?Q?oYxaGahTYbcX19yv9OL6UaOwS5guuNtOCRaRNVFl78LUkiEZGOEidhzcMTnD?=
 =?us-ascii?Q?JV4iHBH9UpabjCVhFaJ0jPfofsqYetz3uap2i7AftFr7RIZMcz8X8ZxgdjXg?=
 =?us-ascii?Q?UOYNNh62BnUokTeIP2sTIrcgkgmofea7H50QF+fwuUd6lAYynja0eBywIYxt?=
 =?us-ascii?Q?IZs2Re2AdlKSYrW9O+GKTok=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dab612-52b5-4368-9912-08dd1824a0d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:39:35.3918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zpveS3/TMtS0ohEQ3DZhy00uM7wHTPpIq6CtXuEyT9NhLs/sI1L1LKCA2hj6m5Zay4gWV4xlECnbVvLGNtnVwg9QNRIBrrQysoEQdHWbaYGQ2VXm1zEkiBHAaUd3xDV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Subject: [Linux-stm32] [PATCH 02/17] ASoC: codecs: cs35l32: remove
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
 sound/soc/codecs/cs35l32.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 96555263e10b8..cc9decb593b54 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -169,17 +169,8 @@ static int cs35l32_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
-static int cs35l32_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct snd_soc_component *component = dai->component;
-
-	return snd_soc_component_update_bits(component, CS35L32_PWRCTL2,
-					CS35L32_SDOUT_3ST, tristate << 3);
-}
-
 static const struct snd_soc_dai_ops cs35l32_ops = {
 	.set_fmt = cs35l32_set_dai_fmt,
-	.set_tristate = cs35l32_set_tristate,
 };
 
 static struct snd_soc_dai_driver cs35l32_dai[] = {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
