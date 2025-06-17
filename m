Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E587AADC100
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jun 2025 06:44:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 825D7C32E92;
	Tue, 17 Jun 2025 04:44:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 587FDC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jun 2025 04:44:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0941344935;
 Tue, 17 Jun 2025 04:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110A7C4CEE3;
 Tue, 17 Jun 2025 04:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750135472;
 bh=H7GANlnHbRQ0PuyObSnaelRfAXM+A9g6rqgPH2m/yv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MfLtu92nyNSb3F2sQDQ/ODu41QB2CvwMUBmPhR71EM1n1U7SKPkOGBJ78GcKamBEJ
 gn7v6p6J4YacC+uhPooq9P7M/jmxtZR0h2aeH8+2V3+0enbewIa1JNmGYCtURoj3Dj
 P1UFGOMjYvOfUKY3tMTnzh/Jqy4KB8dCjleIlK9z48MGCRVflAsAaFFrOZkaeK8uSr
 NgxhVQ3rj/7a1ehnQ8kDQfNvNAktlshGRg/VmyOim4xHXHfiFVgqGWn4fkRDw4lpGZ
 jeu2Zf4DO4MX4USmoLPUgjhq/zMmqoq9acyukuxynaTjuRfmUWU5vh31y7XwsP96Kn
 25msb2rPXD4YQ==
Date: Mon, 16 Jun 2025 23:44:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <6ekro2uytz7kguphtub54wivmclpnfkjobduhsom4kvxlmov2l@hgcjoposj3md>
References: <20250616075530.4106090-1-arnaud.pouliquen@foss.st.com>
 <20250616075530.4106090-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250616075530.4106090-4-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v18 3/6] remoteproc: Introduce release_fw
 optional operation
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

On Mon, Jun 16, 2025 at 09:55:27AM +0200, Arnaud Pouliquen wrote:
> The release_fw operation is the inverse operation of the load, responsible
> for releasing the remote processor resources configured from the loading
> of the remoteproc firmware (e.g., memories).
> 

I was under the impression that we agreed that this would unroll
rproc_parse_fw() not the "load" in general.

> The operation is called in the following cases:
>  - An error occurs on boot of the remote processor.
>  - An error occurs on recovery start of the remote processor.
>  - After stopping the remote processor.
> 
> This operation is needed for the remoteproc_tee implementation after stop
> and on error.

And if it's defined to unroll rproc_parse_fw() it can be used for other
things where some resources was allocated to set up the resource table.

> Indeed, as the remoteproc image is loaded when we parse the resource
> table, there are many situations where something can go wrong before
> the start of the remote processor(resource handling, carveout allocation,
> ...).

Unbalanced parenthesis? I think you can write this in less
conversational style.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 6 ++++++
>  drivers/remoteproc/remoteproc_internal.h | 6 ++++++
>  include/linux/remoteproc.h               | 3 +++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d06eef1fa424..4c1a4bc9e7b7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1857,6 +1857,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
>  
>  	/* boot the remote processor up again */
>  	ret = rproc_start(rproc, firmware_p);
> +	if (ret)
> +		rproc_release_fw(rproc);
>  
>  	release_firmware(firmware_p);
>  
> @@ -1998,6 +2000,8 @@ int rproc_boot(struct rproc *rproc)
>  		}
>  
>  		ret = rproc_fw_boot(rproc, firmware_p);
> +		if (ret)
> +			rproc_release_fw(rproc);
>  
>  		release_firmware(firmware_p);
>  	}
> @@ -2067,6 +2071,8 @@ int rproc_shutdown(struct rproc *rproc)
>  
>  	rproc_disable_iommu(rproc);
>  
> +	rproc_release_fw(rproc);
> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;

These are allocated in rproc_parse_fw(), would it not make sense to
clean them up in your newly introduced function?

> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 0cd09e67ac14..c7fb908f8652 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -221,4 +221,10 @@ bool rproc_u64_fit_in_size_t(u64 val)
>  	return (val <= (size_t) -1);
>  }
>  
> +static inline void rproc_release_fw(struct rproc *rproc)
> +{
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
> +}
> +
>  #endif /* REMOTEPROC_INTERNAL_H */
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 8fd0d7f63c8e..80128461972b 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> + * @release_fw:	optional function to release the loaded firmware, called after
> + *              stopping the remote processor or in case of error

The struct firmware is released at the end of startup and the typical
carveout memory where the firmware is loaded into is released at
rproc_shutdown().

As such, this won't help anyone understand the purpose of the ops unless
they know your system design (and know you added it).

Regards,
Bjorn

>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> @@ -403,6 +405,7 @@ struct rproc_ops {
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
>  	void (*coredump)(struct rproc *rproc);
> +	void (*release_fw)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
