Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FB42ABA3
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Oct 2021 20:07:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21C73C5C834;
	Tue, 12 Oct 2021 18:07:32 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28320C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Oct 2021 18:07:28 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id q12so13882468pgq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Oct 2021 11:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rMd1IaPeCuFrQobeBMJaKkh6bQtA9AR/auByeNqJ+RQ=;
 b=S3hyd+VwcMOzJ2wNAL4Lp/F5Gp4nQRZExwedW78SfOusSVgVnIrWkpCirTVVvlaCu7
 b8hX75+zBfprcY7gBEc4dJ1nO5t5JKei5LNICqySHsKH4AliRSlgtyVpxknry0RH6VTH
 IRd4FOhhZyZjHhsvWfstMMyUvcC3ylNxDTrhCa17hGJshwIijGm2nmbaw2T4rfnOyiQj
 o6rI0xW+cRsS/X/hn+0k0Hc+zCaXRsXtSBjmIEjsCm4640HuHJlpOlsoAO1cCXlLKppa
 mW9+H3YuNLG61QqKXzIkMyv9R6Vo1kIap6pE0TqUc9Vzg+CbUg38SwSN+Uc7Zr+Tbyvu
 iWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rMd1IaPeCuFrQobeBMJaKkh6bQtA9AR/auByeNqJ+RQ=;
 b=uVd1AoLjybz7pITyQVDTFbk4QuQnBMIBR8s9GcQ5lvreRl7Atua1iiAVT7C7/8pNo7
 lqcc2+pKqsCwrVfuTn50aTJZ7NODZr3z8KrjNLKRXt+UcxPqS/g9IKWpmUVp2XdSLqGq
 621WnUjjgc8jxYivudKM0+99kuXBsTumVqMOsRcrNrNf9t0KfkF+CTEyQLFapoRJGest
 UL7mBxbitRe6/1rZ914y3XFQdUPV4fNtNEHq5CzOAQDKEiTYBAX9ZNqUMoi1UG/cllkR
 vmgTu7Ck9pwBxw5fjphBvp7Dhqkhr2+9DzXYCrphQrSDkODBq6QeKsTiRvPWYxlrTf0A
 Nnnw==
X-Gm-Message-State: AOAM530UHxCfV+U7ZrDfNnveQ+tRNfby+k/dUKHr+cCxeSi3B5E+kkQN
 +Kl6q2JrBrQikEgY1x+FIBSmHA==
X-Google-Smtp-Source: ABdhPJxTdbvMeegWk+dJtZYVHNS0MUiwCZX/EWGA6FGVaAvtkMyxjCTjsEBxTVoPrcHU3Bd9gQ9wAA==
X-Received: by 2002:a62:b50d:0:b0:44b:b81f:a956 with SMTP id
 y13-20020a62b50d000000b0044bb81fa956mr32359669pfe.27.1634062046894; 
 Tue, 12 Oct 2021 11:07:26 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id o5sm3499682pjg.40.2021.10.12.11.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 11:07:25 -0700 (PDT)
Date: Tue, 12 Oct 2021 12:07:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211012180723.GC4010675@p14s>
References: <20211008153446.23188-1-arnaud.pouliquen@foss.st.com>
 <20211008153446.23188-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211008153446.23188-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v9 2/2] tty: add rpmsg driver
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

