Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2F61D2695
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 07:15:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E25BC3F932;
	Thu, 14 May 2020 05:15:10 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0F11C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 05:15:08 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s20so726952plp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 22:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2yXsWHQlHZFO6uOvXrEaZ/pS+PzZxIKV+dtwFcRxe6w=;
 b=WaEy+o54dBSzmlKivA2IuiMCd2bVGyN/8T4tkjvVvubQFLn97LTv0O/ySe1z/fH/u3
 MdiddCBwUdTikQYAt7mfPDkzu9K9YRsM1a26eZ7vgwdrfxQv9Ly8One/CWbQuwXe2QWZ
 d0wpkTf3Mt09I3QJARIvSlOGK8APyyQJweufAlgEfoyZZIzX+H4XMEuIHKwZR17+8Z8/
 bi2lE6JgFaPYNKf+KBzn/yQpi6Zom8tNmikCY+c6swEltzuP43VRUoGOCOcl8nf6vKEK
 6DJYLSPYRQRB76ESJr8A6lis27zwZihNf3FK1kdonfvLWja9w4FSmZlr+nveVp58bUwL
 7EIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2yXsWHQlHZFO6uOvXrEaZ/pS+PzZxIKV+dtwFcRxe6w=;
 b=KgP9umWE/qCAmNJw1JGVhnOCweuQuBvFWyA0+beulgjyYy5b5NrAORhNg/E4Tk9BAz
 FA+oIBcX+mVv/y0kqou9RTDWwnDSDXtj3vvilBEBvqOwlRKe78K1vNxYoWzjYqBxVIlQ
 CdNJUQg32g7bHjEfqcp6J1nftm/fsc8kbrfx5D7epa29KvvL83b9uS/du+zUxsh7LQq6
 ebN7BIs0H1CT/zIIX6msXN+DOGtIoIEINwnTVuNoe3yXNRti6p1Z6xfbitkIddSNxVF4
 ya/cLmJ3R/QNqXR6uYazSoh9sDomqX47MBAXqcvXSztEh9jBorK4Ewa96fP4oW5/1CtJ
 Vldw==
X-Gm-Message-State: AOAM5311bVscVFVynL0zZGwDmSfuuzkU5AVbX+5YRx4FKk6Y1TlycDn+
 GCZ7zZvOmvfNEIehvPVKKHWEug==
X-Google-Smtp-Source: ABdhPJxxhy9EY2uDVHzZ5e3gf3ckUoHFy83l2BU7ClFXDzIPQkfzRRzKac281D9+vAEJfZiCrzq7bQ==
X-Received: by 2002:a17:90b:f86:: with SMTP id
 ft6mr7177214pjb.49.1589433307144; 
 Wed, 13 May 2020 22:15:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id w14sm1084582pgo.75.2020.05.13.22.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 22:15:06 -0700 (PDT)
Date: Wed, 13 May 2020 22:13:36 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <20200514051336.GA396285@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-11-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-11-mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 10/12] remoteproc: stm32: Introduce new
 parse fw ops for synchronisation
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

On Fri 24 Apr 13:25 PDT 2020, Mathieu Poirier wrote:

> Introduce new parse firmware rproc_ops functions to be used when
> synchonising with an MCU.
> 
> Mainly based on the work published by Arnaud Pouliquen [1].
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 51 +++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 86d23c35d805..b8ae8aed5585 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -215,7 +215,34 @@ static int stm32_rproc_elf_load_rsc_table(struct rproc *rproc,
>  	return 0;
>  }
>  
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +static int stm32_rproc_sync_elf_load_rsc_table(struct rproc *rproc,
> +					       const struct firmware *fw)
> +{
> +	struct resource_table *table = NULL;
> +	struct stm32_rproc *ddata = rproc->priv;
> +
> +	if (ddata->rsc_va) {

Does it really make sense to try to sync with a remote that doesn't have
a resource table?

> +		table = (struct resource_table *)ddata->rsc_va;
> +		/* Assuming that the resource table fits in 1kB is fair */
> +		rproc->cached_table = kmemdup(table, RSC_TBL_SIZE, GFP_KERNEL);

It's unfortunate that we need to create a clone of the resource table
that we found in ram, and then return the original memory when the core
ask for the loaded table...

I wonder if we somehow can avoid this in the core (i.e. skip overwriting
table_ptr with the cached_table during stop)

> +		if (!rproc->cached_table)
> +			return -ENOMEM;
> +
> +		rproc->table_ptr = rproc->cached_table;
> +		rproc->table_sz = RSC_TBL_SIZE;
> +		return 0;
> +	}
> +
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = NULL;
> +	rproc->table_sz = 0;
> +
> +	dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> +	return 0;
> +}
> +
> +static int stm32_rproc_parse_memory_regions(struct rproc *rproc,
> +					    const struct firmware *fw)
>  {
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = dev->of_node;
> @@ -268,9 +295,30 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  		index++;
>  	}
>  
> +	return 0;
> +}
> +
> +static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret = stm32_rproc_parse_memory_regions(rproc, fw);
> +
> +	if (ret)
> +		return ret;
> +
>  	return stm32_rproc_elf_load_rsc_table(rproc, fw);
>  }
>  
> +static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
> +				     const struct firmware *fw)

Rather than having a function parse_fw that is passed no fw and return
some state that was setup in probe, how about just do this during probe?

Regards,
Bjorn

> +{
> +	int ret = stm32_rproc_parse_memory_regions(rproc, fw);
> +
> +	if (ret)
> +		return ret;
> +
> +	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
> +}
> +
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev = data;
> @@ -544,6 +592,7 @@ static struct rproc_ops st_rproc_ops = {
>  static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
>  	.start		= stm32_rproc_sync_start,
>  	.stop		= stm32_rproc_stop,
> +	.parse_fw       = stm32_rproc_sync_parse_fw,
>  };
>  
>  static const struct of_device_id stm32_rproc_match[] = {
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
