Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A55A388D3AA
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 02:18:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A22EC6B46B;
	Wed, 27 Mar 2024 01:18:56 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 126C4C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 01:18:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEGwGewKaz0G+jH1UYqe8kA6rPUQ9tAWnXY60zmpXGKDpqAT8iw1R5UtADot5M65ISlOlaV22/u+yYuPtD/dPIhrystDyBp1qshyq/WbsJpZcFMYgQBAgegSnZTuUYRwtjrHpjxq/j07v47z3r2cos5os3ZdIuIStXjpQeavnpENn7pJ1GiQRPY2p2CxJRSx9+TRLYKvjLSfDZPt5wsUGesGI5OxsDXjb7dSpp6rROQZIoH9EOBreYNHfhW43IKsdAiWDYdhXu5EmTeneOILdc3Je/cad4naUhgPGpTxnfTA0Ni9vDFvGwiIswB4uZ5jmbiaezLy9vut/+wCc1YfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4WrhSCJtf6xsaANSnCtGVvqRY1iuiT+3q1FGgFGqMs=;
 b=kDajomp5UiIDGHInBOY1XF7UtiuJmgW/1WrLDidjQp3kDxqbUuuIQBZnbsKzg9JE4UyCxhdDg71dkvHmWBm5OyWf9d63MRcBT4mjgzsYef8ljI+hxI/4nr0Hqz2QteXRKfOCV0C1JVAzQ5LRwI3cfKz3yrE8p5EXTz9yIFN56wSbas0/MNAWen8ANpeDDqmuoX9zvKpRYgCL7bQFH/WFwtXLji802qHBibqujzogE6l7o5XwfU5AiKAhEY0UPVdEaWh5dalqoSEl1E+ZWUED1EijqELJbE0Q7DJQNTTpVQOCnGtFF6CqSh+bcTh5lQ92OVQIotCNnBYO9J8epXujZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4WrhSCJtf6xsaANSnCtGVvqRY1iuiT+3q1FGgFGqMs=;
 b=PiagwmNcWLFQSbr2lH0JdxjIqZz68RCZvwqNCKiDnVF9qGoR/+jZovATsFtHjz/Ch8SbuzQ5Qeetsq1LTDniw/IvrLUe0/UnP2ProUNcgAd0BpKsENkPFemoppHjk/2s1fmVgUswFjXSKER/eAwdBvoRO8qd1cIuuMh4L0th4Sw=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5817.jpnprd01.prod.outlook.com
 (2603:1096:404:805a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 01:18:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 27 Mar 2024
 01:18:51 +0000
Message-ID: <87ttkscw07.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1c437229-cbc7-4e0c-987c-9ca31800a572@linux.intel.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <87frwf53mq.wl-kuninori.morimoto.gx@renesas.com>
 <1c437229-cbc7-4e0c-987c-9ca31800a572@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Wed, 27 Mar 2024 01:18:49 +0000
X-ClientProxiedBy: TY2PR06CA0037.apcprd06.prod.outlook.com
 (2603:1096:404:2e::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5817:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+FHbe23GxmVvunlfacHBSBi9NoPtWKmUOK48fcIrlfDiC6m1Xebh7v/R8QrtvrEoQXHdEu41897KSa1DxW3Tj06i6XNwmyjwXYqt42GpLpqVKMBUKoKx+TWMGnnuptIjl1wbqBb/QA2N0YBnSMzxN/8uUt2yH9bFgmzgaVc9y5Xv+s5vaDilISgrsYQgqn5zqtwkXeWm2UrtkQ+HAehMJiivr2w5jWNy5lNTiH3UymzYY4qQYVCh/UpZkheZ56rCnwR7/ASW8zE0/04kr2RfJ6F9Lx7a8Kq2E9INJ21Sa+8GvY7kS54WuSLiBpGkct29Wr0+VQQunhNpVX6o0bdzfj45/U3Trv+5jTc76VconOaDBq4NVNcI/T8FND0rEtT/BMar8XvEAlx0cZZQUFf9UVfsmEfsjDpDZZEzblRiIkaSWdW2rZS2gBzEFD4jbCAl3aLSS9eTt2Zg5pcn42bDrqT7El0Z9Uex7n/+hUZLt0o7hN2exT2elTMNSIwnGnf6+L6qbObeKEmYecGnAR6SKd8j/rvhAwGdFCEEz38bv/ozePefMGHBQ1UOvD9r3F6WOUeWEF/72Ky0JdemheTY5f0wAOtAsvNIQOjdIX4uHXPjA+u4VQSHCOT2zElY9nB6iKJg4C9AI0M0m6FSL13CuaWReIC3EWz3aU+t41wd1yfZVla+ELXktmosZFDdLKPvjGJUVfSSu4rxrSnjqrSbuCr6c23T5icqBgQczcGxJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n1eGdAHsoXB9Kgh87aUW4UpiFotT4bZCYofXv4FQW0xpM7bGz92Ix1Yr/fOa?=
 =?us-ascii?Q?vDr9XpyLsXPJ2/1422yrIZEF3wDUQOlXIj9RBM11lrskLUoq7B3zJVP7t+tF?=
 =?us-ascii?Q?MPhJbl0Oa1dvMI09qXMBjDKAl7lg+tpBHxFsgQLuJAgVnD9Nji4vhgtc2TZO?=
 =?us-ascii?Q?Tw9Ti9x3ziohuH3MqjUgD4lPS5TyimvOG+hNaHFd/8OwQPgd593+0wyELC6Q?=
 =?us-ascii?Q?eqtXCkZ5dStJ0f4aL0MQ0dZDLba5jXDGWdZvWWkj2CP6T2DFhZpk28odYu8Y?=
 =?us-ascii?Q?xK9KR8IR0w22XcNFH1vvtKqwugBdnp9SG+qMpqyQOun7rAFvhZuuGv5ei3/J?=
 =?us-ascii?Q?WGXzTMfkfWyZKc4zhnDXRL6dguLJiyvhq0SAB1FZDTFf+YIjehQR1J53P/M9?=
 =?us-ascii?Q?dIXD4fpZjZdLTIn0ZAwvLN59j6uR5uoQQ2KyXUFzBoDrXHU+nKnGXpJFZfuf?=
 =?us-ascii?Q?pZLpQDPvD0gdsnyZqgogbu4RcAWTfbnCKVJ15ib+K8A1hgHnPbaF+8ANUSFi?=
 =?us-ascii?Q?jemvYgN47vJ6erqG+Qgm+JacGEyToAs8VvtGKgvbVrIN/46DrxxE+1vqcmMt?=
 =?us-ascii?Q?h7BM3d0GrnKvQqBCCyXoqdWVOayiMbeYYVtBeFF75ZbZPgbrlVRxtz0puH0I?=
 =?us-ascii?Q?7eGTj8oRsXVi99hbnGYtMAoJatUew/9HIm7++WbLsn9/v8p7u78Jq841vvXB?=
 =?us-ascii?Q?ft3nfgKKVk3os+9RWPVQc8bTopAksdm2AGJK1g/VgjhN1SDhW2tpDnRETpx6?=
 =?us-ascii?Q?rK2eknoHS+ar5y3RzXRbk4o9AIArqQOtsHEFixpn1x6KL+W53Jdhm+suYdzD?=
 =?us-ascii?Q?ukOorSmlUFGDhUG2pjI62rzk1HfR5Mwwl6Ve+x9jBDJP6vf/9/v2kFWbpJrE?=
 =?us-ascii?Q?rqSep1OZYOZKBhF/6VvsHJvnTydF0+uLAlL0ns4DxST1oUszU4+o3p4brlRI?=
 =?us-ascii?Q?B0dJNlyMk5b/N+gPkgA3ochusubuyDKNWUbU6afWjk/tqGKlmUyaNSsfl7lD?=
 =?us-ascii?Q?utDJAEgbR6+fQLjCUxoebHuZfAqB2lR5DJoTWQJqVlc8+EPjwyrIlaWIKG5p?=
 =?us-ascii?Q?98pwdxqRvrBHN71sZf5168BI+tOdnzCbE2cK4nkJ7yBSAXcSnseXx3PPBzbS?=
 =?us-ascii?Q?D9wnSkfPDGZR3NLJE/IK7Z0lhGZ5vkdyVkkFPN2GfYcy0/vw6mg/NqLRAGAQ?=
 =?us-ascii?Q?XyChTHzRzs+70RE0uerxcJzuR79shRWYhJYmf20PB8spILE+ACC9yikUKQmV?=
 =?us-ascii?Q?V6ir1DUH+VHvg4rgexRSrF1ZgRyt5y/JwnTtoURFnplO2i0enOYfF+k66viz?=
 =?us-ascii?Q?cjRkKT1WVEBx56iP/JAl6A87Edr8Ec7pcB5qVER/43VUjgZYUHBop4rZXzsr?=
 =?us-ascii?Q?jTbU5Ae+urh4zWIlBIyJ9+EfNxc6mFRYKeQ/IzvpNy0IlKShCsJwAu5OPTxO?=
 =?us-ascii?Q?ZQvdGGt69UURvg3COPCKez2OVinL34UYmzJRAEYJKcQ0dvhGpjCb2wJb8vVa?=
 =?us-ascii?Q?MgRVrYXvZ0lti/4wRR9Pym8oYJ+UKsguaoIHeE4SYA1fLLRX5+USbMSYonEV?=
 =?us-ascii?Q?CuThIaJsmAUSBCR1i6eNCQYjWDrRSI5/EUi+z1bFN2OFd55GRHY7eJg6zTwc?=
 =?us-ascii?Q?mgKaleQX6Ll2En3ACbPdZis=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c98d4b-8ceb-441a-deb0-08dc4dfbdc65
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 01:18:51.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZPbaUuK8slaYkZd6RPxi41vm53oBB+EcV8s9SamDphoC0VtLCFQFZMG4gh4AIzH7gqwgPx8l/mLJsA2Pjh3N/XrGxxqO1xDOGBOJVnKGLJPUgA/2Fd7MwVzHpMrkECB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5817
Cc: imx@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
 linux-sound@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Brent Lu <brent.lu@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 06/15] ASoC: Intel: replace
	dpcm_playback/capture to playback/capture_only
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


Hi Pierre-Louis

Thank you for your feedback

> In addition, I have a bit of heartburn with the concept of flipping the
> logic from a clear description of playback or capture supported, to an
> implicit 'both supported unless stated otherwise'. We are going to miss
> some cases and have regressions, it's pretty much a given.

Amadeusz indicated similar things, but it is not so strange for me.
Because it has driver to use it, default "supported" is very natural.
And, normal connection case is using this style (= default supported"),
only DPCM needs special flag.

But I have no special objection about flag direction, I just followed
existing style. If you and/or Amadeusz want different style (and there was
no objection from other reviews/maintainor), I can follow to it.

> > -	.dpcm_capture = 1, /* Capture stream provides Feedback */
(snip)
> > -	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
(snip)
> > -	.dpcm_capture = 1, /* IV feedback */
(snip)
> where we lose comments on what the capture stream is. That's not so
> good, we added those comments on purpose to explain that the capture
> stream isn't a regular PCM format, I don't see a good reason to see them go?

Ah, thank you for poining these.
Indeed the comments should not be removed.
I will fix it on v2

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
