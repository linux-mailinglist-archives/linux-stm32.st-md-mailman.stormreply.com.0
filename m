Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2289E8C41
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 08:39:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90A1FC78021;
	Mon,  9 Dec 2024 07:39:32 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 165CAC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 07:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8QzZUyzivLrCS3rLI+PG23ahGtAWeJ2iYM7mlEpmHhOu+oEOZ6B1DsbmJ/HlMM4QH+IZdAXLUQTcx03wIxdh30eEEQrRzLLjDZzNGEaCu3yXuXjhBsO+zk05OHrkyHJM67xIgiZPsEHWqxgPRQiUqIfFxHfj3nFOSxKgF/E/uChZ6K/mDF4J+Q8bfdVLfI1Q5jf1QyVRHrng528n5452tRGszR9YVqgvRMjOdW8uZXKY+JpYAmrhQQd+OTO5+KynKiuzBJD164AQR7potnDJB4bhS4BssKxFIDp2mXdVy9GXBTZw154uOjCRHtfSy9MAsLB2bUgLOusByc1UAfjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m//mbcZ/kRq/04ii91GOtrXI6TGwzAjtbftlPq0PV60=;
 b=Az2FVvy0Hd7TowHK17kw44BwVW/MvFt8nOTaDsHYZazfP7yRrVKQd2O8TPTf3wP9UhV026S8S6DzWy3/E/npwiIBrEDuv48sOJkvx3lSKrrxuhnQTRij9i9e/LB709jRUdxUAYDArfz5GWlsUln8rLZJ4D/voaV9dTy9eMYDUEnckHKFDO/G1VSi8OsMmGSLxzZcH610F+2luZt+QehgSxacglKYdVT6HzwPC6rTqch1WNPBO4I2S65jhHbDT/k3LyJVmjuA0XYtxnj0FGTnwkaX0Esq/Z4eILru/o0aSx3DXGlk5sHZIVA5o+dqwnQh90uKML/qz11kDJqAwUzXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m//mbcZ/kRq/04ii91GOtrXI6TGwzAjtbftlPq0PV60=;
 b=gBo5lEQNNJoUHQ8KIM+/dJ2/OVetMNS42Dfg6sHfB/lPlZ45iSxv15KevOUPvhGQVCq7SNrXRrI8g0M/4tYZ7SmsOAUu5cjCj0+2V93ZKElFj2S7KhmYUxI8rBqMd83E9CsWEqF5LYffLwnf6L3G1HCxyef6n8h3ZEVNXHICM5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:39:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:39:27 +0000
