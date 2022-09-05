Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD575ADB93
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 00:55:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A79AC640F0;
	Mon,  5 Sep 2022 22:55:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFBA5C0C920
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 22:54:59 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id x23so9578262pll.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 15:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=QRQkxIGFI3OF3amcRlbkZf4vgkek6ggFXyd9zidvB8c=;
 b=gsorC9ciDElqLq5gq0tq73oj5nMDX/AJm+EMEt5M9j7Nw6OucD0+TVGBzuQn+rrtls
 0loRnw7UzHrgMM28KIGVLo7qn/bZoumg2qTw3CfDMDdQmf0bgbzpShi+kGjU7raGyx6P
 sToiGUYujxqPyCybICNsYdfYAa2jOurTif72VImXpZhCttvifys7wIqhFIW1PJR8dY03
 UzvU99z5GubsoABcuAk5rbAMv44acUIXmY5P0ep133FiqLgOHtVg+wzuulxPweHG+ula
 IzdWZ5ta3aGiqrNbwgZATXaEEWNGQRgzb+HrP6NXzuvsc0zd1wPa546sY9tkILtVErqR
 hUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QRQkxIGFI3OF3amcRlbkZf4vgkek6ggFXyd9zidvB8c=;
 b=51iPEyFU9mDC1ZcVuxAeqsnX5v3sGZs4k/Nb2QeWoEjhwFi6ARH+MkGeMKxLOkLlgE
 uYlRNgALQJ8o939mfR/XWCCoUZitBHz4VMxI9rH/J7pOHjWfTqM17EzAAYqv3jjZ9PDK
 OPMg5Io/QtcOee+0OBmWDp8XzhR5LCpda4jTW4RSUi5Xllg3CiEpOclI+tb6eqQyj5Pw
 JQ0Ovjt59mEm7C2dliRL4ag+o00Ldv4vp0jlOME9xSIMmKsq7R8hiJr9nKZjNs2eoU/U
 VayRTcEEB6LNtsGjMFBc97gvSo4ZAvZrTMUm38MIc9VyFkW+bx15RyYNIwQiZhdBvpyF
 y3DQ==
X-Gm-Message-State: ACgBeo3OgFXiN90XSfwby5Ludt0TFap4TTXLqyA/eUNQ2Mp6Y5QVeTET
 39MComnETN5m3M7EDaaB338=
X-Google-Smtp-Source: AA6agR6BVwijybUmJvKefzrwHZ9dDsULsMfqVmOf8/ecx+Q6qQipxqieCoJRYSCXP05TF0ANy6CnCA==
X-Received: by 2002:a17:902:be03:b0:175:6397:9425 with SMTP id
 r3-20020a170902be0300b0017563979425mr21493671pls.26.1662418498231; 
 Mon, 05 Sep 2022 15:54:58 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a630e15000000b0042c2def703asm6833366pgl.22.2022.09.05.15.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 15:54:57 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:54:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <YxZ+PSDRYZnVKfFO@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905070046.46nlhczkck2ufr4x@pali>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Sep 05, 2022 at 09:00:46AM +0200, Pali Roh=E1r wrote:
> On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > device property API.
> > =

> > I believe that the only reason the driver, instead of the standard
> > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > because it wanted to set up a pretty consumer name for the GPIO,
> =

> IIRC consumer name is not used at all.
> =

> The reason was to specify full name of DTS property, for easier
> identification of the code. DTS property is "reset-gpios" but API
> specify only "reset".

I see. Do you want me to reset the patch with updated desctiption as to
the reason devm_gpiod_get_from_of_node() was used?

> =

> > and we now have a special API for that.
> > =

> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > =

> > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/contro=
ller/pci-aardvark.c
> > index 4834198cc86b..4a8a4a8522cb 100644
> > --- a/drivers/pci/controller/pci-aardvark.c
> > +++ b/drivers/pci/controller/pci-aardvark.c
> > @@ -1856,20 +1856,19 @@ static int advk_pcie_probe(struct platform_devi=
ce *pdev)
> >  		return ret;
> >  	}
> >  =

> > -	pcie->reset_gpio =3D devm_gpiod_get_from_of_node(dev, dev->of_node,
> > -						       "reset-gpios", 0,
> > -						       GPIOD_OUT_LOW,
> > -						       "pcie1-reset");
> > +	pcie->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_=
LOW);
> >  	ret =3D PTR_ERR_OR_ZERO(pcie->reset_gpio);
> >  	if (ret) {
> > -		if (ret =3D=3D -ENOENT) {
> > -			pcie->reset_gpio =3D NULL;
> > -		} else {
> > -			if (ret !=3D -EPROBE_DEFER)
> > -				dev_err(dev, "Failed to get reset-gpio: %i\n",
> > -					ret);
> > -			return ret;
> > -		}
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			dev_err(dev, "Failed to get reset-gpio: %i\n",
> > +				ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D gpiod_set_consumer_name(pcie->reset_gpio, "pcie1-reset");
> > +	if (ret) {
> > +		dev_err(dev, "Failed to set reset gpio name: %d\n", ret);
> > +		return ret;
> >  	}
> >  =

> >  	ret =3D of_pci_get_max_link_speed(dev->of_node);
> > =

> > -- =

> > b4 0.10.0-dev-fc921

Thanks.

-- =

Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
