Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A85B171E
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 10:33:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AC66C63328;
	Thu,  8 Sep 2022 08:33:41 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E14B8C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 08:33:39 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id y3so36396729ejc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZlO9z6iariE6j62dDg3WdSSqBdCZFPhJNQtrGMOHOrM=;
 b=yoKt2dR8DpMlh2XORFcltXAYMgjes8PsrrPXKGawrKEhed4y+WSSTQmmNgG0Gf1SJu
 /FfQ3PEPixSLl61o/wNzP2mAl16GeJnsTLbhWLnWfaVkAwo6y83SYrJYUs2zfFeTOmCJ
 KCfvXIX2k6sUR9M4H2LnnadTsaJNBeTiS5ZBjIN9tOf2Kpq6GTWefCkCUFHSnLO/4AAN
 bF2Kwwu1NBRMUHGOV8o4kZ9m3PqjItvKGaAHum8EmxiW7WxhfY/+qFWuKiEN2m/2UZCf
 n8HtcVv1JxiPWMi7HHbrHpse1K4PW6ghIMCVLd1VC32slTHEjJxXugMgMhGNvWgPOPtq
 zkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZlO9z6iariE6j62dDg3WdSSqBdCZFPhJNQtrGMOHOrM=;
 b=W0H2kem3Sq41TBsD+pJnASdsq2vDZttdHginUsnLs1Te1QFU4IOwgkrrXEcNcmNxf3
 jOIEzNlSHPkLJODcdaRq292wiJG/+3j4w/umSNunhhaArcvm0t+uFZoIyjTf4hu8GPCn
 MbndZDMQ0lFoQsGEwf8mq6JXfbVfexV9X5nXJEflacTnhqFLKC2BcmTZQ3ykra4pgVr4
 caQtjyLXPTFfktIROUJqu5OLFFsde6GJ5t2SzWvIa3FpKknXGGYW7jYAXIymE3IgVtY8
 wwGYNyi4CqQyfyJcmIlVrxRPwLDFqbKA0QNMoRG2Wk6gsxTupY+dKiDsaqgQfi3wLZSv
 eYZg==
X-Gm-Message-State: ACgBeo2vSRfBKTT3JbuJs0zZbjE8/MFr+pBwCULsW6W+JvJo7ODQRL+Q
 8uTjatXb7+2VZQAroXkIwzkun0HsxgQBF8OHNFZJGw==
X-Google-Smtp-Source: AA6agR6YdmowLCqDy13X6GVFnJajdgoAbYXT6/9jX+Ol46w4Ykshwr2tFJzDmJvExLu3Rbp1DyOQwdZVX8mDYcaxnJ0=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr5235773ejc.203.1662626019497; Thu, 08
 Sep 2022 01:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-7-b29adfb27a6c@gmail.com>
 <YxaSBRkAG/hKjFol@google.com>
In-Reply-To: <YxaSBRkAG/hKjFol@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:33:28 +0200
Message-ID: <CACRpkdb2dYvNkyx7O24uURjSYcCPkGR+Gj=weCSG6GdcM1B7Xw@mail.gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 07/11] PCI: apple: switch to using
	fwnode_gpiod_get_index()
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

On Tue, Sep 6, 2022 at 2:19 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> On Sun, Sep 04, 2022 at 11:30:59PM -0700, Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > fwnode property API.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > index a2c3c207a04b..d83817d3ff86 100644
> > --- a/drivers/pci/controller/pcie-apple.c
> > +++ b/drivers/pci/controller/pcie-apple.c
> > @@ -516,8 +516,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
> >       u32 stat, idx;
> >       int ret, i;
> >
> > -     reset = gpiod_get_from_of_node(np, "reset-gpios", 0,
> > -                                    GPIOD_OUT_LOW, "PERST#");
> > +     reset = fwnode_gpiod_get_index(of_fwnode_handle(np),
> > +                                    "reset", 0, GPIOD_OUT_LOW, "PERST#");
>
> Hmm, I am looking at the driver and it leaks the reset gpio on
> unbind/unload. I guess it does not matter in practice, but still nice
> not to leak. Thankfully it is easy to cure by switching to devm option:
> devm_fwnode_gpiod_get().
>
> I'll send and updated patch with a new justification.

With that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
