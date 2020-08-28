Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A509F255C90
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 16:33:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B84C32E90;
	Fri, 28 Aug 2020 14:33:28 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E900EC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 14:33:26 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id w14so1556516ljj.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpmT8z3vCoI387yR05xFtDPOcMcQ4MSd+QWPcIK213o=;
 b=SXuwPRZCasKbRTNTD4rBVmpvxw5674fLb7D3nUZanlM12QZHv9w8tybE1ygcVHuyHf
 oInP73nxqRqG/m924yhoXHEfVfMd8UNcGRHcOgglzIGOvStEqWimRNUmkiNO8lXlxASX
 CCpDX7fmupyd+Q7PIqp/vvF9e1lBa3Fh+ICv7e70bLR/G0jT4Gkx4E349CQz9h+h21Rd
 J9n3piyD5XHKRoxk039mI9PtUaLpkGEORrwzNi7gop6r9A58+nzmeDGzRENEZ4/0F3H/
 ri4qABCfHUAxKq3affmj3xX920jjMz3hnbCzfllSaY6dfAWtXQUtN0eWy5GAs/w/o60R
 vy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpmT8z3vCoI387yR05xFtDPOcMcQ4MSd+QWPcIK213o=;
 b=FGw1R3ttJkkr1DTPshwIXh35zf38zr6/pO0dw7WcYwCYFaxyxE/rrHxcX0WIQx4+fi
 PoXv8/XpQBc/dFI5BYp5/rEOHCX8l2oJyla3l56i3lpICU3VcUJv8leOlXSgpmwUzRAX
 BWv/Q/3dVmVcVIHyjOxNzLna6jln+CzQCJkNSrZA7AsMdV9fbFgTtCf2Xn5RRY0kJkuf
 /IUxpHgJH32Nm+tqE7DU3yEjztQA4gkLYuamtLGJ+/MEpDFPwR79FkNuIAf/XsDvUTtg
 o7qLkz2gJcRyp7hmsNJj9xec3KwqCu7cnkl3wSzXaeBHHrJ2MJ4viWXo/XB7XVsngJ5m
 8bvQ==
X-Gm-Message-State: AOAM533PxGvN9HGTLnNqHdCYmM5V80DBaeDAshnriX+1Bq1Pwo1F9Qrf
 0h5Zzk2OEnWPg6aT2xLEU98OULj6x3BVhuSF0MYI2w==
X-Google-Smtp-Source: ABdhPJx50N3WCz+95xej33BT+LFzbgw+YdB2RFlR9a5r50nwxYsPt9Je6m4kpOoXdZYez8d1PPZWYNLG7DhnlToAq/A=
X-Received: by 2002:a2e:558:: with SMTP id 85mr1056326ljf.293.1598625206108;
 Fri, 28 Aug 2020 07:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-16-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-16-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 16:33:15 +0200
Message-ID: <CACRpkdZTTq=yARxK5uAu6f5rAJy0tH0V5HQU3d6ddEMa_a9KnQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 16/18] iio: magnetometer: ak8974:
	Simplify with dev_err_probe()
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

On Thu, Aug 27, 2020 at 9:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
