Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7B9E8C53
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 08:40:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47880C78031;
	Mon,  9 Dec 2024 07:40:38 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33E50C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 07:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyUsycII5dhrlEFovLLWZKg15mVklbxHGDfZgxxx96W3F7ywDlsVHopYweTaTtzA1yQKEomWBkayl9SxHhQxSSIaiIrwUzAxuhei3A6qegukArK03bRk/NilwhUtY6XlqGRferz9KjXNaZlIO83UsowRFw/X71mN8cEw0yv2BK1bGsYn+UjeipjhRhnJTL3rNpqv/2Frvj1eDNfhTvkLf+FmLppP1djjKMk5fwNKLiM/bHgsC40reB7ccj1yTlWYY/3aRMEUvOPvzjK9EyI2zzWxOaGWYxJ5ZaWT5AoDJ10em9AJUvfraH4PwneAOPaQOin4bTSGsFNgSZgsSfJpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG19BNwpZldei+7SIEKPrUrFe7aJkpcfJOxc+MxsPEw=;
 b=gLwIKVWbHgvfwN4lA5axJ842U4Z6jTC8Q8gOp/FBO1eGtgty+YnDJHR/vN1NgZJcHSxBL+WNnAjB/ryS8jumbJJ8R1w/aeZ2o+EB7CKR4wEnDYEzahEfWR+IqEnREbNdRxTbDkqwscthfgsSjcC/13LkA1Fm1GGpJ+kaTq935diacBtn05+CX1mr28fWIJvtFLsImUhzd3ax+/mMj9nPXiS+9fYQW3o/mEncKemeDC4VwNmBv+2oDd7YGV1GMDYT9yF+DOiBYY0qz0pr6u13glM42YtxzJmDB1dOHPh0wSNDUtn0Pp7AFoFNI2cAC2fD7ruKOX4o2MMcNb9r15xwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG19BNwpZldei+7SIEKPrUrFe7aJkpcfJOxc+MxsPEw=;
 b=Kb8M79dE4FNfphoo2xbTcfbJgWRc56w1871ye4+G3ZtgDoZf+/nWG4FdS17v25A+ZvjyAmWMbMT4Qj0QBpY+HrBvNr8/zBZV8ZZkOEgSutvrsLcc1qP//guRXSsLGfXFiRZgRC9pys/Y6p2bixYygXeBw8QrDQAJAolt0M40mV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:34 +0000