On Fri, Oct 08, 2021 at 05:34:46PM +0200, Arnaud Pouliquen wrote:
> This driver exposes a standard TTY interface on top of the rpmsg
> framework through a rpmsg service.
> 
> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> per rpmsg endpoint.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> Update from V8
> => Update based on Greg Greg Kroah-Hartman comments:
>  - add module name in kconfig
>  - remove the tty_rpmsg.rst documentation file and add description in
>    rpmsg_tty.c.
>  - rpmsg_tty.c remove of useless check and logs.
>  - print err log instead of debug log on truncated RX buffer.
> ---
>  drivers/tty/Kconfig     |  12 ++
>  drivers/tty/Makefile    |   1 +
>  drivers/tty/rpmsg_tty.c | 275 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 288 insertions(+)
>  create mode 100644 drivers/tty/rpmsg_tty.c
> 
> diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
> index 23cc988c68a4..cc30ff93e2e4 100644
> --- a/drivers/tty/Kconfig
> +++ b/drivers/tty/Kconfig
> @@ -368,6 +368,18 @@ config VCC
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
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called rpmsg_tty.
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
> index 000000000000..226a13f6ef94
> --- /dev/null
> +++ b/drivers/tty/rpmsg_tty.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 STMicroelectronics - All Rights Reserved
> + *
> + * The rpmsg tty driver implements serial communication on the RPMsg bus to makes
> + * possible for user-space programs to send and receive rpmsg messages as a standard
> + * tty protocol.
> + *
> + * The remote processor can instantiate a new tty by requesting a "rpmsg-tty" RPMsg service.
> + * The "rpmsg-tty" service is directly used for data exchange. No flow control is implemented yet.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/rpmsg.h>
> +#include <linux/slab.h>
> +#include <linux/tty.h>
> +#include <linux/tty_flip.h>
> +
> +#define MAX_TTY_RPMSG	32
> +
> +static DEFINE_IDR(tty_idr);	/* tty instance id */
> +static DEFINE_MUTEX(idr_lock);	/* protects tty_idr */
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
> +	copied = tty_insert_flip_string(&cport->port, data, len);
> +	if (copied != len)
> +		dev_err(&rpdev->dev, "Trunc buffer: available space is %d\n",
> +			copied);
> +	tty_flip_buffer_push(&cport->port);
> +
> +	return 0;
> +}
> +
> +static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
> +{
> +	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
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
> +	msg_max_size = rpmsg_get_mtu(rpdev->ept);
> +	if (msg_max_size < 0)
> +		return msg_max_size;
> +
> +	msg_size = min(len, msg_max_size);
> +
> +	/*
> +	 * Use rpmsg_trysend instead of rpmsg_send to send the message so the caller is not
> +	 * hung until a rpmsg buffer is available. In such case rpmsg_trysend returns -ENOMEM.
> +	 */
> +	ret = rpmsg_trysend(rpdev->ept, (void *)buf, msg_size);
> +	if (ret) {
> +		dev_dbg(&rpdev->dev, "rpmsg_send failed: %d\n", ret);

I'm with Greg on this one.  Event if it's a dev_dbg() something like this could
quickly fill the logs.  Customers should learn to use ftrace.  At the very least
please use the ratelimited() version.  Same comment applies to rpmsg_tty_cb().

Otherwise:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +		return ret;
> +	}
> +
> +	return msg_size;
> +}
> +
> +static unsigned int rpmsg_tty_write_room(struct tty_struct *tty)
> +{
> +	struct rpmsg_tty_port *cport = tty->driver_data;
> +	int size;
> +
> +	size = rpmsg_get_mtu(cport->rpdev->ept);
> +	if (size < 0)
> +		return 0;
> +
> +	return size;
> +}
> +
> +static const struct tty_operations rpmsg_tty_ops = {
> +	.install	= rpmsg_tty_install,
> +	.open		= rpmsg_tty_open,
> +	.close		= rpmsg_tty_close,
> +	.write		= rpmsg_tty_write,
> +	.write_room	= rpmsg_tty_write_room,
> +};
> +
> +static struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
> +{
> +	struct rpmsg_tty_port *cport;
> +	int err;
> +
> +	cport = kzalloc(sizeof(*cport), GFP_KERNEL);
> +	if (!cport)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_lock(&idr_lock);
> +	cport->id = idr_alloc(&tty_idr, cport, 0, MAX_TTY_RPMSG, GFP_KERNEL);
> +	mutex_unlock(&idr_lock);
> +
> +	if (cport->id < 0) {
> +		err = cport->id;
> +		kfree(cport);
> +		return ERR_PTR(err);
> +	}
> +
> +	return cport;
> +}
> +
> +static void rpmsg_tty_release_cport(struct rpmsg_tty_port *cport)
> +{
> +	mutex_lock(&idr_lock);
> +	idr_remove(&tty_idr, cport->id);
> +	mutex_unlock(&idr_lock);
> +
> +	kfree(cport);
> +}
> +
> +static const struct tty_port_operations rpmsg_tty_port_ops = { };
> +
> +static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_tty_port *cport;
> +	struct device *dev = &rpdev->dev;
> +	struct device *tty_dev;
> +	int ret;
> +
> +	cport = rpmsg_tty_alloc_cport();
> +	if (IS_ERR(cport)) {
> +		dev_err(dev, "Failed to alloc tty port\n");
> +		return PTR_ERR(cport);
> +	}
> +
> +	tty_port_init(&cport->port);
> +	cport->port.ops = &rpmsg_tty_port_ops;
> +
> +	tty_dev = tty_port_register_device(&cport->port, rpmsg_tty_driver,
> +					   cport->id, dev);
> +	if (IS_ERR(tty_dev)) {
> +		dev_err(dev, "Failed to register tty port\n");
> +		ret = PTR_ERR(tty_dev);
> +		goto  err_destroy;
> +	}
> +
> +	cport->rpdev = rpdev;
> +
> +	dev_set_drvdata(dev, cport);
> +
> +	dev_dbg(dev, "New channel: 0x%x -> 0x%x : ttyRPMSG%d\n",
> +		rpdev->src, rpdev->dst, cport->id);
> +
> +	return 0;
> +
> +err_destroy:
> +	tty_port_destroy(&cport->port);
> +	rpmsg_tty_release_cport(cport);
> +
> +	return ret;
> +}
> +
> +static void rpmsg_tty_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
> +
> +	dev_dbg(&rpdev->dev, "Removing rpmsg tty device %d\n", cport->id);
> +
> +	/* User hang up to release the tty */
> +	if (tty_port_initialized(&cport->port))
> +		tty_port_tty_hangup(&cport->port, false);
> +
> +	tty_unregister_device(rpmsg_tty_driver, cport->id);
> +
> +	tty_port_destroy(&cport->port);
> +	rpmsg_tty_release_cport(cport);
> +}
> +
> +static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
> +	{ .name	= "rpmsg-tty" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_tty_id_table);
> +
> +static struct rpmsg_driver rpmsg_tty_rpmsg_drv = {
> +	.drv.name	= KBUILD_MODNAME,
> +	.id_table	= rpmsg_driver_tty_id_table,
> +	.probe		= rpmsg_tty_probe,
> +	.callback	= rpmsg_tty_cb,
> +	.remove		= rpmsg_tty_remove,
> +};
> +
> +static int __init rpmsg_tty_init(void)
> +{
> +	int err;
> +
> +	rpmsg_tty_driver = tty_alloc_driver(MAX_TTY_RPMSG, TTY_DRIVER_REAL_RAW |
> +					    TTY_DRIVER_DYNAMIC_DEV);
> +	if (IS_ERR(rpmsg_tty_driver))
> +		return PTR_ERR(rpmsg_tty_driver);
> +
> +	rpmsg_tty_driver->driver_name = "rpmsg_tty";
> +	rpmsg_tty_driver->name = "ttyRPMSG";
> +	rpmsg_tty_driver->major = 0;
> +	rpmsg_tty_driver->type = TTY_DRIVER_TYPE_CONSOLE;
> +
> +	/* Disable unused mode by default */
> +	rpmsg_tty_driver->init_termios = tty_std_termios;
> +	rpmsg_tty_driver->init_termios.c_lflag &= ~(ECHO | ICANON);
> +	rpmsg_tty_driver->init_termios.c_oflag &= ~(OPOST | ONLCR);
> +
> +	tty_set_operations(rpmsg_tty_driver, &rpmsg_tty_ops);
> +
> +	err = tty_register_driver(rpmsg_tty_driver);
> +	if (err < 0) {
> +		pr_err("Couldn't install rpmsg tty driver: err %d\n", err);
> +		goto error_put;
> +	}
> +
> +	err = register_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
> +	if (err < 0) {
> +		pr_err("Couldn't register rpmsg tty driver: err %d\n", err);
> +		goto error_unregister;
> +	}
> +
> +	return 0;
> +
> +error_unregister:
> +	tty_unregister_driver(rpmsg_tty_driver);
> +
> +error_put:
> +	tty_driver_kref_put(rpmsg_tty_driver);
> +
> +	return err;
> +}
> +
> +static void __exit rpmsg_tty_exit(void)
> +{
> +	unregister_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
> +	tty_unregister_driver(rpmsg_tty_driver);
> +	tty_driver_kref_put(rpmsg_tty_driver);
> +	idr_destroy(&tty_idr);
> +}
> +
> +module_init(rpmsg_tty_init);
> +module_exit(rpmsg_tty_exit);
> +
> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>");
> +MODULE_DESCRIPTION("remote processor messaging tty driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
