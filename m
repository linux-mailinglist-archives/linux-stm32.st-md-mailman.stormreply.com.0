Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9689C9329
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 21:23:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F2BC7A833;
	Thu, 14 Nov 2024 20:23:09 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E2A9C7A832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 20:23:02 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7ea8c4ce232so1028151a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 12:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731615781; x=1732220581;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3t3j3ES+KMYiY+uHRfv46SZpfLjb2BlkXR6mS0oLpes=;
 b=lpQ7UNvWy+wt0IE+AtkVqiAJQ0TOhl3ooJ+0Okf2KJs9gNIKywk04F6gR8POX25aBR
 O6Blur7XE0qV0EoBJpquJZIaXy1LuCL/uIMNt0bzIrdHRYNF2qusono5mqcerhuDREzj
 MCZEuTOXJMWpnj/8bNSCJ5IxXsAKE44WZxoMFgBIhlnO/cHGOHUUrQ+fwSO3n+XJLJrj
 BDaNPQwSLXKuAkF116r50dhEbNjzK3XHn1gPJaFbzLdeFXZAlYFXUxpr/Y7WC1SVs8U8
 1WplG4z9SllRTxMYhpxFQJXvoPAT74m/wx2CgaedRyD3YTuDT7tmq8qmIY0R10zzLLM7
 negg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731615781; x=1732220581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3t3j3ES+KMYiY+uHRfv46SZpfLjb2BlkXR6mS0oLpes=;
 b=Vqgh1tI+h/XFuIyl+NRSwl2XV9955t0MQ+iv2/l9Yivyq+A7MN7dfT0DTu4HiFaKGj
 7TC4luC/0TWO83+dP9PB5kzLdk33tzsjXNnli+5nex3UVEIYa2LJJ9M7kmI0dGonAtqC
 3+MI/wSG31Evo5LKmXO4ifCUylaeXALNA9ykX+Ru9SgsMrX5IpPlSbL7Fc/9UanXBP7e
 9TOXEnyv7u3Z5ZDOWRoMFqHZlzRYI8Gq45AHz9yHeyteWe+t6W+a/eltXvygWj0ou7K0
 YyJKQWTrd5UVUzvaesGNtKTOMhk0vB83mOract7rUG3jNNBhd54svkc+1WB/FXrhtzRY
 Q3bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULVfnitz7KUMHdpyjQkCanVhjhI3KepIWf1loDzZkPlzaS6V4ioxSCiVmgM5MS2OebworqQ+3wjDfEbw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrQXzRa76oGVGGAacG9eEe/ceCFm+8WHrDfuu+g6ib2ooQGeHm
 zWs5q0LffVsb2g4RPc6CQy1A6LfJGYAqkRJ9nsK5TnBMwUEmOc//LAj+e/VoI44=
X-Google-Smtp-Source: AGHT+IEWrtvYg0ycOEPvYgPz1j1Z/Gs2uiPWVaIPMlwwfbfV9OSuuEkejTWFwmCY24eOW9B2M742Dg==
X-Received: by 2002:a05:6a20:7346:b0:1db:e9f6:8dd7 with SMTP id
 adf61e73a8af0-1dc90afcb5fmr65998637.1.1731615781071; 
 Thu, 14 Nov 2024 12:23:01 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:d240:c440:31fa:1568])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72477120aa5sm39076b3a.79.2024.11.14.12.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 12:23:00 -0800 (PST)
Date: Thu, 14 Nov 2024 13:22:57 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZzZcITZq/U9SOqnP@p14s>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v13 4/7] remoteproc: Introduce release_fw
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

On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
> This patch updates the rproc_ops struct to include an optional
> release_fw function.
> 
> The release_fw ops is responsible for releasing the remote processor
> firmware image. The ops is called in the following cases:
> 
>  - An error occurs in rproc_start() between the loading of the segments and
>       the start of the remote processor.
>  - after stopping the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates from version V11:
> - fix typo in @release_fw comment
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>  include/linux/remoteproc.h           | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..46863e1ca307 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);

I always thought that looked hackish and brittle.  I am trying to find a better
solution.

Mathieu

>  	rproc->table_ptr = rproc->cached_table;
>  
>  	return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 2e0ddcb2d792..08e0187a84d9 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> + * @release_fw:	optional function to release the firmware image from ROM memories.
> + *		This function is called after stopping the remote processor or in case of an error
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
