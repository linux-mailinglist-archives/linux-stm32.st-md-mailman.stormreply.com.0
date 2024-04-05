Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD678998FD
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Apr 2024 11:07:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6FE8C6C83C;
	Fri,  5 Apr 2024 09:07:08 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 392F8C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 09:07:08 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d717603aa5so24083531fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Apr 2024 02:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712308027; x=1712912827;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=dx7Q6iClG4dKjPFFAd0xEXzHEYFgFMGOrT79d2/WULs=;
 b=QCTm3eGd3xVzOR+VskPRS9aJsp6WcruZcIpvYcuUr1U1emyS7rsiVZlZ0uANmdHNgr
 1x4AyI/PBLcDQWpapuR+DUfOZRhZYOmRkPNj5aMTYgJxoewcWIfikcPGYBnuFsrFOR8z
 A64fGTRjiSnUcXQoJFn54sjatJFYCq2JDvDCyVp8xGd3Tm8bZL39i3y/qN7Vr5pA63ln
 0/q2GtI+2hMW/iWMSOf/G/VhdWd5zPZ0y3pRfuvjwqiTDkwco5PdN0zHWBFRThc5tQcv
 Hq/1L/NUd1sN5qnODSzWG51+2/I5cxw7jII8AKtRZCmC/ZHhsR8Wsr69ltybAp5bt02O
 sNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712308027; x=1712912827;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dx7Q6iClG4dKjPFFAd0xEXzHEYFgFMGOrT79d2/WULs=;
 b=sYcjIrdpFfMUydAitYfAJrHhJ7NAmf1W49KrApRybfZUTScRcNlwmBPzL3bLvdbCTs
 0/F7eDOHSxn7DuRjRS8qwfenLxJxcXuHvUVFTL5bx2zXAvJNKEWcPifRVwLjUYXV9LR2
 gsou6Xz6wHbq1z8cYckrmI5TeTlAh4VMxIkcXs8j3d4auEWueyjwThLFKOpbaZZ4llOk
 VwVesQuGbvPTMgBQtyfxFa61+ccW/vkvXvwAYNKwSj1N5Tl09PshodqJgH0lCur76R+l
 Q2y8hYGKxg3Ey8f28CQgFrj+jWPrVczJGqyJWNcfX6lxE7mkv97gJgzBeI71nmjowPLG
 uX5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZoNZPQarwsvsHTzoVIVeBDP9ABtM4/byyloZy9puB8xJhCfeZbyV5X9Y2+SiMZl7hKPySQT9JQb5UNCjWwzjV0oqNj/5eYzqAW88dpT7seWiETOiB709t
X-Gm-Message-State: AOJu0Yw+ws/n3MiY/8UZ6+mpobLUI+jcP/LB8n371vUv0w5mZAXEKv7c
 P4Z9McoJNziZdbRt8YBcQXFbeQ2tUrMChqdqMObhA+t3O4DBkQqxY6VKUU8/vrs=
X-Google-Smtp-Source: AGHT+IFzNpI2nNYaTUkEnZn7gYRwkIeFIyuTNluFylKpIC0pmqbq+2qkk9YMdM/xrAATLZryy+1B1A==
X-Received: by 2002:a2e:8084:0:b0:2d6:ec7b:b69b with SMTP id
 i4-20020a2e8084000000b002d6ec7bb69bmr693984ljg.7.1712308027074; 
 Fri, 05 Apr 2024 02:07:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd7a:d766:e9e8:454c])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b00414887d9329sm2122868wmb.46.2024.04.05.02.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 02:07:06 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <1jil0xplcu.fsf@starbuckisacylon.baylibre.com>
 <877chcraaa.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 05 Apr 2024 10:59:20 +0200
In-reply-to: <877chcraaa.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j5xwwp491.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: Daniel Baluta <daniel.baluta@nxp.com>, imx@lists.linux.dev,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/16] ASoC: Replace
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


On Thu 04 Apr 2024 at 23:13, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your feedback
>
>> playback_only and capture_only have implication on each other. If one is
>> set, the other can/must not be set. This leads to conditions which can
>> be fairly hard to read and possibly bugs.
> (snip)
>> Wouldn't it be better to replace those 2 flags with a single bitfield ?
>> 
>> something like:
>> 
>> unsigned int directions;
>> #define PLAYBACK_VALID	BIT(0)
>> #define CAPTURE_VALID BIT(1)
>
> I think Amadeusz indicated similar idea, and basically I can agree about
> it.

I've seen it afterward. It is similar indeed but I don't think 'None' or
'Both' should have a dedicated bit. That would be yet another
redundance/implication between flags/bits ... so another source of
bugs/complexity IMO.

> But in this patch-set, I want focus to removing dpcm_xxx flag as 1st
> step. So I'm happy to create such patch-set, but I want to handle it as
> another patch-set.

Fine by me ... at least for the Amlogic part.

>
> Thank you for your help !!
>

Thanks for your work !

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
