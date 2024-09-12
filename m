Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD0E976DB3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Sep 2024 17:26:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51D28C78016;
	Thu, 12 Sep 2024 15:26:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4630BC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 15:26:16 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2d86f713557so759988a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726154775; x=1726759575;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AW/y1gSAhKENjHL3lW9TJj79JKhDjrYNIUo6Ww7RCUs=;
 b=G6iuT/BQC/28wRrQg510Nxsyj5V3W+K9AMCFKVwLLuEmRN0eLrJfyXjOXq7WrHHWny
 q0U0sz0ZZ4QLVHQ0HeVMZnOrOw2YWIMceX5xDX4pIwDAI9tEHdL/TYTJQaZStwt9oxkE
 /3UYCBqWhnRm3jZpz3MhEDMO4WxeHTFCDC9cTwcawaaut1F9J5OEKogRBzDxeBL6ixHm
 vLYfeNh+ula8vUUIAT/M6p3Mvq3Nc2a9qhCK99zT4CtmIIxpaMamFVJh+WfeDyBrFaEd
 aN7b5a04Qo+V+9ue3CzwTepmoWfadniLnxMT9spUxc9xZcE0nTbmXV4OGbnlHQUA5t/b
 CyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726154775; x=1726759575;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AW/y1gSAhKENjHL3lW9TJj79JKhDjrYNIUo6Ww7RCUs=;
 b=qIGsbDpPY/qWwJu5noLZPBUYTd2VZvdHYXz+Cmw4Fc8ksl5YfSgvDXjsBBkzs0Pg23
 sPjnYnthhY3vs8bPEKdjf9fcAbVvZDcht9lknC4ELSSE9PY7bgHW24bqOiR9j4PGM94h
 QWr8Ff8ZBOmhEkaUMBqjuW4VZ/dJ6SV24h5CbgoFd7mN9QoEzC2tEbLv2DLVIXoMkf1B
 MD4PZW41h6xtdUieVNqpQu3j80LeaWSI+9L1TSdQcW373gFZ8KuVNQlvXRUVwf0+dGql
 adOPI6MZzrHEoR60rlCLn3Jj1OZNICE7S6dxgzIC/1XxWExWzqoVtrwZTvkA1IXW46sx
 RtRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZoAKP7EEgWlIwcgz58Bg4WraMAVHbgCNpFX9twYZHBF4iIcwc10p2gGWyo4yTVtGbfEzIKJmZ/nCqFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyt9M9nsGKrIVPrNTMKG5Ovewu4f7uJJ5LW9aO8cPGS7pVXarwL
 u0NWqFuzHduuSKB1EOKnCFvGgnkd5SupT6atNOG+HvxJyykzGcfOY168gPfh75U=
X-Google-Smtp-Source: AGHT+IEnUV2gdc2JrTZ0PDN+tPvw1sNecok9fGkCMZLj9cBqFlHeQWX0ELyRbR9mPIeM7B+XWHHF5Q==
X-Received: by 2002:a17:90a:f00b:b0:2d8:7a3b:730d with SMTP id
 98e67ed59e1d1-2db9ffee5e9mr3070246a91.21.1726154774608; 
 Thu, 12 Sep 2024 08:26:14 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a82e:e104:d822:3d3c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dadc03d0ecsm12710893a91.23.2024.09.12.08.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 08:26:13 -0700 (PDT)
Date: Thu, 12 Sep 2024 09:26:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZuMIEp4cVrp1hWa7@p14s>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 4/7] remoteproc: core: Add TEE
 interface support for firmware release
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

On Fri, Aug 30, 2024 at 11:51:44AM +0200, Arnaud Pouliquen wrote:
> Add support for releasing remote processor firmware through
> the Trusted Execution Environment (TEE) interface.
> 
> The tee_rproc_release_fw() function is called in the following cases:
> 
> - An error occurs in rproc_start() between the loading of the segments and
>   the start of the remote processor.
> - When rproc_release_fw is called on error or after stopping the remote
>   processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..32052dedc149 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -29,6 +29,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/rculist.h>
>  #include <linux/remoteproc.h>
> +#include <linux/remoteproc_tee.h>
>  #include <linux/iommu.h>
>  #include <linux/idr.h>
>  #include <linux/elf.h>
> @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);

Function tee_rproc_release_fw() returns a value that is ignored.  I don't know
how it passes the Sparse checker but I already see patches coming in my Inbox to
deal with that.  In this case there is nothing else to do if there is an error
releasing the firware.  As such I would put a (void) in front and add a comment
about the return value being ignore on purpose.

> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	if (ret) {
>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
>  			rproc->name, ret);
> -		goto reset_table_ptr;
> +		goto release_fw;
>  	}
>  
>  	/* power up the remote processor */
> @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	rproc->ops->stop(rproc);
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
> -reset_table_ptr:
> +release_fw:
> +	if (rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);

Same here.

>  	rproc->table_ptr = rproc->cached_table;
>  
>  	return ret;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