Message-ID: <87v7vtmhjk.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Tue, 5 Nov 2024 15:29:00 +0900
X-ClientProxiedBy: TYCP286CA0269.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 474aed0c-14b2-4ded-9bff-08dd18249c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qSKqFllsuikAWvxTyFW/eW5VMsIjHmRvpxGeL1JSfLwbk6totD0sV2IhJBgO?=
 =?us-ascii?Q?+AIWG94zvFdwB7SrKgCNvKMfQRpZ0Xhk3RJMzvdAPz3pCZxSX+UCHTIUB/7u?=
 =?us-ascii?Q?G380xYzb3eQA0i3sGcpWE0ZfyLJAVzG5SAecYImQRg2Y14OkiRwpiaG1i7Wj?=
 =?us-ascii?Q?UBZ8cph7DMhJ+AbnADZJ8LU6vBVBP/HYFGklPSSPjsNkmNVSK1VglK5St5At?=
 =?us-ascii?Q?GjvR3ty9+HQ0tIKG8+INzeh3+aJdVZ+AwF/LhaZid7sMWVMSGuXl5Qoo7gWq?=
 =?us-ascii?Q?2yBcCLZHnpecNm7z8CNkSoHwoHR6+3YTEBZUanbv19OR5wAUGrklzNyuywQK?=
 =?us-ascii?Q?xRt6NPbkFnWcZftQxgv7F9oU6/pRErDFAhNIE0lIlT2dIZFx7dwHk7RHAQi6?=
 =?us-ascii?Q?GMbWsUPflzfKpFzGlkg0C32SKKu2LVFJZXy6H9jBBqcdhXzERpIwMidBRPNH?=
 =?us-ascii?Q?d8ONMZ3KteJ6D7Xn154ji3hNOziPEYdylV0XnIedGwZmO7F8Ah/2v3+2q3im?=
 =?us-ascii?Q?V6Gt+SfTx9v/EpV481NUuM/MejRDQb5/JNOfeTkbKyfes6VUz+FzJgN4tfxq?=
 =?us-ascii?Q?e76K2S89TJUb9y7zntEqy0nUU683pvh7ylCuzNPCmj33Ifo70R9x/PYhciES?=
 =?us-ascii?Q?8W5w9Ac5KvsjAAvn5oRhlgr27J5V7Xiwa+PfIMkz1rSVhwepWhfVlKwX4OOr?=
 =?us-ascii?Q?00bto4twy28nNfGqraEOxSJBv4Evq5o7xKhnLt5YMXuM24/0Dw++goNhhQwT?=
 =?us-ascii?Q?Re0kXgDOGZYtlXniyaN+x9jHFwXCH8Lg8KhkP5E6W/RznXEPK5VMVNJlGTD+?=
 =?us-ascii?Q?xnscpqKvXjEmZOT019qvMPVGAiKYJRwQz2uV+7SpahjNZzVU5f6Skp8chWWX?=
 =?us-ascii?Q?LbXvjZ9u7HF5fFp+lutkGWpVKWKDciemBOhgqLkFSq240ClRQseViaI6JXHV?=
 =?us-ascii?Q?0nCJKeS05Xb4CVYILQGkuMJxTZI/sqfQX0AZ2Z/b6Gp9gpMWWOFOQywSJfZl?=
 =?us-ascii?Q?o7buUGNgiSs21/EMv5Ud3qLMAH0LSpomUWcO6SPTHJfxIrAmFte5/ns5sAjT?=
 =?us-ascii?Q?n/qM4403VUUn7vWWLPK12GcZEgpi+FXmDcMvHbMhecdidfi3Cc6D2h2RUR/i?=
 =?us-ascii?Q?o0ECO2dKE5cE+IJyVN7U6lP3UmaVHpdve4J+LstVuwcTMMf77xnCZNvdRi9p?=
 =?us-ascii?Q?I/VUz2ehxBHfn6opO4AMkvylXxIfgghaj32z6ibdqxn+dysgGYNI9x+T+q9m?=
 =?us-ascii?Q?9IMQz2M5qCKFASK4R4HPFN6uYsFReadct0+/TSyHUdoxLGb/+BtKgLh3X4c5?=
 =?us-ascii?Q?G7zI2ZFc2Mbqhpj8Eh0EOTi4XAeIfTThwwS3H+EL9lsMc2bxnPuJAnozJyUQ?=
 =?us-ascii?Q?IRl91b9eLFsc1q4VCD15gE151YChLcWOvhkjS6o3MXjXFh7wu8NrJuhNNLSF?=
 =?us-ascii?Q?P53clcL3fByAEqW7h7kH96Dq3IsCqkvG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wp531v868xKwukyq5QTqDNCCJgmF2Jg1n+SKZOScQjx1AnUQX7US6NOImYAn?=
 =?us-ascii?Q?LSgUQBMRhtMo0KsU/L6kYWdqednhU482CUFi5Ild2h+a0L6+Xn6wmEtk7Spy?=
 =?us-ascii?Q?1A29bEyNIEKAY6JeWPSIJOKL5UJgo7Sh1nGwoP9kVwx9FeHKCrJJabYq2h8/?=
 =?us-ascii?Q?MU/eeCIqiuosO2RfsKnm1d/bYVkUAYaCBKwqwxIHU7HTIrjrdStHh8MI2h/i?=
 =?us-ascii?Q?n6C4YOA3RIS5/29r1w1K9NcuHb8o9a9wnnckU8L6l0XpthFS9KHjA0dZJ02O?=
 =?us-ascii?Q?KQ2XOscfJQU9F/1cTkZDspR6AypkJsdooHo4OdYdUwpCPUOS7QeLoNR5jXNJ?=
 =?us-ascii?Q?soAlqxF346abWsHiOooykhOt7rmL6lbOAJ6kv1t62G+pDZqPAEivTM4txFqQ?=
 =?us-ascii?Q?pXUs6uwNS5c79h92cxoWEtyv76tnKHwwfk/FUlO9ewUfRa65CqLFjPAJzwbK?=
 =?us-ascii?Q?jlPk5YR4yCrXMPSz1/nKKzsgqpbWtsnfK5DFz0gDzHPr5aohEQUwbMm1Lnm4?=
 =?us-ascii?Q?sSJfXmdlnpRCJ8fh8MaMFBXNWFXeHWRMMJj9hwGRdgN5pxjOcUb1wKQgA126?=
 =?us-ascii?Q?7WZFx8X6ulXADq3LqH20BCQ5IL8sIOCHWLyFPEnF3PX+kQfAQiFugrWldU8X?=
 =?us-ascii?Q?NNojQugHHxr18erTegsdmr3yNwSWDdo/PqhZh5tg8vt/agmzMes8mCWCw8ie?=
 =?us-ascii?Q?cwZ/2tl+8rJ21nZkiko+O+AyBLL8enQd79H8Vkv6RTK+yEd+yDBfJyduzypb?=
 =?us-ascii?Q?WxmkzoGElDokLYTInwgfH0sWWRY7c5k01lZuWiWglEHNg32i6Ee6G0ni4qTG?=
 =?us-ascii?Q?dqJBtcigN3l7EPlKUXGK0rpwmrM90TcE9QweQkGwslNl0eE6CT2JUWWqCabO?=
 =?us-ascii?Q?iefoIBR9Qa3XNxwNtI4nkv+uBydyV0RM7P8t6Xkh396d9S0bxEmelQ4kWz1n?=
 =?us-ascii?Q?wCKwaNqEZld1y4z0+8/e2n2ds6dwoQclET3s8K1drTxft0ZoZhVQ0dFoAItB?=
 =?us-ascii?Q?a4J7pTzg3idTWoif7ldh8PpHKh7lBUMHerJqZ+EfTdnzhq2oz7eBifSJyT/i?=
 =?us-ascii?Q?6mi0JdLvEPkPW3+NBwS8N8YJGpANTDqT+MMS46gCAvRKu47GR4JJ2bpDONMX?=
 =?us-ascii?Q?8te14dcvUCr4JTX5AVugvx74pb+RRgqpHZUPAz4RHhjhi9ITcnVJb/823iSN?=
 =?us-ascii?Q?+Xzdoshw0d0CHHba+8D1YITv/W2eDUYnyVJWLPylhZnlg3MTPflT+jYGKAym?=
 =?us-ascii?Q?3NwGXWAJnHoYVE763ARTijs+oAO/DaH0gdH9zaSZTxNMloNzRlDQ1ZhO38WO?=
 =?us-ascii?Q?Gf9kYCPA+6tDiUiVSlOxlXkY+TLwfsiXoPvJJS1ul0G5LytN+nGR3cxBqUyQ?=
 =?us-ascii?Q?Un5ZaoOETNHwiamQrIXJG0PqwJ9AqgqDf3diwVzUzm1Dkj4kqpUkq2za7oLz?=
 =?us-ascii?Q?6btI0FjSuPaPPdQrcataowegwzRd5JjCPP0ogvEEpCQboEU6I7sBCA9UUMXn?=
 =?us-ascii?Q?mhL+z3UXswPd87z5aW5HjlULX4FZT1AY/zxj0h8NHOB0foe3R1nEDNg2r2ZS?=
 =?us-ascii?Q?3Jwlxs8PRy1N7r15nZcCXxUTs5VFB2M3w6zf7uC3U+BDlgFfcxw4xHdNyArm?=
 =?us-ascii?Q?HeJdg9BJvKzKQdv5lC8Mqx4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474aed0c-14b2-4ded-9bff-08dd18249c32
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:39:27.6338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxaiIoAPTugfUEY21ETNRTXv32XVVE6myoKrdBZI2bkZGpwtxWngOwWIdGKSYvjQIPreCJcyuxPB1NgDAD9xFhlfGgBY6F7KXrYNWqNfayPXsTwPnEUseQ1G9LqKyMYb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Subject: [Linux-stm32] [PATCH 01/17] ASoC: pxa: remove
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
 sound/soc/pxa/pxa-ssp.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index b8a3cb8b75978..1abacb3994aef 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -347,26 +347,6 @@ static int pxa_ssp_set_dai_tdm_slot(struct snd_soc_dai *cpu_dai,
 	return 0;
 }
 
-/*
- * Tristate the SSP DAI lines
- */
-static int pxa_ssp_set_dai_tristate(struct snd_soc_dai *cpu_dai,
-	int tristate)
-{
-	struct ssp_priv *priv = snd_soc_dai_get_drvdata(cpu_dai);
-	struct ssp_device *ssp = priv->ssp;
-	u32 sscr1;
-
-	sscr1 = pxa_ssp_read_reg(ssp, SSCR1);
-	if (tristate)
-		sscr1 &= ~SSCR1_TTE;
-	else
-		sscr1 |= SSCR1_TTE;
-	pxa_ssp_write_reg(ssp, SSCR1, sscr1);
-
-	return 0;
-}
-
 static int pxa_ssp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 			       unsigned int fmt)
 {
@@ -822,7 +802,6 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.set_sysclk	= pxa_ssp_set_dai_sysclk,
 	.set_fmt	= pxa_ssp_set_dai_fmt,
 	.set_tdm_slot	= pxa_ssp_set_dai_tdm_slot,
-	.set_tristate	= pxa_ssp_set_dai_tristate,
 };
 
 static struct snd_soc_dai_driver pxa_ssp_dai = {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
