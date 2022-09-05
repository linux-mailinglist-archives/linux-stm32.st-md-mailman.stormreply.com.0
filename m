Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 493CF5ADB81
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 00:49:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA2A2C640F0;
	Mon,  5 Sep 2022 22:49:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 186BBC0C920
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 22:49:49 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id o4so9460945pjp.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 15:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=Nz+uqA7e4/P8W1+vztFIrzinPtJHEHUsBZrInKc0qlM=;
 b=QV/OF44k3joZDZETl0+ZlAcG808nTpQ+6yaZoVIx1EasnMTt4l9JtEqbk6ylV1sjPH
 CpsCnzKXD1yaRjJY8yjGFM/Rgnq9yiszyTc8TCHLEugHFhpgglTtFg/61iYR6lNKhfNX
 n+f8CJcsIFbu92wir0N7hH/bTYw1QemkS4mo8z9i7RazUS8WbaVUlDCuaya5GJBZu9IE
 QvA+bSBWFp0EO1XhWI8AaZpOPguSsXCXaTdXXwJTBB7rNsozxl6OvfDIM+wu5p0E19qV
 /OGRMYL6CRqyQ5aXHZUHHnxJTRmKFDJXhnoU6eq51SznMODXDCf9krZ5aKy7RCOTOjHC
 Ptlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Nz+uqA7e4/P8W1+vztFIrzinPtJHEHUsBZrInKc0qlM=;
 b=Gan5q1bPUuC4CWFFU9vQG9cqnpidLCsmxX/lajnXoEqn+9ti4aFfTkZLFVhJxTEs4c
 B5ufbrODSW1HomSYirSuR9Gm/79mio01/8PNYiKWmSsSPx36svluamg3xfc12oY6tlex
 XWmPxsmFdiKmJd8B1E22a/yXdF0KVDh0JnL3GBMgYikTW8Z38TWqKaeu2L8D2bB6U8oi
 KqcPSygGByFPeTt4/Qdnpr0wvDNJgbtNopVXt2MdAiC6miO33ioNJY1+Gtgs0yJQH6SN
 p1AkOCfSDZXBRCNVDFf0+mRS7KWSrsOfEVpt2wjX3cR9j5N3KsXxJ9pznNKzJLNFudHP
 Xv9g==
X-Gm-Message-State: ACgBeo0rvvMtYfwWNxAFIl4JSS7bpqszOUK/CLOlZBqAFuxcNd1lPXS8
 AXfUk9lurUtqz+2NNFJcwMk=
X-Google-Smtp-Source: AA6agR4K6lIuAxsSdVJ0oNphFJqoDM1Qz4a/ewauw+FqqlvVaYz09d/58GCWTrClE39lnwuTI3+EHg==
X-Received: by 2002:a17:902:d4c4:b0:172:f328:e474 with SMTP id
 o4-20020a170902d4c400b00172f328e474mr51321307plg.144.1662418187481; 
 Mon, 05 Sep 2022 15:49:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a170902a38a00b0017300ec80b0sm8054511pla.308.2022.09.05.15.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 15:49:46 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:49:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <YxZ9BkBnQOUpXt/O@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905071902.fv4uozrsttk3mosu@pali>
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
Subject: Re: [Linux-stm32] [PATCH v1 01/11] PCI: tegra: switch to using
 devm_fwnode_gpiod_get
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

On Mon, Sep 05, 2022 at 09:19:02AM +0200, Pali Roh=E1r wrote:
> On Sunday 04 September 2022 23:30:53 Dmitry Torokhov wrote:
> > I would like to limit (or maybe even remove) use of
> > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > a bit, so let's switch to the generic device property API. It may even
> > help with handling secondary fwnodes when gpiolib is taught to handle
> > gpios described by swnodes.
> > =

> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > =

> > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controlle=
r/pci-tegra.c
> > index 8e323e93be91..929f9363e94b 100644
> > --- a/drivers/pci/controller/pci-tegra.c
> > +++ b/drivers/pci/controller/pci-tegra.c
> > @@ -2202,10 +2202,11 @@ static int tegra_pcie_parse_dt(struct tegra_pci=
e *pcie)
> >  		 * and in this case fall back to using AFI per port register
> >  		 * to toggle PERST# SFIO line.
> >  		 */
> > -		rp->reset_gpio =3D devm_gpiod_get_from_of_node(dev, port,
> > -							     "reset-gpios", 0,
> > -							     GPIOD_OUT_LOW,
> > -							     label);
> > +		rp->reset_gpio =3D devm_fwnode_gpiod_get(dev,
> > +						       of_fwnode_handle(port),
> > +						       "reset",
> > +						       GPIOD_OUT_LOW,
> > +						       label);
> =

> Why in pci-aardvark.c for PERST# reset-gpio you have used
> devm_gpiod_get_optional() and here in pci-tegra.c you have used
> devm_fwnode_gpiod_get()? I think that PERST# logic is same in both
> drivers.

I believe Andy already answered that, but in this driver we can have
several root ports described via subnodes of dev->of_node, and reset
GPIOs are attached to those subnodes. We are forced to use
devm_fwnode_gpiod_get() instead of devm_gpiod_get_optional() as we need
to supply the exact fwnode we need to look up GPIO in, and can not infer
it from the 'dev' parameter of devm_gpiod_get().

Thanks.

-- =

Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
