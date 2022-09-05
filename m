Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7A55AD139
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 13:13:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77248C640F0;
	Mon,  5 Sep 2022 11:13:46 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 425E3C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 11:13:45 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id c6so3833385qvn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7iAktJHc3w6rPsnzClYi6h63eWPfDzaVzHqTBIckRp4=;
 b=R7t2Qcp1lBflY1vcWSAvFGDpL1wm70fCepnWH+zrAbiof4E0R0r6MaodmK99KC/uqU
 lkRNi47VWEdS1Mh0Cq7rMIeuWmncJJ2cOty+OFE/rSCBYVUer1tDhNIt1xJajNoN+pha
 9hYFjgcUDhUv9vg4Rsjx4Td0f/j+c8XAElCdXPkz1XbyGCnZFSRjvecB8Dt/V/2ytwns
 pr0+QJCk5ml5PiGLXoq+OBMZT8nSbzyKkmBD4jlfWYYC6/a2AVD44sThrAdLIlOLbLDI
 BjJuCJ4ppbMAAjAsrBVEK+NW8M6uu3+DQvsU1sl/6kNwDh7BxhDa793GpPoaKD+rDvK/
 /Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7iAktJHc3w6rPsnzClYi6h63eWPfDzaVzHqTBIckRp4=;
 b=4zN3V+udVyMP2JKqdC/V7oquTjkEqlpvJprX0hR1v6dU0l80SRaoRHLE1NiDxf/x7D
 GyQDFkz6cO/Y8MYFCbYap9qB9LJMvf9757rduY4AEsXWhxoPPJBbVRkkWXottAL7vsQ7
 kbNrZN6+Hp6eWHyv0KghnFFKSiQyyI3L8ylr0P2z2mCDygp2oBo1V7VZebvrlLIcvJd2
 qbViINfeoctxCV5zAFH5PniaGJ1JtvLkvHHnKAwQwEEP/asEb5bC9S7hW4uMAe6DheB3
 z2hTA/Y8x8hHNxLwmJVXZh7n8MFWyFbQK6TqO5qK1qP15j3K1g2yLUGe2dvmGRRYKzh1
 kkew==
X-Gm-Message-State: ACgBeo095E6OuoEzBTSEfzCK2I/jzDNtqsiNn3mY1hVLz7yd3Y0APoBr
 RrxY+1EhDW001L/Fj1XE5rMqqlxdwglBGr6BgS0=
X-Google-Smtp-Source: AA6agR7NrRmeK1sjqt1ZjgVXwez7kxeuRCTCLwTPPcAUxaHLOiRLXkVvjX6xUtf8npwaMKmSjSHhnRIt4pJmIe7SA1s=
X-Received: by 2002:a05:6214:19cf:b0:4a9:4241:2399 with SMTP id
 j15-20020a05621419cf00b004a942412399mr1093930qvc.64.1662376424240; Mon, 05
 Sep 2022 04:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 14:13:08 +0300
Message-ID: <CAHp75Vc5cEs6mPSL1fkHBT2hw-CbmbELFwkEGvwxkrdEVF2K_Q@mail.gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
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
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 00/11] Get rid of
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit. We can do that by switching drivers
> to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
> the door to augmenting device tree and ACPI information through secondary
> software properties (once we teach gpiolib how to handle those).
>
> I hope that relevant maintainers will take patches through their trees and
> then we could merge the last one some time after -rc1.

I'm in favour of the series, but some comments would be good to be addressed.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
