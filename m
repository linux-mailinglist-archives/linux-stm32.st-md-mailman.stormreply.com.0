Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9A5545C3
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jun 2022 13:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25184C5662F;
	Wed, 22 Jun 2022 11:37:14 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with SMTP id 58B64C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 14:19:26 +0000 (UTC)
Received: (qmail 876385 invoked by uid 1000); 21 Jun 2022 10:19:25 -0400
Date: Tue, 21 Jun 2022 10:19:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YrHTba9s2NhBfQT2@rowland.harvard.edu>
References: <20220621130506.85424-1-fabrice.gasnier@foss.st.com>
 <20220621130506.85424-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220621130506.85424-2-fabrice.gasnier@foss.st.com>
X-Mailman-Approved-At: Wed, 22 Jun 2022 11:37:12 +0000
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, hminas@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: host: ohci-platform: add TPL
	support
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

On Tue, Jun 21, 2022 at 03:05:04PM +0200, Fabrice Gasnier wrote:
> From: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> The TPL support is used to identify targeted devices during EH compliance
> test. The user can add "tpl-support" in the device tree to enable it.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---

For this patch and the 2/3 ehci-platform patch:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-platform.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
> index 47dfbfe9e5190..0adae62651276 100644
> --- a/drivers/usb/host/ohci-platform.c
> +++ b/drivers/usb/host/ohci-platform.c
> @@ -28,6 +28,7 @@
>  #include <linux/usb/ohci_pdriver.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> +#include <linux/usb/of.h>
>  
>  #include "ohci.h"
>  
> @@ -210,6 +211,8 @@ static int ohci_platform_probe(struct platform_device *dev)
>  	hcd->rsrc_start = res_mem->start;
>  	hcd->rsrc_len = resource_size(res_mem);
>  
> +	hcd->tpl_support = of_usb_host_tpl_support(dev->dev.of_node);
> +
>  	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (err)
>  		goto err_power;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
