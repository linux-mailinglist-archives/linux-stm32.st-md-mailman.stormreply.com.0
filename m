Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2524C9E8C48
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 08:40:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E01F6C78021;
	Mon,  9 Dec 2024 07:40:12 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3467FC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 07:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Har2o1yByPDjil5Od+rfrxR7yx7Qu70U7yzjPIpbUQd8YslcTqR/EfWPxQylFB/AGtURbxavhuuAQIh0Ush4GIB5h70GqRIY6zCY37k6Mk8dUpyUd8X4/IP/sXDF5g7jp8MjbGoOqADvPgQx5+G+nHxrtCX490t1OxmX3ueRenUWBeC/XMcxPWwNT7e02WKBuBhE9rMdQ6Qduq8FkyX/+leNiwcJvFSUbVn4nNhQIfT72QMJ86GnBerIyowoaa+8G4xXUjNeIqi3eYVx5OoBIb3mIgqtKgHj6k0wG/LuYOrrx5EaiLC880pJZTwnH8NVhpVDz99Ev+Vq1bJVQptqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbU42JVlTRPWUwBkJS9XMIQh1yWty2iAKklQxpsw0Pg=;
 b=JhPYfKgHprPhuVzCZZYbQpyeReTGHCdI4qddYpSBsozFTePLK1kKWyDhxfaqbBITji7kXG0Gi72VpHWyvuM7U5GFKWcUU/6Fpq1X56+wVIhcUe1dgg1+As+QK/selZWGAl8TnRWHBdGVX9DK8sJfX3hQOo3FRm5ozHciW6XVJdaniLabVNCWE1bx+pQ+QjFFXuDs/tBaxTq7FY7d42WBvJ6Nhv+m+h+S6VpB43Deodptx1ECusRpYzeAi4+XXCyssgc00cHCFjg3KM/6QwYghrLBxRoAfgg71jcP8VjbEFrs6AUgVyeVm8xNHRSSx10RaUMLa0+fq/8UPkMC9XGKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbU42JVlTRPWUwBkJS9XMIQh1yWty2iAKklQxpsw0Pg=;
 b=DcunxJ+PyB/jsEcwYKLjqqeQIRCsgb4okkP3m2OVBVPVAAHHOk/79IYpsl9f/vw8+UbvmINJyoa8zSkiaYNKixDF99DcCUJGzpx4cVocAcWl7Gih2KXbJAUUmnd0Fu6GRbOTz0czn0dOWVZwCL+aBNLoxs7iP60sJT0rsRSF4y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:07 +0000
