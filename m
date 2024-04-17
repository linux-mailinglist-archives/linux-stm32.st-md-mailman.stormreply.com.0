Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C18A88AC
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 18:19:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2773C6B444;
	Wed, 17 Apr 2024 16:19:55 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4A98C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 16:19:53 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-36b1774e453so13761205ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713370792; x=1713975592;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=;
 b=Fpweg/PqaQPxftzFM2RM5c1V3nIBM5zgjDwjeTONmqDjl9NtcgRmSSV55+/zJnih7p
 OB4n/2sB6p4RlhxJCdo5JhpRaG1XDOeOG8/EKtJ6RQr3QShkO0FftDOVRcc8C+o1VbVe
 cFWTMJnXq8x9sBnECj4bjTRMp5HQje+UD2B+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713370792; x=1713975592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=;
 b=st341mwVeKvzcIbJJoKwUL6yMtBCLt6vIi3EeDoC9Gcm6CXrBG6EtX8jkyabMUulqB
 16bCxTV/ZYE0w3I8z8dFflr2MmoYjtiPnr7gm5JfAJW+hxxj8fM4uHl5yZNeIPx2bQWz
 K2pfenkMv2zlz1HRDp72wUuL24TqDMpaLCrVcGaJgCbLIqMPYC9IRKHtoL1UhqcG1bzy
 RJ2jqHT4CL+cD5J4g3AMLfiaYWsJSX/ZXcoW/h98pjQ5gpla3KC6jVmbNq9wkltR4mgH
 wDrnE0m7bHCgdxMqC//G2KYeGphQsTLub7UiXdqqnMTy/YXzMWaaLhFyMAD5sdqF1m5d
 RPfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEB715hqInudjTiEu+eQHke7Z6YRVSO0MGpDZW1YTPjQtdiHiBnoyQeaMT9rWwDijqM310SKDVI4PZiOJcW8WkqmfRhrQu7AhE2loBMqC4fLBoJ9Gq5a8r
X-Gm-Message-State: AOJu0YybHjWRNDB6Yk2SFS3ZRrZwOdv/WoH7vF0aBFtfIGf/0+YhsThj
 LNyiV9FDirQiozFJGhNdFMfzIPMrz6qAQFjhyDzgxwVnntea95/oL75/u2WHwsaOPEowPe7/HNu
 Iaw==
X-Google-Smtp-Source: AGHT+IGQfsNQucdkx+c7hXOEipMVaYSMaM1MrtYoZIgLjJrXPnxBWYkEwjx1EQFRH8deVZZf6ADfNA==
X-Received: by 2002:a92:cd84:0:b0:36a:1f5d:44ba with SMTP id
 r4-20020a92cd84000000b0036a1f5d44bamr18313981ilb.9.1713370792309; 
 Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43]) by smtp.gmail.com with ESMTPSA id
 c1-20020a92cf01000000b003688003d036sm3809589ilo.61.2024.04.17.09.19.51
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7d9480d96bdso204652339f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:19:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVXUFVLc55zgs5PbCB1XIuBMVfUfKLAbKUz+Csyy5gniFQmDEW9uiqu3wIojTBK6GNxQzqZpe256DbC3FjEIqhm+jx2SBpz6mTtXGRC7lvy2E/syBQiVECl
X-Received: by 2002:ad4:4f23:0:b0:69b:5445:6ab0 with SMTP id
 fc3-20020ad44f23000000b0069b54456ab0mr19079283qvb.46.1713370770447; Wed, 17
 Apr 2024 09:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain>
 <20240417155112.GQ12561@pendragon.ideasonboard.com>
In-Reply-To: <20240417155112.GQ12561@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 17 Apr 2024 18:19:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
Message-ID: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Oleg Drokin <green@linuxhacker.ru>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Pavel Machek <pavel@ucw.cz>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH 00/35] media: Fix coccinelle warning/errors
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

Hi Laurent

On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > In my opinion, it's better to just ignore old warnings.
>
> I agree. Whatever checkers we enable, whatever code we test, there will
> always be false positives. A CI system needs to be able to ignore those
> false positives and only warn about new issues.

We already have support for that:
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads

But it would be great if those lists were as small as possible:

- If we have a lot of warnings, two error messages can be combined and
will scape the filters
eg:
print(AAAA);
print(BBBB);
> AABBBAAB

- The filters might hide new errors if they are too broad


Most of the patches in this series are simple and make a nicer code:
Eg the non return minmax() ,
Other patches show real integer overflows.

Now that the patches are ready, let's bite the bullet and try to
reduce our technical debt.


Regards!
>
> > When code is new the warnings are going to be mostly correct.  The
> > original author is there and knows what the code does.  Someone has
> > the hardware ready to test any changes.  High value, low burden.
> >
> > When the code is old only the false positives are left.  No one is
> > testing the code.  It's low value, high burden.
> >
> > Plus it puts static checker authors in a difficult place because now
> > people have to work around our mistakes.  It creates animosity.
> >
> > Now we have to hold ourselves to a much higher standard for false
> > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > Drokin has told me previously that I spend too much time trying to
> > silence false positives instead of working on new code.  He's has a
> > point which is that actually we have limited amount of time and we have
> > to make choices about what's the most useful thing we can do.
> >
> > So what I do and what the zero day bot does is we look at warnings one
> > time and we re-review old warnings whenever a file is changed.
> >
> > Kernel developers are very good at addressing static checker warnings
> > and fixing the real issues...  People sometimes ask me to create a
> > database of warnings which I have reviewed but the answer is that
> > anything old can be ignored.  As I write this, I've had a thought that
> > instead of a database of false positives maybe we should record a
> > database of real bugs to ensure that the fixes for anything real is
> > applied.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
