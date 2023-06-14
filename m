Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD0072F5AB
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 09:14:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7C95C6A61A;
	Wed, 14 Jun 2023 07:14:03 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA0A6C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:14:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4f642a24568so8048943e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686726841; x=1689318841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wXKHed6+j3YBrrxp8AhQhFGlVOHvFUCBH9GPXEoaEzo=;
 b=ZGmuxDkhsAalBig4v1AtxqfenTa9oHltsyUnycHLWUoEv/eCk7scpXtexHXjYEPFTB
 I5kXHlSPrqYz+33urIOC+twEm1kzgyg8jbonYStoPSjf4qCu6uca4RfIxCGTnH7cDpKA
 DAbGrnDmtaFUuMZYZErjWVDcBikPAFJM+kUso3aFafgqCt6bwxcV5MeuibqNO0+Jq8BW
 4GjtwvDpW2Xol7UI/lL71HZyR+tqFhHC8Y7ZdfAp4cyHeoYeLdXDCTNX3YLFrpfIeqb1
 K+a6tbjLw3ZZPR1fwAHNk4OGupAWnjHpACivT8IFDkz7V7MieEvPvnLw1aUCPfbRQLPE
 EcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686726841; x=1689318841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wXKHed6+j3YBrrxp8AhQhFGlVOHvFUCBH9GPXEoaEzo=;
 b=OmAaSHc9CjXbAT2x+vP6wmXBepEftMq016ScmzNRuymyx3W5qVBtCWLG3DdhLc1N6G
 X/wF07xYIQbPFz93fOijZoE7mWwfaa0Y19g8c65Sr5PGeDzJwT213FO7NMO4BKKo67MB
 TSIhBv0hpjAiBjrXM3W6Q9z6m+lp3veT3TxSKHhi7RkcUna0m3YgoIMGSf5W5z86Ct7o
 qiOT5k5f7Gq9Y1rzFvpzIqnwWlRsFgpj1JhdqX5QolDvYBOG7Efa7w4DPskFHPTCaPYA
 nWn8eUbQsSugzsJxcXPBvsxiPn5K2xg77qbnxu9frW9mJLw2Naxb+4/np7esImbsbnX5
 slvQ==
X-Gm-Message-State: AC+VfDw6+t9RgrF8+RhQlUhq/cDqDXaJv4mFhHW7vXxR7Rhfx/6oLulD
 oTKu3MfJdFdl1QiDNjTzQ6acwQ==
X-Google-Smtp-Source: ACHHUZ6UUVEg8GBaPlHMq9L3Im2SMaz+Jvnddpr22VGirb893Y/RtH/cprjUAq6IjFSaN5o14+X86g==
X-Received: by 2002:a19:6611:0:b0:4f4:b783:8556 with SMTP id
 a17-20020a196611000000b004f4b7838556mr6082949lfc.66.1686726840952; 
 Wed, 14 Jun 2023 00:14:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056402184400b00515c8024cb9sm7510329edy.55.2023.06.14.00.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 00:14:00 -0700 (PDT)
Message-ID: <03b672b5-46f6-5df5-e0c6-050886cea311@linaro.org>
Date: Wed, 14 Jun 2023 09:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-5-brgl@bgdev.pl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612092355.87937-5-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/26] arm64: defconfig: enable the SerDes
 PHY for Qualcomm DWMAC
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

On 12/06/2023 11:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the SGMII/SerDes PHY driver. This module is required to enable
> ethernet on sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