Message-ID: <87msh5mhih.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 9 Dec 2024 07:40:06 +0000
X-ClientProxiedBy: TYAPR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 29466a55-f954-4fd0-bf94-08dd1824b3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0LDP3CwfVg4MfTPl7x6ZFSMmS+adX4jesjMASZL3zykIa8RCkKN7fe7debgk?=
 =?us-ascii?Q?IYJFm0yFtuBURdE7e2t0hb/lF6C0WWAWiV1vpQb7hKxvCu1VbK5qismK1ohO?=
 =?us-ascii?Q?AkyrAD+Xs34IBDixE1HGuVCI42wqvtJtrYpGcSp+1zGZP6fDfP9e5LfHr/ok?=
 =?us-ascii?Q?/M3ioweXDE0lUmUIFgYX2mMpm5b9l/VqQtOtQIOuaI3+f6pZ3bKcq/2AEJZ1?=
 =?us-ascii?Q?VifcH1rCXbI5feZhIh90ZypHoC93yyStH8swujVJTOp8zEYynjComUrzl9RY?=
 =?us-ascii?Q?8TLhdJjCU17iiTbIagf0Yv4j0Z6rKnNRfsgL7kdwjDNSf3cMG96AdNlYZfrR?=
 =?us-ascii?Q?rFntWh2meYbnlDEWdotl9IoQdCYrp0HsKw39S7YHR3jb5N3Sx7cbYIClGt1n?=
 =?us-ascii?Q?OtpWEoxglBiSf8suBhQZnlBLHNqytF2tFp3+FuLORtfIw+Ee12+Dv06oGrnI?=
 =?us-ascii?Q?kEbaiheWjOhiGSfcBcTPf//LwrMSwsq3BJMEWIvHTDqLwJq1iPwSMffZjLrO?=
 =?us-ascii?Q?VhOLcf+VdK5+GgiAKYsA5sb7x+d8AQnr0tQOs1ff2DvUyrEV8QZkhOakiPT2?=
 =?us-ascii?Q?jCXG68uBUmdZAITtoo/56h9LZjR6uaJLnaVv7OnyiM/AAszZLy7byleME0vp?=
 =?us-ascii?Q?NLWwEAq5jMouY56WwO/jy16GgiicboY7Ofm3sYyXb9caMGMBs+xAmnkyMzNt?=
 =?us-ascii?Q?jYesoitDdy9aMK+xM4G60u03PErMb7SyP7GIC5F7luJq/ytkPRVrsBqJpT3t?=
 =?us-ascii?Q?JLbLw2Y3GUBtvMvlbV3xwvR2JU8l2KOMa4GwhYbEGsXP5DdfoHQXWD09gFy5?=
 =?us-ascii?Q?mSbhRz2QohZJyHRLX0D4c6LoY91JhUjTOxRt0FxnWx0MTTD7Se3Cuo3xqIDT?=
 =?us-ascii?Q?mff9XRkdupzrL1v/3TRUIxbMeh7Du5D5B9RwsW6V7t2ZXSm3u7W+1FP2e7Qi?=
 =?us-ascii?Q?f391E1FYxFwUrt20xlIB3TziJwW5Do7Y/YxWrldDp/QF0MTTuhVbxucWlxnN?=
 =?us-ascii?Q?j3Y5hahblOaI8VK+68dbw7kgFA6g+MrDGAmk+FGgjHH6v31Ln2zHowvDQcdY?=
 =?us-ascii?Q?nSA/m9mA9DHHQDwWHC4WxmtWWYpkHuhO/rmZ2AjMSs7Ar619qjY/FEZ9+4+H?=
 =?us-ascii?Q?5YRe+VO0n2zU+btaOnZscXfGWhKSwSn+5/YfPPdh9aGufLx6G94ro50xct03?=
 =?us-ascii?Q?YOZF21IkyBi6yOi7OLDXnQu+sTsOz4gYReNvHAOczbYAqvEW9NAQmtNA3xdk?=
 =?us-ascii?Q?uMWqH/p2oydtNg6dTTydr7mv1NvBJoQ8ijeXnr2qA2r4P7FnKL8FqZJ8r5QR?=
 =?us-ascii?Q?vPJuHsR7nehohovNVe6tVSdNmDUi++blmKw/jgjHVZKwb42uYRFnuuejEZmP?=
 =?us-ascii?Q?fA7fF8OgvguG9f/jFgnvt87Vm55GfFqqIdEMAup/BDvYYyhrnlEVK+IhSia1?=
 =?us-ascii?Q?ZoONhsi0qvOs7DmZytWX3Mxf+oarwSeJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GyTYDtIp1QhlVXuOgT2GpZztvh/qkEmb1gkBQ0FTBb+t/H1LB+2e4cgK9Nrl?=
 =?us-ascii?Q?kLtUpykZ2iDGHoAacD/8k5vnWxWImCJJAGOOL4Ileao3yu4M1pks416jggLE?=
 =?us-ascii?Q?8SRdYEuMGaNrTYxUDbrocSZgF3xUjhUV1XYnNV9lNRtauDmbAT9VAVfUjZlz?=
 =?us-ascii?Q?2+0ZFMFiFpCAeV/DQcYtds+unx0IUtSKNiWXfjl583apwetbOPW+XaDdRpM0?=
 =?us-ascii?Q?oQ4pf0w0W/dauEOJMFYAV065xmmCB68Bm1Nj6vSs8XzuWR3UA3WbtzkQ0ppv?=
 =?us-ascii?Q?NhFl3vGt+xwGSqxJMpIejiQYo9r3JtMqlGhsKK83WPpQ2Y1p7JQbMQFwWDOx?=
 =?us-ascii?Q?VWacsPq75wc+/BYOC4Eg7BtjdkAA7VZ6CaW3RBK3De3OMR69Msj2y3LgPWKC?=
 =?us-ascii?Q?Z0S0PfDaKHQvOZ6Ua455rNdRr417rvU9OF/FATYv0XlW/RJWahUF/SLKV6ZF?=
 =?us-ascii?Q?6VlkxSzmOriXafU8wz+c/FJ+6nP+XlEyxn5kMA35kFlU0uKR2AYrxNXafcPB?=
 =?us-ascii?Q?UaegFjcQlwZdIG6MCIdqZpIky6ICoSKCRwG8n0PFqKN55WGxGGR+mWx89NFI?=
 =?us-ascii?Q?/Pc4WwDeiawfJMDreZ0oh2e8Ice8jy4+P+eCkodS/VjLUcLKTzgo5OYCp8ZE?=
 =?us-ascii?Q?DX5y35zdzAMdf53G3zJhF6XZbzMKsB7FYjiSEdzaPBJ8v9+5z99Gs7ncASEM?=
 =?us-ascii?Q?ZbnvfjQ5yUJxGMTkc5c/qxSN7x8C1uXVEXUsiFH6NK6PCO9EpCEv1AZmqiYS?=
 =?us-ascii?Q?8mDco3smtmn+RsGfGEyGgyJoZqp1lueLaV8bAHan19Rp/vT9FGuBav1tOYeG?=
 =?us-ascii?Q?Rgbp5PrhyenrfnSahnScPpsMDHhrF8V2/jziWeL43CdnrvpOOWSqX9gYPJfr?=
 =?us-ascii?Q?kmfpi65lEkGGu0ScoYYtG2ZIA1wKfddNoBwLRh8vYGnrHNyMpp+CdwLT7ke5?=
 =?us-ascii?Q?ChrvH4UNAwqqgS+4Or5581em8tsTxZbLoqy1eUajO/SMFd3lmRtfLF7M4Y8g?=
 =?us-ascii?Q?ciUOM9JPNXINVItJCd9ZwzzhtOK/uvCx0fHvW0oL1+f6q0xZaNiUVfF+OIuZ?=
 =?us-ascii?Q?8Qp3Y3C0XG/AczAI9ET434nh4PVdV9wQlCM/OyjNbmcNc+fFXR6kMfUzyWlq?=
 =?us-ascii?Q?+/NiHTd3tdrs48LJ1HC1TsYtGnAxL6DzHkf6X03LHeeDOmZZTyxIAwSMdw+T?=
 =?us-ascii?Q?AEA2JkLNXro2wq8NRH6YMaFndf4/1GC+/GtxzPoZ68KJSWCYcuT1bcDVKFbj?=
 =?us-ascii?Q?y2llVDx1uPL+53z+UXXaIZeVqLkNFEbgTjM+4vJTTXr74KjbH3NRcjOmVjxb?=
 =?us-ascii?Q?bpLQDakr89ONR+7BTyeNOLdT04GriCNzTvXyohyL0jTywtjK7qD2HCsefzmC?=
 =?us-ascii?Q?D49ocwP1DcbDToab49nS0eVv0fINGnELb0eMHm6KA1cYiz/vpHrg9/amVor+?=
 =?us-ascii?Q?49kwvhC3RVCa70DdoCds2i4iS8JcdJ5rXb7fbWmAybvnPmL/MsWC/yaKVHRX?=
 =?us-ascii?Q?gn1pa4JR8OIR/rxSY3Ke3g+guzgQnuhiDUVAL2iHwhQ3zPIBhqXVV9KYmnBd?=
 =?us-ascii?Q?32v+owofzdcgskogDtlXSh2LuwvegJvCPXbXJHoAXducrrB+jJMdRKEuYoVE?=
 =?us-ascii?Q?Fi36Gxd1dRIKy6Z8vM+1zrA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29466a55-f954-4fd0-bf94-08dd1824b3a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:06.9510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VDIVU+Wx6GSCTfy9gTctlTguGUrwpLNRW4GqGoA6/SHBBgfz3W7z/eWvzOfiQiVhi4zhjpS3cOURUWMgkKCTpM2qybxazxtO2PzvtvscezJn4Z8kBDvRJJZNRgMQuRU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Subject: [Linux-stm32] [PATCH 07/17] ASoC: codecs: wm8961: remove
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
 sound/soc/codecs/wm8961.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index d1c731e25777b..13078796c4e28 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -685,19 +685,6 @@ static int wm8961_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return snd_soc_component_write(component, WM8961_AUDIO_INTERFACE_0, aif);
 }
 
-static int wm8961_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct snd_soc_component *component = dai->component;
-	u16 reg = snd_soc_component_read(component, WM8961_ADDITIONAL_CONTROL_2);
-
-	if (tristate)
-		reg |= WM8961_TRIS;
-	else
-		reg &= ~WM8961_TRIS;
-
-	return snd_soc_component_write(component, WM8961_ADDITIONAL_CONTROL_2, reg);
-}
-
 static int wm8961_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
@@ -807,7 +794,6 @@ static const struct snd_soc_dai_ops wm8961_dai_ops = {
 	.set_sysclk = wm8961_set_sysclk,
 	.set_fmt = wm8961_set_fmt,
 	.mute_stream = wm8961_mute,
-	.set_tristate = wm8961_set_tristate,
 	.set_clkdiv = wm8961_set_clkdiv,
 	.no_capture_mute = 1,
 };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
