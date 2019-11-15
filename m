Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5ADFD675
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 07:32:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1288CC36B0B;
	Fri, 15 Nov 2019 06:32:35 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 711A6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 06:32:33 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id az9so3927872plb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 22:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q3ePoHPIIdr3W7D+aaS4Z60EnVlbf0EDqLIH1S2hQUU=;
 b=IDUmX0KGEbj6muhIKJyL7HEhTXwt+PkuOrsqDIMdJNfODpcksOOJ4zuhsAIsOr/Oce
 U27ZwTq8v6TVX2+Mm7OMb2JyPNhU+gFqNK6itxctNYK+T7Beoe3iwMML41GMjVpy7iRW
 p9QrS6/uZ7hhBUVoYO1vBF2n7h4u0ac3aKJM3Sv2mS82gGvsO9ZSsHCIng271RLEqKgc
 ussy0+OzHFTn9oj0QukKglzMDdkO5Xk8PZSKKceMb0VCOSrLdyAgGnyrSGxVbGhJW3kf
 iJ53JmuF4I2o6rTRRvcX3VwVUcWOuNhknIkWTpzAgKryWtidmIWwgK8nYkLweoAu4GC+
 4LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q3ePoHPIIdr3W7D+aaS4Z60EnVlbf0EDqLIH1S2hQUU=;
 b=hTrKc98hRyh0ONJthZf0GK/FpWAWoEqYEsu1Aj8OtN2CPVwa9XuvI1vtCT0xMQF/gT
 3iqisMM7FOgo2Db6mn/h20Me+8cBOnX1OQRhHtruJoMrGCutk46MkMZxI4BI+yYI/DJD
 FBNWpXPGF2IzFVYUlUwxvu+kxbMdbFIn60Ve4P3v7KdQsEe0Ch9fpcStO0pQqzFragyB
 vaITN7JYe9ODiN0Zo8h3P46HuwYPNWUfLHxLZZZhCETH28axofM8B2liEIV7CGw0UnsV
 RDgnvrUv+byFBpfjvuWlPfCel905Piz4YlorZ4zjfHkCa7eQy+IYj1bfnn5csuo9MjFr
 nmrQ==
X-Gm-Message-State: APjAAAWwR1bfW0YZjTQMobUGnSRkR7r0dB1ZNM3jSeAb5iiauk8HVU+o
 4owmtN0QUe2NC2ElVsx4WswL+w==
X-Google-Smtp-Source: APXvYqwXmWhg5Qpo4vphioNQf1z/8vt/0yg96EIeaEoylI37/2yBLu1fWTS4R30QXtIhmfgqLJ6KzA==
X-Received: by 2002:a17:90a:bf16:: with SMTP id
 c22mr17129860pjs.83.1573799551704; 
 Thu, 14 Nov 2019 22:32:31 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id p16sm9058430pfn.171.2019.11.14.22.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 22:32:30 -0800 (PST)
Date: Thu, 14 Nov 2019 22:32:28 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20191115063228.GS3108315@builder>
References: <1573635167-24590-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573635167-24590-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] remoteproc: stm32: fix probe error case
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

On Wed 13 Nov 00:52 PST 2019, Fabien Dessenne wrote:

> If the rproc driver is probed before the mailbox driver and if the rproc
> Device Tree node has some mailbox properties, the rproc driver probe
> shall be deferred instead of being probed without mailbox support.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
> Changes since v2: free other requested mailboxes after one request fails
> Changes since v1: test IS_ERR() before checking PTR_ERR()
> ---
>  drivers/remoteproc/stm32_rproc.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 2cf4b29..4b67480 100644
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
> @@ -329,10 +329,16 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>  
>  		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
>  		if (IS_ERR(ddata->mb[i].chan)) {
> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER) {
> +				ddata->mb[i].chan = NULL;

So this relies on the caller jumping to stm32_rproc_free_mbox() to
release a subset of ddata->mb[x].chan. While this works I find it error
prone and would prefer the idiomatic solution of cleaning things up, in
this function, before returning.

So, could you please goto a snippet that loops backwards from i-- to 0
calling mbox_free_channel() and then return -EPROBE_DEFER instead?

Thanks,
Bjorn

> +				return -EPROBE_DEFER;
> +			}
>  			dev_warn(dev, "cannot get %s mbox\n", name);
>  			ddata->mb[i].chan = NULL;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> @@ -596,7 +602,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	stm32_rproc_request_mbox(rproc);
> +	ret = stm32_rproc_request_mbox(rproc);
> +	if (ret)
> +		goto free_mb;
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
