Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E5BA0B5CC
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 12:33:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DA7FC78018;
	Mon, 13 Jan 2025 11:33:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38613C030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 11:33:40 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43626213fffso31438855e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 03:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736768019; x=1737372819;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3zQksN/TTsX9vOpJ8MEaX/p+hq09whruB8W4shax6NM=;
 b=l3npdraKjTRMl4HDzpGJ7gr93loKpI+8qLMqZop9Lwi+sYmt3i6u8/rfLqycWPD1Mk
 BPHESmszyTRuK6/TdTOXL64axGevXhq6ujClwrq2es8FSDf2w3w+T6Y75HmgyzHjatjL
 HtJ8Q0pU3ZoNiNkMduTYQObBA6xeIZsceaUno8RGptTe1IPXP/o45A2zpkRnDled7SNm
 yzAeE4nh2Sfq9EzYaXqDoWRQHTtjSdmAaG6B3n/IDb56r4CcMSJrBOh8Ooca71Smog7t
 a4gBGp7HO3iW/u5sfPybNHJqVXjkNFO4fDuR5GagkKl9zNFHGMkYFCUt/8HCQLeHrJbp
 obKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736768019; x=1737372819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3zQksN/TTsX9vOpJ8MEaX/p+hq09whruB8W4shax6NM=;
 b=WhHkYOoA1Z696j7jM2POuLUWGGyt8jvmFykGeZ5rs5DadGi/8bHbOAqtdVFyOR9ltl
 76AK8q16osE6Z8IP8k6b9nqkiNAvdxKLwhyw6yfns1zf9SAE1VCzAMJKE+TVicC/1Pp2
 3vLhXnEzgzE6IPoBieVphV3mqBwRoU9npM7ebHml30cI/J5kHWqmA6hDgkM0YolQR+Gq
 WBms15mBKvxiFEcIjN3EIAgOaMtgAseyBmYGoYYJGjs8PbBNZVYPGAcsYuLHjL3AGUaR
 8l2+RqlCGqE62NfqahlocOfYEI4+zgB0uy5sPpc/RDrq5HJSDtB5m+fL8fGBAFt4pF8H
 Va7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUMQ9rOfy9zjGYQnzem6lq12gOzghSVnJUpxoRk3XZLy4dgUSZSvIuRZKC6/06dDcmOOsjaRXu/TeaAA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxo+AFRsrAcWtTQkiZC879tUvWQbU4efl9+hFgPmOYoVtCPbVMV
 Hqjm/So6wKaY/nSCBNScmq8mhgLuUmK6PgHCNW1zatyy6oByzkoTqU4xYl18eoY=
X-Gm-Gg: ASbGncs5hzPV/k47GN3Dam51NSuYIYSHojqqiBolbYuBGjuRzCDUyJOG7NYArW/N5Ii
 zpEjTNM38TKBBkLZrUn0iK10lyEWhtIXa/wrFFjDZGF2++hRdmwtKnkQQG2Axx81cFcKNEqPI9K
 Ub5f+GmZWNEIC7aEFTtAkO85XrZ8jiCR85393PvPhfpoiuI4B8VIegLQdIdLAKyoZ1N+5FVF74y
 tSL8l8VC9sNbTMgV2As9rQglg9G6/beCOMQVmhBcsUJe6CLX1EcTWbu7BI94Yg3g30Q
X-Google-Smtp-Source: AGHT+IErNZ292W88Ml7JDMJHkUe6E1sEG0FgJvIY7MzDkFid6VFTjBJklMQW67SGtV9vc4HOI/jALA==
X-Received: by 2002:a05:6000:45a0:b0:386:3327:4f21 with SMTP id
 ffacd0b85a97d-38a8b0f8507mr10910143f8f.27.1736768019544; 
 Mon, 13 Jan 2025 03:33:39 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d01dsm11832630f8f.9.2025.01.13.03.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 03:33:39 -0800 (PST)
Message-ID: <7f342ebe-6c82-4ae6-b59d-399ec3018838@linaro.org>
Date: Mon, 13 Jan 2025 11:33:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-2-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241226011022.1477160-2-quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v8 1/5] Coresight: Add support for new APB
	clock name
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



On 26/12/2024 1:10 am, Jie Gan wrote:
> Add support for new APB clock-name. If the function fails
> to obtain the clock with the name "apb_pclk", it will
> attempt to acquire the clock with the name "apb".
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   include/linux/coresight.h | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 17276965ff1d..157c4bd009a1 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -459,8 +459,11 @@ static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>   	int ret;
>   
>   	pclk = clk_get(dev, "apb_pclk");
> -	if (IS_ERR(pclk))
> -		return NULL;
> +	if (IS_ERR(pclk)) {
> +		pclk = clk_get(dev, "apb");
> +		if (IS_ERR(pclk))
> +			return NULL;
> +	}
>   
>   	ret = clk_prepare_enable(pclk);
>   	if (ret) {

Reviewed-by: James Clark <james.clark@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
