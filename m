Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 691EA73FA34
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jun 2023 12:28:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 029B1C6B44D;
	Tue, 27 Jun 2023 10:28:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88E47C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 10:28:20 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fba545d743so5649055e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687861700; x=1690453700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gmf7swzBx3zmrorxZOdEgYZz3vMgCASZCN0hJOkIo00=;
 b=C+BVtYn4jX0LRy0VrAz6Tpink6WrpV7gikawtc8z6OICC9zRejV4euVhEN7qDurUc4
 I10v4x8VsvLNbjrUd0sigj2DP8SNn0yP4q3PpTmvlBr8qALYshj5BXKrSILx8V9DFiBz
 4GvIQ3bQaSMtkaieP5dfIeXqPgQDS9KETd60dZ4ix3c/ckSMKh4Lyeq6OLsPB2tnVCVF
 r8dEOPcgigBTLHy9fu59BNAsyRfs4OEh5LYoH4Qvx98EonKQ3VHEcOY29vpq2t+B5tTi
 ywNEh7XU/A8bJQFbO3O/iFSoV3A/uMEFAEbntTtQ42fR777djBZbWkYChLlvgg+Bb4W1
 QBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687861700; x=1690453700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gmf7swzBx3zmrorxZOdEgYZz3vMgCASZCN0hJOkIo00=;
 b=F2+R0vgvdryKHDiX9XONbNG7GOIVGke7uID6c9Ydac91s1ra2RfDJwcGmMa6QgHOaE
 ekf/D7zewomXjbYO2AWmXaxX94cSxMHc0JXsdxagxkWt/ZLFWgdbQiJlLQkxkH/rLmMC
 sBzpkab2Ck6kcsQVerlmibTLQsw83tFfnlu5E0uhySMIQVDdTwtnlBVeYUty2ERTcb49
 yhOn0EVJ+n7s5GA54Tp1f3dEQ5TddB+oT8Sw1c6jBKMt1Fn76PoCyGT/SBzTx/U0ReMj
 Ro15vI5IKi0dP5Bdeq8pk0HF5FaJvQfxwc19OlI0I3VddpeoyS1pNzm+/aWkRv27q9gV
 i6HA==
X-Gm-Message-State: AC+VfDx9pffINsg3ADvPnyTstGOTpOaCl07geWTF0NMctc0+gwmEcasY
 Bug+lpXg4u5NT/C2eO6nsvZdLw==
X-Google-Smtp-Source: ACHHUZ5XMObNZEMfu2qUXIhZuLUJ2ha5NxMgYWPdt3EyCo1TufdxxWi8w5C9EWlJPCA81JQywXQslA==
X-Received: by 2002:a7b:cc15:0:b0:3f9:846:d892 with SMTP id
 f21-20020a7bcc15000000b003f90846d892mr24473786wmh.9.1687861699917; 
 Tue, 27 Jun 2023 03:28:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b003fa74bff02asm10232352wmb.26.2023.06.27.03.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 03:28:19 -0700 (PDT)
Message-ID: <689ffb7b-9efb-ecec-61f5-9d8b00f9906b@linaro.org>
Date: Tue, 27 Jun 2023 12:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
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
References: <20230627101215.58798-1-frank.li@vivo.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230627101215.58798-1-frank.li@vivo.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/15] genirq/devres: Add error
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

On 27/06/2023 12:12, Yangtao Li wrote:
> Ensure that all error handling branches print error information. In this
> way, when this function fails, the upper-layer functions can directly
> return an error code without missing debugging information. Otherwise,
> the error message will be printed redundantly or missing.
> 
> There are more than 700 calls to the devm_request_threaded_irq method.
> Most drivers only request one interrupt resource, and these error
> messages are basically the same. If error messages are printed
> everywhere, more than 1000 lines of code can be saved by removing the
> msg in the driver.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  kernel/irq/devres.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/irq/devres.c b/kernel/irq/devres.c
> index f6e5515ee077..fcb946ffb7ec 100644
> --- a/kernel/irq/devres.c
> +++ b/kernel/irq/devres.c
> @@ -58,8 +58,10 @@ int devm_request_threaded_irq(struct device *dev, unsigned int irq,
>  
>  	dr = devres_alloc(devm_irq_release, sizeof(struct irq_devres),
>  			  GFP_KERNEL);
> -	if (!dr)
> +	if (!dr) {
> +		dev_err(dev, "Failed to allocate device resource data\n");

I don't understand why did you send v2:
1. Without responding to my comments - either by implementing them or
continuing the discussion
2. Without changelog explaining what happened here

My comments for v1 stand. Please do not ignore them, respond. If sending
new version, then usually one per day is max and of course provide
changelog.

>  		return -ENOMEM;
> +	}
>  
>  	if (!devname)
>  		devname = dev_name(dev);
> @@ -67,6 +69,7 @@ int devm_request_threaded_irq(struct device *dev, unsigned int irq,
>  	rc = request_threaded_irq(irq, handler, thread_fn, irqflags, devname,
>  				  dev_id);
>  	if (rc) {
> +		dev_err_probe(dev, rc, "Failed to request threaded irq%d: %d\n", irq, rc);

Why printing rc twice? Did you test this patch? Does not look like.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
