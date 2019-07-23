Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B4471CB1
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jul 2019 18:19:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29730CFAC64;
	Tue, 23 Jul 2019 16:19:11 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E23AACFAC60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 16:19:09 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r7so19394615pfl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5cCrOYr2TnsV7hg1z4ufQ0QBSkAleXOLlrvwjgt7a8c=;
 b=HjeaCWMLzBkFGJqQXljhwWJsnBNJDOLusXlLORvuiIX/zx47EgSI3ZrqqVgboAZcu8
 7iWFwjZ5BjM7HIHuANs0ekokz4x8ZTpITs2xKvANVd3ZdXsURbsbuDegN/qvnNVqrN50
 V+yZCblOlSH2jvDDHbD2+ADTwZQdrdaxF6WjYfhb9O3diIcqypig3RXF8mycJaRu+YFn
 OxQbHaICJMlMnqii2Z3EnbN0tuk2udnq7NAWXa6V9vZn/BX+P4a5uj7nY2OAJ/kTwhuJ
 me2N02/lAa/H/UKkiXS9rATXXHjTdKa5XxSa5Dx/pVfi6TpE16b+jwTThiUQNOqnasNY
 Qy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5cCrOYr2TnsV7hg1z4ufQ0QBSkAleXOLlrvwjgt7a8c=;
 b=Fza4/+kDkJOMBLbsTZM7+i76rclAICiXPcAb/aPgI8ZLDBIdq/KExC/2r8+dmvZIoS
 5RCJZkYvGPKNazKG0sXk0pMUD3TTeUygpE7Tm/McgBezEr4UrTlZwENuK6be6P7PNnSi
 BRz8Mhd8yP9RlGZPCEyuRiAO2quaHQIJiXJO+6FUlVHrXdEHBNaBXj5hRDxGmzR4+lOP
 XE9VEd+/L2VGZ4fXuOwJHSsRgCaZMEm00ED3TCc0BIn9EaonfBKqt7MlSSnSrHwKWM2J
 MK7EyJEZNQf35Q4SQIIB0PemfxzIo7vEcnsS66q8MBixbrJ8YE99tRHuxZbYsJuew6iJ
 tubg==
X-Gm-Message-State: APjAAAWIy3+bIVehP43TSC6h44dx3LC1ZSAEALT/QP0MvQ3zmKTacyVC
 PnPTSTU1m4A7950yyo0y8m4=
X-Google-Smtp-Source: APXvYqydcQW2cCafiPIaF7/QZPrBBYpr4qob4CqJ6cgqd3IcA6gfMn0T2uK4ay1hxtAi5OTtmdf/bQ==
X-Received: by 2002:a17:90a:21cc:: with SMTP id
 q70mr85533665pjc.56.1563898748328; 
 Tue, 23 Jul 2019 09:19:08 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id e124sm68442200pfh.181.2019.07.23.09.19.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 09:19:07 -0700 (PDT)
Date: Tue, 23 Jul 2019 21:49:02 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Steven Price <steven.price@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <20190723161902.GA2910@hari-Inspiron-1545>
References: <20190719184606.GA4701@hari-Inspiron-1545>
 <1d9aa4be-4da2-b532-4787-c98869c0bd9d@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d9aa4be-4da2-b532-4787-c98869c0bd9d@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Linux-stm32] [PATCH] rqchip/stm32: Remove unneeded call to
	kfree
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

On Mon, Jul 22, 2019 at 11:26:09AM +0100, Steven Price wrote:
> On 19/07/2019 19:46, Hariprasad Kelam wrote:
> > Memory allocated by devm_ alloc will be freed upon device detachment. So
> > we may not require free memory.
> > 
> > Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> > ---
> >  drivers/irqchip/irq-stm32-exti.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
> > index e00f2fa..46ec0af 100644
> > --- a/drivers/irqchip/irq-stm32-exti.c
> > +++ b/drivers/irqchip/irq-stm32-exti.c
> > @@ -779,8 +779,6 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
> >  	irq_domain_remove(domain);
> >  out_unmap:
> >  	iounmap(host_data->base);
> > -	kfree(host_data->chips_data);
> > -	kfree(host_data);
> 
> In the commit this is based on these variables are not allocated using a
> devm_ alloc function:
> 
> $ git show e00f2fa | grep -A12 *stm32_exti_host_init
> > stm32_exti_host_data *stm32_exti_host_init(const struct stm32_exti_drv_data *dd,
> > 					   struct device_node *node)
> > {
> > 	struct stm32_exti_host_data *host_data;
> > 
> > 	host_data = kzalloc(sizeof(*host_data), GFP_KERNEL);
> > 	if (!host_data)
> > 		return NULL;
> > 
> > 	host_data->drv_data = dd;
> > 	host_data->chips_data = kcalloc(dd->bank_nr,
> > 					sizeof(struct stm32_exti_chip_data),
> > 					GFP_KERNEL);
> The function stm32_exti_probe *does* use devm_k?alloc, so perhaps you
> were getting confused with that?
> 
> Steve
>
  Yes thanks  for explanation. Please ignore this patch

  Thanks,
  Hariprasad k
> >  	return ret;
> >  }
> >  
> > 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
