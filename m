Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB872EB7E
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 21:04:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 873DCC6A61A;
	Tue, 13 Jun 2023 19:04:15 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 822EFC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 19:04:13 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4f762b3227dso345700e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686683053; x=1689275053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=woeYYFEiU1y3NclAr5wdCFdPFOi62sLbxPfwISR5Xn8=;
 b=q2bbZiF2Xy2JxkCX8e3y4fFp2cP9iFKv42xyhROdmk2mpDr7LXZfz3AWcU7AxuHxKc
 IBySptwOhOAewBK0W7T3JZWk1l4Kj0ib1b7kfAkZPI6Mp/FlSBZj1SdO4XPDtu53cxh+
 wzJOoSDF5OtB4VFwZt0q+PodkxVuxE0QGoEdHp9BvSX7JmMHiBIIFACiOq9QEDZ5HZeI
 xXZqzZxo83ru7G7QauolFOyXqjc0HfXZRUJgtbKj7CmSdqc+ucEjOfsDf8AdyWXweCr2
 C+2eCONnBG/Stb3+zfI0K/svhD1H7VcMrPRWr7lntdBMeOj9IO7/m0BH9YMeFk5YzD5H
 pxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686683053; x=1689275053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=woeYYFEiU1y3NclAr5wdCFdPFOi62sLbxPfwISR5Xn8=;
 b=a9MosFI4/p6pjCu8/guL424n1NA1jWC54VZnqtLo0YwLrhsNyNvRU8JO9nDr5ArvCA
 eXiIs7cNyhW8+8X8puTwvpfG1xT2niOIue4k5I6Hhuz6TZCw/febEcIU2ZcY2/VZRc2L
 KmZJD9KaFC0xBAtPspT/02dc5AQBJBV8HvUg1CKibsJxbe+H0AC/bGCa52BN6B/CUcem
 ueH8C+T5Zm3+UlQ3fUnl7lhST61sTk5W5hzAQ8B0RkBoafKVbFF3LbeiR/wYduJfbipL
 S6I3V3iD2bW6IaQ0XWVvTB5O/icbvQ1ngubFll7BJKrl5CTl7bDJBp+Xdc8Rhtd/5I1a
 u8Xw==
X-Gm-Message-State: AC+VfDwl84/57dXWeJnAamLBzKZ+k+9t2FnWCqY36p8LeaL1B/fuTnmr
 bEzkchpWFYw5z+W6K1TrjVBpYw==
X-Google-Smtp-Source: ACHHUZ64q3nAkmQiyy1A3DAZ+hVneYytXEVoRe5yh0a8KBFRcAQJiZjhKQQHeFFMapSCKaxVrNlEzA==
X-Received: by 2002:a19:5e11:0:b0:4ac:b7bf:697a with SMTP id
 s17-20020a195e11000000b004acb7bf697amr4518741lfb.4.1686683053205; 
 Tue, 13 Jun 2023 12:04:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u7-20020ac243c7000000b004f42718cbb1sm1856560lfl.292.2023.06.13.12.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 12:04:12 -0700 (PDT)
Message-ID: <7b511c41-4bf5-f7ff-8ae9-5f1bffac50d9@linaro.org>
Date: Tue, 13 Jun 2023 21:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
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
 <20230612092355.87937-26-brgl@bgdev.pl>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230612092355.87937-26-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 25/26] arm64: dts: qcom: sa8775p-ride: add
 pin functions for ethernet0
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



On 12.06.2023 11:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the MDC and MDIO pin functions for ethernet0 on sa8775p-ride.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index 7754788ea775..dbd9553aa5c7 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -370,6 +370,22 @@ &spi16 {
>  };
>  
>  &tlmm {
> +	ethernet0_default: ethernet0-default-state {
> +		ethernet0_mdc: ethernet0-mdc-pins {
> +			pins = "gpio8";
> +			function = "emac0_mdc";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +
> +		ethernet0_mdio: ethernet0-mdio-pins {
> +			pins = "gpio9";
> +			function = "emac0_mdio";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	qup_uart10_default: qup-uart10-state {
>  		pins = "gpio46", "gpio47";
>  		function = "qup1_se3";
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
