Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0058A9D9D
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 16:51:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5E53C6DD66;
	Thu, 18 Apr 2024 14:51:46 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31BC0C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 14:51:45 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4daab3cf090so499306e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713451904; x=1714056704;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oMqAEiiN7av4J6wM+O4afdcaiaOjYq8V1FKf5PLPclI=;
 b=FUmSKNhUF9EFA1VuIW7xpasL3o75IEIjC/WYcViOuipO9Pu1igqPoBu5o29eindbL4
 1BScprAq9E09rN7uLTvqJoysFadWzDQz5UxWdF7NQv0ssFNkmKDl4JFowcOXJKiNhNF6
 8/wGNnKS8qJs2HXO2tDljKgoCWAViAmwlsYIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713451904; x=1714056704;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oMqAEiiN7av4J6wM+O4afdcaiaOjYq8V1FKf5PLPclI=;
 b=QmMalwWBrNlk1y2O93fGftyioWiEG+LZeJnevHIBdGSxwF2YIQh8Fopupnkw8ue5o+
 Ofu8Y/NGmCvvOm9HLgzNUFQa0h5yEjURn9lN5eze8zmoen6rCeGbfsMdKfAmmGNwcuMK
 MXoslC/kCfDc/7OHuniy0LegDpAgk7sSKO/oPsm80VsJzKX2kDfrozj8/LskiwH+Fcub
 O8V9b3k15Hjdax6Cgfz/N7F/ZJG2fYdW2Qq0g/6lWOgvVNpNpDg2aop36PcJqpY0NIEf
 lijW9c4faGtF+IRvDF3YqxbHVJAgxMQ+jP6s0pAhm2JyT2LddSeGXkH5xZ7kjg79omGS
 TzyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe37gksgIDOzoymeIjtVtbqDVPzytSDao/Qa2EmBLN+K5Ky+cjDiXLIJGS1pwfUZG57H6GoxZonjnws9/xXHGFf8Z5skVlu43gpObCmdDdn9sJscSso1Ml
X-Gm-Message-State: AOJu0Yzv59Afcl/zrqthoL2KjGm5h75FjMLCSbyLIY6AvclMbKd6mJxH
 9V/QZcs5UcDA346Cza0wVo30k59ufx94c7vqp5BswxO+eJzFWjU86UDzFNpMmKlKnutVR9tT1IM
 =
X-Google-Smtp-Source: AGHT+IFoehz/66YGG0ubU0JhnGnmxFyxxeLNOINgEC1JC6+eoQH6ADXG+gSskfbyDv0A7qdMos7bIg==
X-Received: by 2002:a05:6122:1d8b:b0:4c7:7760:8f14 with SMTP id
 gg11-20020a0561221d8b00b004c777608f14mr3880939vkb.7.1713451903810; 
 Thu, 18 Apr 2024 07:51:43 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41]) by smtp.gmail.com with ESMTPSA id
 a11-20020a056122012b00b004daaeb20ab2sm195461vko.4.2024.04.18.07.51.43
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 07:51:43 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-479d6c6f2c0so1179131137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 07:51:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHH7tbsb0atRP1JR0BzrG27DXPBWvrz+yvYO13LbDrrtPg7Obe9KXf3ZKySqZSCnm4T39oMOkTthy1Fc7lOdnwO+kfSsVoyCMXj4NrZNhI3KizeLVPNkEK
X-Received: by 2002:a05:6214:4a5b:b0:6a0:4571:e0c8 with SMTP id
 ph27-20020a0562144a5b00b006a04571e0c8mr3999896qvb.18.1713451882078; Thu, 18
 Apr 2024 07:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain>
 <20240417155112.GQ12561@pendragon.ideasonboard.com>
 <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
 <20240418105310.GV12561@pendragon.ideasonboard.com>
In-Reply-To: <20240418105310.GV12561@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 18 Apr 2024 16:51:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
Message-ID: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
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

On Thu, 18 Apr 2024 at 12:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Apr 17, 2024 at 06:19:14PM +0200, Ricardo Ribalda wrote:
> > On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart wrote:
> > > On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > > > In my opinion, it's better to just ignore old warnings.
> > >
> > > I agree. Whatever checkers we enable, whatever code we test, there will
> > > always be false positives. A CI system needs to be able to ignore those
> > > false positives and only warn about new issues.
> >
> > We already have support for that:
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads
>
> Those are manually written filters. Would it be possible to reduce the
> manual step to flagging something as a false positive, and have a
> machine build the filters ?
>

Do you expect that the list of exceptions will grow?

I hope that once the CI is in place we will fix the warnings before
they land in the tree.


> > But it would be great if those lists were as small as possible:
> >
> > - If we have a lot of warnings, two error messages can be combined and
> > will scape the filters
> > eg:
> > print(AAAA);
> > print(BBBB);
> > > AABBBAAB
> >
> > - The filters might hide new errors if they are too broad
> >
> >
> > Most of the patches in this series are simple and make a nicer code:
> > Eg the non return minmax() ,
> > Other patches show real integer overflows.
> >
> > Now that the patches are ready, let's bite the bullet and try to
> > reduce our technical debt.
> >
> > > > When code is new the warnings are going to be mostly correct.  The
> > > > original author is there and knows what the code does.  Someone has
> > > > the hardware ready to test any changes.  High value, low burden.
> > > >
> > > > When the code is old only the false positives are left.  No one is
> > > > testing the code.  It's low value, high burden.
> > > >
> > > > Plus it puts static checker authors in a difficult place because now
> > > > people have to work around our mistakes.  It creates animosity.
> > > >
> > > > Now we have to hold ourselves to a much higher standard for false
> > > > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > > > Drokin has told me previously that I spend too much time trying to
> > > > silence false positives instead of working on new code.  He's has a
> > > > point which is that actually we have limited amount of time and we have
> > > > to make choices about what's the most useful thing we can do.
> > > >
> > > > So what I do and what the zero day bot does is we look at warnings one
> > > > time and we re-review old warnings whenever a file is changed.
> > > >
> > > > Kernel developers are very good at addressing static checker warnings
> > > > and fixing the real issues...  People sometimes ask me to create a
> > > > database of warnings which I have reviewed but the answer is that
> > > > anything old can be ignored.  As I write this, I've had a thought that
> > > > instead of a database of false positives maybe we should record a
> > > > database of real bugs to ensure that the fixes for anything real is
> > > > applied.
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
