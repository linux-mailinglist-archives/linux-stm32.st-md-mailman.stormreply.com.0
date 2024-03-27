Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A36BA88F02A
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 21:33:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 543B4C6DD96;
	Wed, 27 Mar 2024 20:33:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFE56C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 20:33:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A40AD616D6;
 Wed, 27 Mar 2024 20:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9259EC433C7;
 Wed, 27 Mar 2024 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711571634;
 bh=rRoyxu+FoVr32d7zvCeJuaO1U99AvdvpOp4sRPoaSLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dZ0g5TlnUCghieJAW72UqUaU2lIIa/6hghcAqkJRZAp+RAq+3k/cZrZ57l5R7MeS2
 TydlAKSSQZUnX+2T5p1QS75hSb72ep8uZvS/x07UsQuKkRaXozLuiQ0reoMN09MVC8
 AIK6Ya8Aa/GiLS6827G4A7k8iVR6n5FNoOkhGY6DIqxoyQnxgT9oM/f23Oobo45pBa
 WF66wSLY55QRYVhJdi8lQ1xKf9Ll6pqUD/1Abem9ZnyOidBaUuBaPLe5kxgZp4idaY
 mSVgD8WJLridM75HDggtZeiLIOBIWZlD7LDMZcPES6jUj0d8jxODqikoVKY0tFlHTX
 WAhfAy2yOWKcw==
Date: Wed, 27 Mar 2024 21:33:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <6p4cdmbhrezm7fqbe3kgrkblqgrhaq4fgiw5x4n5dnptii7kjp@vmbj2pkjglp7>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-1-4517b091385b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-1-4517b091385b@linaro.org>
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

...

>  /**
> - *	amba_driver_register - register an AMBA device driver
> + *	__amba_driver_register - register an AMBA device driver
>   *	@drv: amba device driver structure
> + *	@owner: owning module/driver
>   *
>   *	Register an AMBA device driver with the Linux device model
>   *	core.  If devices pre-exist, the drivers probe function will
>   *	be called.
>   */
> -int amba_driver_register(struct amba_driver *drv)
> +int __amba_driver_register(struct amba_driver *drv,

...

> +/*
> + * use a macro to avoid include chaining to get THIS_MODULE
> + */

Should the documentation be moved here? Well... I don't see any
documentation linking this file yet, but in case it comes we want
documented amba_driver_register() rather than
__amba_driver_register().

Andi

> +#define amba_driver_register(drv) \
> +	__amba_driver_register(drv, THIS_MODULE)
> +
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
