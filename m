Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB08422743
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Oct 2021 14:59:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42D30C5AB7E;
	Tue,  5 Oct 2021 12:59:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF6BAC5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 12:59:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 305686124F;
 Tue,  5 Oct 2021 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633438763;
 bh=vc0AIiiG/lp+/3L1MOoDAGLKzrH8rDn2SCnuHBCQD+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0KQNPijNSHaLEfz57hoIKkXndl4fOOZwnsBH9Gby6N4c2PS658FEY7w2CMFP3zRk0
 5eFV1ExPhXdtJ1JssFVfra+vs5TqWh9ozoys6JkdEAsVA2rPweqq8OPIZdfwFTi1uz
 Sf6UoiRbkhy3RqLIrKTMbpNotQm5Ttb6Cf3uLUac=
Date: Tue, 5 Oct 2021 14:59:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YVxMKekWW0w0+qoM@kroah.com>
References: <20210930160520.19678-1-arnaud.pouliquen@foss.st.com>
 <20210930160520.19678-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930160520.19678-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Suman Anna <s-anna@ti.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 2/2] tty: add rpmsg driver
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

On Thu, Sep 30, 2021 at 06:05:20PM +0200, Arnaud Pouliquen wrote:
> This driver exposes a standard TTY interface on top of the rpmsg
> framework through a rpmsg service.
> 
> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> per rpmsg endpoint.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  Documentation/serial/tty_rpmsg.rst |  15 ++
>  drivers/tty/Kconfig                |   9 +
>  drivers/tty/Makefile               |   1 +
>  drivers/tty/rpmsg_tty.c            | 275 +++++++++++++++++++++++++++++
>  4 files changed, 300 insertions(+)
>  create mode 100644 Documentation/serial/tty_rpmsg.rst
>  create mode 100644 drivers/tty/rpmsg_tty.c
> 
> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
> new file mode 100644
> index 000000000000..b055107866c9
> --- /dev/null
> +++ b/Documentation/serial/tty_rpmsg.rst
> @@ -0,0 +1,15 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=========
> +RPMsg TTY
> +=========
> +
> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for
> +user-space programs to send and receive rpmsg messages as a standard tty protocol.
> +
> +The remote processor can instantiate a new tty by requesting a "rpmsg-tty" RPMsg service.
> +
> +The "rpmsg-tty" service is directly used for data exchange. No flow control is implemented.
> +
> +Information related to the RPMsg and associated tty device is available in
> +/sys/bus/rpmsg/devices/.


Why is this file needed?  Nothing references it, and this would be the
only file in this directory.

> diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
> index 23cc988c68a4..5095513029d7 100644
> --- a/drivers/tty/Kconfig
> +++ b/drivers/tty/Kconfig
> @@ -368,6 +368,15 @@ config VCC
>  
>  source "drivers/tty/hvc/Kconfig"
>  
> +config RPMSG_TTY
> +	tristate "RPMSG tty driver"
> +	depends on RPMSG
> +	help
> +	  Say y here to export rpmsg endpoints as tty devices, usually found
> +	  in /dev/ttyRPMSGx.
> +	  This makes it possible for user-space programs to send and receive
> +	  rpmsg messages as a standard tty protocol.

What is the module name going to be?


> +
>  endif # TTY
>  
>  source "drivers/tty/serdev/Kconfig"
> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
> index a2bd75fbaaa4..07aca5184a55 100644
> --- a/drivers/tty/Makefile
> +++ b/drivers/tty/Makefile
> @@ -26,5 +26,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
>  obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
>  obj-$(CONFIG_VCC)		+= vcc.o
> +obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
>  
>  obj-y += ipwireless/
> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
> new file mode 100644
> index 000000000000..0c99f54c2911
> --- /dev/null
> +++ b/drivers/tty/rpmsg_tty.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved

Copyright needs a year, right?

> + */
> +
> +#include <linux/module.h>
> +#include <linux/rpmsg.h>
> +#include <linux/slab.h>
> +#include <linux/tty.h>
> +#include <linux/tty_flip.h>
> +
> +#define MAX_TTY_RPMSG	32

Why have a max at all?


> +
> +static DEFINE_IDR(tty_idr);	/* tty instance id */
> +static DEFINE_MUTEX(idr_lock);	/* protects tty_idr */

I didn't think an idr needed a lock anymore, are you sure this is
needed?


> +
> +static struct tty_driver *rpmsg_tty_driver;
> +
> +struct rpmsg_tty_port {
> +	struct tty_port		port;	 /* TTY port data */
> +	int			id;	 /* TTY rpmsg index */
> +	struct rpmsg_device	*rpdev;	 /* rpmsg device */
> +};
> +
> +static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
> +{
> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
> +	int copied;
> +
> +	if (!len)
> +		return -EINVAL;

How can len be 0?


> +	copied = tty_insert_flip_string(&cport->port, data, len);
> +	if (copied != len)
> +		dev_dbg(&rpdev->dev, "Trunc buffer: available space is %d\n",
> +			copied);

Is this the proper error handling?


> +	tty_flip_buffer_push(&cport->port);

Shouldn't you return the number of bytes sent?

> +
> +	return 0;
> +}
> +
> +static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
> +{
> +	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
> +
> +	if (!cport) {
> +		dev_err(tty->dev, "Cannot get cport\n");

How can this happen?


> +		return -ENODEV;
> +	}
> +
> +	tty->driver_data = cport;
> +
> +	return tty_port_install(&cport->port, driver, tty);
> +}
> +
> +static int rpmsg_tty_open(struct tty_struct *tty, struct file *filp)
> +{
> +	return tty_port_open(tty->port, tty, filp);
> +}
> +
> +static void rpmsg_tty_close(struct tty_struct *tty, struct file *filp)
> +{
> +	return tty_port_close(tty->port, tty, filp);
> +}
> +
> +static int rpmsg_tty_write(struct tty_struct *tty, const u8 *buf, int len)
> +{
> +	struct rpmsg_tty_port *cport = tty->driver_data;
> +	struct rpmsg_device *rpdev;
> +	int msg_max_size, msg_size;
> +	int ret;
> +
> +	rpdev = cport->rpdev;
> +
> +	dev_dbg(&rpdev->dev, "Send msg from tty->index = %d, len = %d\n", tty->index, len);

ftrace is your friend, is this really still needed?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
