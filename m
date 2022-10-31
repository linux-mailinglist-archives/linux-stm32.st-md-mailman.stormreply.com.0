Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D39AD613C59
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 18:41:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85820C57183;
	Mon, 31 Oct 2022 17:41:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6272C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 17:41:08 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so1941557wmb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 10:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q/OpgeoeT7Af136IYQ4r3OQjgAT02ZBjfVXL9qn1o/M=;
 b=tmu37pv2M36Eh1MEouK9cr5G8V7M6XmhSKO/J7sGvSl8iw4IpEw76eWF0XlLhAKP3x
 ubv2Kh9NW9aL5WUN24AMRxFw1OHiqGznvWwlz3Rzut1N4+RXboLvtn7k0Ku27K9OhRPf
 MIPhzD5bpwUlAnYo7P4FaKPPWr9jg/R2Xf9oFQB8GRgFlhB6AufUXw16QwfLzA2Dz2L+
 k4xMV/H/xbV2sYxscsKFP0sTZfLFgAE/ZejVjlOTrc02Y9Ob+i/FnQIMlboBAUNbwRfO
 K0WRMMRuQQNtpzhlnCFHRH1mbK4gKDcSIIrwLVkufl6qzi+EADsq7c1FmkAR7umWTwxL
 VFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/OpgeoeT7Af136IYQ4r3OQjgAT02ZBjfVXL9qn1o/M=;
 b=YXlMIjGzxax70e6ytklBNIzYdCjtLVTNisOpXKw3i0Jt5XO1tl4UtkuP0PF8hr49tc
 Ly6JOU2hQwp26BAkQwq+zsjcZLdLdpA3j0kwhwJw51bAycvDuwmXnrM8RdHO1ur5UFj7
 kSjAPUE0wRjTQjDkVQzhTNm3DVDYEChUpsRXMaHEcsmCxX5OgFhAj/d1QfqThqmjMTau
 4oeizwU2U/Qy5hVSVhl9AtSzPEGKdh1WQr2wZ6rPvyN8YADIWds8jVyk2zZmMR1ztbC2
 FkSyrVMjdHkO8qfxyUKhvogLH8rJYqoU92fWHUt03UkyUFObaGttovbukEFS7t4fe7ij
 z/iw==
X-Gm-Message-State: ACrzQf1HhcfJrHixWn5BuzYGRy2L+0Q48g/5usBfcM8CvDVyxtSeAztD
 kpfALVRPIdNauG9EtqlcXtX2FA==
X-Google-Smtp-Source: AMsMyM55+npV/D80DBdbhTDyJtLxU1fuAGuUKvpU07CgaqByW/XCNI4AmnNwV+McKAMVAwlNEKxViw==
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id
 u7-20020a7bc047000000b003b4adc71ecbmr8993665wmc.144.1667238068336; 
 Mon, 31 Oct 2022 10:41:08 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 a15-20020a5d53cf000000b0023682011c1dsm7767985wrw.104.2022.10.31.10.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 10:41:07 -0700 (PDT)
Message-ID: <d6f4731b-5383-22a6-ca4c-76aed6c20147@linaro.org>
Date: Mon, 31 Oct 2022 17:41:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221017154957.277120-1-patrick.delaunay@foss.st.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221017154957.277120-1-patrick.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 0/3] nvmem: stm32: several minor
	improvements
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



On 17/10/2022 16:49, Patrick Delaunay wrote:
> 
> Several minor improvement for BSEC driver = nvmem stm32 romem
> - move STM32MP15_BSEC_NUM_LOWER in config, to prepare introduction
>    of next STM32MP products with more OTP
> - add warning when upper OTPs are updated to indicate possible ECC issue
>    for second update
> - add nvmem type attribute so userspace is able to know how the data is
>    stored in OTPs
> 
> Changes in v2:
>    - Add patch "move STM32MP15_BSEC_NUM_LOWER in config" in the serie,
>      solve dependency issue for "priv->lower" in patch "nvmem: stm32:
>      add warning when upper OTPs are updated"
> 
> Patrick Delaunay (3):
>    nvmem: stm32: move STM32MP15_BSEC_NUM_LOWER in config
>    nvmem: stm32: add warning when upper OTPs are updated
>    nvmem: stm32: add nvmem type attribute
> 
Applied thanks,
--srini

>   drivers/nvmem/stm32-romem.c | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
