Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766E88AA22
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 17:51:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAECBC6B444;
	Mon, 25 Mar 2024 16:51:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41032C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 16:51:47 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1def3340682so37223405ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 09:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711385506; x=1711990306;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pj8PTKVryqKwwdBoZ+0WnicFRNErWIn69RAMUd5IKdc=;
 b=O6Zfdqr9ZIggXzRabGub4xzCn8RMkvJ1tQ5EbW3PERvBnYEYqx1Y/5Mmg+Kxad8/f5
 ZV5N1PiBksgz1IY9C17vQKy5F7h1UIhwKQad4zLHX5D7Dux9ETp9HS+l2RFpp4BkdfKa
 2LGRADJneyHdeKVjbIzEq+/qDkDSVx0UZCQ0fWfoUO5PVZOommVDHSY6xC7j8fULpA+4
 4bdvFPXzlMK63vQLX5K2X3QM1l6RTh1T4/oz0OaBTiMUA77P8zoYWo33bzwtmUi8cnnl
 7vDtyV62z7qeTIhBu1PjXZV3Yp4DuFCKz23hF21+MDcxWkFMeI5krT6I/IPa30X9JT6N
 MrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711385506; x=1711990306;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pj8PTKVryqKwwdBoZ+0WnicFRNErWIn69RAMUd5IKdc=;
 b=iRxmSxsJzqEWAV2wKCnPj8T8miyVPHWIEn5heWvO/ytMAyFu+2P1fuxlEoQyjfokrS
 FlyoGx/JyNjRMsubSBtT8HfN/NE99O9IKo96jSQxdfzdhQ+pxfQU+8pF6gRiHZXb9rej
 6cmrrygsPJAZkJkdbG9l2s1FWb75Y9b9IwsHenKd0i9pXNxNeQYDBOmpKwzOX4iUv3V6
 o/DyL9bkMWc5l2Xn/LgvH0b82XkMnr7N6lSFHbeT4mkI9xZvht+6ChwfFYT9hBPL+RFn
 XYvmQbGMsAkl/lO+DWzpEd4dvjkfNpUTAfIh92k1iqnBeo+nVR68sjq7zKiNlYYAZxzJ
 6qNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwQ/jptubwP2+NASBvUpzejMYd4T3XiGHpoVmwyAsXxOU9LN4BnK1ZcAXv+6kNym3wuV9kQR1eTGMCZyYtqU3TWOMyqxvOPzmDrnbhaz5Wx6hHAfY5JcTa
X-Gm-Message-State: AOJu0Ywn4ENDR1/Cd8W0f7+XqQZduy4xL/QqFfDVwePW9d/pM7f+e6aU
 VX2tlv7PXNxdTxlQrxZx24euZr9MJZeHHXZAuDJfzi+Eure7j0qUaLOhqDso7lU=
X-Google-Smtp-Source: AGHT+IGoV4RhZKceQIINbyMVzRZ5e1HPuju79F8lHHNd/Bx3c+IjzhBFu/0IBlEFjOn25VeKI5qwIA==
X-Received: by 2002:a17:902:f54c:b0:1de:ff81:f650 with SMTP id
 h12-20020a170902f54c00b001deff81f650mr12006579plf.10.1711385505732; 
 Mon, 25 Mar 2024 09:51:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4a22:28de:eba3:89d1])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a170902da8500b001e0c568ae8fsm1517672plx.192.2024.03.25.09.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 09:51:45 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:51:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZgGrnkcebcIQQic6@p14s>
References: <20240308144708.62362-1-arnaud.pouliquen@foss.st.com>
 <20240308144708.62362-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240308144708.62362-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 4/4] remoteproc: stm32: Add support of
 an OP-TEE TA to load the firmware
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

