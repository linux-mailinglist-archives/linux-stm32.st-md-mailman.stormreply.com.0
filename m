Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 012609E8C44
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 08:39:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB6A7C78021;
	Mon,  9 Dec 2024 07:39:57 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA414C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 07:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkTZhW3/MMBRII9esHd2We0bWEUJY6LqocTxvdd7ftan2GyruDg8cTn6Uth7YK+olF0ZsmBiqY7TxgcNLubPdHQ7ENHKh1qizoXYVFgd/lhjQcJyZG4otqsekEoPt/rrLmQnrKZEw0VnNZTFlRm9GxS+AZYbU1Gd+XNr3+2ZSpdS3ah2nInNU3UXa4sQOuuA1vAQ0LpHuqnEaqJRAg9//rQfgteliAbdpdtLJsdnrBvNPDfbhC3vYJm+tNkv7smRhwI6V5UbN67sCr4Kc6lHcgH4GjuUwIrMwbYk/SkWMAT/rSNd6dYv51D6Wo+0FjlBd7B1kEcF5kgtZGJLv6IfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xrh2dO7oEJjloTlgw9PWXTGbvAkS7kZdGGcW1LHBK+s=;
 b=ydj+dxcgSZFhQPynLM/OUDQ7ICrPcA9lisFmQV3hCWUMO396NQWqd6z+z48LvclJ/kSKgPeZxPFkA1oq2/a+tGABXUxmMdCwRUrKMRxHTe/4HGH8aJUhUVmrFFNxy+NpUWRLgaclWY0/1poRugcADe95tBIS5VvhJ8APrzlcSmgAX2uB8uvuGpcsGqjNF6Pn8CAulH6BW8d8Tt0F+DAH0otea0Fk9ErTqKIf06ZPBr2wQ5/+j7UJr5K9WfKy32m5mdoLhhzRuS44qaiO3rOjdQiXml5GV1yIYlo2J/+3Xzi9vhb98JEtjBBV0lo6zLBlqbcTdVYEImvviEeqBArcKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xrh2dO7oEJjloTlgw9PWXTGbvAkS7kZdGGcW1LHBK+s=;
 b=oZyUk1rWl+R2mBNYN2va9EGh21gHOzRq5dbhSrw29tv9DAUgcbz4RPEBPcjuneGfiP+kU4waN4fBnr4H3wPpYWRNAz+N77GESiPJRtx440WUOqcE7jrR0XLzeIcPNRPESM/oGv20sEg1MwtQryRQCprV1ftPbSUvDjSZxAH1TZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:39:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:39:52 +0000
