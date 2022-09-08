Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFA75B1743
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 10:38:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A49B4C6334A;
	Thu,  8 Sep 2022 08:38:44 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AA23C63327
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 08:38:43 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id bj12so36288940ejb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 01:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=SqPML+unsouuIp4FVHK4Uf7DFvDcdAzoCu01LQ5xtJU=;
 b=SAoPOQWnZqu89mgLfBmiK5MrA8YCX5o9aGmYu4qqPNVoBkVnERkpNhCjHVCDQ9Zla1
 dwqjtxWA+cJ6EDML6KOuvVZ4R6NIPdCxT8QAEB80mIcXpDf2Zf9m7S4FsFoMJ51USitH
 Qd1pfZ4aI8HWIB9O1qt8jwZQ6YhUw0CUeBplhf899+yVwxpGxiGqmmXQn83Kl/G4s1eI
 C+ZSChYFtQHAmgSz+vgZPMqj3wcCWnPZrWj/U9r/3gRuxpP0SGbraorsJPs29Q973tKF
 kAzOfKhkV3IcUs1n2dwba5aeil8pWoUhDW7HjrjRLDXn9ByPmVyCvnNoBZTuKajNSFhw
 VwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SqPML+unsouuIp4FVHK4Uf7DFvDcdAzoCu01LQ5xtJU=;
 b=4gm573dMx/DDxryN3mR4gzn/6uW3jPRWL9o+Hzjs7UTvs68UfuwmeWXBcdPepYNnmi
 KxbryrA0gko25N4yMZeuZ3DX95/1zJ/QFcYnYtmVVGzSLtwPj6HBADrKEvn36/AEvgtR
 N/vI54p1oLJrCWHl5d+GLK1LbQt5x5ZOG8mlZjhB+UxKJPN09UjKxCml3mSzcWUDkW9P
 WS4cIa6kMPjkfLYPhkfq+jPrPpwWgLWxKbaQ/xMUeyzwr9Bl1uuS3fWFiSINTF/JQ4qJ
 zHCvhdIWR86218F1O073ScJZAYHa+zTJP13MCtUs3jQa2Wd3W3RJn5zqV4YziAFWXgey
 vc/w==
X-Gm-Message-State: ACgBeo1KOCmX9Rs+S5TCaICzpc2M4u4ToVAoO9I+gXcjUqbK3QeYDh/B
 8wJgVvciG4tbOLj3IC1+UTHxX4ievSZB4jNU9SPPuw==
X-Google-Smtp-Source: AA6agR5Qlu6bHigQRlsF7FnyAifGVWu07Yimovaj6W3A7lzSYgEVwFSZi08eyLAuAWp+B7C3eLgpufDg+xQ7EBPkK+Y=
X-Received: by 2002:a17:907:a420:b0:765:70a4:c101 with SMTP id
 sg32-20020a170907a42000b0076570a4c101mr5281501ejc.526.1662626322796; Thu, 08
 Sep 2022 01:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:38:31 +0200
Message-ID: <CACRpkdaeQFP+H786D=SG4s+sQmxScUzve-uWkm-Sg7xFDK_Syw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v1 10/11] watchdog: bd9576_wdt: switch to
	using devm_fwnode_gpiod_get()
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

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
>
> While at it switch the rest of the calls to read properties in
> bd9576_wdt_probe() to the generic device property API as well.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
