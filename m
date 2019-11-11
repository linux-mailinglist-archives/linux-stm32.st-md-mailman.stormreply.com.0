Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945BF82B6
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2019 23:04:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E09BAC36B0B;
	Mon, 11 Nov 2019 22:04:23 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 152C7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2019 22:04:21 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 15so10329384pgt.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2019 14:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b6mNCX/KX4boUEtiC4AfiPV9MtFO5pIWwbz7PSRKAGA=;
 b=fL7Vo58nzJhGzD6mdJp1QeRvNGKLgdPvqHWFIW8gS1JkcmXyMkkZooq1lWwqynq6jy
 ye9GJKZGGhLs5Gl1BIidWCcJcwsg4S0ZHHYBS64Ac3uKvYlrHTkQ+YaNa+zP4iWIxUyl
 NKdUycwDJ1c5ARuP1+Hb8YD8aOl+oAgsTQ4s5Syi1t0XHfH8GII5MHsizKKYIGa0uj4S
 K0Jrl3XwFs7A2XZMG1qY6oo8LcTv7dHjA6fJPAM+ofy8gUxtLY6AqOsZ+g7CnDF7+caI
 ueNzcWI2NWy5M4toTT7ymIUUoTzAMD2T1uPphNtcdZ8XBjTU7tafFBd5QVB8ZTtOarMA
 MRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b6mNCX/KX4boUEtiC4AfiPV9MtFO5pIWwbz7PSRKAGA=;
 b=gmK9CAuV2OeEQR7COLXYaiY+9fGLFNn7T38SWsvBH5pIxQdtM+/w7W/Aouz9a7cVmf
 4HomXqYUjh5knk5YnKBXUY5XoWpAjTWeNa7N295+EvXz3nIWg2vLqyMiGFdEp4HA0PuJ
 JDLTp7nCT/U7DCSuhsByoPJ+ADLX79LOJAzA6AIQ3LSvG54x4Iog+vkPkA40GD75WFVa
 Bgqn+2Q58XqPuUDEf22HxtqNE+gkZ2OZvYKlQMf6zGBvS4IaApebF/hGrhY//DqZc9EZ
 A2sYKjTxcH6t3SqbK8nViLc+Eg+uu1BT8Y9iBx1KOzkaxpi0MY0DzrdZ3gcFLGOn0/vX
 UXRw==
X-Gm-Message-State: APjAAAXbiWaSeu8BXzsr85e6BvPliCdtCA64SteqgAoQWSqB0LYFl6o+
 waYR5ort3HNzdZ7GFU7p4cLwhA==
X-Google-Smtp-Source: APXvYqyWTI6bisXzwWbs7tADpWb7qCtkjIYrZwQXbVFK2S/mZ3Li94In+tKU3yps+tF5SFtBvVa+6g==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr32518116pfo.30.1573509860257; 
 Mon, 11 Nov 2019 14:04:20 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f19sm11173159pfk.109.2019.11.11.14.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 14:04:19 -0800 (PST)
Date: Mon, 11 Nov 2019 14:04:16 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20191111220416.GB3108315@builder>
References: <1570433991-16353-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570433991-16353-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] remoteproc: stm32: fix probe error case
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

On Mon 07 Oct 00:39 PDT 2019, Fabien Dessenne wrote:

> If the rproc driver is probed before the mailbox driver and if the rproc
> Device Tree node has some mailbox properties, the rproc driver probe
> shall be deferred instead of being probed without mailbox support.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
> Changes since v1: test IS_ERR() before checking PTR_ERR()
> ---
>  drivers/remoteproc/stm32_rproc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 2cf4b29..a507332 100644
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
> @@ -329,10 +329,14 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>  
>  		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
>  		if (IS_ERR(ddata->mb[i].chan)) {
> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;

If for some reason you get EPROBE_DEFER when i > 0 you need to
mbox_free_channel() channels [0..i) before returning.

Regards,
Bjorn

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
