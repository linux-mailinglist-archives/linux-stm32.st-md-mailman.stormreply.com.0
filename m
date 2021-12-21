Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0280447BBA1
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Dec 2021 09:18:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4EA6C5E2D4;
	Tue, 21 Dec 2021 08:18:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11036C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 08:18:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF19061465;
 Tue, 21 Dec 2021 08:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1161C36AE7;
 Tue, 21 Dec 2021 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640074708;
 bh=vrx6RPSDmWAICZO/O856wjjtSS7R7umwCZ+joXnTXy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f2fbqHayxI5zE8rz7XssFncNFlkheTrC0qEaUpbufP9D9nhnmrUkTSTw4Fd3KzNzw
 XvDaug56XhG1VsIE0IDzOOaRQiMo3IR70nij7cfM1Gse1OCuIQ72t7al9hpTAAoPXG
 EmRiiBLfpv7UZXc9K41Jl5l0+8LPNyGRwQhRcf6g=
Date: Tue, 21 Dec 2021 09:18:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YcGN0fDn2hqAdrP9@kroah.com>
References: <20211215153121.30010-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215153121.30010-1-arnaud.pouliquen@foss.st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3] tty: rpmsg: Fix race condition
	releasing tty port
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

On Wed, Dec 15, 2021 at 04:31:21PM +0100, Arnaud Pouliquen wrote:
> The tty_port struct is part of the rpmsg_tty_port structure.
> The issue is that the rpmsg_tty_port structure is freed on
> rpmsg_tty_remove while it is still referenced in the tty_struct.
> Its release is not predictable due to workqueues.
> 
> For instance following ftrace shows that rpmsg_tty_close is called after
> rpmsg_tty_release_cport:
> 
>      nr_test.sh-389     [000] .....   212.093752: rpmsg_tty_remove <-rpmsg_dev_
> remove
>              cat-1191    [001] .....   212.095697: tty_release <-__fput
>       nr_test.sh-389     [000] .....   212.099166: rpmsg_tty_release_cport <-rpm
> sg_tty_remove
>              cat-1191    [001] .....   212.115352: rpmsg_tty_close <-tty_release
>              cat-1191    [001] .....   212.115371: release_tty <-tty_release_str
> 
> As consequence, the port must be free only when user has released the TTY
> interface.
> 
> This path :
> - Introduce the .destruct port ops function to release the allocated
>   rpmsg_tty_port structure.
> - Manages the tty port refcounting to trig the .destruct port ops,
> - Introduces the rpmsg_tty_cleanup function to ensure that the TTY is
>   removed before decreasing the port refcount.
> - Uses tty_vhangup and tty_port_hangup instead of tty_port_tty_hangup.

Shouldn't this hangup change be a separate change?

> 
> Fixes: 7c0408d80579 ("tty: add rpmsg driver")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> delta vs V2: taking into account Jiri Slaby's comments:
>  - Inline rpmsg_tty_release_cport in rpmsg_tty_destruct_port,
>  - call tty_port_put in case of error in rpmsg_tty_probe,
>  - use tty_port_get port return in rpmsg_tty_install to take into account
>    NULL port return case.
> 
> Applied and tested on fa55b7dcdc43 ("Linux 5.16-rc1", 2021-11-14)
> ---
>  drivers/tty/rpmsg_tty.c | 49 +++++++++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
> index dae2a4e44f38..cdc590c63f03 100644
> --- a/drivers/tty/rpmsg_tty.c
> +++ b/drivers/tty/rpmsg_tty.c
> @@ -50,10 +50,21 @@ static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *p
>  static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
>  {
>  	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
> +	struct tty_port *port = tty->port;
>  
>  	tty->driver_data = cport;
>  
> -	return tty_port_install(&cport->port, driver, tty);
> +	port = tty_port_get(&cport->port);
> +	return tty_port_install(port, driver, tty);
> +}
> +
> +static void rpmsg_tty_cleanup(struct tty_struct *tty)
> +{
> +	struct tty_port *port = tty->port;
> +
> +	WARN_ON(!port);

How can this ever trigger?  Shouldn't you do something if it can?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