Message-ID: <87r06hmhiw.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 9 Dec 2024 07:39:52 +0000
X-ClientProxiedBy: TYCP286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 8939e80c-0307-4cb8-4258-08dd1824ab1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z0CZC+b4nnNYZ+zl+2rtQkEw5Iv3JMBBzUFpORt0MDYCtZFc+RzT7DFixDSx?=
 =?us-ascii?Q?J2P4K/vbMujiRQhcZFJe1rZKtBc5McmIZLX8nKGL1rkPSNZD+fH7644/nekm?=
 =?us-ascii?Q?WhG/oXvCyN6RdMoMNFXZmQNI0K2qu59bFaISDH5XIpJuwz9yXflvWtV1SxOk?=
 =?us-ascii?Q?ZN8lOtLPsrIN2GadoHcqnd46KURL0Y11hD/3PhT2AfHn0sfoLLh08qsvecNT?=
 =?us-ascii?Q?vzu4tZ/obofX35Q2mGNA8tCJPV25OAbx5hkH7JoKJCYvblMpkfGaLDAU/vGf?=
 =?us-ascii?Q?J0yZlBBLh9/I8n4pNci8RG2I3aj7n28dkubiwkzCkEwf9HHnV1cYJ7ILF/3D?=
 =?us-ascii?Q?a8QYMQTQnFJLw+Ai3Kvjtx7mGMecu2bpX+gAnM+k6tOmGTcP+H9lB0kDk3Nb?=
 =?us-ascii?Q?1u79Y6Qemv5eXCosN8baMKXrAAd1EO1ChNfCdWDDjMdyRfyZ7eoBBnE0uJnJ?=
 =?us-ascii?Q?88L2vjkTlrjXHL7wiGho6VZT4U54Gql/pq7e1BlmElLB8N3zVV8w20nCoQnM?=
 =?us-ascii?Q?r34WRqam01w2eCY9MiRiHFkJCiBJP7qPN4ppo5gpDuL908bmeK+bm+ck5rtT?=
 =?us-ascii?Q?04w1LcGFp+ytMRqqYYcnThba/ttCH0UMraUjzgioaGU8iOoM9H3LpivTwoE7?=
 =?us-ascii?Q?8zFEBR8WC0DennpP/zp9u/ZlWL0oP+AvGz/Aa+I3gfXoUbf5R1Yh2ecJLKNl?=
 =?us-ascii?Q?94+CwrnMDBQ13ixRnr+Tc3p5ujTaM/4KdS9JaNmjAjHf8ekTMR8Jl4RqMawr?=
 =?us-ascii?Q?nrR/IWuDy+zy9FlnN7brjg/GrwljNHUR7/ZIuA766WXX5pDhGM7RwLXAgWNk?=
 =?us-ascii?Q?PKhrIvjNRFQtPKQyXHlqChenbZJO1LQ8osm0cBQnKsNqc/RXm64bnTIFzcVu?=
 =?us-ascii?Q?2ezlhmWRwwlNmtgXeIxTdpi5RUKW8DKvhfHpwuHMPdicKNnmhost0mpyAy2U?=
 =?us-ascii?Q?LedUZ0afEOoq46ZRA07wBoRf21tTvMujYgEdqPby62p3dRqElpJObF9rFpmi?=
 =?us-ascii?Q?XG9IcJrOHGFyGFYFeqixGuOxkGITGJxiVL+X3M2Lr2PhF40UbyNfHGVRCu7C?=
 =?us-ascii?Q?Y7IETY0GGW00xxNOrCmCUAOj5NANRHp8Paz0UczsOkTD1WneeeHz8X1s/aSJ?=
 =?us-ascii?Q?m5ES6oS20MVZBNdE9GLgwVRgZuzIeSN5rmCL7etaSPqXGDyDozsgj9fPMBj9?=
 =?us-ascii?Q?Lllpwr1kNBkrOfyLMOnKtxrSqAZdLvru6eEgFi8b4O2zCtAJnGn4L3OQvGeP?=
 =?us-ascii?Q?TuhL1pOCsS3kEIO9oXceaab8fL5S8os4mTWKMB+K6qYnlrFZS79GVgVi5hQ/?=
 =?us-ascii?Q?Mv/s8whWaWL/HzNNtxbRMvwkZg2MIs5q5VG/g9l5HXAptNup75e+nIvYWNQo?=
 =?us-ascii?Q?MjGszp1sJYhNJ34yqK+YiG5u8P+TuZn/FxaZbL9ugx+xT5ZA+Z9Afp7JGGr/?=
 =?us-ascii?Q?DCmxRipgmQvIAXkExxMX+5SmP4CYhAfh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FXMdtWxNaImXKcm7s9mVAQGk/inP62kecd38UQKnVZaP9htI+sVF2nvidOUX?=
 =?us-ascii?Q?VWXLCAKETzYHdpROi7YFbpWDotuAMdz4s90a3YWnzjW7KDwfQTqsYc3b/1QX?=
 =?us-ascii?Q?v5hzBV75jEtG0LHISO1NNThNIpQWb1HJ/vvb19CHyihjtf23PJZbAO3r262U?=
 =?us-ascii?Q?Ym40tuBLtsLOGR59Mf2mJjcm4m6RN0CZdRbMdr8p6KQY+VMnCTdo+fH4Q+O3?=
 =?us-ascii?Q?cswqFy7HBIu/yKviA8WMvZasNoCsFP1V/MK2jHGn5iTQqEPwtQgLsqm8XrGW?=
 =?us-ascii?Q?a+DbZH9eRWqvksab2UThXTwbuT1IZfNRvlPBf/+dqc6mxF5bBP77tcqIl21x?=
 =?us-ascii?Q?YSpWimrMylGne9StAwbsROlsjNpNoZGse5AmB7Z6WFK9Q934N0VZ3wZHrwWW?=
 =?us-ascii?Q?eGTo7YVFzA7dQbFB1EUsShCaoZZkmF+r/YjhsJAj1gBhU8zdGEer3ONf4QGU?=
 =?us-ascii?Q?gL6g4lLHsT3OwG9oIkdYYgxd8djClCCYa/gROc7DAUPnNpsQ6ijMkatAV+Du?=
 =?us-ascii?Q?VgLB2j/GWHwXcbDdU+INk2fmGUSPnVVvDTsbejYWS2mJ6Ng40fsltul56dxJ?=
 =?us-ascii?Q?OnZ4o3hQr29Z4pA3Fz/CmXDnuqQsW3pqJ9LhCwwEf4CoUNHWgIpGza3HqF+p?=
 =?us-ascii?Q?DKBkAdcJjP34J2+Qw/DcIiShPsp7h7RYa7BmwrnI5SMe/cVwqw7Bv3ll+4GR?=
 =?us-ascii?Q?/mt+ll5PM+xL24Pe6EpIdnPXlNHpHcZxscpodvFddqorKXFn+wDViOWbZaHe?=
 =?us-ascii?Q?acU42O1WqEeyX0/cmJBOioR0fFQR59N1ZDRtaSVP4uv1PLUdzq3xzrNYF83A?=
 =?us-ascii?Q?tsU637WKYv5jFYMVdEYL5e1tCNEYVuFgiLgXXV6LncPBDYNmqYuDyWKMlbYb?=
 =?us-ascii?Q?HoqF2mWL8pWsfd8lriS4+nlukE4iFaQyoVlwlcdNEyML2SYDRDEJuvO/jjkI?=
 =?us-ascii?Q?JeybvMaPt4ZpEZPQMbRbuPuAduA3SBgpl0Tc5s24zXAp8l4MI8o+yxODRrrl?=
 =?us-ascii?Q?BnN9D6Un+KUBV/Qat39ruiYnbkpoby8HuRBnsnNRLJzeF/UYJMuJ+TzYITeH?=
 =?us-ascii?Q?Xov4Jvym0LLG7a0ct/GY3ZkF9uY3PV0XD/jfTGj86KH1rJfXN6612Lp/G/9P?=
 =?us-ascii?Q?wv2qpE2pA7gH5ovpl2vsbnTmU+GI5ndY0CCsEkFwwCZP/NbMjTO0oqUwkFGF?=
 =?us-ascii?Q?bftu7fHD1fOtGIyQH56uaXUwQ3IA8jwGmZYBGsN72SHYmECjh16YAEtnFXm2?=
 =?us-ascii?Q?H2eaFK/Kd7qyNmBiYbOQaT0gfKoigfwTSu84rgbzcoikBnPb1lu/Z9wzXKcJ?=
 =?us-ascii?Q?vPtRvuyL0SjxnrhMH8J3zNE7bZqfofxsXP0Wsg3tYLzi0IALaeyxMPetXyhv?=
 =?us-ascii?Q?i3fnqF9os/CEzNDcqOtrWMsJpDIg9uaJKTBa9nKvhYH2whawvtbW/dGlj3b4?=
 =?us-ascii?Q?FVEJ+QOgHgsWgyAsxA6+iKmXO3xJ4+IgaV1U7ky7j2/Dp73FUDROWBtNAJAC?=
 =?us-ascii?Q?m4kfrXaMNCPTy1pQujXuf9hNPUulnHumurdvPGnoUzv51oxZ/nUv0/8CypWU?=
 =?us-ascii?Q?gWNxpvMa4z9hBuMdGtHSJJiZxjoGts6WFB+yAfGM5FRPLoPmsq4GWLDkCNu6?=
 =?us-ascii?Q?6NUYW80rHqgYERQnjL0+XDI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8939e80c-0307-4cb8-4258-08dd1824ab1b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:39:52.6174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIXaQn/U1yB0rnG0vaxN2EpFXiSGzkYbWuDxxOFWzRO79eDzramLHvVUmESPHralWlG6DFtUq4LMZ46ydD4Kb0qf0cHZ6KphWJpRVlDmbFnpygbzWbloQrlmtHFS+69v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Subject: [Linux-stm32] [PATCH 04/17] ASoC: codecs: cs35l34: remove
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
 sound/soc/codecs/cs35l34.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 287b27476a109..e2eab209538d0 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -562,20 +562,6 @@ static int cs35l34_pcm_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int cs35l34_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-
-	struct snd_soc_component *component = dai->component;
-
-	if (tristate)
-		snd_soc_component_update_bits(component, CS35L34_PWRCTL3,
-					CS35L34_PDN_SDOUT, CS35L34_PDN_SDOUT);
-	else
-		snd_soc_component_update_bits(component, CS35L34_PWRCTL3,
-					CS35L34_PDN_SDOUT, 0);
-	return 0;
-}
-
 static int cs35l34_dai_set_sysclk(struct snd_soc_dai *dai,
 				int clk_id, unsigned int freq, int dir)
 {
@@ -619,7 +605,6 @@ static int cs35l34_dai_set_sysclk(struct snd_soc_dai *dai,
 }
 
 static const struct snd_soc_dai_ops cs35l34_ops = {
-	.set_tristate = cs35l34_set_tristate,
 	.set_fmt = cs35l34_set_dai_fmt,
 	.hw_params = cs35l34_pcm_hw_params,
 	.set_sysclk = cs35l34_dai_set_sysclk,
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
