Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE98947B0
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 01:27:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E2C9C6B45B;
	Mon,  1 Apr 2024 23:27:22 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 761C6C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 23:27:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koJsTXSA8SK9OdpofAu1eLt9E6huyVRviOgm+HIww+vpkUQIne0p3EdmCx1pFYGYpQaHHrjtGPAU2V5RwAwBGGlMX/o9jSCQumpNUNjEIYJr3gC0i+euX76hUpyxOy3ezcEWbE5/QsALSI5zD0UzUFpn2vpChAlCoVwJT8AVk/JtP7xj2vR3huRvoRXQcRzKTywQmb56uOF9uG4GrvbPNTvQecev6D/spqhwncTlCI3upmNsHQILvMTilhiCQCpwok/GGVdeBR4OoqFIGxud74nsiniziBF3XxoEatk7T4k/lo/mrHilrP4wDRJVlA38gAV/UVRH9YQtJADL0GMA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b47w42CNZEcKWlBFaKuiM5ghkQI9r+64HdbjLHY2MSw=;
 b=XS/NUY0yCOMzFEVDOGW7Z1wQ1h+GrHStig7Q9fcmhtBH0SUYaQYIDEoHbQsVuGUQa5QUmjcnZkvsJEaMeK3gx/uR7AH6EQsgrwPCiIlfOt3C5OJox/a66WGDEtQXjd1/nJtqFY6OZdmgMRACdtGU694xilMrrZcI4Kbdg8my4tlXThUfpegoiqOs1vsDOWqp3g9fCMsSqCXPFhM3Cd79SQ0o1Yg6+TOvSoW0tWZCzeiLDSasoIRFcMis2afxFP4bwvuAguIxy9HRiT1c1JsA2fIsnYQit5Cbb6JW5TLKS7aHkdGCKD2wCu9Fs+uhkBhCP4QcZr5/Udwlfdk9647m1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b47w42CNZEcKWlBFaKuiM5ghkQI9r+64HdbjLHY2MSw=;
 b=m5m0jfMI8MJseTQ8XKNL9ecq9GYYmZBZKaqRlMdcXw1wG4lypYdQdDYI+sssHZSKZYAK1XWcml1G1HxYtfLnkxopbG9LN0tITeqyWx9DORjcWzN+5WS/I2gdIZeGNGJt2eoYw7mNdlE/1scO4heVR7iIBMrGRy7Nx0oNvUneilY=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6223.jpnprd01.prod.outlook.com
 (2603:1096:400:77::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 23:27:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 23:27:15 +0000
Message-ID: <871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
 <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Mon, 1 Apr 2024 23:27:14 +0000
X-ClientProxiedBy: TYCPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:405:4::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6223:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7iz/ystLdOUhbbzLBj30VVGv8No5HEyRI9uLXizSABTCqe0TgbAfAmsUjd5huGgjduLNdmPDRmV7i7H1MYXxwXSNrynnxzDYEy7VPRzKq9yW9qERNhbDRsHm32FdwyhkSkgxpg3aoe9AAb+O7ij9+4d/uTcQKAgV07gYIwF5eQlH4wjFnxzKmCokTRhkM6LBFPEH5xbNy//pMYGLabfX3+j8zRETaLpMBYLjTckmAK2rdJbaTFuH2Xh0dIUka8/Sg/b2lg+QStHohhKFyhie5Dk7uLEKhOTcN6GWDkLn3XLTaTqVp8PmyeHTGPNZWcVYXK6Eb3MJeK9JBHEsSaLkdKoED2qgJDkaic+FfZen+UkHZOl9pu16RYVLX3GNUJegINv73hi6OjC1o/31+fauuDP56yDrXZDSbSMtoJF/ZWvy80CokLCswS5GRzp3rSo9seBfVlVZm8kbxFt2u3osB6ejDv32d3ZTiavo6UoaXPD/QMQHdAsmuSVpn1Y2kNlOhFGkUZB3OI3/8gVfmRGrKO7V6a0wf3WDWnkgBaCMsqVv+UFhZ8dFKmjawNnVq1M62EqlitDTYm52kR79GPgZknbZpGhD1pofH4kBjdBORLxkHdx1QpdPQJ14fA6whYY3xfBi610y5TQTm5EgYfTBzW6Ex6QmHYH+Pi9s96CzyUxJVFGQpk877zDvalUn7RzHeFJtUqSbEn3On/TERUlUhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ijit4zbge6+zPSEJgFqYUKWq8m8X69YKxsDhTlRhZGGHJHYnXAe6DCPDdcvR?=
 =?us-ascii?Q?pgIwGLAvFBbTBjnqd5xhQ2s36FJ5VerIDGVj/RTWYsmEf11Oy6FKXi0emc2x?=
 =?us-ascii?Q?xndd7Vc9/t4r2QIv9fNQBj8IGAjaZUjhG1TkMh7+ftOuDOD1nYbVTHiNnAff?=
 =?us-ascii?Q?p3jx7c3pyXCgu1KQlcpbQoN+oxP+M5KorWPeVFGwiuTvj8on/AXGuDtaufmC?=
 =?us-ascii?Q?/0vhnkFUJz2vNfoUt9wH8TIhMHoCoWv6sUCDkiETqu/fdE71X+shHYNYGSXr?=
 =?us-ascii?Q?f2hsaPa0SBl3H2GjRoiJ/tpJfIRDp9ijTUvZvdZ7vIPMt0gLGkxNa7QY/HD1?=
 =?us-ascii?Q?ZcsGQ2IIHKGzFgaf83Qt+uinKd9DcTHBhbpxndKuZvjtcP6Bng91KGw8ap25?=
 =?us-ascii?Q?edYy0vUJ+uINtCNqJaYfu8Y44tvDj82y2fhUdIVOpv/hh0ZLbMI8CdBdnYLw?=
 =?us-ascii?Q?FWv/tnBaEMKTwpZbkYHh1qvJHl17I3KuQl6BMBVeZczm66sewGaqaqxD+z2t?=
 =?us-ascii?Q?M1Rc8eTm21E4qgDvwyR946r/DSa8D9D57cenImBJnGgCL/BfgGTpESNZVtyz?=
 =?us-ascii?Q?WSnNBw5tpcEQ9dxPc28uZI+TY5nfAP8fodn0+7l5zLR5j7iulwO/A3D49vJH?=
 =?us-ascii?Q?LWc72XYQhi5rVfLFYhm50/eQIaXkXJBbVVrpMB/08MXqSga8Qli3XhZj/XJv?=
 =?us-ascii?Q?MbNDpOgeGwuhMzev1zJvTyA5Eh4BI+dRrNtyeFmOZRhUrPt3DLEmCRHJ+s9K?=
 =?us-ascii?Q?B/4zgi0UjJeI21h3OW0ZeBAx3EG2mP84iJGvAd0E9OMgA0xku/BIfSykulwD?=
 =?us-ascii?Q?ftp0MqY2TJtIWVwBZf1GMqWQPLUlrk5kWAZu3gR4qS9H4/vuStbDMgFRTQ3H?=
 =?us-ascii?Q?rDzDvDTuYYsLFVBRMHceCnNerahQNnA5tWrPN21k/6yZSymi1T4pIJeiJbRC?=
 =?us-ascii?Q?NWI9mA+CKTXl6RsdrEjwVunSHmnJTeg3923JT7DUyHfrMoG/81/l//7gsESF?=
 =?us-ascii?Q?KjtCwyx+Gnx0EjakHh36EfzByeVLfh2TwYOK7sClLWxQgp0mlE+zXZ7vygCC?=
 =?us-ascii?Q?RrjG1/cij7bk51PoeDtSDAaz307QkZAlfPjtJ/aw8NQwaOmUvBiQE2ofo+/F?=
 =?us-ascii?Q?bVz0q4ZS+sSaOEjZEA2/Gy8wFwM9rCFipOeGINR1TpOMkpDt8dXj5OdJJeRC?=
 =?us-ascii?Q?51ZAVVl0Ob2xhs/fAKzq6l8YPyVBWHW0Sn87uW4QAk28OeRU0jkOzIZlPUQy?=
 =?us-ascii?Q?4oCSlc1f41zWFeDVlw/xPxKJCtWfOD3RxjtnAMT/OUVa3Cn/gY1sxQKy752x?=
 =?us-ascii?Q?kwzZlrDLB70oXGPWbL8C2nr/KhSgUyNcw7hcwX+3zsEh1nOtG/M+pY58/3KV?=
 =?us-ascii?Q?QzyPIPt+YoM3myRoPlrdNgyu+X+1qDhXyPZMeTyquvbpARnZyWWQlzTL1+Zs?=
 =?us-ascii?Q?dUl316Wzmn761bihTnWPls/n6qJEpnRCvL/2wfB//anWtL4Nje1nae567KxR?=
 =?us-ascii?Q?zjjIw6hzvz8ZIU5AG3DN8z8VA6nd7TFfqLr6Btk/iko+5zF30t8vyAZWaYQk?=
 =?us-ascii?Q?CfxZOtm9tZCaMWm+wBaCjfUhGN2R9tqwOVMRcObCzTrJSuWkwb9Eu0di7xOg?=
 =?us-ascii?Q?VIie4Zp1TWOJ933+59RaztA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b71fc5f-cfcb-4ff0-1838-08dc52a343e2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 23:27:15.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/MG6/CiTTCeKvIQhzjk1/eWbPhQfu43AcgqG19e+P5QxLBuNMOqykZsiPGn5WyXErbeBMKTLmOVYa6fHD8LL2ouuzh3HZvf9NHPSE1gD1dOAK80B3NeFc/Msm7pBaL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6223
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
Subject: Re: [Linux-stm32] [PATCH v2 09/16] ASoC: soc-core: Replace
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

Thank you for the feedback

> >  			/* convert non BE into BE */
> > -			if (!dai_link->no_pcm) {
> > -				dai_link->no_pcm = 1;
> > -
> > -				if (dai_link->dpcm_playback)
> > -					dev_warn(card->dev,
> > -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
> > -						 dai_link->name);
> > -				if (dai_link->dpcm_capture)
> > -					dev_warn(card->dev,
> > -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
> > -						 dai_link->name);
> > -
> > -				/* convert normal link into DPCM one */
> > -				if (!(dai_link->dpcm_playback ||
> > -				      dai_link->dpcm_capture)) {
> > -					dai_link->dpcm_playback = !dai_link->capture_only;
> > -					dai_link->dpcm_capture = !dai_link->playback_only;
> > -				}
> > -			}
> > +			dai_link->no_pcm = 1;
(snip)
> It's not clear to me how this is related to the
> dpcm_playback/dpcm_capture removal.

In my understanding, if "dai_link->no_pcm" was 0, it sets no_pcm and
convert setting to BE. If no_pcm was 1, it is BE anyway. So no_pcm will
be 1 anyway after this code.
And then, dpcm_playback/capture is no longer needed.
So it just set no_pcm = 1 here. But am I wrong ??


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
