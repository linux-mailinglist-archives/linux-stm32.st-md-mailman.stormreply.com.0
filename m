Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC1B2540C4
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 10:27:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70507C32EA6;
	Thu, 27 Aug 2020 08:27:31 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EA5BC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 08:27:30 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id q1so2226414pjd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HZu39BmrS22KD4B9ZU5A9XCIkFWAsFL80Y7SUDG2qtE=;
 b=oqBSHp+HrXhPE9QUUx68UGa9/YcMBY4IZZmU8tQEHoL0eR6q+q9L3KJxyU+5smq+mh
 Qpb47EuOJNxtnzUze/6j+DruJ9FAig6k1cmSSVZe4HSNqO71XXMp0HWKvL//Jn/SrsVg
 XDbTdaVO9ZDB9BadUVb0EXv/8MSvaT+iNh4DUhmXqSPdRZA+FvIWaEBj0KvH7/jwmzlc
 kbK+AW0LRTkel5HNUFj1MK2DXbFfjbShHU7ash7Sspa9HWszpy9Gmt3BpJ8DPsAlNMxF
 /XJN/Pw5pnUN3rRoxjBCOhTrLosJSp8mDe6aGlHjEfTDwyJ7xlixtSkiGR3gw2hRCCMF
 7Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HZu39BmrS22KD4B9ZU5A9XCIkFWAsFL80Y7SUDG2qtE=;
 b=Mv5qZ4qfOuHwG5KRt3h3NgJEnAr6dsCDJvAFv1c0BjwXulD+2W/mrGOSuZP951amEt
 ilkhcyx7JOtYblzrmQIax+IbdmJfjabMxErApMNTth79CZo9G5VCaf7PfJpvyEmpFm/G
 r/tZ08eEGxGGa29Omsn22XILtfyyFq1eoXz2fq53vVsOt0WUSGYEgI1CP1fKrZ/33Tyo
 jALHhtrbvESZJX46XtXVlbb7gHRDa2rMRJ0Z6YK6E02L1kmceh0MHvCMP7mUuB4wYoTg
 FYYTeEIxHp7cLMHFyzoR36Eanl+8h8At6kZGnuapnw8dQo3WN054MFcc5/QvNU05EtO9
 wDnA==
X-Gm-Message-State: AOAM530l01peIH875wEpjDhtcF2Pj4oyt/NVsPphtPggzEAbbjzyKYVH
 UPs0zEEWSBWMO4nQRtCIDXx4042vM0sL36X5uIE=
X-Google-Smtp-Source: ABdhPJy7FFxyHMt/VY+0213GOuICfPnBcgRzlKo9w1yk5kPoOdyCc69OPZ9PWgEDp1GqqASWBQKX2axNN3k90TDpCTE=
X-Received: by 2002:a17:90a:2c06:: with SMTP id
 m6mr9988021pjd.129.1598516848820; 
 Thu, 27 Aug 2020 01:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200826161818.20969-1-krzk@kernel.org>
In-Reply-To: <20200826161818.20969-1-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 11:27:12 +0300
Message-ID: <CAHp75Vf3s0+RrHnBoO4y4+t4Egth4uyYwtO5iPt9DbLJcunL6g@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio <linux-iio@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32: Simplify with
	dev_err_probe()
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

On Wed, Aug 26, 2020 at 7:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.






>         priv->aclk = devm_clk_get(&pdev->dev, "adc");
>         if (IS_ERR(priv->aclk)) {
>                 ret = PTR_ERR(priv->aclk);
> -               if (ret != -ENOENT) {
> -                       if (ret != -EPROBE_DEFER)
> -                               dev_err(&pdev->dev, "Can't get 'adc' clock\n");
> -                       return ret;
> -               }
> +               if (ret != -ENOENT)
> +                       return dev_err_probe(&pdev->dev, ret, "Can't get 'adc' clock\n");
> +
>                 priv->aclk = NULL;
>         }
>
>         priv->bclk = devm_clk_get(&pdev->dev, "bus");
>         if (IS_ERR(priv->bclk)) {
>                 ret = PTR_ERR(priv->bclk);
> -               if (ret != -ENOENT) {
> -                       if (ret != -EPROBE_DEFER)
> -                               dev_err(&pdev->dev, "Can't get 'bus' clock\n");
> -                       return ret;
> -               }
> +               if (ret != -ENOENT)
> +                       return dev_err_probe(&pdev->dev, ret, "Can't get 'bus' clock\n");
> +
>                 priv->bclk = NULL;
>         }

Again, devm_clk_get_optional() and even, if it exists,
devm_clk_bulk_get_optional().

Please, revisit all patches on this topic.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
