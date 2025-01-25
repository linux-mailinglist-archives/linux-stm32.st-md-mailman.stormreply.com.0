Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C7A1C209
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jan 2025 08:14:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 279B7C78F90;
	Sat, 25 Jan 2025 07:14:04 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75B5AC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 07:13:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 56C08A40C8D;
 Sat, 25 Jan 2025 07:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BB8C4CED6;
 Sat, 25 Jan 2025 07:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1737789235;
 bh=zQO/rI+Tx589OS8M0rrdAc9eToBiAckJZ3rbpXLpn1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fBywUHZTtC+wJUuhuEHCVHAipdm6rADLMPA0DWazeLQyGS8req6ZFLJ57ClkQ3VaR
 2G83XE8HKYq9NQwLfuF7iyqNx6IiLlDadzDN7+eCFT417rawl7SiIyD9eVvMVtqhEX
 2/x5zJINmqgGu6gvDrMutxYfnS8Zp0+T5tAexCcs=
Date: Sat, 25 Jan 2025 08:13:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <2025012543-unpaired-cartridge-c221@gregkh>
References: <20250124173325.2747710-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250124173325.2747710-1-fabrice.gasnier@foss.st.com>
Cc: hminas@synopsys.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] usb: dwc2: gadget: remove of_node
	reference upon udc_stop
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

On Fri, Jan 24, 2025 at 06:33:25PM +0100, Fabrice Gasnier wrote:
> In dwc2_hsotg_udc_start(), e.g. when binding composite driver, "of_node"
> is set to hsotg->dev->of_node.
> 
> It causes errors when binding the gadget driver several times, on
> stm32mp157c-ev1 board. Below error is seen:
> "pin PA10 already requested by 49000000.usb-otg; cannot claim for gadget.0"
> 
> The first time, no issue is seen as when registering the driver, of_node
> isn't NULL:
> -> gadget_dev_desc_UDC_store
>   -> usb_gadget_register_driver_owner
>     -> driver_register
>     ...
>       -> really_probe -> pinctrl_bind_pins (no effect)
> 
> Then dwc2_hsotg_udc_start() sets of_node.
> 
> The second time (stop the gadget, reconfigure it, then start it again),
> of_node has been set, so the probing code tries to acquire pins for the
> gadget. These pins are hold by the controller, hence the error.
> 
> So clear gadget.dev.of_node in udc_stop() routine to avoid the issue.
> 
> Fixes: 7d7b22928b90 ("usb: gadget: s3c-hsotg: Propagate devicetree to gadget drivers")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Note: I'd have been tempted to remove of_node setting from udc_start:
>  -	hsotg->gadget.dev.of_node = hsotg->dev->of_node;
> 
> I can't find the original code that parses the device node [1] from
> composite_bind() routine, originally part of the series that introduces
> this.
> I'm not sure if setting the gadget of_node is really useful, but I chose
> safe approach to simply clear it in udc_stop().
> 
> [1] http://lore.kernel.org/lkml/1340720833-781-6-git-send-email-aletes.xgr@gmail.com/
> ---
>  drivers/usb/dwc2/gadget.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index e7bf9cc635be..bd4c788f03bc 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -4615,6 +4615,7 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
>  	spin_lock_irqsave(&hsotg->lock, flags);
>  
>  	hsotg->driver = NULL;
> +	hsotg->gadget.dev.of_node = NULL;
>  	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>  	hsotg->enabled = 0;
>  
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