On Fri, Mar 08, 2024 at 03:47:08PM +0100, Arnaud Pouliquen wrote:
> The new TEE remoteproc device is used to manage remote firmware in a
> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
> introduced to delegate the loading of the firmware to the trusted
> execution context. In such cases, the firmware should be signed and
> adhere to the image format defined by the TEE.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates from V3:
> - remove support of the attach use case. Will be addressed in a separate
>   thread,
> - add st_rproc_tee_ops::parse_fw ops,
> - inverse call of devm_rproc_alloc()and tee_rproc_register() to manage cross
>   reference between the rproc struct and the tee_rproc struct in tee_rproc.c.
> ---
>  drivers/remoteproc/stm32_rproc.c | 60 +++++++++++++++++++++++++++++---
>  1 file changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 8cd838df4e92..13df33c78aa2 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -20,6 +20,7 @@
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/tee_remoteproc.h>
>  #include <linux/workqueue.h>
>  
>  #include "remoteproc_internal.h"
> @@ -49,6 +50,9 @@
>  #define M4_STATE_STANDBY	4
>  #define M4_STATE_CRASH		5
>  
> +/* Remote processor unique identifier aligned with the Trusted Execution Environment definitions */

Why is this the case?  At least from the kernel side it is possible to call
tee_rproc_register() with any kind of value, why is there a need to be any
kind of alignment with the TEE?

> +#define STM32_MP1_M4_PROC_ID    0
> +
>  struct stm32_syscon {
>  	struct regmap *map;
>  	u32 reg;
> @@ -257,6 +261,19 @@ static int stm32_rproc_release(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int stm32_rproc_tee_stop(struct rproc *rproc)
> +{
> +	int err;
> +
> +	stm32_rproc_request_shutdown(rproc);
> +
> +	err = tee_rproc_stop(rproc);
> +	if (err)
> +		return err;
> +
> +	return stm32_rproc_release(rproc);
> +}
> +
>  static int stm32_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -693,8 +710,19 @@ static const struct rproc_ops st_rproc_ops = {
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> +static const struct rproc_ops st_rproc_tee_ops = {
> +	.prepare	= stm32_rproc_prepare,
> +	.start		= tee_rproc_start,
> +	.stop		= stm32_rproc_tee_stop,
> +	.kick		= stm32_rproc_kick,
> +	.load		= tee_rproc_load_fw,
> +	.parse_fw	= tee_rproc_parse_fw,
> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] = {
> -	{ .compatible = "st,stm32mp1-m4" },
> +	{.compatible = "st,stm32mp1-m4",},
> +	{.compatible = "st,stm32mp1-m4-tee",},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
> @@ -853,6 +881,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
> +	struct tee_rproc *trproc = NULL;
>  	struct rproc *rproc;
>  	unsigned int state;
>  	int ret;
> @@ -861,9 +890,26 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> -	if (!rproc)
> -		return -ENOMEM;
> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
> +		/*
> +		 * Delegate the firmware management to the secure context.
> +		 * The firmware loaded has to be signed.
> +		 */
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +
> +		trproc = tee_rproc_register(dev, rproc, STM32_MP1_M4_PROC_ID);
> +		if (IS_ERR(trproc)) {
> +			dev_err_probe(dev, PTR_ERR(trproc),
> +				      "signed firmware not supported by TEE\n");
> +			return PTR_ERR(trproc);
> +		}
> +	} else {
> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
> +		if (!rproc)
> +			return -ENOMEM;
> +	}
>  
>  	ddata = rproc->priv;
>  
> @@ -915,6 +961,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (trproc)

        if (rproc->tee_interface)


I am done reviewing this set.

Thanks,
Mathieu

> +		tee_rproc_unregister(trproc);
> +
>  	return ret;
>  }
>  
> @@ -935,6 +984,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>  		dev_pm_clear_wake_irq(dev);
>  		device_init_wakeup(dev, false);
>  	}
> +	if (rproc->tee_interface)
> +		tee_rproc_unregister(rproc->tee_interface);
> +
>  }
>  
>  static int stm32_rproc_suspend(struct device *dev)
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
