Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E78072554C7
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 09:03:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1718C32EA6;
	Fri, 28 Aug 2020 07:03:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CAE3C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 07:03:20 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C9BB21473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598598198;
 bh=4faSGkxwde2dUgjoJLxEPngM/PNDuiR7AsduftolHIs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sx7QHngCjfwrj5EpTWFj8h72BUzgxBMBKywR+k595Wk3fByAORr3jVBGDZLwGksw0
 PYNKYbUpEnueECWfETWbOSoHpehiGjPGGdGrQ1xkURBaro59NTzuZqovK+ftZZdWmw
 BIoHuIn6C7rK8aWGwpap/DKCec5A9wvC81kDbajc=
Received: by mail-ej1-f42.google.com with SMTP id a26so166052ejc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 00:03:18 -0700 (PDT)
X-Gm-Message-State: AOAM531Su+ryWnGUWOC3F/MdiADgY29XL9v4rtHyegBK2tMTmcmrjwWw
 Z7UlgbcdUe9BR7kQz3XX0izc/hsYQYp5xQ4CSQY=
X-Google-Smtp-Source: ABdhPJxeqj21bGrdAgawvMqE4DUECkHszI8hRw0tB+YmvQTkV+0igeB3UuUCefttjGSqXjyZ8z82C9AEfK2QoACQnCo=
X-Received: by 2002:a17:906:3e0a:: with SMTP id
 k10mr409528eji.148.1598598197045; 
 Fri, 28 Aug 2020 00:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se> <20200828062443.GA17343@pi3>
 <3a5cb59b-454e-2c3f-9f31-43147e843c66@axentia.se>
In-Reply-To: <3a5cb59b-454e-2c3f-9f31-43147e843c66@axentia.se>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 28 Aug 2020 09:03:06 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcqNE5U82UThzBTPCvucCf2LsCVSfAHE1vnecJGCKCaig@mail.gmail.com>
Message-ID: <CAJKOXPcqNE5U82UThzBTPCvucCf2LsCVSfAHE1vnecJGCKCaig@mail.gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 09/18] iio: afe: iio-rescale: Simplify
	with dev_err_probe()
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

On Fri, 28 Aug 2020 at 08:58, Peter Rosin <peda@axentia.se> wrote:
> >> I'm not a huge fan of adding *one* odd line breaking the 80 column
> >> recommendation to any file. I like to be able to fit multiple
> >> windows side by side in a meaningful way. Also, I don't like having
> >> a shitload of emptiness on my screen, which is what happens when some
> >> lines are longer and you want to see it all. I strongly believe that
> >> the 80 column rule/recommendation is still as valid as it ever was.
> >> It's just hard to read longish lines; there's a reason newspapers
> >> columns are quite narrow...
> >>
> >> Same comment for the envelope-detector (3/18).
> >>
> >> You will probably never look at these files again, but *I* might have
> >> to revisit them for one reason or another, and these long lines will
> >> annoy me when that happens.
> >
> > Initially I posted it with 80-characters wrap. Then I received a comment
> > - better to stick to the new 100, as checkpatch accepts it.
> >
> > Now you write, better to go back to 80.
> >
> > Maybe then someone else will write to me, better to go to 100.
> >
> > And another person will reply, no, coding style still mentions 80, so
> > keep it at 80.
> >
> > Sure guys, please first decide which one you prefer, then I will wrap it
> > accordingly. :)
> >
> > Otherwise I will just jump from one to another depending on one person's
> > personal preference.
> >
> > If there is no consensus among discussing people, I find this 100 line
> > more readable, already got review, checkpatch accepts it so if subsystem
> > maintainer likes it, I prefer to leave it like this.
>
> I'm not impressed by that argument. For the files I have mentioned, it
> does not matter very much to me if you and some random person think that
> 100 columns might *slightly* improve readability.
>
> Quoting coding-style
>
>   Statements longer than 80 columns should be broken into sensible chunks,
>   unless exceeding 80 columns significantly increases readability and does
>   not hide information.
>
> Notice that word? *significantly*

Notice also checkpatch change...

First of all, I don't have a preference over wrapping here. As I said,
I sent v1 with 80 and got a response to change it to 100. You want me
basically to bounce from A to B to A to B.

> Why do I even have to speak up about this? WTF?

Because we all share here our ideas...

> For the patches that touch files that I originally wrote [1], my
> preference should be clear by now.

I understood your preference. There is nothing unclear here. Other
person had different preference. I told you my arguments that it is
not reasonable to jump A->B->A->B just because each person has a
different view. At the end it's the subsystem maintainer's decision as
he wants to keep his subsystem clean.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
