Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3070C254ECB
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:39:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE7A7C32EA6;
	Thu, 27 Aug 2020 19:39:08 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2AE5C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:39:05 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id v15so4089265pgh.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MZm/oywi3r1tbCCgZePyobFM2PGZReJQn7CQ3uKc+Ao=;
 b=f8n5VPrpuTtwANe91fL3ceCKerjs9R1uZiyAXmwVy/cZqu3I8o92h7iWKeUrZbvTHI
 xv3f2KNykWxz9M4p+YEx/8qCMXuZ9zkFFj9z+dffQXJOEZsPQBZzrKqn6Xfw2iQuP5Af
 eIOEmUek3WrgS3fxMZwWJXrEDNbdzLAOraAWLfkDXyFr6h00Z7O9KvIpFIS9xEGr+3aX
 9zXFJ0A9XeZY0Ce0KWz63fWV7wQ7VVhbTgUiEEsxac+lfKyxCqS913SAPiQ6itoN4Kdu
 Hp/smrljQR+JJGKvlfG5Wqu+EBGIUVqGeslwuBUsIrpvL2dILvRlZuex9jG0lt4PEcd9
 UTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZm/oywi3r1tbCCgZePyobFM2PGZReJQn7CQ3uKc+Ao=;
 b=DN/4CY0jZ5Ee+a6ASEDyUTGgJ6a4JkjEtakA3vz0dUpFlgv/DO1EX/7QH10/LnFTd3
 eR3V6jjTD01npT/yoAUOapIljcacZ+z/Krw1pAoyGdhlgcI8NfbfXNYgtIdyFDkJGrNM
 qN7vrSTgfiCUClwvLOmrWMTBzVqSwMKK0n26abpLO9ULEyaN+8aRtrHNUgkyHifGQGnK
 rCd4rufu3pHhjjGSPco968AeCKw6z37Lba3dDYhta8CVp1uahuKaSZwY2/Rpn7c73mim
 ivTLlzD1/OUQBd8pjEByMQOyQDn+Rt8V3Dc4mLkUVEK9SnZcVON26jA41EQkRia7uy93
 uotQ==
X-Gm-Message-State: AOAM531sEeonLzf/Y4C9AIuqTKpR3ppVXb8tkp1Mj4EJlcDWQQ1Mu2Zl
 caYXpxq0td+8S6m7bETQMWQrx6mA5xhbRGuI9Fo=
X-Google-Smtp-Source: ABdhPJzf24/mTVbylFzj0huXtaxnG7j22bCzla2pU3gLISj7msJajR9gj4ZkRMNtbU33SxLbtqsrpdn12ipaw+rhX4g=
X-Received: by 2002:a63:ec18:: with SMTP id j24mr15210554pgh.74.1598557143681; 
 Thu, 27 Aug 2020 12:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200827192642.1725-1-krzk@kernel.org>
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Aug 2020 22:38:46 +0300
Message-ID: <CAHp75VeOWTuB1SqsajLZE9WB+VzgMuL9gnA-ohf58_hfJ=gn5w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 01/18] iio: accel: bma180: Simplify
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

On Thu, Aug 27, 2020 at 10:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iio/accel/bma180.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
> index 5b7a467c7b27..448faed001fd 100644
> --- a/drivers/iio/accel/bma180.c
> +++ b/drivers/iio/accel/bma180.c
> @@ -1000,19 +1000,15 @@ static int bma180_probe(struct i2c_client *client,
>                 return ret;
>
>         data->vdd_supply = devm_regulator_get(dev, "vdd");
> -       if (IS_ERR(data->vdd_supply)) {
> -               if (PTR_ERR(data->vdd_supply) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vdd regulator %d\n",
> -                               (int)PTR_ERR(data->vdd_supply));
> -               return PTR_ERR(data->vdd_supply);
> -       }
> +       if (IS_ERR(data->vdd_supply))
> +               return dev_err_probe(dev, PTR_ERR(data->vdd_supply),
> +                                    "Failed to get vdd regulator\n");
> +
>         data->vddio_supply = devm_regulator_get(dev, "vddio");
> -       if (IS_ERR(data->vddio_supply)) {
> -               if (PTR_ERR(data->vddio_supply) != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get vddio regulator %d\n",
> -                               (int)PTR_ERR(data->vddio_supply));
> -               return PTR_ERR(data->vddio_supply);
> -       }
> +       if (IS_ERR(data->vddio_supply))
> +               return dev_err_probe(dev, PTR_ERR(data->vddio_supply),
> +                                    "Failed to get vddio regulator\n");
> +
>         /* Typical voltage 2.4V these are min and max */
>         ret = regulator_set_voltage(data->vdd_supply, 1620000, 3600000);
>         if (ret)
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
