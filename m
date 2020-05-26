Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1391C59D5
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 16:40:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9583CC36B36;
	Tue,  5 May 2020 14:40:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61E08C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 14:40:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DB0A206B9;
 Tue,  5 May 2020 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588689616;
 bh=j/GqXoT+GQGssQ3rGRFGFL3Qfzj08wyd/Iyt+COdg2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vQRX4RZsIX+qs0WE3rk0U3eOEH1uAOv+i+v2rDbwNKAFYykV6I37Zfaitx0oUXWwm
 wtxPbEft1eIUz4BouINwCZusQpQ10+hcyUHJspFT+n8tfliHeVjyY4l+zIcs60Gf1f
 /xBEITuUyoyNppCR7aSoddeDROW8aT33JQLYQlMU=
Date: Tue, 5 May 2020 16:40:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200505144013.GB838641@kroah.com>
References: <20200505073308.22914-1-benjamin.gaignard@st.com>
 <20200505073308.22914-3-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505073308.22914-3-benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/5] bus: stm32: Introduce firewall
	controller helpers
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

On Tue, May 05, 2020 at 09:33:05AM +0200, Benjamin Gaignard wrote:
> The goal of these helpers are to offer an interface for the
> hardware blocks controlling bus accesses rights.
> 
> Bus firewall controllers are typically used to control if a
> hardware block can perform read or write operations on bus.
> 
> Smarter firewall controllers could be able to define accesses
> rights per hardware blocks to control where they can read
> or write.
> 
> Firewall controller configurations are provided in device node,
> parsed by the helpers and send to the driver to apply them.
> Each controller may need different number and type of inputs
> to configure the firewall so device-tree properties size have to
> be define by using "#firewall-cells".
> Firewall configurations properties have to be named "firewall-X"
> on device node.
> "firewall-names" keyword can also be used to give a name to
> a specific configuration.
> 
> Example of device-tree:
> ctrl0: firewall@0 {
> 	#firewall-cells = <2>;
>       };
> 
> foo: foo@0 {
> 	firewall-names = "default", "setting1";
> 	firewall-0 = <&ctrl0 1 2>;
> 	firewall-1 = <&ctrl0 3 4>;
> };
> 
> Configurations could be applied with functions like
> firewall_set_config_by_index() or firewall_set_config_by_name().
> 
> firewall_set_default_config() function will apply the
> configuration named "default" (if existing) or the configuration
> with index 0 (i.e. firewall-0).
> 
> Drivers could register/unregister themselves be calling
> firewall_register/firewall_unregister functions.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/bus/Kconfig          |   2 +
>  drivers/bus/Makefile         |   2 +
>  drivers/bus/stm32/Kconfig    |   3 +
>  drivers/bus/stm32/Makefile   |   1 +
>  drivers/bus/stm32/firewall.c | 266 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/bus/stm32/firewall.h |  75 ++++++++++++
>  6 files changed, 349 insertions(+)
>  create mode 100644 drivers/bus/stm32/Kconfig
>  create mode 100644 drivers/bus/stm32/Makefile
>  create mode 100644 drivers/bus/stm32/firewall.c
>  create mode 100644 drivers/bus/stm32/firewall.h
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index 6d4e4497b59b..843b356322d9 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -203,4 +203,6 @@ config DA8XX_MSTPRI
>  source "drivers/bus/fsl-mc/Kconfig"
>  source "drivers/bus/mhi/Kconfig"
>  
> +source "drivers/bus/stm32/Kconfig"
> +
>  endmenu
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index 05f32cd694a4..5e0e34b10235 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -37,3 +37,5 @@ obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
>  
>  # MHI
>  obj-$(CONFIG_MHI_BUS)		+= mhi/
> +
> +obj-$(CONFIG_MACH_STM32MP157) 	+= stm32/
> \ No newline at end of file
> diff --git a/drivers/bus/stm32/Kconfig b/drivers/bus/stm32/Kconfig
> new file mode 100644
> index 000000000000..57221e833e2d
> --- /dev/null
> +++ b/drivers/bus/stm32/Kconfig
> @@ -0,0 +1,3 @@
> +config FIREWALL_CONTROLLERS
> +	bool "Support of bus firewall controllers"
> +	depends on OF
> diff --git a/drivers/bus/stm32/Makefile b/drivers/bus/stm32/Makefile
> new file mode 100644
> index 000000000000..eb6b978d6450
> --- /dev/null
> +++ b/drivers/bus/stm32/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_FIREWALL_CONTROLLERS) += firewall.o
> diff --git a/drivers/bus/stm32/firewall.c b/drivers/bus/stm32/firewall.c
> new file mode 100644
> index 000000000000..95f716cf926f
> --- /dev/null
> +++ b/drivers/bus/stm32/firewall.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
> + * Author: Benjamin Gaignard <benjamin.gaignard@st.com> for STMicroelectronics.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +
> +#include "firewall.h"
> +
> +/* Mutex taken to protect firewall_list */
> +static DEFINE_MUTEX(firewall_list_mutex);
> +
> +/* Global list of firewall control devices */
> +static LIST_HEAD(firewall_list);

Why is that needed?  Why can't you just walk the list of devices on this
"bus/class" if you really wanted to?

Along those lines, why is this going around the driver model and
ignoring it?  Shouldn't this be a bus and you have devices attached to
it of the specific type?


greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
