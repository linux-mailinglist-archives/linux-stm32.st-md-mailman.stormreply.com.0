Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082F5AE813
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 14:27:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A514AC63326;
	Tue,  6 Sep 2022 12:27:48 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F095C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 12:27:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="322753388"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="322753388"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 05:27:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="565074197"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 05:27:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andy.shevchenko@gmail.com>) id 1oVXfv-00975d-2X;
 Tue, 06 Sep 2022 15:27:31 +0300
Date: Tue, 6 Sep 2022 15:27:31 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <Yxc8s8IfzElm/mjS@smile.fi.intel.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
 <YxZTS3Nl1YaMGoBC@google.com>
 <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
 <4a0d089d-6ac6-b92e-6ac7-3d3de0144b4b@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a0d089d-6ac6-b92e-6ac7-3d3de0144b4b@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 USB <linux-usb@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 04/11] usb: phy: tegra: switch to using
 devm_gpiod_get()
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

On Mon, Sep 05, 2022 at 03:07:48PM -0700, Guenter Roeck wrote:
> On 9/5/22 12:55, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 10:51 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > > > > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > > > > <dmitry.torokhov@gmail.com> wrote:

...

> > > > > > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > > > > > +                                      GPIOD_OUT_HIGH);
> > > > > > >                  err = PTR_ERR_OR_ZERO(gpiod);
> > > > > > 
> > > > > > What does _OR_ZERO mean now?
> > > > > 
> > > > > This converts a pointer to an error code if a pointer represents
> > > > > ERR_PTR() encoded error, or 0 to indicate success.
> > > > 
> > > > Yes, I know that. My point is, how is it useful now (or even before)?
> > > > I mean that devm_gpio_get() never returns NULL, right?
> > > 
> > > What does returning NULL have to do with anything.
> > 
> > It has to do with a dead code. If defm_gpiod_get() does not return
> > NULL, then why do we even bother to check?
> 
> PTR_ERR_OR_ZERO() converts into an error code (if the pointer is an
> ERR_PTR) or 0 if it is a real pointer. Its purpose is not to convert
> NULL into 0, its purpose is to convert a pointer either into an error
> code or 0. That is what is done here, and it is done all over the place
> in the kernel. I don't see your problem with it. Care to explain ?
> 
> > > It converts a pointer
> > > to a "classic" return code, with negative errors and 0 on success.
> > > 
> > > It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
> > > IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).
> > 
> > I don't see how this is relevant.
> 
> You lost me. Really, please explain your problem with PTR_ERR_OR_ZERO().

I don't know what I was thinking about... You, guys, are right, sorry for
my noise.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
