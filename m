Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95F88E139
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 13:55:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F1CEC6DD93;
	Wed, 27 Mar 2024 12:55:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F9AFC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 12:55:38 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-341730bfc46so4801915f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711544137; x=1712148937;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=Vp48KocudoiGALvWKkmTWkUXKZEVfSQEtoMbBwrHz/0=;
 b=MGW3HLlYV0e5BefHgJjj1jswh2nEmNRGgKuIwpYraHFet70xleFaWOdXdENtMp/FZ4
 IaAgHCAxZb41WiPvqEUwkfddfkIlmN5V2rJdQRZNA1Xf7+UyU5CR5Y2lDgu/3Vkh98id
 L0Yvtpe9o8IpZYNeMECUydgEterBF2ZjbM8Wa0apaz1JJbxqwstMb2u2TrtYUt+AT3BS
 R1qd30GG0P13RdH7TYzgAxEsDxeQycOh7F3xYFOuiS64c5fRHuajwVhjokhKsIou2awZ
 qWDOUO0tqaNFPWBxzMMc0bN4DKGrxUFZ7S8xwHY9aEIBn6l6FAgu8B3igSMnBenNfGE4
 uVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711544137; x=1712148937;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vp48KocudoiGALvWKkmTWkUXKZEVfSQEtoMbBwrHz/0=;
 b=pNeNVGXwBoy+gCo7BZuI6BTSG1yt1krEfH45i+5droknGXt6y1JiaW/SGdQZYeEmIT
 3O+Gc4mitH58bRWXwioa03NAybirrZLgEU+BOg+X6gPgAieYGNA/KlJMRY6qDmYMGlol
 AF7hW8CbTDGUSfvkhaG/DeQ1pMQ4n4B4IhulCrvyoV9CLCOQDLHjJqoCcpRnJzcspmJj
 QCh/XsQho8h5GbA38IKjByB8Z0sDE+UgqlLl94exxn2KHQj2iZj81lvbAkBfIWui7heH
 82yDVG+Yrq4YVrlpdW/TNt5pXTS+F3yUjjuax1ZpumH1vAICGp6/vD66aEjwXC3zhaC/
 pnOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfvIOHEbNPepkhBfoO+E2/Wkmca7hR733jGmINfYrJOsMjSI5C+QCUn55n+O94ApedjBjTN0H7s2v+ZmoPs96ScYv1kOeb4yfkMnMstgbhmi15gUg3QYs6
X-Gm-Message-State: AOJu0YzmwTIeeMSefK8s/SKp4hLLKCHsJ8JSDVdwTmjecWcUZFy6qOOE
 RWwEQNfkk0813WJ8X/kOlJiB3zPc+zOlKlnWOG9EHviC2M/H66NYfWfmrhO4an0=
X-Google-Smtp-Source: AGHT+IFNNxBDz2Tx/jpDPmwWEphhbXKgsW+qHx/Yz0edPYKGGY5dsGFKtIqCm7B13uhNEaK0FJ6NZA==
X-Received: by 2002:adf:a3d0:0:b0:33e:1ee0:6292 with SMTP id
 m16-20020adfa3d0000000b0033e1ee06292mr4235689wrb.58.1711544137249; 
 Wed, 27 Mar 2024 05:55:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e2f0:34bb:2ffe:1a3b])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5042000000b00341c162a6d4sm11641186wrt.107.2024.03.27.05.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 05:55:36 -0700 (PDT)
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
 <1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
 <87v858cwki.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 27 Mar 2024 13:30:32 +0100
In-reply-to: <87v858cwki.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jcyrfal6f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRz?= =?utf-8?B?a2k=?=
 <amadeuszx.slawinski@linux.intel.com>, linux-sound@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
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


On Wed 27 Mar 2024 at 01:06, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your feedback
>
>> I'm not quite sure what you mean by "should have validation" and what
>> setting exactly we should validate ?
>> 
>> I know I should be able to able to understand that
>> from the code below but, somehow I have trouble deciphering it.
>
> Current ASoC have validation for ^^^ part
>
> 	DPCM
> 		[CPU/xxxx]-[xxxx/Codec]
> 		^^^^                   (A)
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
>
> (In many case, this "xxxx" is "dummy")

Yes for many DPCM user, you have:

       DPCM
               [CPU/dummy]-[dummy/Codec]

FYI: on Amlogic it is mostly the following
(only considering DCPM, omitting C2C ...)

       DPCM
               [CPU-FE/dummy]-[CPU-BE/Codec]

With possibly several BE instances per FE, and several codecs per BE.

And there is even this for loopbacks:

       DPCM
               [CPU-FE/dummy]-[CPU-BE/dummy]


> By this patch-set, It will check all cases
>
> 	DPCM
> 		[CPU/xxxx]-[xxxx/Codec]
> 		^^^^^^^^^   ^^^^^^^^^^ (B)
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
>
> At first, in [CPU/xxxx] case, "xxxx" part should be also checked
> (in many case, this "xxxx" is "dummy").
>
> And, because it didn't check (A) part before,
> (B) part might be error on some board (at least Intel board).
> To avoid such case, temporally it uses "dummy" instead of "Codec"
> before [15/15]. This means (B) part checked as like below.
>
> 	[xxxx/Codec] -> [xxxx/dummy]
>
> Because "dummy" will pass all cases, (B) part is almost same as no check.
> Yes, it is no meaning, but the code will be simple.
>
>> Where you have a CPU supporting both direction and 2 codecs, each
>> supporting 1 stream direction ? This is a valid i2s configuration.
> (snip)
>> >  		/*
>> > -		 * FIXME
>> > +		 * FIXME / CLEAN-UP-ME
>> >  		 *
>> >  		 * DPCM BE Codec has been no checked before.
>> >  		 * It should be checked, but it breaks compatibility.
>> >  		 * It ignores BE Codec here, so far.
>> >  		 */
>> > -		if (dai_link->no_pcm)
>> > -			codec_dai = dummy_dai;
>> > +		if ((dai_link->no_pcm) &&
>> > +		    ((cpu_play_t	&& !codec_play_t) ||
>> > +		     (cpu_capture_t	&& !codec_capture_t))) {
>> > +			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
>> > +				      codec_dai->name);
>> 
>> Taking one codec at a time, would you trigger a warning for the use case I
>> described above ?
>
> Oops, indeed it will indicate warning in your case.
> How about this ?
>
> 	if ((dai_link->no_pcm) &&
                         ^ Actually my comment applies to all links, DPCM backend or not

> 	    (!codec_play_t && !codec_capture_t)) {

A codec that does not support playback and does not support capture does
not support much, does it ? ;)

I suppose you meant something like:

>           (!cpu_play_t && !codec_capture_t)) { 

Then at first glance, maybe ... CPU and codec seem to exclude each other but
that will only work as long as DCPM is limited to a single CPU per link.

> 		dev_warn_once(...)
> 		...
> 	}
>
> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
