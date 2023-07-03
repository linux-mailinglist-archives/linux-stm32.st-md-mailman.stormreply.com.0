Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62981745B4B
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 13:38:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E30CC6B45A;
	Mon,  3 Jul 2023 11:38:09 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8F8CC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 11:38:07 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-51dd1e5a621so5672684a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jul 2023 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688384287; x=1690976287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X5HPd4zFbQ0E8syfNvWoZd2Jd08kmy2oDhqKMHkzCzU=;
 b=WTSAIu0maOXQvTMLW5soPiv4CB8m8rJXos+Ot/4WhoAT3QcoySeaG03E3s4qyOsLAE
 Fti+Zr+2ygJOfVCoGWf6TlPthhRoXpzr9z1/jgRcGtrGllnYf7UxA8w8Bs17b0pQZEW5
 tvmISmZINVUix2PAApU6Osun8dVCilkx/R5h/GnAeZs1US2IfXem9jb1iEC+UzK7RTkg
 Fa4TqSjhPZVbAQlznOuPTyNAlqvYzttRsp/lsMgeItRybVTA4RvQ34EpHtHgAxPlSVJh
 nFb/hPJCev99wQuTGYl4XRx/TOKxJ9WppJPRuUH+ChxHLvd0uAGickcRDP7CWstI7fPj
 4NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688384287; x=1690976287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X5HPd4zFbQ0E8syfNvWoZd2Jd08kmy2oDhqKMHkzCzU=;
 b=XVd70SVCCwo4xVmhO7SPn7C/nDgfhO2YVLjwZKd+6rc9LSuTk3o+cwDcl/rXtTIhLS
 Y3coN4QlVKGzK4EPISGgomIV/4+ebu+AgVk9IpB5Xm+bnIlzU8E+yltORjG+4+Q4BH5W
 /Zhr0XspJ+P+gB49+clx8L/MciS8xIFMp8AwmNFd10eZxNL8R4W9qttRlW2b4UkfquUx
 HbYcTmYFTmPFlJf8MAKl3F2adstljRJov8HmdlD5DJDX9vvhAQnMrzaihXr09fB4VNfC
 6YVCco8W73CF1mVGzjoFYCyFNCxuxopqqhFcckwsKGBM5QFdnqVPxA2Q3ITsMwatyq21
 I6+w==
X-Gm-Message-State: ABy/qLao9se+40RcYvnh1BVJLulGV+DFuuepinzS282wFCY1Dcac2ERg
 ZpJgBbaJi8Z+X9brV5WGgruABQ==
X-Google-Smtp-Source: APBJJlFffSttED6PPzA0GMbvALnbcSFZlcl8peWg26b+PFdzfiWaPZ5DZ6BTAp/RMGL8Hcmd6Pnyng==
X-Received: by 2002:a50:ff0d:0:b0:51b:df1d:ebc3 with SMTP id
 a13-20020a50ff0d000000b0051bdf1debc3mr6968185edu.25.1688384287387; 
 Mon, 03 Jul 2023 04:38:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a056402515600b0051e0f100c48sm1412583edd.22.2023.07.03.04.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 04:38:06 -0700 (PDT)
Message-ID: <20873d35-86f6-70e7-ed19-efaffb9eb25b@linaro.org>
Date: Mon, 3 Jul 2023 13:38:02 +0200
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
References: <20230627071707.77659-1-frank.li@vivo.com>
 <82dc5efc-35fe-15ff-d0ea-e1a19da71c5c@linaro.org>
 <db14ea3c-c224-e263-e134-70e9acc5008a@vivo.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <db14ea3c-c224-e263-e134-70e9acc5008a@vivo.com>
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

On 03/07/2023 11:10, Yangtao Li wrote:
> On 2023/6/27 15:43, Krzysztof Kozlowski wrote:
> 
>> On 27/06/2023 09:16, Yangtao Li wrote:
>>> Ensure that all error handling branches print error information. In this
>>> way, when this function fails, the upper-layer functions can directly
>>> return an error code without missing debugging information. Otherwise,
>>> the error message will be printed redundantly or missing.
>>>
>>> There are more than 700 calls to the devm_request_threaded_irq method.
>>> If error messages are printed everywhere, more than 1000 lines of code
>>> can be saved by removing the msg in the driver.
>>>
>>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>>> ---
>>>   kernel/irq/devres.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/irq/devres.c b/kernel/irq/devres.c
>>> index f6e5515ee077..94039a915218 100644
>>> --- a/kernel/irq/devres.c
>>> +++ b/kernel/irq/devres.c
>>> @@ -58,8 +58,10 @@ int devm_request_threaded_irq(struct device *dev, unsigned int irq,
>>>   
>>>   	dr = devres_alloc(devm_irq_release, sizeof(struct irq_devres),
>>>   			  GFP_KERNEL);
>>> -	if (!dr)
>>> +	if (!dr) {
>>> +		dev_err(dev, "Failed to allocate device resource data\n");
>> Just like any memory allocation, I don't think we print anything for
>> devres failures. Why do you think we should start doing it?
> 
> 
> And tglx point out that:
> 
> Having proper and consistent information why the device cannot be used 
> _is_ useful.

Where did tglx suggest printing devres allocation ENOMEM errors?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
