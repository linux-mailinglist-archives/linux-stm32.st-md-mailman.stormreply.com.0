Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E261070B
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 03:06:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC0A9C04003;
	Fri, 28 Oct 2022 01:06:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58BCDC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 01:06:37 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id g62so3494934pfb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eouvp87d3Uwj62ptbIwj2FltIDQrDKmm7rl+pdi32U0=;
 b=nQ7weogHhMIC9v9rAl3TVZ1zfLs3IGvA3QKHPCFBZ+KojUNUj5TChT+OvOY12ityd8
 VbE20EYGCMWZidXQ0mA4iREKWBtYaSnvAUNEf/MGSFONDmzlPI+MR4CrUM9ksmAsrDKt
 cj+aWdebIPLIeH6IbKuwGrCytZHTwYkz2OUKYh4KijicqkVXtFp7vt0bi0LKmFm6i4xU
 q4LDtjxwFqoNAonlD9dnY2gWjZ01CSB3ruJJV2hDr7cYI/uKy5RyQ+vTowUxUWeVa6zy
 zJdma15Tr6xjC12xRbPs+cXXQMqUWSrtgiCQqqToh1CNrevC/C1rFj6Z+ww6/oTseywE
 yduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eouvp87d3Uwj62ptbIwj2FltIDQrDKmm7rl+pdi32U0=;
 b=ViJTpKbeXvZxv6MAI3vCjzpU41Zn0EW/L00JUMzid1KqKJgEYWy4kz/cXKntfCNpSB
 R5ajaJSjE6uqejmYYHrwKE6/3qrItZki2Djdpzcea1l6LJNcllVTholrWYLir9hSGuDi
 dZWL5DD3gTiPa0DWeIHb3/KqGqiSzIEfmxjzFKu+BJ96x3NuUI+Jigp7eiXNPLoVokFg
 Iq7HU6snhyzVEsWr9gmExI39Dsva63X+OQ73NDfdbf+6HY5i5sjaWT8DJpq6eWyGqE0M
 ICHsY8J+IXKzVpZSE6oOv8/QcJToIhplsWvS2wGUR6TB3QFeSnTwl0WHAb0LPqHAYb8a
 yEbg==
X-Gm-Message-State: ACrzQf2JxrDmv5HhbemthWDLN653pXwrsEgZqxn0Jbj1XlyFRgo3jd+5
 3dQmYiWtWKXlbCGqEI8ndb8=
X-Google-Smtp-Source: AMsMyM71t2M2+k7329f4iPqjn+WDD27m67jwDQ968XupuMJUSxT0+/ISWLqKZwmQAQWuSE8GPvBuVA==
X-Received: by 2002:a63:1917:0:b0:43c:1471:52b7 with SMTP id
 z23-20020a631917000000b0043c147152b7mr43836410pgl.522.1666919195743; 
 Thu, 27 Oct 2022 18:06:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ea9a:801b:ed52:2db1])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902e21300b0017f57787a4asm1747996plb.229.2022.10.27.18.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 18:06:35 -0700 (PDT)
Date: Thu, 27 Oct 2022 18:06:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Message-ID: <Y1srFi6mJGl5/3gi@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <166687787352.847482.10005684512699510391.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166687787352.847482.10005684512699510391.b4-ty@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Guenter Roeck <linux@roeck-us.net>, Daniel Vetter <daniel@ffwll.ch>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v1 00/11] Get rid of
 [devm_]gpiod_get_from_of_node() public APIs
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

Hi Lorenzo,

On Thu, Oct 27, 2022 at 03:38:11PM +0200, Lorenzo Pieralisi wrote:
> On Sun, 4 Sep 2022 23:30:52 -0700, Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_nod=
e()
> > so that gpiolib can be cleaned a bit. We can do that by switching drive=
rs
> > to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we o=
pen
> > the door to augmenting device tree and ACPI information through seconda=
ry
> > software properties (once we teach gpiolib how to handle those).
> > =

> > I hope that relevant maintainers will take patches through their trees =
and
> > then we could merge the last one some time after -rc1.
> > =

> > [...]
> =

> Applied to pci/tegra, thanks!
> =

> [01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
>         https://git.kernel.org/lpieralisi/pci/c/16e3f4077965

Any chance you could also pick up

 [06/11] PCI: aardvark: switch to using devm_gpiod_get_optional()
 (20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com)

 - Pali Roh=E1r has acked it.

Thanks!

-- =

Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
