Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C143573F5E6
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jun 2023 09:44:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79E3FC6B44D;
	Tue, 27 Jun 2023 07:44:01 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A987FC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 07:43:59 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2b6a0d91e80so29000771fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687851839; x=1690443839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nXDjy7JPJ8XrZiw8dYtuA9M7FtFKUmW4GijlGMiZDeo=;
 b=W3StrIEt1NsXEWvdU5avGU95Enq3cbFYCcn4JQnVWeuR2OJCVzshq5XVbRERJWATTj
 a8gTuNq+u+zQTtVHVlxCyJhcjzGRjssWWYa18rsYhWT5uM9hOtRtst7HejvUCbqZ9b6U
 oBLhEK3ey+uadLyH3jqFHft76Hup2g93+m5WYHqveVWRtmePCFkN+4j5sJ9GDFM4Es8X
 OdXG1uZChre1Rw0EPQGwd8DTHS9Tw2mPeNoAlu4qfwnbKprxnJ7GDcvEt9NC5IkZSfrh
 Up8W3fdSXm5G/T2XZcqeOIo6DdRVHrwqkx6R8Eu7VZs1I+uQ9V8bQ4PbTI/hPhZT9Zo8
 eLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687851839; x=1690443839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nXDjy7JPJ8XrZiw8dYtuA9M7FtFKUmW4GijlGMiZDeo=;
 b=DazF45KazXmv0/qo+/IJg73/J1R7BmZImYRdVnqMfm1DPUcgHRF4ZpbTA2ko1M7uCz
 AWS3GbJ07ORcIvj83O9rNvx+5qRKzYRNtxTss/ixVoJgCuIschsU9KTCkxKSNJKAM7y9
 SdU6h2xQQeKHIqlGeSisPK4n+Yxy9MsWm39AFGVKD2xtupc22GW4zYaibpwUSxjoxCOI
 18Ntuci578NiPBTagROFqhyB8yvPGi3R6vBElC0Bak8eWvCqIzOrXYlK8KUBFdKBjD1T
 LpDqkD+MjIzVyx8LIUC2PyWWLNRqhyqidNGJK1lgJcumcZexZTd24ZOxV232JYqLAbdc
 iV9Q==
X-Gm-Message-State: AC+VfDyi8QAoHDL4NkjtHfo0jDgRxt29il3pcv/KrkRiXmwPhM5ZQxpI
 /A1gcFVIhXqxcXwn6x+P8XOeRw==
X-Google-Smtp-Source: ACHHUZ6qtmjN/vi/vgCBazSl8DAEcvTTiaFDRa2Iv5DYB3acC9xLxbjSTFmH5IakkXPbPPvl85v0lA==
X-Received: by 2002:a05:6512:3f1d:b0:4fa:ce08:a9d0 with SMTP id
 y29-20020a0565123f1d00b004face08a9d0mr4045130lfa.57.1687851838802; 
 Tue, 27 Jun 2023 00:43:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c22d500b003f9cb3c8958sm12898448wmg.3.2023.06.27.00.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 00:43:58 -0700 (PDT)
Message-ID: <82dc5efc-35fe-15ff-d0ea-e1a19da71c5c@linaro.org>
Date: Tue, 27 Jun 2023 09:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Yangtao Li <frank.li@vivo.com>, miquel.raynal@bootlin.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, mmayer@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, thara.gopinath@gmail.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 srinivas.pandruvada@linux.intel.com,
 DLG-Adam.Ward.opensource@dm.renesas.com, shangxiaojing@huawei.com,
 bchihi@baylibre.com, wenst@chromium.org, u.kleine-koenig@pengutronix.de,
 hayashi.kunihiko@socionext.com, niklas.soderlund+renesas@ragnatech.se,
 chi.minghao@zte.com.cn, johan+linaro@kernel.org, jernej.skrabec@gmail.com
References: <20230627071707.77659-1-frank.li@vivo.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230627071707.77659-1-frank.li@vivo.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/15] genirq/devres: Add error
 information printing for devm_request_threaded_irq()
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

On 27/06/2023 09:16, Yangtao Li wrote:
> Ensure that all error handling branches print error information. In this
> way, when this function fails, the upper-layer functions can directly
> return an error code without missing debugging information. Otherwise,
> the error message will be printed redundantly or missing.
> 
> There are more than 700 calls to the devm_request_threaded_irq method.
> If error messages are printed everywhere, more than 1000 lines of code
> can be saved by removing the msg in the driver.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  kernel/irq/devres.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/irq/devres.c b/kernel/irq/devres.c
> index f6e5515ee077..94039a915218 100644
> --- a/kernel/irq/devres.c
> +++ b/kernel/irq/devres.c
> @@ -58,8 +58,10 @@ int devm_request_threaded_irq(struct device *dev, unsigned int irq,
>  
>  	dr = devres_alloc(devm_irq_release, sizeof(struct irq_devres),
>  			  GFP_KERNEL);
> -	if (!dr)
> +	if (!dr) {
> +		dev_err(dev, "Failed to allocate device resource data\n");

Just like any memory allocation, I don't think we print anything for
devres failures. Why do you think we should start doing it?

>  		return -ENOMEM;
> +	}
>  
>  	if (!devname)
>  		devname = dev_name(dev);
> @@ -67,6 +69,7 @@ int devm_request_threaded_irq(struct device *dev, unsigned int irq,
>  	rc = request_threaded_irq(irq, handler, thread_fn, irqflags, devname,
>  				  dev_id);
>  	if (rc) {
> +		dev_err(dev, "Failed to request threaded irq\n");

I don't like that one path - devm() managed - prints error, but regular
path does not. Code should be here consistent. Also error message is too
generic. You need to print at least irq number, maybe also devname?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
