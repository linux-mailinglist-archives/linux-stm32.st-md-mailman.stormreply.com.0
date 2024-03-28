Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22D88FAC5
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 10:10:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E552C6DD96;
	Thu, 28 Mar 2024 09:10:06 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4DB1C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 09:10:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8919FCE1B33;
 Thu, 28 Mar 2024 09:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAA8C433F1;
 Thu, 28 Mar 2024 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711617000;
 bh=buN5Ppu9AGNZtC/if8g17RcZZEQzgqGlib2VdnuWvYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OFLlSdaFgLJfwlccYTUQ07QIz60FOyuC8o6pcVV92LZbtE4gq7IAodXVpi6MWqQKD
 /P4Fl8Qvp5yVtqoZgDTztgedrMv69WkJQHT0+Txctf1PpT/Xt7GN34m4JFuIr7B2Ob
 ZenIk9jv0ixo23yCmoRslgOW7owKOyIYOaTT9eixAfQmT/MLYqxgdsDEciF2ow33fx
 8Bp/LnCK2rxFLnCW0HllcXCOe0nR3LyIMLLjxk5pVqhide4zeg+ntfoRA3RYM/BQBD
 2/XHLh2NMuIq7tdO8199Pn4n+qV0Z9Lu1bznDyMzbl74t5Y9igoKy2SgIRxUTfCqJ8
 VO6OdnuV01Mcg==
Date: Thu, 28 Mar 2024 10:09:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <bm7xoej6ihtzw63mhocvkkb7j5no2wnhztwrvvlogmuxjycviv@7frc2s3dsi5h>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-1-4517b091385b@linaro.org>
 <6p4cdmbhrezm7fqbe3kgrkblqgrhaq4fgiw5x4n5dnptii7kjp@vmbj2pkjglp7>
 <c33833ad-9102-40e6-97bf-9a4e1bf0a3d9@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c33833ad-9102-40e6-97bf-9a4e1bf0a3d9@linaro.org>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 01/19] amba: store owner from modules with
 amba_driver_register()
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

Hi Krzysztof,

> >>  /**
> >> - *	amba_driver_register - register an AMBA device driver
> >> + *	__amba_driver_register - register an AMBA device driver
> >>   *	@drv: amba device driver structure
> >> + *	@owner: owning module/driver
> >>   *
> >>   *	Register an AMBA device driver with the Linux device model
> >>   *	core.  If devices pre-exist, the drivers probe function will
> >>   *	be called.
> >>   */
> >> -int amba_driver_register(struct amba_driver *drv)
> >> +int __amba_driver_register(struct amba_driver *drv,
> > 
> > ...
> > 
> >> +/*
> >> + * use a macro to avoid include chaining to get THIS_MODULE
> >> + */
> > 
> > Should the documentation be moved here? Well... I don't see any
> > documentation linking this file yet, but in case it comes we want
> > documented amba_driver_register() rather than
> > __amba_driver_register().
> > 
> 
> That's just a wrapper, not API... why would we care to have kerneldoc
> for it?

Because everyone should use the wrapper while the real function
will be used only once or twice.

I see also that this is a common practice which I don't surely
like.

In any case there is no documentation exported for AMBA so that
this discussion does not bring any tangible benefit.

So that, considering that it's a good improvement,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
