Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46531254F9A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 22:00:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B4E6C32EA6;
	Thu, 27 Aug 2020 20:00:24 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C129C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 20:00:22 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id g207so283560pfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 13:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7FsTR8MREGabBVt8LZ1j+20Xw6tV3sc64t+TrTmz1s=;
 b=H9Avjr9TBzYfwPOkz9EdvQOD/Hp2R/foNgj3n1RhDeUBaZ+T5lK3N+jmOVnF21fOPt
 cveijGliKTaLjmDGdxLWA8yVPczBusBiXh8fEduLfVMgyZ0AxHteuhJDmjK+uvJjLgPq
 hM8m0PARzvkixd1ZpgNhwBjSF1Ql6JaTzlrCF6hmmq+YjKNxQIvus1kjO8clKsH8C/t2
 Nr82ezEM0MgwJqZL7nrR3nrQCfjaqM4GPuz/FwXoB+2fw+2pY2HJ58nma+QCs85J+WsJ
 mBjjdnKmcvQsh0zyRUoV3RFVkHHilb03CsDzzWN0tKOzpTSWidOkEcJRc4N+Npaqr7Eh
 iyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7FsTR8MREGabBVt8LZ1j+20Xw6tV3sc64t+TrTmz1s=;
 b=ITvt1LlaLOqGWDIAYPPAJPGwCJe6QTF4rdjpogMoS5zufUH6JX/D7Lhv3jlz7nrmPh
 EwDLktcrTbXMonXxVLwoaCDPBQI9R1PLSo4f+EDIsLDPYCohQ5WHUTJPuJDcaAiJZUhs
 TajJKtn2/xoGh83+cS7SybcErocDK4cOm+kh0CVMyLAVQ0hY+2UuLJxjkCuwYN8FeI9c
 22Awlaeu14FY4VF3cMVLANkyAZTdjQ4sTRYTEyWiIO4NEhIgr3ddgSzjgwdOk5OeHo++
 ZyKwBnw5IOoSh/eUxLSx3aTO/Fmo/eNgjhYZqxNS4XXNe3wB2pTj4BSeo0IktybrUciZ
 QvDQ==
X-Gm-Message-State: AOAM531zlkB4cMOlcM6lpiA+rCFkUe6lc1xeDvi1jZy+bXzgn9TB0/Mw
 D+jXaw6yKmh1TsN1phWdat8yc02ewJWe3raWdbQ=
X-Google-Smtp-Source: ABdhPJzMVgucetaUrBARc94LCHK9ltEz39VRjcWxPvDTspL6QeAi4Dc29DqGVOxpjkKfh4YtQxfRbS/CdGszBd3FklY=
X-Received: by 2002:a63:f24a:: with SMTP id d10mr15673608pgk.4.1598558421035; 
 Thu, 27 Aug 2020 13:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-14-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-14-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 23:00:05 +0300
Message-ID: <CAHp75VdQYzuiXBXYBrwaLKzZDZWtyT1_kLAWVU0G7fXTi8fAGQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 14/18] iio: light: isl29018: Simplify
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
> ---
>  drivers/iio/light/isl29018.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
> index ac8ad0f32689..2689867467a8 100644
> --- a/drivers/iio/light/isl29018.c
> +++ b/drivers/iio/light/isl29018.c
> @@ -746,12 +746,9 @@ static int isl29018_probe(struct i2c_client *client,
>         chip->suspended = false;
>
>         chip->vcc_reg = devm_regulator_get(&client->dev, "vcc");
> -       if (IS_ERR(chip->vcc_reg)) {
> -               err = PTR_ERR(chip->vcc_reg);
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&client->dev, "failed to get VCC regulator!\n");
> -               return err;
> -       }
> +       if (IS_ERR(chip->vcc_reg))
> +               return dev_err_probe(&client->dev, PTR_ERR(chip->vcc_reg),
> +                                    "failed to get VCC regulator!\n");
>
>         err = regulator_enable(chip->vcc_reg);
>         if (err) {
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
