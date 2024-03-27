Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 014BC88D395
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 02:06:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97372C6B46B;
	Wed, 27 Mar 2024 01:06:45 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76DE1C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 01:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkzkRQcKxr/nx4nxwYlWajxtjV7Ft4RMxfe8Ph/Pi05gAW5Z7qsnhMPHyy+zbx2kzv388nKXLGC2OmLKfisjD/5GArzUiC4IbjZdfztgMP26qaHlZevwkXrBeR6sa6FJSzRxiGveFghYN3qshiZpwUKnVhka8wwBeg7swVZK68Gb97/VcSLcyqqsqhRE0CN6hM4k94uLonpyW7RIuXi6Q0nTsUxNMsOjqG4ykB7LcDMs0onEL1VVzlBZ1y0oMs3WO6ZCRl/YLKeG34DAviWbTGPN2QFXZgCpwe0UwnYn8Nn42VPPMMAw8u7A6GfySah3Z77oyxrH68Cc3ffwjh94OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiMGB8tsN+BKlLNci6btHbI9YNlfMMkJm/A3SR46XmE=;
 b=JaSK7PkbqRYsuCMPtn5wcLkzZKmwkzLrBhbE+vIQ2XNh9eiP2+mKiKrOmWzJ7i833EufnWPq50+ok+rnTver6k3RqhcQBA/oko/t1BTPoeesavuEiOPduufgGHnv/CZenjYfGFzOHG3MJ1HRvIGH2E0W/N0qosEsfsQ35QtIXxxCRbK99bdnbXJM56jIYZLn7WSNcLbFa2PHig2QEXBHqWA11JSQcO2M9NxmDIbPAz9+/BrpzFqR0eCUdgn+z/cYlA4C5ZCvHNAYt6RuUaNdvRvt8NnAj/DsJPv/7jYZTOZYKr33mWKecQbp2XlOnMqI5/yD8qv1P0JuOilbTLXAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiMGB8tsN+BKlLNci6btHbI9YNlfMMkJm/A3SR46XmE=;
 b=lAaoaHPJV0+ZjMGHOhE1waaa4UlLkQEYhNE/sOk9tvxepzGQ71BYV83vP//A3v0HS0tAz0wOuI5NeS54h3XuCIz+2sAwGDJk4JrOXFHxIP6r3HUh5pPS0Zse4+nVzBwDF+VM9OYmYchN1yT/OmJJaf3ZDMPMotkZFGRBJW6xoKE=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11865.jpnprd01.prod.outlook.com
 (2603:1096:400:38c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 01:06:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 27 Mar 2024
 01:06:38 +0000
Message-ID: <87v858cwki.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
 <1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Wed, 27 Mar 2024 01:06:37 +0000
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11865:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMUiCreJCTgI04B+yy0gZHGATnFfsdBZUjrYkRVVWhruFrNWCjbtI6A4k8W1oZF/edoonBR6zgr0UPS9ibxAv0HaW8NqC/1FSCtACz4bm4X9wzdknVeTk3r64+FKWYBvHqh/gXL/bdyp89wMCfwcN7suo/Qlla0GfMrlNfMDfrSsX/vyyPJlYKOxV2fkTTpm8z1Eic4K4R3rbrroyDRU0J3DQ+KTjaXO+HAnnF3XNmjnR4a/7Yu6JO+WQ9yqPlypW/tgHhElv/tG/Z6iyS2PmXOk9gP9zzvn3lq7YeuaCavbN1Lwjm7gY/GhDSPLLUlNnIK1xgp/EkFHpF5BwtEZe7QQgUnZk5oCRXOnh775SGVguX8S5t4/G3wrzTa64dAJW60euGLAY9xyiWLv03Qd08VTSHbtATinbmwxNlPRIcvlo+SxWHB46gz6SVxK6slXz/STJyqh1NyAl1WU2i96NjwUwMX2o8YYsKmPpAaZMhzajr/hHl55nHowOAorms1CMPFHa8rJzRfl+YJDkXGTdkkMyh8HYZXwqQctjxusbUJJMevrEE5j/oChOmVjzHl5aRwHZ1gNHXWeNp0QnmBw2m3RooHFl1bJetErIt6Lx5F0ZvHQaXI6dz/koymqLIl8Y5mce4enUq9CI31qCS/BKHMGxFus3uCzkM4Qp2nBvsFlSIHogo46OIwF4d7PS/KJGYVzl1pxTIFADwoeI83guKg4lq0P1S5Oj2ZFRd6GTII=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(52116005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6rlZrz/auiE+pUdDweyJ34GvVDXVwJTIpkzFwka3rkR1n5Yn0l/45ASYcxHr?=
 =?us-ascii?Q?hT1xgGGraJjKadqMNPPFKrRdXsiBdWU5jqJ8pe24rtXYwLDzHeWdCdu09VKi?=
 =?us-ascii?Q?vIEekOCmPD0kqxy03gelIBZiBrYB3C6XxNAwSJ43NOuB9oawtx4iB4rhLTFU?=
 =?us-ascii?Q?0IXL+xSNd1ty6PvSNn5kdm1pQDMPenhwxxgKD26+Ny6MN01VQGtG2n4Me3Pl?=
 =?us-ascii?Q?GFCFC6Fyf/ZRhlVt77Ep7uCg3zM0kjCWGL6BK/9cT1khS9e4BZk1RDX07vEu?=
 =?us-ascii?Q?BvSh4vz26z3MEzTHkes9zg6VBFnIfeBXHiuUkPfwsn2bWIOULgJDjFivoFf7?=
 =?us-ascii?Q?ihPovWoWojDq+0KJQVwJ360/haJxjH0IJyJ+qB2prgv7IbSsZePwSwF5uTKM?=
 =?us-ascii?Q?GqT05nCPk2PVUh+RtF+qBfqwO/p87nHCiu61gDKOx379bnxzYNJ/QnyCtDXQ?=
 =?us-ascii?Q?SGmau4lRP/7FND31Zf4SWYKUz8sIzVat1lrBhdO9iYJJYYZokaCs5Ow7/Gxh?=
 =?us-ascii?Q?Max9qdmvUoEUaPUZciwG5Evdm8Wrq4Vlkv8YD+rAyAKB1274kMdrkGCdMO/4?=
 =?us-ascii?Q?kL5E87+VUPdmX3pYYHvPrSlmZIVaWJ0Kl+aVm2e+uYS1tzKCQh46cBJt27fO?=
 =?us-ascii?Q?I3pgP9QA9B57u5Aao6SVnAKLYEfO/JGJath/l/y7vk76E/alJnQWfbMszWZQ?=
 =?us-ascii?Q?DQREnNIyAUg0fEEmG5zZksDUO8Luz6l6R3B4IJvkOnG2f3c+judig7Wzlet3?=
 =?us-ascii?Q?ofc9NQCLEF+/58z7VbhEhJpd0uPX/K+9hT7TVEl0Qj2HgGuNZvrjxwQZ0xzl?=
 =?us-ascii?Q?7ZISGqfw7/sEPcN0ycxSiJOMP5vH7cHAR51HiwmnUPC34AYSwvDgqS3X2zIS?=
 =?us-ascii?Q?R1YeDH1u8Bp5OLacMM2DBcVovyrNo7GEb9atFsadXZO0YXghQLZyTTDtVeAy?=
 =?us-ascii?Q?4sQTzLbDebAfzcAqW1u+wdAAvaP4dAo//0B+9v9Y8mJ/vZQ4f+3O1EPrDAKe?=
 =?us-ascii?Q?7lxjrShHUwF6qtsN7/g6Q/hYaUJn1b+HzQytFBruB2r8nczjXrWs8iQJA2U5?=
 =?us-ascii?Q?NOHKGdl2NILV1+bkDfBk9Xr58vqX6hW4JBVnA2yTC/qNAxAq83qGVvQhkM+l?=
 =?us-ascii?Q?xzBEBzdog6P0KVQdenvi9gaJ3H96nzOogT2jofRchm8CHuGdEIPwg1uNfM8t?=
 =?us-ascii?Q?D+3X1wKxGRligAE6KXiFttGpuey4eS0JrGfW6eWdiFb0/nY6sWVPiwMXFpSg?=
 =?us-ascii?Q?eWt5NvW1+H3G/XHXiGBiSYF1LWZtf0CQ7gF6LyfO8kvwlQysyQUGvNoIRUM4?=
 =?us-ascii?Q?IdLnb7yX/VtWLnK7y4+WRTTiUdHqqh6OlN4UKIeHtXawH0cIJNdmcN2hjsxn?=
 =?us-ascii?Q?58sxXjkS2WMaVNTdxprhJUShr/5XxubuNxKW2VgwEhlDVdENbNbLWK86b9aI?=
 =?us-ascii?Q?ouBo2yhh64DfpPbaiKFICu8EKOb3NeNv+N2RjhBG5Fgx7rnG3lsqKqQ7cEw2?=
 =?us-ascii?Q?VoSsY31thBl4rPKrmykeOSGQqHdgitqTfctcsPHmAfQ3zvfbXzh2rtA9+HYi?=
 =?us-ascii?Q?OJEjvnGCC2ET50AvS7mhkvJgxgz2ZTjeObg0inbOnjAwnxKcE4xMAj6tvGgI?=
 =?us-ascii?Q?qHU8qENI4K0+TOb55eoixSQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee997d3e-b223-45a5-5688-08dc4dfa279a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 01:06:38.3075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9kUUKH6i/Quxa6my4RRGnvvZbTKhDU5pgiRbgKG9wuX2+1Xjsmpbh7TM82EvE4sFXFY70pI2YFB84gzGXWFG8fabLTQbrAaUyZ0qw0DIcq53mTsieXMRPuXsugbsaCo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11865
Cc: imx@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
Subject: Re: [Linux-stm32] [PATCH 15/15] ASoC: soc-pcm: indicate warning if
	DPCM BE Codec has no settings
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


Hi Jerome

Thank you for your feedback

> I'm not quite sure what you mean by "should have validation" and what
> setting exactly we should validate ?
> 
> I know I should be able to able to understand that
> from the code below but, somehow I have trouble deciphering it.

Current ASoC have validation for ^^^ part

	DPCM
		[CPU/xxxx]-[xxxx/Codec]
		^^^^                   (A)
	Normal
		[CPU/Codec]
		^^^^^^^^^^^

(In many case, this "xxxx" is "dummy")
By this patch-set, It will check all cases

	DPCM
		[CPU/xxxx]-[xxxx/Codec]
		^^^^^^^^^   ^^^^^^^^^^ (B)
	Normal
		[CPU/Codec]
		^^^^^^^^^^^

At first, in [CPU/xxxx] case, "xxxx" part should be also checked
(in many case, this "xxxx" is "dummy").

And, because it didn't check (A) part before,
(B) part might be error on some board (at least Intel board).
To avoid such case, temporally it uses "dummy" instead of "Codec"
before [15/15]. This means (B) part checked as like below.

	[xxxx/Codec] -> [xxxx/dummy]

Because "dummy" will pass all cases, (B) part is almost same as no check.
Yes, it is no meaning, but the code will be simple.

> Where you have a CPU supporting both direction and 2 codecs, each
> supporting 1 stream direction ? This is a valid i2s configuration.
(snip)
> >  		/*
> > -		 * FIXME
> > +		 * FIXME / CLEAN-UP-ME
> >  		 *
> >  		 * DPCM BE Codec has been no checked before.
> >  		 * It should be checked, but it breaks compatibility.
> >  		 * It ignores BE Codec here, so far.
> >  		 */
> > -		if (dai_link->no_pcm)
> > -			codec_dai = dummy_dai;
> > +		if ((dai_link->no_pcm) &&
> > +		    ((cpu_play_t	&& !codec_play_t) ||
> > +		     (cpu_capture_t	&& !codec_capture_t))) {
> > +			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
> > +				      codec_dai->name);
> 
> Taking one codec at a time, would you trigger a warning for the use case I
> described above ?

Oops, indeed it will indicate warning in your case.
How about this ?

	if ((dai_link->no_pcm) &&
	    (!codec_play_t && !codec_capture_t)) {
		dev_warn_once(...)
		...
	}

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
