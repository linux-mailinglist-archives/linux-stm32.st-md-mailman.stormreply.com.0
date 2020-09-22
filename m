Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AA274589
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Sep 2020 17:40:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 195D8C3FAD4;
	Tue, 22 Sep 2020 15:40:24 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FDDBC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:40:21 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t18so17738616ilp.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 08:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8GdJRN6siN1K/3VUt/RzQ7dwFh0PUHODAfHPAkJXVec=;
 b=JJf+A9Fyjsgk+PoOLYgzWpWTUjXAdW5Aj2lN3qbGATFCCgTYzhkJgRGCfyF5g/HE6d
 MB19FLnRi3sb8PqbiCdOrQaVfwc4O5hQrWI856M1CoFSh63h5TN+wd5FUJPCPPsuoXFi
 WUt5h02oMSBQdRNGEivTCvopmH8AQ7+kPjEB5Jy6XdAuDO0l5GLauoSD37dqx4+lymwk
 3zNeis36jm732NgnaKXDibWul9NC6y6FW0ZlxAFwfGKfPzIKr7wIiB5jG8ap0axmknx3
 YUGWaUjB+nHPtabk46JIiXzsnJXs++aWNPWk6TVII0mg8Q7wK5LAI55scKaadiBVxpvT
 yQdg==
X-Gm-Message-State: AOAM531QzpYJ5KT6ARZMh3J3bbXGgqS7jg14jz067SX/kajqRGINuw3T
 DLA75/oQmNRA5ZqUitvwxw==
X-Google-Smtp-Source: ABdhPJyREJxSIdBKii6r07HwAtgscFY+xZM0Hzr/ADdWxpwvmnoH8SQzW6oBqLEpp2gzISGF/n+Kjw==
X-Received: by 2002:a92:b503:: with SMTP id f3mr4935318ile.23.1600789220548;
 Tue, 22 Sep 2020 08:40:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id e4sm7533543iom.14.2020.09.22.08.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 08:40:19 -0700 (PDT)
Received: (nullmailer pid 2730094 invoked by uid 1000);
 Tue, 22 Sep 2020 15:40:18 -0000
Date: Tue, 22 Sep 2020 09:40:18 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200922154018.GA2657058@bogus>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
 <20200920193915.GA31074@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200920193915.GA31074@kozik-lap>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 01/13] dt-bindings: gpio: add common
 schema for GPIO controllers
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

On Sun, Sep 20, 2020 at 09:39:15PM +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 18, 2020 at 08:30:02AM -0600, Rob Herring wrote:
> > On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > > controllers.  The schema enforces proper naming of GPIO controller nodes
> > > and GPIO hogs.
> > 
> > Did you not see my previous reply about a common schema? We already
> > have a common GPIO and hog schema in dtschema. Please add to it
> > whatever is missing.
> 
> Indeed, I'll enhance the dt-schema.
> 
> The trouble is that each in-kernel YAML file still has to mention
> possible gpio-hogs nodes. Is the proper solution to put them in common
> YAML inside kernel sources?

Currently, the gpio.yaml schema is applied to all nodes. That has the 
advantage that GPIO related properties are always checked whether we 
have a device specific schema or not. It has the disadvantage that you 
can't do some constraints like required properties or what's in child 
nodes.

We could (and probably should) change it to be referenced by specific 
gpio controller schemas like we do for i2c, spi, etc. Then you can 
define required properties there and do something like:

"-hogs$":
  type: object
  $ref: gpio-hogs.yaml#


> > My goal is all common schema end up in dtschema, but I haven't pushed
> > folks to do that yet. Ones I've done are there though. One issue is
> > what's in dtschema should be GPL/BSD and the existing text bindings
> > are default GPL, so there's a relicensing exercise. In some cases, the
> > schema is there but I haven't copied over the descriptions.
> 
> Right, I'll skip the descriptions when posting to dt-schema.

I was hoping someone would add the descriptions. :)

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
