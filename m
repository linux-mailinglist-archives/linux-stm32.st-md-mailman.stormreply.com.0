Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECF1A4D39
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Apr 2020 03:29:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07749C36B0B;
	Sat, 11 Apr 2020 01:29:55 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52A78C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Apr 2020 01:29:53 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id nu11so1359943pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 18:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oViI8SklfCpZEbbYlFvgdpzM6/kZH9ALRRalOuYsvgM=;
 b=UNiShD7wlrWrXzBNeCBUu2DcSXJtHq7Z0Y8/MbsvAvNfpVWxNN7VvKLAuR31RGhV31
 LEOiAQi3VF/qJssY+mxdRur0UBNn39b9pLsPV87xF1fdZAvudU3b0CZ2rnInopThwfyR
 0XyuuwJblsOtu+P+1AbiEW7/c1NwHvY+NZM2Yfy140kEFWTiqkSKfSbdXm9/RHxRv2dT
 aSrwEV2ox1H3Oz/URa8lu4yUXLj3AURT7dyuFqOEpYrfMklx44SQAiIFR6yGKCAs06K0
 aC2AR5lgaz9SoZn9OzR3ZhLbqpuDjsRS1k5vUFBhYBtLPbOJ3BqPH9S5MlQeBTE1ux+9
 OfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oViI8SklfCpZEbbYlFvgdpzM6/kZH9ALRRalOuYsvgM=;
 b=QYtLeaDeqqfe1WBR4pL9ozlRfy5kuwL7CY4PnP+/fwMdeNprDEhWHitkPRqxCcqF8s
 jEQQMWwHMEDf+9UOY5jtTjl5pxl4h6v6yPaPDBZcsW+Nj3AGTFPe/l4KVHH2+pBJgunW
 HkBMS6uzkz+K/GeJ9Y+iI67QDxKZtRvMq+sJhe211ncwnwqxTWjB3rfA1vaUYCs5GtaU
 btbL6F3H1udv4aaXchs4nAaX7OvPGsJ31d25eALTUJ9kvwC08ABTe3T5hgRoi4sqpXsb
 OTaVkZY57OtB3jHCLsSvf+/9zcsKf4I6XVTSR43avSuMbbdovLwc3xibhWu4muFnwj59
 ImlQ==
X-Gm-Message-State: AGi0PuYEERTQIwqa85i9gaV/kOPF4YShnUzaB4PMLVwRqkWoqyjEngs3
 gT2fbCB/nE2aaYx2DjoLjBiyuQ==
X-Google-Smtp-Source: APiQypIXEXPs9ksy3YjzBn7ixpo5mSMrugBfNzjkDJTpNfz4i3ihrt5TAUeFr8YSL7/BbVFVdh0/LA==
X-Received: by 2002:a17:90a:6c22:: with SMTP id
 x31mr8469537pjj.124.1586568591685; 
 Fri, 10 Apr 2020 18:29:51 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id s62sm2575561pgb.94.2020.04.10.18.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 18:29:51 -0700 (PDT)
Date: Fri, 10 Apr 2020 18:30:01 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Clement Leger <cleger@kalray.eu>
Message-ID: <20200411013001.GG576963@builder.lan>
References: <20200410102433.2672-1-cleger@kalray.eu>
 <20200410102433.2672-3-cleger@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410102433.2672-3-cleger@kalray.eu>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] remoteproc: use
 rproc_coredump_set_elf_info in drivers
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

On Fri 10 Apr 03:24 PDT 2020, Clement Leger wrote:

> Modify drivers which are using remoteproc coredump functionnality to use
> rproc_coredump_set_elf_info in order to create correct elf coredump
> format.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Clement Leger <cleger@kalray.eu>
> ---
>  drivers/remoteproc/qcom_q6v5_adsp.c | 1 +
>  drivers/remoteproc/qcom_q6v5_mss.c  | 3 +++
>  drivers/remoteproc/qcom_q6v5_pas.c  | 1 +
>  drivers/remoteproc/qcom_wcnss.c     | 1 +
>  drivers/remoteproc/stm32_rproc.c    | 1 +
>  5 files changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 2b01f2282062..8c3bd0954a13 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -423,6 +423,7 @@ static int adsp_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;
>  	}
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 03ffc6db4c68..5a7ff1092362 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1355,6 +1355,8 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>  		return ret;
>  	}
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
>  	qproc->dump_complete_mask = 0;
> @@ -1632,6 +1634,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	}
>  
>  	rproc->auto_boot = false;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	qproc = (struct q6v5 *)rproc->priv;
>  	qproc->dev = &pdev->dev;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a41860d2243a..991f57e8e55b 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -390,6 +390,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	}
>  
>  	rproc->auto_boot = desc->auto_boot;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 0c7afd038f0d..5d65e1a9329a 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -480,6 +480,7 @@ static int wcnss_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;
>  	}
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
>  	wcnss = (struct qcom_wcnss *)rproc->priv;
>  	wcnss->dev = &pdev->dev;
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 6a66dbf2df40..0f9d02ca4f5a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -625,6 +625,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (!rproc)
>  		return -ENOMEM;
>  
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  	rproc->has_iommu = false;
>  	ddata = rproc->priv;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
