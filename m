Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E629E8C5D
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 08:40:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76ACFC78031;
	Mon,  9 Dec 2024 07:40:55 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23F34C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 07:40:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xX1bToSW4mgSZmq/H2gxf6yguJFugUbm9IYWsaBRjJZvhtse+szDNZNnIfil9YiZYitPY9nlhf7pM0hmKAdthU45Puw6MLz0sdmx8X80F29Nre+wYeIoHJtdXdJgeKmy8xPXRJIiK5HY3ij5VHWqZNbZhEMHOF77/yqWtJ0loy/LWOVocGubEgG4ZWgDBE9JVXLmpC7AjZ51HIW84Qtkjcs3fiy/b0XSntHlyuaz0mCGuzei+2Ma1WjBjiw2p2xS1kUE5PZqL1F5Z+t+rXthP7adLpfPeV7Jv6ykS5o3O3r61Hk2Gb22k1hhVL4scxWJrEDTsa4FBSyMuRijrr5i8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Av+xRgZk/QPYjc2N38/uB9wy1eZCbnHhBo5GHyKiqM0=;
 b=Euo9wdl4q4IWhujXBb6ApMMAmm2GfzYz/OX2kcOv+sUnHWg96/LRh97VIEJXEUrENOK7b+5GYWNp7fUM8jgI4HM8phvLs8gbSy6hnCRbRDG11L4ADUOtpKM3HnHlAbdBXJ9xtohL2DQi30tSvqa++CkBh/ydaNOvcYsnOWC5M/RsA+REToUh7Ma35FJqjk+tYWlw6M/lFrYSZk+QcWe/FmvSowbw9TuSNJgMYHyffO4pRox28zeuCm6zXHyu27lFv4O98nUg06QuT7304S2zy4o2HcN0DosCVkzVnQzIKmGz2rzh1NB1w8WIWkf3q6LofG5vJHdjORqkne9aFnfpjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av+xRgZk/QPYjc2N38/uB9wy1eZCbnHhBo5GHyKiqM0=;
 b=NlY5Ihh1fhVBZHVAWeAXsRIn/8DRMvHc/MCjgA3DA9DVH0p2YIw3KF5bTHOLTW4QxAb76qHZvmtJrUW8+42uMTnfA+Sh4NzV7b8QR/Bh0GsD9kXj9KFqdIrk3d2v0kyTAXeAzTPtLIybcz32GzbQQZhAOdtFJfCXDznZXc6hJYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5479.jpnprd01.prod.outlook.com
 (2603:1096:604:87::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:51 +0000
Message-ID: <878qspmhh9.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 9 Dec 2024 07:40:50 +0000
X-ClientProxiedBy: TY2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:404:56::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5479:EE_
X-MS-Office365-Filtering-Correlation-Id: 01583d17-e370-4001-b263-08dd1824cdd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7j2mSZegQwNJbRsWER75VYQHLMXzUnfvAKBte2LRh8jXf7c1BoJaGFM4/I2/?=
 =?us-ascii?Q?ob2zCkqIh8Y+EKniez6tz37YkwDo4NnzXziUjazXPzWNlKSRBtVStIGWDHdX?=
 =?us-ascii?Q?iNVKYPalxWLm24AMGkuO5scfEC4E4YerjxyBxJ40w9GkA66WRpmaI3BNyR0D?=
 =?us-ascii?Q?ciWek/Ijis3lU36PRlUqjnLhoRhvNyPOcVytT55Tq45+5+ulxJsXhYykeawV?=
 =?us-ascii?Q?wM/DqjrxNX91jqPKWv+TPEL/PhxDaLA84sdq6W4D+QCtHnG3fmXBBlzqBdvo?=
 =?us-ascii?Q?1icgGBO9C0g3Ftez99/zX4iaqipW3Rc8MacOFun6f9RZg0OOKVLPNx7I+qni?=
 =?us-ascii?Q?a+ZLrTQnUD8cievYgCAdFy8LoVDnYocnjFrbw59kJJC7d8wEWdOdCbqa9UHn?=
 =?us-ascii?Q?qM1ksdqvtLrAKutV73coF0woX77eob/GzrA3TZCYU3OViUJT33vqr3459OWJ?=
 =?us-ascii?Q?qZ1hgfOGknvyCfbCVQynpFqT2mkgB8anjFC1yRQsFr5CMQlc3bPPzmgW40G3?=
 =?us-ascii?Q?tTjux9J/K4o5VvBbqWBlfJ1/dfo2K1IUZjTKaCuRCX54IojCek+dIKdxufR6?=
 =?us-ascii?Q?V4R7q5pGVxd7EEfewPxbsal5fN9Y8WN3FQDMGXhXnsg5GUWFPOvcqBHOhmXd?=
 =?us-ascii?Q?RdA4WpIOcsbJIU8LotCww3bCrO8XJvRnK5hHlHV+8vcyz+SHcXKEKPx1zMYR?=
 =?us-ascii?Q?mdrUqFdatfNl8z6brZ3J7moZPFRcpHW3+KBFWabSXGbeZ67i9q+CWXrCbRO+?=
 =?us-ascii?Q?WuR54nxtbIB+EmBK4RxHPYL4WVprWrI0KuSW64hPDy7jpQq8e1Ie5HAgP12O?=
 =?us-ascii?Q?Du0SE/Cdav7ojqALypz4xwdyj4Vehk1/L7wy6Ooj4qNJk0NymKpiCW0RSP0y?=
 =?us-ascii?Q?DVo9ZkcYBSjw/U+/fxGb6OHiofESit42lrpMx7Cs5umxQSOxa4dkAzhvFSgH?=
 =?us-ascii?Q?BTkXYKszluEMpVyvR6WhUn6FRMrffPfnbtbsAJaCfFODOiK9moU5JDG/xYZp?=
 =?us-ascii?Q?yTyvMkn9j+zmzaPGVAAwIgAtB09+t7cURfOJ+KkFoPvxkLuiKS92772k2acB?=
 =?us-ascii?Q?o0g4wisWTm3/nqjsero/X5u8nxkmAlgwhG9eH9OO6e7YSEWEzlQ+py601R28?=
 =?us-ascii?Q?L0ngpj65n/7O8ItaasyTsx0bhEaaRGlbBYDNJFrngqbBwLo3iiq5K90C1vik?=
 =?us-ascii?Q?POPT7hk1EXOcnqYPetPsvY12YwLrJp7IuZ1efonOcDQptEJZOnI8l0elFMNQ?=
 =?us-ascii?Q?DvQpPyhRSCWbj47x3iHhJWn7msPmKNIqaBwr6i459mhnZgyZ/sl6vJ0ceHWw?=
 =?us-ascii?Q?XtDmvHLlrPE9E8pKoLeIjtUGerHuCB4L/pL/dOhK9YgqMuhktCg4ilylkYeB?=
 =?us-ascii?Q?JQId5rEzq+YxhGtqnfJKR2pXBSB4aURhNLtB4GEMirUOmumxJiO+X2+GgwtU?=
 =?us-ascii?Q?STJZFgo2Z4YVC1N2l3LJ4IYAsaTLkNAF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?svNFX9riN5HtQy1sUjukQKpBzCLug8Za4C6ZXlxuwoxRHSbrx103GpHb+Rbp?=
 =?us-ascii?Q?X4LASsZSRW53sISW1LQdq8LAXp+CeK+VSCAKE1E0ezMesHz4gbE8ZR3URwCH?=
 =?us-ascii?Q?ulLSeBjwH4tBRBsDq5v6qAE74akSKXxVyuf3YSGvzimUBOS75YJNIHhSC/Ss?=
 =?us-ascii?Q?Fc9Zha+4JIRTLB3p8EYurfY3ndLNJlZb0v7IVRaNamvUeD769zb6BB91N0ES?=
 =?us-ascii?Q?JHD5oNRD/LAnRI2C6nVpgr8/mNXb/LVBXhYbvQlh3mAqf+ErGBxjLLhJYpJx?=
 =?us-ascii?Q?mYCsbBmfExLzaeKsEhBEhRpszvywIKwoLBGAG5Uo5qqo2OJFaWMGHNsoDl8p?=
 =?us-ascii?Q?DEHxNuOh2pTbwYm73hY7LqE5CDvAtg7IIDpr3TkqsviPwztNOLyqt41A0yAw?=
 =?us-ascii?Q?kaIYHAPu+LQhPyioA1j5N9zHClvDpGCaor/rdUHyn7NjZLR+h8TsnJvLlfeW?=
 =?us-ascii?Q?KPUZgLjP3ndaChHowQJKBzvWTS1EervP9lhBtLTIyjED5ydkIlAAQe7S9wJX?=
 =?us-ascii?Q?wHmGeOxI2jhzHXIgSshfmZiiFFGJ5itaCP868jLKLGKI30fotEdhbh8qt/vp?=
 =?us-ascii?Q?UiNi5ZDCbIvBGtO8vKMfC9uDOzp6XFlO/oDfGLUc66fajf4egYpELa0sHBCJ?=
 =?us-ascii?Q?j1VhAkXTKZqNQmXVDCuX5b1LhCEqnE3behpEzGvEVLLegDWuQPqSzEC2tLV9?=
 =?us-ascii?Q?oF10DJ+15Tsrjo69FI+54UurA1IUsmW8ZApsll0yAaB1HWD75+v16ccz649u?=
 =?us-ascii?Q?8CHw7rUWrKcQR4IzyKzNaBsG06jWA9tkJMzgKFJCgvqbpo3IAT5gCdlehPal?=
 =?us-ascii?Q?5hOmKLUmkaJstiCjhO3qobqFCJm/tiTAZN5tmHYqSXnyqy9CZ6geF2JlGBHM?=
 =?us-ascii?Q?HOBlCdo59oXrtOO6aAL9ziH08hC1B+42/24UcyfmlIPbON3bfVyt6E2AFvjk?=
 =?us-ascii?Q?vKNQhNEnn9pzyaxBBmkY6eDtr2Lgmkj8ooaMAMPrBs4dr60GSOz7MRxXkxXh?=
 =?us-ascii?Q?qkQeXStc3nCH5jL3FuOgqPnStsq2UCGNAvAqvwpFOSxR0QH0LvInpU2iRIV/?=
 =?us-ascii?Q?xC14gXaTLKbhyTT/ZukCNOKLhSEOi9+39vvNUwED967S61j21YR+ITTmONZv?=
 =?us-ascii?Q?2xs7OkpfbmH9ClRArZJ8wponXlro2McKaEnAohSE+2YvhPit9rnoJgmcYZew?=
 =?us-ascii?Q?44Helni1GF10sdXlTNYcYtv0puB9FC/hFR1ccv0BmRp0eXeb3Zs9ObYyLcnn?=
 =?us-ascii?Q?+rfzKzWlbYLWxkjedlgRqOfHmiYx+9GahnmJM72tG/C4Q/5FpT8MnZSKBVkh?=
 =?us-ascii?Q?NYjru2blzN+jjMpBR9VcQsBx4A0Q96VW9QW7JXMKXRgL4H4+flTpIOnn60O/?=
 =?us-ascii?Q?lksarMz2jHYK6JL6/uIfBeDbuCostXRGi60x4ZSOggoPv/kvq0O/c3Kv1lBq?=
 =?us-ascii?Q?nWnLh1n+KmowkFpjCYw7cnYv41ZfSGpnP29jq6eaPBVoSS4KB8rIFwZi0Djy?=
 =?us-ascii?Q?aRv95q8o88v3cLpMsXfpTj+uV3iCAyH01Tg3l4BsBFDxEujdmm6aJEgF3TIm?=
 =?us-ascii?Q?V5UTxQMzneqIDAoQM0VOXltHPF919VIIoY2OjkauNvGHfpUez8MMjdvOTnvA?=
 =?us-ascii?Q?6Nx68jhSvC8WwulWvvfibhw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01583d17-e370-4001-b263-08dd1824cdd8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:50.8955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugt7a9pw/dB1HLK9a+Wz2jDgMmdTq4xmqMhT8WtOKh4v47ala4QwFWLGSpCl5M5l0tDQ8g7xXfROuo+8G3NJs6Qe+HF6Dj6k5L9CNqGnUznCT3VGh7o8eojyZjUDKZg/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5479
Subject: [Linux-stm32] [PATCH 17/17] ASoC: remove snd_soc_dai_set_tristate()
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
 include/sound/soc-dai.h |  3 ---
 sound/soc/soc-dai.c     | 19 -------------------
 2 files changed, 22 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index aab57c19f62b2..eeadb636c9f64 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -191,8 +191,6 @@ int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 	unsigned int tx_num, const unsigned int *tx_slot,
 	unsigned int rx_num, const unsigned int *rx_slot);
 
-int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate);
-
 /* Digital Audio Interface mute */
 int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 			     int direction);
@@ -306,7 +304,6 @@ struct snd_soc_dai_ops {
 	int (*get_channel_map)(const struct snd_soc_dai *dai,
 			unsigned int *tx_num, unsigned int *tx_slot,
 			unsigned int *rx_num, unsigned int *rx_slot);
-	int (*set_tristate)(struct snd_soc_dai *dai, int tristate);
 
 	int (*set_stream)(struct snd_soc_dai *dai,
 			  void *stream, int direction);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 34ba1a93a4c95..e42b99f12f0b3 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -341,25 +341,6 @@ int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_get_channel_map);
 
-/**
- * snd_soc_dai_set_tristate - configure DAI system or master clock.
- * @dai: DAI
- * @tristate: tristate enable
- *
- * Tristates the DAI so that others can use it.
- */
-int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	int ret = -EINVAL;
-
-	if (dai->driver->ops &&
-	    dai->driver->ops->set_tristate)
-		ret = dai->driver->ops->set_tristate(dai, tristate);
-
-	return soc_dai_ret(dai, ret);
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_tristate);
-
 /**
  * snd_soc_dai_digital_mute - configure DAI system or master clock.
  * @dai: DAI
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
