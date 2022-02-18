Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFC54BBA14
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 14:25:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40AF6C60474;
	Fri, 18 Feb 2022 13:25:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 242D6C6046E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 13:25:03 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso6424219wmj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 05:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yrkYgpVIUXGnXP2wkyWmIbd2RYDJqfqs2Rsp+OtCt5o=;
 b=uAAaFw6RHpsnW5DW+gQVrVkaLEzP2Xzhuy4W0EJdVj+v9QPUI1dBLADu063fihlOEu
 SMmDL+vn0fseuUyOwz4U6ojcjnvO2AmogeBd02BQNAwHSuD2pcrlE/kh8xiGBAW74gk0
 VLtxRzwtsIGpUyxapMkGGRS/4St+WSxs5Ah+5sMiXD+P009Tfy8QTxz2pi2Qkhqe+hxF
 hv6LJMEvU1UKM3Gp4pilsMA012MvSbmPZjV8RfRX3qiQ03dZkCCo0OPtymcMqivDiXaK
 6WxgiHHGOQyo+j/OrC3DkLrUyDsYAju7NmHIHfHQEd1nUXxkf4Wm83SB5/0gRlrqW/3l
 OVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yrkYgpVIUXGnXP2wkyWmIbd2RYDJqfqs2Rsp+OtCt5o=;
 b=fWC2tyCD4V3cIJDvCjjzi06/dT5QmZ08Hi0k9cj3NkK+4VqEP1m6WW+20t0OohiUob
 W3T2dH9PnYowtBpA4hKCOGWLv76bOlUyGWcT0FC1k5j1IZ4SCEzR2L9LsgtqtrGtSO+v
 tPJCNj0w2KrgbdDwaaCsu0Hni/U/ojA3LSU87SG6KvyhWJc3YTp0myxlxViPf3ibrkMW
 u3JD9/JP2DFkLBisbhsq74puJHlDOtz3See72Kjr+bkTiHZm2PSD7hll3IeKMvZ3sMwu
 R9X6awhn6NkxRnYXBo8Y9rPIbixNWAy5MFP8gjTcVz4yfvVpw2sjv4b3JQBttinAP57z
 l1uA==
X-Gm-Message-State: AOAM530yeRNDR6wceyeLSJYfIspCboq15rEUAApDxZ9BdBmkBf4w/Baf
 EbvSuZjFiOp5psKjHkJ6NJBY/Q==
X-Google-Smtp-Source: ABdhPJyVAYzbgy/AAZpsXhPLMR1fBjvqb4Dg1MygToTm7RwGLTNkBP3nvxFtcdd/zIFp23yEwgJAXg==
X-Received: by 2002:a05:600c:19ce:b0:37c:6fe:68b6 with SMTP id
 u14-20020a05600c19ce00b0037c06fe68b6mr10451900wmq.90.1645190702754; 
 Fri, 18 Feb 2022 05:25:02 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id r2sm6039032wmq.24.2022.02.18.05.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 05:25:02 -0800 (PST)
Message-ID: <e451d814-2d10-6cb6-3402-6d1580ddbce2@linaro.org>
Date: Fri, 18 Feb 2022 13:25:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, p.yadav@ti.com
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
 <20220217144755.270679-5-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220217144755.270679-5-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH v3 4/4] mtd: core: Fix a conflict between
 MTD and NVMEM on wp-gpios property
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 17/02/2022 14:47, Christophe Kerello wrote:
> Wp-gpios property can be used on NVMEM nodes and the same property can
> be also used on MTD NAND nodes. In case of the wp-gpios property is
> defined at NAND level node, the GPIO management is done at NAND driver
> level. Write protect is disabled when the driver is probed or resumed
> and is enabled when the driver is released or suspended.
> 
> When no partitions are defined in the NAND DT node, then the NAND DT node
> will be passed to NVMEM framework. If wp-gpios property is defined in
> this node, the GPIO resource is taken twice and the NAND controller
> driver fails to probe.
> 
> A new Boolean flag named ignore_wp has been added in nvmem_config.
> In case ignore_wp is set, it means that the GPIO is handled by the
> provider. Lets set this flag in MTD layer to avoid the conflict on
> wp_gpios property.
> 
> Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: stable@vger.kernel.org


Applied thanks,

--srini

> ---
> Changes in v3:
>   - add a fixes tag
>   - rename skip_wp_gpio by ignore_wp in nvmen_config.
> 
>   drivers/mtd/mtdcore.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 70f492dce158..eef87b28d6c8 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -546,6 +546,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>   	config.stride = 1;
>   	config.read_only = true;
>   	config.root_only = true;
> +	config.ignore_wp = true;
>   	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
>   	config.priv = mtd;
>   
> @@ -833,6 +834,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
>   	config.owner = THIS_MODULE;
>   	config.type = NVMEM_TYPE_OTP;
>   	config.root_only = true;
> +	config.ignore_wp = true;
>   	config.reg_read = reg_read;
>   	config.size = size;
>   	config.of_node = np;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
