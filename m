Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD4D613C5F
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 18:42:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A65AFC0AA15;
	Mon, 31 Oct 2022 17:42:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7781C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 17:42:40 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y16so16981676wrt.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qBD58fOU8dXLZw0gU/vFhiLvEwJEGbaxG96W6LE0yWQ=;
 b=DFddqwoKdUK9FiPWro84KHWXNxctg4u0sBQ5fwz4T8ZEHwP3YNl9J0hHY8upp31AiA
 lV4r2INXQUfSRz4zDE4lTuhcZ4DS8axYzPJpvcKEoaDWf8GFpJbzcsXMDI/qiOFsyzdV
 GS0gMt4kjnKnz5I7EFjZODt/hypuOT0cwOlC/mFICA7SDOR3I14QZgt9mjaQeujcHgxC
 i0HOfJ2ufURD3rWCJF7W+7wY765aS1+F+mLngXtA8o79FVF0Yn4TEuZVCkdvaJae4/lV
 Cu1fqms1Sd6zBIJ22vy8f03+RWg8v0fFTOrPNOB3WseIMTjSotENj8LMSEuMfpqkQAjy
 s8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qBD58fOU8dXLZw0gU/vFhiLvEwJEGbaxG96W6LE0yWQ=;
 b=KuhZ7MR110uctuy0yooNg04UHWpjn3+CZFN3fZn6gct6vGq+8ezSGlhqHZzeg6KSVf
 wv6vOfqJqr+laoxTPv2zhbJQAkJWQhe3EZqh0ad89ZQ9II5hK41KgZwrq9l4mGJBpsEL
 Odk/Lq153r2QWcnhC5FXZ18hgf26IgdjucqUWXb9GHzObpMe1AoX06qcuOH5TpPRTv5B
 gIms/vMCmcJjrzmY8/UlY5p6k4jQ7ESJLfbXo/217z3fi/i9OsicEY4ux+aIYDiky2bx
 N8k7S6EVsf9s7XFJz53k6M7nU56nFnnZ0NOytWQM9565rmLcMewnxugE0adVAgHAHQj0
 tTyA==
X-Gm-Message-State: ACrzQf2ZujixjIG8ztSlMjXv9VGBQ0+MwLNrOZQ0Sx+zvZa1nKNIUTpK
 Ix5hdGyCQ0Chrry5iO4R5CgVfg==
X-Google-Smtp-Source: AMsMyM445eUR2UuTOs0wCe7zoEzp750QBgbl7ZjXyGKXWlj9ASz4sIx6ORMSuR/+TaFi777WdjBRcg==
X-Received: by 2002:a5d:5643:0:b0:236:699c:6cd8 with SMTP id
 j3-20020a5d5643000000b00236699c6cd8mr9010504wrw.435.1667238160365; 
 Mon, 31 Oct 2022 10:42:40 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 g15-20020a05600c4ecf00b003c6f426467fsm8585443wmq.40.2022.10.31.10.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 10:42:39 -0700 (PDT)
Message-ID: <4cec819c-abd9-a9f8-5874-8394b6902bdb@linaro.org>
Date: Mon, 31 Oct 2022 17:42:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <20221028145252.2115933-1-patrick.delaunay@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221028145252.2115933-1-patrick.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/3] nvmem: stm32: add OP-TEE support for
	STM32MP13x
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



On 28/10/2022 15:52, Patrick Delaunay wrote:
> 
> This serie update the NVMEM BSEC driver to be compatible with STM32MP13x
> SoC and the trusted application STM32MP BSEC in OP-TEE
> 
> This serie solve issue in initial support of STM32MP131
> (using BSEC STM32MP15 compatible) and so it break the DTS compatible.
> 
> I create this serie for more efficient review.
> 
> The 2 first patches of this series are re-sent of patches already sent
> 
> 1- "dt-bindings: nvmem: add new stm32mp13 compatible for stm32-romem"
>      https://lore.kernel.org/all/20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid/
>      https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=685403
> 
> 2- "ARM: dts: stm32mp13: fix compatible for BSEC"
>      https://lore.kernel.org/all/20221017134437.1.I167a5efc1f8777cce14518c6fa38400ac684de3e@changeid/
>      https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=685815
> 
> This DTS break is acceptable as
> - the STM32MP13x SoC is not yet available outside STMicroelectronics
>    (not official)
> - the same patch is already integrated or modifications are in progress in
>    the other users (arm-trusted-firmware/TF-A, OP-TEE and U-Boot) of
>    stm32mp131 device tree.
> 
> It is the good time to correct this issue before the real availability of
> the SoC and before full support of SoC in Linux kernel.
> 
> This last patch on NVMEM STM32 ROMEM driver in depend on the preliminary
> patch for the driver:
> 
>    "nvmem: stm32: move STM32MP15_BSEC_NUM_LOWER in config"
>    https://lore.kernel.org/all/20221017174953.v2.1.I95e71328dd654723bd4c57206bd008ff81c726bb@changeid/
> 
> present in the serie
> 
>    "nvmem: stm32: several minor improvements"
>    https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=685886
> 
> Regards
> 
> Patrick
> 
> Changes in v1:
> - update commit message to indicate DTS break reason.
> 
> Patrick Delaunay (3):
>    dt-bindings: nvmem: add new stm32mp13 compatible for stm32-romem
>    ARM: dts: stm32mp13: fix compatible for BSEC
>    nvmem: stm32: add OP-TEE support for STM32MP13x

Applied 1/3 and 3/3 thanks,

dts changes need to go via the dts maintainer..

--srini
> 
>   .../bindings/nvmem/st,stm32-romem.yaml        |   1 +
>   arch/arm/boot/dts/stm32mp131.dtsi             |   2 +-
>   drivers/nvmem/stm32-romem.c                   | 450 +++++++++++++++++-
>   3 files changed, 448 insertions(+), 5 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
