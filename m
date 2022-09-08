Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D91B5B170F
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 10:32:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17F1EC63328;
	Thu,  8 Sep 2022 08:32:39 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7962C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 08:32:37 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gh9so14439678ejc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jfNxp3kBTvkWQp+z++yGCicLFIdP3WSDrE1bvSJvPmY=;
 b=N7OrHuhPmgpLtKe7tnHDZ7RwDs9JtGDJ1pEZAugqax5yV6+dKsP1g39dwektERtKK9
 CqiUuFQqXSSuUbo+lbqds7kHNQyuAL/Veez+V9HFOwJssWjKLEA54Jx+xvOnWdZg1gU6
 JOxfP/9/NxYiQrnLd3UxjZHv8TMQ+wgHt7KdSXV0V6cbJmW4D2Gwb7ov2pd9SlH66fj6
 WijmIrNii/pRVcLStzTngeZFuroX0sCBHB94+ZwmirZBSIfw1kFdXAtYlaSw1bazNWqB
 9cSY6xpglQGMGo0jkZGZJzkv20FP4T7zRyAO/IH7JbUYsvCN+q3yaVGE1LQNbtGUJdZX
 OmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jfNxp3kBTvkWQp+z++yGCicLFIdP3WSDrE1bvSJvPmY=;
 b=FPwvhXwTYIHKjrMWVySvBeagdh26Kl13jBvz3g3UxPMb19Mc5/S3rTP3hRBDnms9VC
 lAVyr+2HODrU/krUewfNMsfuoRYVJnM5l3waipqUWKEDYLh/9+nUuo89Rfyu61eXAAzw
 8q9tLP/w6Iz4sL5YLdDL3h03lDi4+ZXwtd1lXUnzo9g+2wiGA0WKcRrPGI5vbLRcKl4h
 p3V4detXIn9G5p3ANo5vSUbFYkg4GGk944Qbz1n+i+V/+jfgklnuloicVAG2h36lzidD
 YobIE/a2U4YbDmv/Oimkat71sWl9FyPcJ9OMQ4d/cPFJ7zrchId09ZsPpOgwXWmvsKDC
 TP4g==
X-Gm-Message-State: ACgBeo2XWeqALpSA53KVVV/aouZWk5nmKhMYBQ96raLV/ZMJftFfaWB0
 5yrtD2g7nPyEpYjOhTsu3hOxsC+5aY4slRbzWBKGeQ==
X-Google-Smtp-Source: AA6agR5Pikao0PJyi3RWxDK9ckpLNq+5mIIPSLz2103lmxoJTGOdaR+FFIYnzUMOtVhVwUgnD2qSZsn8UUkJGH1BEqg=
X-Received: by 2002:a17:907:1690:b0:770:80d4:ec4c with SMTP id
 hc16-20020a170907169000b0077080d4ec4cmr4628049ejc.690.1662625957353; Thu, 08
 Sep 2022 01:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:32:26 +0200
Message-ID: <CACRpkdY_TrA7DB1AkQhNALbAdMdw+T2PkA4+s9ORUNAA--DZEg@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> device property API.
>
> I believe that the only reason the driver, instead of the standard
> devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> because it wanted to set up a pretty consumer name for the GPIO,
> and we now have a special API for that.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
