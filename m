Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BDE254FAC
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 22:02:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B37CC32EA6;
	Thu, 27 Aug 2020 20:02:28 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACC5BC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 20:02:26 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 31so4111383pgy.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZGo/LXMWA743P+olH7TRkE+L3lrjbqKbRZ3LxAQjPo=;
 b=dTu6o2U3wIn+j1v+r3MXNSN35FUN+T2Ga+C6IEZhOqyDDBfBE3A597INaQykc/zK5N
 e29lSW8oIy3von1EDSHzrXAVeRMAvW1ed+lYOELqagYL5sR2inJeqwfBbqXV4FK6sCMk
 Hfm42l4h/LTOWilsOGK7JOMAPAdmKuTI7ri15EU81fGomSsgujOEykmO3j5u3b8d00JT
 y6G7L3ZjYiblAjxovxtPZnHCI16Md4+vLhzEs1tK7lNien1ry4pAHrXAiN3tLj6C5xlc
 yK8rJWblvVYrsonzu63yJ/EgonbAcYBoDqsF2KrONQ8csAQTA+38zWBBwcTvD1DPUifV
 GLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZGo/LXMWA743P+olH7TRkE+L3lrjbqKbRZ3LxAQjPo=;
 b=j6dsrf3FD8t20HQK9tpFPDA3joNZeIwydUluYxNkAkuBl/o1vLiYNX41C9yCcWTaTQ
 F9noIs9T4db4dBjJE1sPZs5fDZgVA7oWAo1uF/MnYcPBIXs3NBEFKChzqX8OpsMgb6Ji
 eG0No8P15Hqvu50920uJdY6Fns8P5QcJXqkHDGryHH1LSWizyYlyAedR3tDnuZiqG57z
 D+umF9OGYGMcXAH1xHMUQsYG994zntFcIBBawfRhMVw8BXBlYEYBP62A08dRwxnI0+VY
 E9WnHHuKEt7kL3RtLpFDbJZF2GSujkrthbztULHtVmLoDDHK2rs2u07E212npqIqMosg
 PgrA==
X-Gm-Message-State: AOAM531QBdow0kMWyFNtCVF4pVUxWNP49VKCOCV/1JmY+oXFLd6+yDps
 wt3bVC8egWA2/dQZGnRkJD6FC688pvK0O0zvaLs=
X-Google-Smtp-Source: ABdhPJyrJVOQaAjVOgzTH9Ia08ZxKIpsXNc3Mfx5rESAlYI8qMYgqJ1+s8Yh5E+7TlXUKU+iWqHjdU0n6g2EX6jm0oE=
X-Received: by 2002:aa7:95b8:: with SMTP id a24mr17478277pfk.219.1598558545190; 
 Thu, 27 Aug 2020 13:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-18-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-18-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:02:08 +0300
Message-ID: <CAHp75Vc4R_PkVSYFGNr0UO5yJ+dLGhVV-G7vznGnNu_aCVoTVQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marek.vasut@gmail.com>,
 Kukjin Kim <kgene@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v2 18/18] iio: magnetometer: iio-mux:
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

On Thu, Aug 27, 2020 at 10:29 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/multiplexer/iio-mux.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/multiplexer/iio-mux.c b/drivers/iio/multiplexer/iio-mux.c
> index 6910218fdb00..d219d4a86657 100644
> --- a/drivers/iio/multiplexer/iio-mux.c
> +++ b/drivers/iio/multiplexer/iio-mux.c
> @@ -354,11 +354,8 @@ static int mux_probe(struct platform_device *pdev)
>                 return -ENODEV;
>
>         parent = devm_iio_channel_get(dev, "parent");
> -       if (IS_ERR(parent)) {
> -               if (PTR_ERR(parent) != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get parent channel\n");
> -               return PTR_ERR(parent);
> -       }
> +       if (IS_ERR(parent))
> +               return dev_err_probe(dev, PTR_ERR(parent), "failed to get parent channel\n");
>
>         sizeof_ext_info = iio_get_channel_ext_info_count(parent);
>         if (sizeof_ext_info) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
