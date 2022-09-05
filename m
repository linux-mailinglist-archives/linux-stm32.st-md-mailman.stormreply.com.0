Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF275AD9F4
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 21:54:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EF7AC640FE;
	Mon,  5 Sep 2022 19:54:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56745C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 19:54:28 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d12so9295131plr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 12:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=zxa96jF7Tq2NFS5Z0f+Vbe6tPHaqlTK7+tACu1Wc1bY=;
 b=p+w40zBKb360cS3t/20RQ9fj87kNmL9+wV2DVi2rkEnZbxImbIJc7pte6gUegPMA8a
 sFBB5aUkvaOM6b3Kj9qmd2ut1NKgO+CDhyFT91dG8+KUVoVf0gInhE/UOnfhB92XkSNY
 u8qMra/sYBIyNm2Awyf4P1TWUIjbeQASP/d7P9T5CM2s7DH926t2/T3HcNVk1DoW+UGS
 v796lRquHF7Qmw7ptQ1DqA4ajtoKb1+hxfBI6rfUByvolTPU6//4uMw0nmTfqEuWbj/R
 2Evodr6uEdppBL0mwTkx6onhEejt0ETyPcrx+UWGe+X8/pqjNco8n2BX6gqU3Djw+OmE
 nbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zxa96jF7Tq2NFS5Z0f+Vbe6tPHaqlTK7+tACu1Wc1bY=;
 b=g1uDJXQKUqiMUWmp/Q7KqtsYyDXBvmiEpzdBnyAh2iGK9n5yB1r6i5ukYcps2P+5mD
 NHoScXXvhfBKu/FTPlM4Kslbv9RJUDf24QUHF964NtRfgWJMreOiLdGr/9MXbxX5Rpfo
 0n3pcGCBDQxIUjibVAShPy/swW6Gv9VDu/cVoDJGAKJuY/eZE9XgQ6wjHdQpttJwwb1k
 3aREVVMP4rRIa8MFbhc33xwsStVs6dp3FQYkuSmCNFMD9OdRYRpjKJX4n8/affrWAtmf
 +Ydf3VS0coLFGTNI5UIrMdB/5GFvJZF90Eeuufq1EI5Oa+L8D140KTzq252xFGfwxdO9
 TAbA==
X-Gm-Message-State: ACgBeo3MZMf2yQ36pB3+OBfWQmfXm18asx9xrQHuEOYyJ0uvKe9A27DU
 Yu13G/RHEH3hMnu8kym8gaA=
X-Google-Smtp-Source: AA6agR5Cv7sHKUo7MkZvN9NCQW+TEQYIAszXUVs54FMP1ugGloikm17da8wbNClAm9HOmIskUrqfng==
X-Received: by 2002:a17:903:248:b0:172:7520:db07 with SMTP id
 j8-20020a170903024800b001727520db07mr50029962plh.76.1662407666780; 
 Mon, 05 Sep 2022 12:54:26 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a170902dace00b001754a3c5404sm7987874plx.212.2022.09.05.12.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:54:26 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:54:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <YxZT7tDhW/7T+Snl@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
 <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
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

On Mon, Sep 05, 2022 at 01:47:41PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 10:02 AM Pali Roh=E1r <pali@kernel.org> wrote:
> > On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > > I would like to stop exporting OF-specific devm_gpiod_get_from_of_nod=
e()
> > > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > > device property API.
> > >
> > > I believe that the only reason the driver, instead of the standard
> > > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > > because it wanted to set up a pretty consumer name for the GPIO,
> >
> > IIRC consumer name is not used at all.
> =

> It's. The user space tools use it as a label. So, GPIO line can have
> "name" (this is provider specific) and "label" (which is consumer
> specific, i.o.w. how we use this line).
> =

> ...
> =

> > > +             if (ret !=3D -EPROBE_DEFER)
> > > +                     dev_err(dev, "Failed to get reset-gpio: %i\n",
> > > +                             ret);
> > > +             return ret;
> =

> I understand that in the input subsystem maintainer's hat you don't
> like dev_err_probe(), but it's a good case to have it here.

The driver currently does not use this API, so I elected not to
introduce it in this series.

Thanks,

-- =

Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
