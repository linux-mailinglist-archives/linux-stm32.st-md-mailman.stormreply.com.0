Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE359757B5
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 17:56:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DED1C6C841;
	Wed, 11 Sep 2024 15:56:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC902C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 15:56:37 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2053525bd90so412925ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726070196; x=1726674996;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qyEYdmmCtjL2ZglMclaQOmpZZ8FR1iFPca3qPYCy9w4=;
 b=ec2FMJnNiydZPqwy/Ag56/Lx5TxjGDiRTjx/I+4ue7W6scFk3id2TBqJWx/O8OHu93
 vyUpwQhWFbhNYO63Kluw+/zIc9mAEvK2jIE6Sn3vf/mgOBNAabuFI5k5ez9gd2UXeZel
 AMEMMpPMC9b43KExf48mux/p0/8suOHf0YAXVsKiDrLIhmo+dPU42hSZRm6KJeImHSJz
 wEUGIaR/Z9he6wKVf+o2/xqc4IWGdeFmTStFQZiYug6W380YmX1VhzSG2iNn1rC+lyry
 me0sSRlnfYmvyqkvcKAC9UVDYRxV+Id2N33SzTP0GFH+Hhur4m8ChBAa8geXehSgMi8J
 7wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726070196; x=1726674996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyEYdmmCtjL2ZglMclaQOmpZZ8FR1iFPca3qPYCy9w4=;
 b=savdLagzXXDcuNzLMKZtJL+aw0IKVpRoBb38xZwSaqnm2nfoBCH9MJD3NenDLqkZ6e
 b7FmOm2P0EooH6XM8iMF8Lmryy1uNvX8kKwsjK6jZKH0XfOWJO6ODIGAQtCSBi7oTkwM
 UzfYaDAsI6tTRnQzsqXcohj5JI05i01hBxpifQSOAAAfdX2/KnWyrWLtiT8Bw7rEY1fS
 Bd0e+HBCvYTpe88GywXXwgiPCL1jineEbArnxcLTlxWXKk8pHqZoIplfLi/InNnqEd8C
 pFcRmL5mWAQNDeAV0ieJ7Sowzg4+D19VXw8YebgWfmOY3RHTwxaKMMj54Vk+HysdCuVx
 4REg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWqOPOZ74x4i0pn+AeLDTibqdgdoURb/GSRt0782bwPGsmvhN6tgUiSGNqCd00IBW9FWanpl5DBNLYNg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqUbU146b7OO6RMLdUPb2lhSazmfsou7IV8DHG8fUC0xzWb7Kj
 XhNLytyyc7pEQ4lMOxsW1J7hzLMoSb0FQpAYSzsVIh9saxDJ6U+ixEmwkujbSAk=
X-Google-Smtp-Source: AGHT+IGa4wRKlJxrETW0qCu5ZTTQ3xb8Do/wPK2e8jasfbzAeq1gxfAE2Mk/Fx9F2dJ/V92m0elHfA==
X-Received: by 2002:a17:902:d4cc:b0:207:3a46:345 with SMTP id
 d9443c01a7336-2074c761a4dmr58970435ad.51.1726070196194; 
 Wed, 11 Sep 2024 08:56:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:cc9a:9892:2799:3634])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9cb9sm1159555ad.193.2024.09.11.08.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 08:56:35 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:56:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZuG9sOI+xX93NCQc@p14s>
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
> +

If I understand correctly, the first condition is there because the
attach/detach scenario does not yet support management by the TEE.  I would
simply move the check to tee_rproc_release_fw() with a comment to that effect.

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

I would have kept the old label.

> +	if (rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);
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
