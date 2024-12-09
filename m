Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83F9E8F55
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 10:53:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF7B5C78021;
	Mon,  9 Dec 2024 09:53:50 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 161E5C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 09:53:42 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B97SI8a010517;
 Mon, 9 Dec 2024 03:52:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=PODMain02222019; bh=Ut6LcVsTIG0oZHILjN
 iw4Y5NRvtVX4JYmOtGu6tel8w=; b=Y+NzqaSnCn1hSJqEGDNt0snTrcrGE1RT3T
 8flZij+Jcn5ehw4PL96FJTG7FTPmibGaIiXVk9FtR7h1Ne0ACfqsUFG4fHW8Cg9U
 iPFJL7rRU0vhK7yAaoEyPJNPZc5uDba1jCnUZaBTprgvvaYxQL+pDN9UZ/i7+YFs
 aVYKt/l5FE60PEIecIZm7QPkyGSnRK5uRhQR1vcM1fQY/c63ibCkwDSNuEFLXXe9
 CCHETHwl1N7UYNbBUYtTdeH8oTP3lNPGwKuns28Hh6HnaKPgOt+UHxbBi+n6InzL
 sZYmXna/XDh/rSYWqbtnIUCUf46gmoHy5t6UqU77Xb8BMROs0M/w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43cknk9v33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 03:52:54 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 9 Dec
 2024 09:52:53 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 9 Dec 2024 09:52:53 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
 by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 337D6820248;
 Mon,  9 Dec 2024 09:52:53 +0000 (UTC)
Date: Mon, 9 Dec 2024 09:52:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <Z1a99HJuL04nWuqx@opensource.cirrus.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
X-Proofpoint-ORIG-GUID: 6sC2AuF3yPVyGwHQRs2Fhx6Ba-fI5Urq
X-Proofpoint-GUID: 6sC2AuF3yPVyGwHQRs2Fhx6Ba-fI5Urq
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi
 Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 =?iso-8859-1?B?Ik51bm8gU+Ei?= <nuno.sa@analog.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 =?iso-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Dec 09, 2024 at 07:38:52AM +0000, Kuninori Morimoto wrote:
> Hi Mark
> 
> snd_soc_dai_set_tristate() has added in v2.6.27 (2008/Oct) by this commit
> 
> 	8c6529dbf881303920a415c2d14a500218661949
> 	("ALSA: asoc: core - add Digital Audio Interface (DAI) control functions.")
> 
> But it has never been used during this 16 years.
> Let's remove it.

We have definitely used it in out of tree code for some phones in
our times. Whilst I don't feel super strongly, I would say it seems
like fairly reasonable functionality and it does no harm, so I
would vote to keep it.

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