Message-ID: <87ed2hmhhq.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 9 Dec 2024 07:40:33 +0000
X-ClientProxiedBy: TYWPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: facac300-9679-4c31-8b85-08dd1824c3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SlDBVvZjad04NmIoeZSzGfv+G8RfdVuWTBA4liOMPDthHtchhLsWXRLtHcT3?=
 =?us-ascii?Q?5FksfLT5SxDC5BAaeymeSp0Oz3zA1xkyqqrkasf7LfeCZarb8d8nixgGJhuD?=
 =?us-ascii?Q?SjXk3hioZO+I1eWVbZIsBTEY9n/tATSu+MbqYq64HoQIg+hyOesG9G71ANym?=
 =?us-ascii?Q?KzN1DmF2FwfzIsmXfcI45CZc83rbaS/0sxetmcw5Yak3GvfL99qlz3UZxPAe?=
 =?us-ascii?Q?RzgHNaYhl+jOGOe3H6ddmAPGerqtDcKChtR+MRdjpO1/sncO+5jfobrTuOC+?=
 =?us-ascii?Q?OO17F1bmUZzz4+wCQtDptmEab5Om5tCF2YU1aKqEAtHgvKBXgqR2uuRpbKXp?=
 =?us-ascii?Q?HWJfIBsV1tVaeX4A65WdwXh3fQrnNT9BNEuu8amZbOQsJciIdw+0gca/bswD?=
 =?us-ascii?Q?Y/CHQ3C8+xHS6VCC8Wm5+oCRagblxLAzXiWZKdQazzvnVM4/i+OyYCTADe1D?=
 =?us-ascii?Q?a75b5CURTsK/ckqef7hsJb5U6QShRtzJ1UFhCu35pHdCgK7+wIfBb6mRlgqA?=
 =?us-ascii?Q?E5gtEtwYfD24p+w0PCRMACBFWq7VQttvWHGdFFj/5qdob+AjLo4GjjkspiRk?=
 =?us-ascii?Q?zdVN8POaWos21wT18t50dx7g1Yv79/0CFBCfzZAOoEqFwInBGSp4QpDss3Ed?=
 =?us-ascii?Q?t6IhESesLDyr4o162hk4mbMI1EW/TudU7+e+dVqdpWYCYBJEMNPKvGgz3tvm?=
 =?us-ascii?Q?5w2HUaHC+qEZytKai1TaZTMA9YAuIchcZjGae6lMONRtBmrc/TsVkbaha1Q9?=
 =?us-ascii?Q?bbraqHfW91PwMlwsExCsEzgqYjSl97tFl1xlsyg7x6IpHlF1VOdlGfXXXKIf?=
 =?us-ascii?Q?KkNxicxnNY5XUE8WHDuiDsT6LzkGIr2UERvT8Dm+ZyCW/rI5+4/LoZO4ndvA?=
 =?us-ascii?Q?wBCm2Y3XPBm98jD96cmDMne99KKivFcJXpBDCDvQ6oeDiSJbuWHuyDeAOyFj?=
 =?us-ascii?Q?EqMdI1Izx7O5VO44cgvgggHSUN6FT1evla7trUySM+rmnaUGdNdSeSjn5VdH?=
 =?us-ascii?Q?gXAlj/pAV/aVhOAgMV4SgdNSIqcsWXbji+gdC5r+rSXpkBL+Z5B55RgWZ1xs?=
 =?us-ascii?Q?6dobP7bjOvjnVsUAzPm+wjqOK24BqRZhDu4FnfKFrSSbsvxDolxATAbRpOr2?=
 =?us-ascii?Q?2QuIyT0uAjZM85EP9ZpdgTBPERgfbOWN5ts63Q/kJT7DIzRR27bbsDz+y0VP?=
 =?us-ascii?Q?DNrdv1HXqJHyHCZkw7GKGxNQRO90TcMiSzTj+BgdDPb7gmZPr/bxHM5ytFi0?=
 =?us-ascii?Q?CnWR4xr/awlJ3vdfaL+XRSm5OijnARD1fSbBjBJEOI2kL0oTSl8MAEAfFNwJ?=
 =?us-ascii?Q?aQl3ZuHNuCZHAyicEgXXLm1c3ehDgRfiW6N2tw0ka4t+42uRjyD4zVgLLX+Q?=
 =?us-ascii?Q?7kznaNv/ZNXCwfWnmVrcSNl5PuJcM5htIeCnmgLtuJWFTz71w+V4el7b//pj?=
 =?us-ascii?Q?dD0/YdJGw1dGZ/ALMyFwoaf6OHIeyuNT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QntjzyDb71akkqgGCxdNXiYgxg8LJO/fVaC70alwRHU0SUEPy59gXoGI56hp?=
 =?us-ascii?Q?lg8grYHCIMC49+xJ0uGoAz5Q1q8ztSmdnbdSDjDClcTGE6vpblkdpQIBimdg?=
 =?us-ascii?Q?4g+x8cjGBRu8OhaGp8L/ZihtGcg/K5U6rq+f+R4SuQOmpose8/XNR/tZdx2q?=
 =?us-ascii?Q?2XLOhQhQyQURRwL7hKrYxwxPlMBUt8aO0H4ml6WMvK47+isfIlmav5Tzhtwy?=
 =?us-ascii?Q?h0tCZUwfVWnzvJwC3xbwf0drgIgozrprERtYsIgeULj6pEzqKt632TVA2RoU?=
 =?us-ascii?Q?FB4BWJuDfnP+cURIsVL3HkOHNcF3UtgYG3AQqtrHcVWG5YeOjRlMubeL7fXI?=
 =?us-ascii?Q?hQYoJghfddmooTOUeFu4LUM6N66cD1VvEsnkrVnHgtPnUHJ/569hMFGpol6F?=
 =?us-ascii?Q?ZLwGiymwSItjliMriP7gbGuJ/lVfrfiLjZqSg4LozLhPK9cqaPclbRix0SOC?=
 =?us-ascii?Q?Dwi/tXbSazJRcNDb3LFGBBhzrLIhmvLLc0AUgsUmelStpTKnl12cutdM7an8?=
 =?us-ascii?Q?QvvbDic//yZR2+R3Sydpm2wsZ5wCBpzCR7CguWwNHC8g903f31hAMIA+ALNA?=
 =?us-ascii?Q?AKr1tpj91bVofutMkUFfrl3opa/tdm25wOIyppQuVVZha8Y05+WtQWR28Vqw?=
 =?us-ascii?Q?AVj6umZjA98beUelP+0XLxKvjcTmgmDQU9qnL1Fh/I1sT45CUjkfNknayfRz?=
 =?us-ascii?Q?tsES3prtpwm/0bfCYwWQnIdFEL+GIw5KD65e/UyxabAs3GBd1iPrTguewXot?=
 =?us-ascii?Q?lfkxPKzlT/wkNCaIwqceEdh0GYGmumYDkfYbEC/3wZxQqeQ108aX+8JOpYsq?=
 =?us-ascii?Q?aqbuBPmz81OkgBxw039rWiS/Klc9n0XDLU6fwlpJVOW2Et0h7FC4wr+9q2FX?=
 =?us-ascii?Q?k1nwAKqHWswyhMSQ2DWjUoJiBtB5xroLA32fQ0kR9hRTjbjiP68w58E0fytT?=
 =?us-ascii?Q?dDAiOydrboN3W5eoBvLRhUbZYp8u66RwTXJPlPCmt37efmxCcHc4C0+jJxJt?=
 =?us-ascii?Q?FmpOfPqTTo2NDi6gHXU46Npr1BDpUES6bqVyLoC7P3UiGpdVnjoGIGl0j4ck?=
 =?us-ascii?Q?c/mr6qEQ1OFWkHBMyMy5nBVLMwhJNfa/4G4i8njyhmeyoO0baG3fMUJz7Dfl?=
 =?us-ascii?Q?9bEGGXN+J+m4Cc/7V6d8/HFyzCeXreLSQAQzMcEZmbbUi4tuqunppVdEk33C?=
 =?us-ascii?Q?/LUomUaHEDhZRk8BVLno5khwqTBp+sf9mE1GIzhLp3dge3ID2AiipjE9k5EP?=
 =?us-ascii?Q?iCMQ1v2fRmEkyxUixh2yb/rZ02MmiLL1L0x+xd6X0FHsYH1FWjI+WOFBxWe9?=
 =?us-ascii?Q?35BA9XlYq8F/VivMcVKOEg/NQGRFONofdAxdK838NM/yfvyufoG7LGc1Bt4f?=
 =?us-ascii?Q?R6GXLj9do/Z8/omH540BgTs8slLFJv7ogAyinXC/63CmaSWXcOXK0QgzA8Po?=
 =?us-ascii?Q?+3FBAOoDU+stQS0c+NZY2bg6oHVNTEOn5AtwJCdj+Lv0ky9juk1U2lvmAQPO?=
 =?us-ascii?Q?aXbAlNAljxuPZEvvUJ9QoezLmqaGjKtPvG0IrD93pb/w51YtcPVGCb7gP2PX?=
 =?us-ascii?Q?E5sGi1mj6cJyW3UkRJTaBankurJ0fl6hZdZONh6+cnmoD1W+MWuOD56Rg/zf?=
 =?us-ascii?Q?NUxxMNzZyO9iYWLhuTOqUDE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facac300-9679-4c31-8b85-08dd1824c3e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:34.1968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlXx/Jh/YtD8JC8zWDnKPpBpZ4qh/orpMEcwDG2MrrMawlTNS02/TPYclis3X/vmRJ4QRu+j7RTopO3kwGb5WhJM+WUUhe5Qg4SiZLoa38H4Zn2cP0ufRXkK3ifGzw/l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Subject: [Linux-stm32] [PATCH 13/17] ASoC: codecs: adau7118: remove
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
 sound/soc/codecs/adau7118.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index abc4764697a53..df513bc49dd3e 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -207,24 +207,6 @@ static int adau7118_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static int adau7118_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct adau7118_data *st =
-		snd_soc_component_get_drvdata(dai->component);
-	int ret;
-
-	dev_dbg(st->dev, "Set tristate, %d\n", tristate);
-
-	ret = snd_soc_component_update_bits(dai->component,
-					    ADAU7118_REG_SPT_CTRL1,
-					    ADAU7118_TRISTATE_MASK,
-					    ADAU7118_TRISTATE(tristate));
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static int adau7118_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 				 unsigned int rx_mask, int slots,
 				 int slot_width)
@@ -418,7 +400,6 @@ static const struct snd_soc_dai_ops adau7118_ops = {
 	.set_channel_map = adau7118_set_channel_map,
 	.set_fmt = adau7118_set_fmt,
 	.set_tdm_slot = adau7118_set_tdm_slot,
-	.set_tristate = adau7118_set_tristate,
 };
 
 static struct snd_soc_dai_driver adau7118_dai = {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
