Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2338992AA
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Apr 2024 02:46:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 301FDC6B47E;
	Fri,  5 Apr 2024 00:46:24 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6F3BC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 00:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgPnAK6EPYN93RB0SV3p8UBexOF6tHsFqwMsbywU6vn8a6KabOIXTZDrXc/UiaIxnBjHFblha0lm/ZLw1XNyXyBirMjuletUgfhdhJ8VDBkQ6/o7NPFnIVN/jwUWK2g71tMeUCaMHonLq1XvX8DH6/NPepUEmJvzmCIOaKONXv10tnDe13YdkUZ+HSOzqk5OVIDBOhe8nqMwm2ezVsczE4xNyidVqMVqmp5/voTPcoTXtF9jTTjgphwbTY4ADuNSe+/m6wxie9e3jj+3AzHESA7AdfEijLHAdo4IocNpGGpkoLGSov5wuqlvFnl8jlqJq8svj4tAankNWqGTIkWQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ea+dNNqizDQwYx+aect0c4YwAXF9It2j2lT4WpLkrM=;
 b=aFKXWPi211Me3neHtogXOkNZNrlib6Jbf1jCrb4fHcCx27AHZf+B4h+lm72UHzTFrFi+o9AOU2zMjEtaiQoju0M6T0RbcZe1Oi/5XNl3mqJwvDtCzr5voFu5Hu8CVkKUYwFvrztmxyuczc6JWbKeRJstmHRJvAAHBSWRQYcE/WN4t7XCZ/UeMFbNswsmdXWxeR0FEnfjmBKWd+oMS1hjOdGezQK3g+oL0hcywDjTQRR1zEvlAo8EkdDwyQHnkj1kJx4n4MfEnHSKBonZ1OJ/7QVBJaKnxHRGHRxIXwCnajvXPvKtMZ1HBnf+DgtWGbHCAGxl50JZqC9Xx6UjeRubDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ea+dNNqizDQwYx+aect0c4YwAXF9It2j2lT4WpLkrM=;
 b=d8hfmcjDmcjs/ohX5aTsdHGWvjo6hbMJee4jqv51oZEDVnPXJAa9VNkX5UK0DoQWHRO/HdEmg8c2EbxKq5f+ItCKJtRM/yNtX9B70bYFQRZc85xysecPWrRTsJq4CJB/4IsC8UajP4DdyGohy+Vn9+bwc//wRnIhf2O0vvBFbs8=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11519.jpnprd01.prod.outlook.com
 (2603:1096:604:241::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 00:46:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Fri, 5 Apr 2024
 00:46:16 +0000
Message-ID: <875xwwr60a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <40e23972-6745-48e2-81ae-4b93f2ee2dcc@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
 <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
 <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
 <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
 <874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
 <40e23972-6745-48e2-81ae-4b93f2ee2dcc@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Fri, 5 Apr 2024 00:46:14 +0000
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11519:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/gmkhBa6/9g0ja1E0+xpc7Ml42YNm7+2gMyB33O/oOFr9uvrPO4Cu+49zmG2jtCzgCv7gY1IDseMyqFu0sPs++ctB/0XTyFBW6F6o2wUHSOUDyFKJBg2g0AlcpSilt+6r38eY+H6aFoZJXe4NZ743Yn9BSKMOX7GAh3KopI3+rGJC+IXnA7WXqPvydPwsRyphqyrQL8F9X8gbcJr+tdJclNje5nxQhfM/0OT0b3LgIpnvLvvcJ+QsyrCisDw+CXGpNZOsOtBDVpUKsxSPAq4u09fGkTrI+IgokOI1XBnFOLg6z3bqx1ORMD9ihQ0bRffFnwfDIWRkjHVrsfBfFLnSRn8ukrnexIFv7d00lY3ePLjv7kh54BHKIm/owhp9DpY3rhN7652jP2IK9yc0rI9rzMSHrWc4J5q6v8dl/otN/dAb/ANnhhY3yibA8ugARjr11Bp+qvamk6Jg5KQqoeyDwUh9N+GBp/n+lGOkhW8ytpee90+/PlQsPVZXkmEkhTOEjD2N0BWSUO5uJ+Q08jboBPCzYOLqUoCLf39/H8gwycDRB7fmiqdGC41pCoC9K+pzZqQGnhlcUsC4sTodaG7liQ4C9c9v2rt/Btw//Ak5fNwzS38BXU7VmOVl8Vq9UVcyaqJMoRNVs+63BF6IJUx1wr1a/4gM6od4g1wi+hXzJ+We0PRwWE7TQmFDvPv/QSVILEO+ClvU4UBx5udGB/cjqo4Am4ywyLCF/kbRXb5lk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(52116005)(7416005)(1800799015)(376005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7PbQDSDKuWm2ojemTluy12aQu9jYnUKHYJjLONMBLsSwcrxLiZqSv6Bl3bNt?=
 =?us-ascii?Q?e5hhURaLSQAZO8jaKpkENqTqvWxopCQLXE6jXke1u8J61ZEsTGRJBlR/5zNj?=
 =?us-ascii?Q?3fgNPlbVWOPPpjnziMGQwfjs7ueWAWjY3e2dnWdnQe377EDvTgCJ8cxAN3PJ?=
 =?us-ascii?Q?LFrLxNu7uROkOrgLzPIdqJuwgM2YQq0W6d5a1xfFmX5kfROtHOCaIg4a8F6f?=
 =?us-ascii?Q?wuAWBi0IyQDanx3cMHXoUiLUXrhlz6ABuU5wOLuNfQyefuZfG74xXYf9qwEf?=
 =?us-ascii?Q?qo81aJFycgZPgPBsmofKLlVxSu/8BpeMPb+Ao/ajc7/Z0MLmUfDe7V1CH5oS?=
 =?us-ascii?Q?t3xIjimP99H/VrpPk0FzpXs67pRa8GZEqNSDh4KbogQVgwKTlBVMkD7O2ERn?=
 =?us-ascii?Q?K3y90/N96e3UiloUNiGXK8MQijaXYleyHaiRO89y3M3QnU1L7zccBowN98oY?=
 =?us-ascii?Q?oqrHl9fX30jKpajJbnUHf2IkXco31RVmKQpV69/652WOhqbk74w1AHrmnp7G?=
 =?us-ascii?Q?cMEzj1TKHVZiE4+VpuRvI1nPBypFJDdsI5JhoumjTdUxQHL/SjWrm/C8FQNS?=
 =?us-ascii?Q?GhJwDOnO2CX2N8L5f7q/ZYwjfpRKJTcM3mkqpsx2GMuiUSIQsBwkhB16noU6?=
 =?us-ascii?Q?1O725MUVa4G5hWaA+1Guy1GURUzxu5EYM61mddXB45/jeGWCD1HHZnVS7+o6?=
 =?us-ascii?Q?sBt3ufT6qUGx3nrLPDX6CKCDhc9/umZuDbQTMUYAGF+zcTqVqLE+dj4TQYRn?=
 =?us-ascii?Q?tu89FbSMeq39NgrX6Lw4MsqzIBDKA1bw/HUzd0h9XmuMeGPTe9Em3qklXDLo?=
 =?us-ascii?Q?Kaox5jQV7XEzbrRRep3P2s+dsvs9yvsGktfbKu+wGxiVn0bPn04goav9L1Hz?=
 =?us-ascii?Q?YYP00NXwCeQgX5nMSJzj301YpdDTquQXsjTY/KLxte10A1w7K2HNTyXJeNIa?=
 =?us-ascii?Q?NlrRPYzXI2F61tsRo7rqF+Eq4lfRGImiFd4fwpVEj3uju3FRUHOUSHr0dnS4?=
 =?us-ascii?Q?ifSDZI7VWEDVyzSWeTN2dzF6BN6X/jfT4EhHWsSfVkoWV4XhCVcJ3BpzURx2?=
 =?us-ascii?Q?aDsCFypH6poQrv/ltA5979YyrarbsNRawc2V3CqBbmkdGzTDgjSwhsGIZbh5?=
 =?us-ascii?Q?ckfkt2J4VxCVDLP/NzOsR/iMURNaENLc7dTmdpE4f7dVaef5InbnneOOLJdQ?=
 =?us-ascii?Q?8Lz4OBULlYBoTPPpCUia90juKCJy9d/jGP2yb4pidLzNz2XSmTyKQuCFkSZQ?=
 =?us-ascii?Q?hSYpdX3VTleEvBiiPGYEgPqCZrIOOUyudV4w6m96hkrOtBexHhHEqj8nIres?=
 =?us-ascii?Q?pKTdW81iN7gIXXJfYk+Ld2KRL24f6aEroLCN1s+vrmUjGzzcxDbAc+zhK/5s?=
 =?us-ascii?Q?Xupie59B5ul3+j18FJInCPx0YCaLKbWX2jgpI6Pxn9gsXKqdgJZgpzKkEn8l?=
 =?us-ascii?Q?EkJDs/A6kObxUBxPiHvRfV7YnhXm4+KXwW0uKpG8LyBz7Sok3etO5QOK2OTg?=
 =?us-ascii?Q?2sDKgZaYofPK5OfFvLCw9Fz9DH4i6bXqayXRfoaM7h/L7NcCWnongCNHZaXy?=
 =?us-ascii?Q?EyoC/Pp0n78JXiYXdFZ+PCbkPTkY1UAZGTOdPsshdF/cQ+UuYzF1wSBc1iFr?=
 =?us-ascii?Q?InzHnZ9gVwEEfBhOmte4uuI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2ebce6-2931-4d15-6a84-08dc5509cd47
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 00:46:16.8386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF/qJ+pc/n2Z6U7iDfSaM0vho03hgC6/83sEdgJlEGUn8+Zc6H04iwa2SDPYsz5xt6yDsxwAOcz6JlWtfF4WfCFZKGorWxkXxBEP8v5a1OzuSFFf96VKlRMotrDNk9PC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11519
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
Subject: Re: [Linux-stm32] [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
	soc_get_playback_capture()
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

Thank you for clarifying the point

> > And unneeded has_xxx will be removed if xxx_only was set (B)
> 
> The problem is that we have two sources of information
> 
> 1) the dais included in the dailink (the (A) part above)
> 2) the dailink itself (the (B) part above)
> 
> the code in A) constructs the information from the ground-up, but it's
> overridden by B).
> 
> You can view it as 'removing unneeded has_xxx' flags, but it's also a
> problem is the dailink information is incorrect...
> 
> In the past we would report an error if the dailink was not aligned with
> the dais. Now we just ignore the dai information.

Ah, OK now I could understand.

Hmm... is below what you mean in summary?

dpcm_xxx is used to declare that the DAI/dailink is possible to use
playback/capture. For example dpcm_playback means the DAI / dailink
should playback-able, if not it is error.

xxx_only is used to limit the playback/capture.
For example the DAI / dailink can use both playback and capture,
but want to use playback only for some reasons, we can use playback_only.

So these are used for different purpose.

Hmm... I re-consider about it for many cases, and indeed these can't
merge. But in such case, this feature is needed not only for DPCM ?

Now Jerome / Amadeusz are suggesting new idea to use bitfield idea.
We can use it ?

	#define PLAYBACK_VALID	BIT(0)
	#define CAPTURE_VALID	BIT(1)

	#define PLAYBACK_LIMIT	BIT(2)
	#define CAPTURE_LIMIT	BIT(3)

I need to think about keeping compatibility, but maybe OK.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
