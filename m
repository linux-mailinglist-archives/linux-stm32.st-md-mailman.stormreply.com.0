Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF30F9AD942
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 03:29:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 965CEC7801A;
	Thu, 24 Oct 2024 01:29:43 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EA71C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 01:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5d7IDAhEvJNC48QqybnH2LRV3Ksz5gQhPpDCSq4ttOGUZUuN664/lBAGusRA3npvKxyNyHQzIh4BtOyqa4NUa+zd4OJnrxwGzX/XeW+pjX+9BISSwrBJCFUSHp9GMTdDFlH2vUCHuKIngEJMrVLivhjW/TFTNAzuNDh0I95bUk/e2A4jQkqMFb7BFBQxYBs0Tnfb/Cn8jr5nkG7/nK6ZhGcBBI4SaiPwqsHxpc+bBnsgRawC+xNyJuR5gcMMdgJjX4V0dpF3QYewOXxQyHgslPTTAkf/EsRWeA8mjpm6p0pEV8ZhtwIirehlLgENZfTSwJhDDaOswCrNAaxw4wUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nqcruCmoUEHhDAiQIcvXihICbcnhBd2jxrHF4wLhwo=;
 b=OWWPvVj1FIIvR45f+i2wnBwSExXKeSWaz/MvPefQCEKShXAen9+/29M2FiA9o+P9EG7DnAg0XXdw/O+2jfgkGEbyLgP7+RTcoX3cChlxeEyBDrgBUWiC1sahFnQm8MsS3kv62ruTUTJZKEjRewu/aoAM0JER1R1PHgofW0fXTU97xlGjcLRsULIBv/vN4joNaPoETuZrxSX4ezHOEQuIFivxwIIrbkIAKhZ8YzX7/sSg+bgv2AUqaua/A8qaPJbf3JU/zTeyz3JxwZIAKGJHji5G3SgQxVAA1t2jt2YQ5QnfpDQ8frfcHikWqL6C6uXdlECZmz3nyUTrMCroQ5fFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nqcruCmoUEHhDAiQIcvXihICbcnhBd2jxrHF4wLhwo=;
 b=OtDp1W5IdD9UOiMo34j9jF1CaKcYSfrrsT+VRpY0aHl8wZIVE91HE24Az+uGRuTofEfs62CKy5DynrWm6eoJIhddomaQgauAPTdspnXc+G6Ej09Ok6uiiFKVwkm6n0EosuOMbc/VGVa76RkYLbX5qsfu19C0j8Weh+y4BLdB1XM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12111.jpnprd01.prod.outlook.com
 (2603:1096:400:43d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:29:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:29:40 +0000
Message-ID: <87ttd2b858.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Date: Thu, 24 Oct 2024 01:29:39 +0000
X-ClientProxiedBy: TYCP301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: d532ab22-75e9-4f86-249f-08dcf3cb546e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xyO4Wbq+W9gw6YlOci9o5XKQ4Ug+qXVmDYaVLp8akknnKSwuOjGhHZy6bcDr?=
 =?us-ascii?Q?FZBizjZbo+tcClXwE2MVR9VMtTfF86vwQNSbh5p0kps83FhXwbUOkBoCLHyq?=
 =?us-ascii?Q?ykNVxIBnxXkN0RNuGDd3+Dqd7672+7G3IUPngxTMp8/ATkjx/RmEUwBma2GR?=
 =?us-ascii?Q?BWx9Ga22lbFN6Gcbk69eIzfR/vyle5icUtGHiX8tERaVj6qhBz6n69kyY2ol?=
 =?us-ascii?Q?WMykdEcUk4yEmGcLYh/bAuAZHsOP5deiUe0IglkjDiP30+K+4dseTSlwTQE1?=
 =?us-ascii?Q?R+PdOFjvToLtKPXnXqns2QWnrEF/xz6ccxU3MD4daJ0xjjqUeD610BOKc7xf?=
 =?us-ascii?Q?WH2KUSjORso6lYT4/qM3OcMt6ZYxe/n19JzZgmb172fAU3kajWtwSIz0hG2d?=
 =?us-ascii?Q?ui5EWM9THgOrztjr9KP2qozcB/xbCseeuH3py5g8NIQKJDyvV0D+W5Ce6EjL?=
 =?us-ascii?Q?TTCiqef9UU8hBP5IMaQ0Kr78mO35I8iS1Bxgxkek7xfxNsoaTz5Ez0NAPk74?=
 =?us-ascii?Q?wdub4+q92mmhi0Fgvvs6RuzTjpxzr8slt7uWFzTs/volCu0vkFblUYTEos5t?=
 =?us-ascii?Q?rH+TVJAlRQFnDE3Evfd4RlvW6J/5a+YrKy1yKNQMJyhzgvyX237ShRCtDlXk?=
 =?us-ascii?Q?PS/zOZHkI8umc4UTEt+n9yZ3qfM3CvgGS8fKTJVKxKyeKAB5hWRfiOzJ09DG?=
 =?us-ascii?Q?mHNzfVLlcuQsooRhKF+Srkcte0xW1JyDeYg2OmPoUpNlyv4swHb/QJRSnGYp?=
 =?us-ascii?Q?zX6ID10SkTOhBFshGDTUjRS7APNtzx/mpmOabcGT5Ss7AKE/0Jjvx7TefjGp?=
 =?us-ascii?Q?qGY3EaHFupqmLkuuddWjXXJf4HA/eh6FwmDnj6fsyGh3cnjLzw+6xmAbuonz?=
 =?us-ascii?Q?5ggkBQ8fmcgGt2rNb+0CQQpQhHbTu9+4Y8W2nbUZDqolDoLpyHPpqDZcMGHU?=
 =?us-ascii?Q?sygrHetrWtcHE/PxCmrnEp7U0/vvGperk/E9eDa+a5VCG+FmU4gvB0ieJmhP?=
 =?us-ascii?Q?uuabITErFSeWoy0vIfoXBrqFseLlnp3gc8Dtq3Hmvgu8cCrH1FCq57+jX62a?=
 =?us-ascii?Q?DMFuhlLWuYfZU1eGAsBGXLNG6gE+rkn4AVwTpHFf/L0UA8iNlbclsvGCXCb3?=
 =?us-ascii?Q?EpjPVeS8NISzgHcZ6jjcfEkxye0Ef86ncIb+YyfnDbsx/PWbs3SuIEVHXy1t?=
 =?us-ascii?Q?+i7qNsXivYe7vfVHcxDdZLx5NmT6GFkCFYCKeC8Er6ZyUaPL21XQ24eNxXW3?=
 =?us-ascii?Q?KR0t90T8nlwXUTZX9zPmbw7LHJV5axLjX4YXIjWYGSGz4inlj1VM0/3PmlsW?=
 =?us-ascii?Q?Lb8R+rNCgiWrbGjDpgPcEzRytffR7BtKOoAx9/Vzer1tmFdBW1kcsmTmcPqy?=
 =?us-ascii?Q?hc2ZR+kwapLY3GxNUbS47K3o3G0C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7PbPeN/uZlrO75dgsHI99V5meA2j6190zmaUVLDuaAkSo0BlBtbQ6ux668MI?=
 =?us-ascii?Q?kcCFV4V49/aGbT+R0e3hUXSIG6AiTB1gZQEUOhoXYcfQxUMYBGzlvqp7myg9?=
 =?us-ascii?Q?3cpuMGK5OZGDNRuAqtz9+jHRUcz3jNPdZEUG73eu35yZA2GmnPkp4PAv2W/p?=
 =?us-ascii?Q?BbsgOmG0ruGkf+haz3i7iemUEmTGPlWXYgUtT/068ZginR+igdEOaOgF72wg?=
 =?us-ascii?Q?gngMqkYZBU0fly5JcViG1AJzT014YR8RYMGzLUcqOdKxwRgV8bLDA8UWuqg6?=
 =?us-ascii?Q?qC2invw0ueANyrKwggBqTDes7g9/k0UvpSiXSMSUQ2n9zGyRr1p9D4uX2ox5?=
 =?us-ascii?Q?kd7gGbekbHWWcuPUIGrSAYa0fqyNLJliSGsDZ0dbhy3/XkszLlbMhwLIxFBj?=
 =?us-ascii?Q?LPEzOO1aGk5NhGoQtkdey0XNArozzZMrCOCxSKaXJ9ZTrSrm63utVqkM/MKK?=
 =?us-ascii?Q?rO3XzztyGdrUpCdQkiUkGc9/+Sn/Oz9uZJOLPFOWN0radFuD5zmyllG7nprg?=
 =?us-ascii?Q?l4aRBGMLrpbJNBSkADDV/5q9MVS/hLRBZipusrcel+Va16g+D6PZKWknVm6f?=
 =?us-ascii?Q?XttS1ghK8ATqTDROjYNDlesB2aslp/2mvVElikxiL/WkKlAdnGk3MJUMDN+1?=
 =?us-ascii?Q?K4t+UmjTHJCGof/bLrsolHxIcoXA9zHkli9m7svcWMPpUPaPpsrBJXc7BDkh?=
 =?us-ascii?Q?H1tGTL9X3a3hW4T/KkkqJrvTuJCISdzHFWPNKyBpY1KxnPYwDDewJsbPz/cc?=
 =?us-ascii?Q?Qni6rzcc2hmQW0npmYdq8Vjfn9j1jpr7idbAwiSglieNtyQLvCGGoWzttYsQ?=
 =?us-ascii?Q?CMmExw+xAmCk+vEcJy/ydEFaEx7z38B2y9ociKGIl1C7yOYTMG4PUc1/86Ar?=
 =?us-ascii?Q?QiRd53gOcg6nR/oTmFMCdGTdQUU3rJYc8kf3GMyMEl3agKtI6mjxCGXSJTtt?=
 =?us-ascii?Q?/exU2u7dlSptDJbaAWmw8h1GxQKhiSVn3zBagDQQhAIdvKihcJmxbb9b7X7B?=
 =?us-ascii?Q?AYKy8JPc00vf4HOlhPBHnwUyTEYv+VryxfI1JqTQ8DLV0KjDDXzf3f/9PDxt?=
 =?us-ascii?Q?YaTj1QK8DF3Z5nCwFma1zPjwZP+aVKFQjwGCuFnwQiromSVaZsaV1QiKEnmi?=
 =?us-ascii?Q?iVpEBonZXNWIh0i7RzO53bSw1ig7QqiRqNdXsoycv0P7n8SCXLdq8z1+Mnmh?=
 =?us-ascii?Q?rL5EtO3kqwzFWEHIPl3ARJLsqk/tRiIo2N16DrVdhgCyZ8jqSEiQQGBhKu5j?=
 =?us-ascii?Q?HckbPYTvLWVFANdoH/f1drWBShGAXav06sONf9TqdvV5aeelAakkSVHoryQx?=
 =?us-ascii?Q?tox6jZuRhCxDVmGFhSe6CVP7+3W67Xuw5qZVxePKQCXXKn/44TC3J7NDU9Uq?=
 =?us-ascii?Q?pKcHkmRXp0rxq6mmPDGfmvBOarGiEv2+xGRq42M7GFaXDbzegVi2IQ+bML08?=
 =?us-ascii?Q?YIKY7cMj3sHZWb5BSF/QrGOFAA7Fq3I5Icsie7nI55vnwJ1QsyWsPali05ki?=
 =?us-ascii?Q?q4PMlzBw8fPIcB6F6BatpSF9L/4cBK07VKgdhOR/RLmnIzE0tKBI64xoVh50?=
 =?us-ascii?Q?YmiWEGVYI4HwPi+69zy0Rw8zr7B9jGBLO5ry53Qzv7atHYhWwkRUX9Vz6j9D?=
 =?us-ascii?Q?p64Y2/J13YR2zPQHipBY0gA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d532ab22-75e9-4f86-249f-08dcf3cb546e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:29:40.1142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bR12iHXW8uqRckBGR2h9B4QW0Fz0VV7rbHApvIHCK59QTA/ssBp8foqZw5P+oryUh0F7tMTcEDRfufxID05UpcFdAkBuc75xZLQdVJRgMZusFBWxe7coOQvOluQT082
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12111
Subject: [Linux-stm32] [PATCH 5/8] ASoC: generic: switch to use rtd->id from
	rtd->num
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

Now rtd->num is renamed to rtd->id. Let's switch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index fedae7f6f70cc..d47c372228b34 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -296,7 +296,7 @@ int simple_util_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
+	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
 	struct simple_util_dai *dai;
 	unsigned int fixed_sysclk = 0;
 	int i1, i2, i;
@@ -357,7 +357,7 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
+	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
 	struct simple_util_dai *dai;
 	int i;
 
@@ -448,7 +448,7 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 	struct simple_util_dai *pdai;
 	struct snd_soc_dai *sdai;
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
+	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
 	unsigned int mclk, mclk_fs = 0;
 	int i, ret;
 
@@ -517,7 +517,7 @@ int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				   struct snd_pcm_hw_params *params)
 {
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *dai_props = simple_priv_to_props(priv, rtd->num);
+	struct simple_dai_props *dai_props = simple_priv_to_props(priv, rtd->id);
 	struct simple_util_data *data = &dai_props->adata;
 	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
@@ -628,7 +628,7 @@ static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
+	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
 	struct simple_util_dai *dai;
 	int i, ret;
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
