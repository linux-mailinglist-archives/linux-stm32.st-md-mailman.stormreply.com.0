Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 181489E901C
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 11:27:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFBF8C78021;
	Mon,  9 Dec 2024 10:27:33 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 297E2C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 10:27:26 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B92URrX022860;
 Mon, 9 Dec 2024 04:26:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 PODMain02222019; bh=6ELUabJeV2DuJWxQPcmBua6WsWFynHySKPd0DBqNBb0=; b=
 bRnZp1DXHMfTK2APMmzw0GUG16a0hB8ANO7u3NAl9oFzXWX3Y7VB6+D0+zqSR70B
 yAuov7f4KWN7hH/KR1c4xTMS6P8z5kaVyGBDjdfiKRl9MmAyJSfchzLzsE++W+kQ
 qQvWWm8ZMfPlTKuo5QevD23fzI2SDMixnDf2FpCzHfWmF8TSAMVlqUJqXJ8zuO19
 CxOEBK6GafQ9OG0TaMtkAoelE922GNVJrjOQeEg3dGZzT2x15jA1HdGdJCs+vi8P
 gpVLPNynoltdcetKkwP4yy0jOB8u+DO7AaN6+pSrPNEWjwh8+xOAQVoMoP8J5Tx5
 ZBi388JmOVR6jNHqya1J9A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43cmn21u5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 04:26:42 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 9 Dec
 2024 10:26:39 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 9 Dec 2024 10:26:39 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
 by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 94922820248;
 Mon,  9 Dec 2024 10:26:39 +0000 (UTC)
Message-ID: <edff6f0d-7f2e-4a27-b14f-f079855a737c@opensource.cirrus.com>
Date: Mon, 9 Dec 2024 10:26:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
 <Z1a99HJuL04nWuqx@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <Z1a99HJuL04nWuqx@opensource.cirrus.com>
X-Proofpoint-GUID: FoClcTI9iDQt6WmgLjf93qdLdb-8gTkV
X-Proofpoint-ORIG-GUID: FoClcTI9iDQt6WmgLjf93qdLdb-8gTkV
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lars-Peter
 Clausen <lars@metafoo.de>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-rpi-kernel@lists.infradead.org, David Rhodes <david.rhodes@cirrus.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH 00/17] ASoC: remove
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 09/12/2024 9:52 am, Charles Keepax wrote:
> On Mon, Dec 09, 2024 at 07:38:52AM +0000, Kuninori Morimoto wrote:
>> Hi Mark
>>
>> snd_soc_dai_set_tristate() has added in v2.6.27 (2008/Oct) by this commit
>>
>> 	8c6529dbf881303920a415c2d14a500218661949
>> 	("ALSA: asoc: core - add Digital Audio Interface (DAI) control functions.")
>>
>> But it has never been used during this 16 years.
>> Let's remove it.
> 
> We have definitely used it in out of tree code for some phones in
> our times. Whilst I don't feel super strongly, I would say it seems
> like fairly reasonable functionality and it does no harm, so I
> would vote to keep it.
> 
> Thanks,
> Charles

Yes, I'd forgotten that this function even existed. Now I've been
reminded of it, it's a useful function because our I2S/TDM DAIs have
configurable tri-stating. If we remove the function the alternative
of using a pinmux driver is a lot of overhead.

But the kerneldoc description is not very good:

"Tristates the DAI so that others can use it."

That makes it sound like it disables the DAI. Should it say "Set the DAI
TX pin to be hi-impedance in TDM slots where it is not transmitting"?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
