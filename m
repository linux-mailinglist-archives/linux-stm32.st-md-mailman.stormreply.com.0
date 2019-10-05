Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24895CC79A
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Oct 2019 06:03:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7A66C36B0B;
	Sat,  5 Oct 2019 04:03:32 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8891FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2019 04:03:31 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q7so5058000pfh.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Oct 2019 21:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ep+T4ZjSmgVgmfOmjNJkzXbXl0FrJoxYAHDsSkcqpX0=;
 b=Ym13/luvCh4HRz9APPjske1u+h0i1SJvJ/OhgaVzdzAtnKWjlspe8o7xEmP+7IbY7f
 sJcI8dgcp/8xe2szkey2GF1l42mvdGVRx2mI8/KL+8QXBgillBcxrPfY+6808U57GFeD
 S6JqnpqljXqfWpOYoBxju6COK3d8eNXCzpyqmu2I58UXR5daXXiBIZGqcxp/+f3eN+QZ
 SJkNy+5P/fpY17vkKSu5RAX8TK9qXn0UdH360eT+NJjnvoVFeeWCK5D9XR9we5BGFxCN
 83vhwmNyiMbrxr6MLwb/bts1DpkdL9eTRdCA6Eu9mKObTZm/GSOgTo3ylyLrWc7e6Pdy
 5M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ep+T4ZjSmgVgmfOmjNJkzXbXl0FrJoxYAHDsSkcqpX0=;
 b=d1zHs/5TPU7aiFaRiacfZf97a/GLYoCFVB0R1WnOo3Jh8g7cFfa8AvQAlKxaQxL46Y
 Q2Vmo7h5v8RR/AxmjP+TRGj/kapsFUigIYDMRo7sz6ROlkceU3+aHoOPwKgCIzZAKnQW
 ns+GpatSpnVpd/x5TSz9uKXSISetSVtFaFgjTFTQs5BLCH34oP5EPNs5Pedmczj2ywme
 AxSxhZeBjy6PN7/cxnAczlv67UZF05yovgmnKri7ObXGDXsfrzLQaE2nIO2MpilVk1kB
 UVRVUW2gcvCX34oBw2OxEUUr1IdQtba/9I6vftvVu/uhwrOrIZTk8HRi7m3y7I8v3hFx
 ZXhQ==
X-Gm-Message-State: APjAAAV5IInYNiq4o7hMFb+GhC8hZo9Q1YMrxymPYQyAJLK/CkBS9MSj
 FxFkz7IkYibGef+nAmjs7jZiVA==
X-Google-Smtp-Source: APXvYqy6CR1/CTAJi3zeL2dzdM9xntro53i8Tmw4S9q3dLx7SjGWLW2+lCDDvRKQ255GHtt9quen0w==
X-Received: by 2002:a17:90a:cb18:: with SMTP id
 z24mr20149664pjt.108.1570248209669; 
 Fri, 04 Oct 2019 21:03:29 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id e14sm7692470pjt.8.2019.10.04.21.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 21:03:29 -0700 (PDT)
Date: Fri, 4 Oct 2019 21:03:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20191005040326.GB5189@tuxbook-pro>
References: <1570190555-12465-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570190555-12465-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: fix probe error case
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

On Fri 04 Oct 05:02 PDT 2019, Fabien Dessenne wrote:

> If the rproc driver is probed before the mailbox driver and if the rproc
> Device Tree node has some mailbox properties, the rproc driver probe
> shall be deferred instead of being probed without mailbox support.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 2cf4b29..410b794 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -310,7 +310,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>  	}
>  };
>  
> -static void stm32_rproc_request_mbox(struct rproc *rproc)
> +static int stm32_rproc_request_mbox(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
>  	struct device *dev = &rproc->dev;
> @@ -328,11 +328,15 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>  		cl->dev = dev->parent;
>  
>  		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
> -		if (IS_ERR(ddata->mb[i].chan)) {
> +		if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER) {

You may not use PTR_ERR() without first checking IS_ERR(), apart from
that your patch looks good.

Regards,
Bjorn

> +			return -EPROBE_DEFER;
> +		} else if (IS_ERR(ddata->mb[i].chan)) {
>  			dev_warn(dev, "cannot get %s mbox\n", name);
>  			ddata->mb[i].chan = NULL;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> @@ -596,7 +600,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	stm32_rproc_request_mbox(rproc);
> +	ret = stm32_rproc_request_mbox(rproc);
> +	if (ret)
> +		goto free_rproc;
>  
>  	ret = rproc_add(rproc);
>  	if (ret)
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
