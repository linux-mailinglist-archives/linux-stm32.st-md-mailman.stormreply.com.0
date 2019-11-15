Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8FFE54F
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 19:55:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43983C36B0B;
	Fri, 15 Nov 2019 18:55:57 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33BA2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 18:55:54 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b19so7121411pfd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 10:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5/DV9l5vjoy566bD7j+28Px5X64vcSjdjpGgZ+iBNys=;
 b=H/KXp98I7VNkHc8aGry+k4qMOXigEvqS5f48d8OiOYilQ4J2JwVhl6GgokzI6hyV62
 XWkMKULwF03dKbwXHrV25fcvG4pFGGEMexDLJ+Yh3PK+hdPhnERKyqc4g3AzSJ3SGCJZ
 OyCkTZIxlmqlvqF1t+Fnyrlxhd1HP2fIBp/M5NcGjSuffzdMZKMyUk70LicNWBtTC9KY
 I3uBGnreTlwa5iuUJWIJvLlCr5Mbzk9WqyHIHjlGMetRB/9asxXqYDEDtQTGCPZIDZNb
 QWoUp0LtC4qbXAZ+ZD7roicUqYHW05JcJu8W8RRz9Xo7s6emVbzQ9YdMKkWyU+qHPNTs
 Oc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5/DV9l5vjoy566bD7j+28Px5X64vcSjdjpGgZ+iBNys=;
 b=CY2tm0MLvM7YOlg/OHm6+kEEpd68Fs1T63E6EFj6Vb02Hb0PVcbRjqylOijkTliuwj
 nh1uRK2jqcEE37KmLDPnUXiNJFSaHNxEMlxLZAUj0+DNuAPEMDtIpGvIGkHXNx9qJA/a
 TYbamx6ujnuAYYC8ApYt1NUcn9Zi6xa6EdA/YnJEtpQ9ydm4HnCNuEs6hhe6EbCZHtNv
 IidK363FMtV6K7msfNZR45DjIotPtid/pcGtCFOvW6K/YeugWlugbau4veGlBjMIbLLV
 tBtRkH+Yj8wN/Mh5QakcIDl8zzY8LtyvGR5VkCzTEoRVyP7j/FzjhJ5qEXxjQTJQ49wg
 QcNA==
X-Gm-Message-State: APjAAAU07tFwmtc9UOeXqAOn1Dad6NXbM/H8a5jydSoXf5f8MfLUNEwp
 jzXcNO9mHZ3W/wOhOTp25mMwfQ==
X-Google-Smtp-Source: APXvYqxiuLVF6hREoHjpiqNAQJjrFwPI2aFPUGj4Kmc+5j35f5RvAklf22Il0U3b+Ud+37gdYfUmww==
X-Received: by 2002:a63:d70e:: with SMTP id d14mr17742459pgg.10.1573844152375; 
 Fri, 15 Nov 2019 10:55:52 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id l62sm10835645pgl.24.2019.11.15.10.55.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Nov 2019 10:55:51 -0800 (PST)
Date: Fri, 15 Nov 2019 11:55:49 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20191115185549.GA17332@xps15>
References: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] remoteproc: stm32: fix probe error case
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

Hi Fabien,

On Fri, Nov 15, 2019 at 11:03:08AM +0100, Fabien Dessenne wrote:
> If the rproc driver is probed before the mailbox driver and if the rproc
> Device Tree node has some mailbox properties, the rproc driver probe
> shall be deferred instead of being probed without mailbox support.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
> Changes since v3: on error, free mailboxes from stm32_rproc_request_mbox()
> Changes since v2: free other requested mailboxes after one request fails
> Changes since v1: test IS_ERR() before checking PTR_ERR()
> ---
>  drivers/remoteproc/stm32_rproc.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 2cf4b29..bcebb78 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -310,11 +310,12 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>  	}
>  };
>  
> -static void stm32_rproc_request_mbox(struct rproc *rproc)
> +static int stm32_rproc_request_mbox(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
>  	struct device *dev = &rproc->dev;
>  	unsigned int i;
> +	int j;
>  	const unsigned char *name;
>  	struct mbox_client *cl;
>  
> @@ -329,10 +330,20 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>  
>  		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
>  		if (IS_ERR(ddata->mb[i].chan)) {
> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
> +				goto err_probe;
>  			dev_warn(dev, "cannot get %s mbox\n", name);
>  			ddata->mb[i].chan = NULL;
>  		}
>  	}
> +
> +	return 0;
> +
> +err_probe:
> +	for (j = i - 1; j >= 0; j--)
> +		if (ddata->mb[j].chan)
> +			mbox_free_channel(ddata->mb[j].chan);

Do you need to set ddata->mb[i].chan to NULL as it is done in
stm32_rproc_free_mbox?

Also I'm wondering about the error path for this function.  If something goes
wrong in mbox_request_channel_byname() none of the previously allocated channels
are freed and no further actions is taken.  Should we simply abort the probing
of the rproc if any of channels can't be probed?

Regardless of the above and without surprise:

Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org> 

> +	return -EPROBE_DEFER;
>  }
>  
>  static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> @@ -596,7 +607,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
