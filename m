Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C74254F77
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:55:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3018C32EA6;
	Thu, 27 Aug 2020 19:55:05 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4C61C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:55:02 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id n3so3095603pjq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1iCBP+9jZBWChmw6UiUb37gEZ3nyFFfurQpHrGXgKOo=;
 b=fmDKpG7JsNZWYR4WnBcEBetb/oHsOCdtX523ndIe2IZMPYsIrBIKn1XtshfI4TqHwu
 D08AXB8uTUFH9zriG8lI0eNgDKRlaSQ9a+EWr/izTx93LB42f1p07HwFExW+QrUgdzyd
 ilaVRZ8+BDgLBgmCDQoEuZoEJTPlFaZWucf3rXVXkqEzzE9MpG9unIWKWpgco9V4FBG8
 CPvCh+d3lPSpQGZwMLm0Rg+2Ygk4XldfIOOPsXF+p9+3iCHmyKGE8aFMr8pYT4nRCAqb
 eEVyijsnhpi5gSlqNea/keX3CLEEgpzZulaCr/n7I8TIfrBd63KA70brURiKiTw0S43y
 LaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1iCBP+9jZBWChmw6UiUb37gEZ3nyFFfurQpHrGXgKOo=;
 b=Xrvjc58FOdyJAb37GbG4QVgGcnig0sYZXXyjNt1uZ9uPDrTVDxRtaEky36Mf5jAuc9
 PFOxUSASZpce1ubSBKwBNm9zKmwYXNCWstKi+U3xZcWKKgtKfYiH7bztAzkPDcndoViQ
 RaupizaSn1mlqy1pTvls6jLFBC9sp+JmBqtwLO3tC3n1pnIkZBUTaCd4MBfF5skPF9Wl
 ArubWCutlgxj1YrM5nql1Ybz3BgTFnR7adpz6H4+MfUGl7Eeo1b5B9r9uso2ibYwTaSh
 FaPbnqgG9nwAmfUo/lPV8XABNXLQCrvaWxC5CQrvUET8QFdoI8vh36IRkoBi4/chuaPG
 iq1Q==
X-Gm-Message-State: AOAM531ckeRsNzlaUzvr9fXSRr69RzTutMMsVFAntmRjFQiQF5odyrx/
 i2vNZR+dr8edFc3Cqd+j3PPThfwXCQaShhr5NIU=
X-Google-Smtp-Source: ABdhPJy3db6CIQJ4K7OGhMgQan8eyYxEg/iBHcrwmiOZE1uEdOWivJYmfC67a+ptd7Jp7WYZumerqKG+TuNU5caIQKE=
X-Received: by 2002:a17:90a:2c06:: with SMTP id
 m6mr418944pjd.129.1598558101205; 
 Thu, 27 Aug 2020 12:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-9-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:54:45 +0300
Message-ID: <CAHp75VeH1dcn7TzdWf7N5kQ2EQeBXFyXRpRHBb4TyUrx+g4q8A@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
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

On Thu, Aug 27, 2020 at 10:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> ---
>  drivers/iio/afe/iio-rescale.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
> index 69c0f277ada0..8cd9645c50e8 100644
> --- a/drivers/iio/afe/iio-rescale.c
> +++ b/drivers/iio/afe/iio-rescale.c
> @@ -276,11 +276,8 @@ static int rescale_probe(struct platform_device *pdev)
>         int ret;
>
>         source = devm_iio_channel_get(dev, NULL);
> -       if (IS_ERR(source)) {
> -               if (PTR_ERR(source) != -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get source channel\n");
> -               return PTR_ERR(source);
> -       }
> +       if (IS_ERR(source))
> +               return dev_err_probe(dev, PTR_ERR(source), "failed to get source channel\n");
>
>         sizeof_ext_info = iio_get_channel_ext_info_count(source);
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
