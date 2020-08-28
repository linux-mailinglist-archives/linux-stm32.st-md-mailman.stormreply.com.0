Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C5255654
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 10:25:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10AFDC32EA6;
	Fri, 28 Aug 2020 08:25:27 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BFE3C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 08:25:25 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id q3so128158pls.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hgp9U9Y/G0zo5rd2YjDP3ShdcPx6s9r42iPuJEDI0jc=;
 b=ECtC8Qr2QpWVT5Ln1YYdt0d41D8iu4+1QljOFImcKWuMAAwp02hB9Z/uL8VN2ey2J+
 p3GD3wlvEExKnV3Z319A58NvE45esf1chM+0V/fjhkBUwXersN3vaLphhdr1J4difc+p
 0CAUiHbAVl9ixDZFHnIBUOaHukXywdJoUMvTFy3YA0YF9c3y5XU82ueUeX/Egnq+CmRC
 9hNwIbKnSRxOMPUVO8etY6uZgLfo6aqikvMDuvVT9IqO2gK9kJBCJF/qz+RdRz2245Vy
 DFaJDmcxFVDbDqen+wlr2csyHQ1eWpt/RK7KSuNhW3eyhUvIV3DI9LK5Mo5H9XXISrU7
 E5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hgp9U9Y/G0zo5rd2YjDP3ShdcPx6s9r42iPuJEDI0jc=;
 b=nbB/wQUO/osiTlCa2wtyxveAPqbwLPFjw7a9xGmmmdRU4BEsoMs6KSxDnMwpE884Mi
 f6D5VlkuTP4aDFyNiJLrH9BM7/CALjwIACgzcqWvGsGaXRFdlgHibvXRVBrwRyOXZj4j
 fXxWjv6yFprTDOD5QEGsdMuZYlXqHu2/9xca4r6nFXi/CW7JvfMJXtLUNoJ4Z4Hy9B16
 YpKSkpdn54Ls87z5IqcYh3TjYbv5qTV9matNk2LjB1lXK8zJyNptllAX9q/IFx8IjTIz
 DHltvajHKejQKPNi4hkO+OjdCXHjQmkeNmpScy4tGWXDrgSE0PJpCXbH5J/1ODGbRktK
 PdHg==
X-Gm-Message-State: AOAM532PRqilJjRoSQ+BagANjW7im9Ikl5sWObQEIQCPst1l7Q2f+2uM
 ndK54HKDNvFkK2SMKJIlBuroIMMBNpzTmUb25KY=
X-Google-Smtp-Source: ABdhPJwsbuw20O2OB1p5m5faNM+P4s8DD8aLK8TuvYw3gq+cYE8m/WMyHxDzBvhpeh/QCh5ExRey2Xy2BFReiumdd/0=
X-Received: by 2002:a17:902:b194:: with SMTP id
 s20mr408970plr.321.1598603123368; 
 Fri, 28 Aug 2020 01:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
In-Reply-To: <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 28 Aug 2020 11:25:06 +0300
Message-ID: <CAHp75VdWDtoGxm3uxxeXveZQ3Y_ofShdYPSXHL0Vxsz5d0miuQ@mail.gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

On Fri, Aug 28, 2020 at 12:46 AM Peter Rosin <peda@axentia.se> wrote:
> On 2020-08-27 21:26, Krzysztof Kozlowski wrote:

...

> I'm not a huge fan of adding *one* odd line breaking the 80 column
> recommendation to any file. I like to be able to fit multiple
> windows side by side in a meaningful way. Also, I don't like having
> a shitload of emptiness on my screen, which is what happens when some
> lines are longer and you want to see it all. I strongly believe that
> the 80 column rule/recommendation is still as valid as it ever was.
> It's just hard to read longish lines; there's a reason newspapers
> columns are quite narrow...

Why not to introduce 66 (or so, like TeX recommends)? Or even less?
I consider any comparison to news or natural language text is silly.
Programming language is different in many aspects, including helpful
scripts and utilities to browse the source code.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
