Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5DF72EB98
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 21:08:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D275BC6A61A;
	Tue, 13 Jun 2023 19:08:19 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03F16C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 19:08:18 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f61b45ee0dso7419547e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686683298; x=1689275298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+tm3+Pdm0PaXfiZEzyRYLx0bL/2PcssnIDcJqEcG00=;
 b=pXvtSrfvSZFtqXr7gBQNbwO93crNLRG5kDvQKUb9i07WRGV8cuKSZdeN2AHPfkSYEV
 s9Kj4TDyZ6xACpGIQJynV4qJHfQP8x2u9sRicGgoFESj5RceIKeBfElicevTTgiNi7RL
 9QVYc+lVnCKM1rsbq+3A8n10G22u07GDwcLiscU3lmCZ6y7WPLfCyTgRAVZA4pyyw5Yn
 JKU8Q+vKxm0IHBX04DCwxktI6OGATGIu3ihwztTO+oNXjo8vTM8yorfcSd8ysJEEaPSj
 +opeKcUuZUOr+FiHdS+JpkxNfEiaACOn71VVmdwpa4d0A54Sj9plaNCeEqJ1uAKxPOTX
 1XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686683298; x=1689275298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F+tm3+Pdm0PaXfiZEzyRYLx0bL/2PcssnIDcJqEcG00=;
 b=GvZFRIpcO84WQJtgig7+2iB8CjbjW8j2124HqgRRkR1RNWQ3MD0Zmjjz0gglBLmhKL
 xTxt1rRmT95v+x24inSYjLHv/FyKnQmCWRciZH4k7RS8n4RrfXt9cYx7DCHzRvtGoTkj
 GNitR5wqxhcVTwCYy1Bs9GIo+TLydZqlcFcHR7aLYOnRf48KFIpzp+KV4PIsaiaSTCZp
 nG637jG/jpPcHsXyW/nx8Trp3HT1Yqzd1sIPO4toiLt+04JJ9ClxXzG7Nnu+xtnWxVxE
 FZeLogk0HcjpkKjfIlJrrxS40ZM24iVkMNOoUitq85OynUktagYBklYO4KC8sdW+TBaA
 hRDQ==
X-Gm-Message-State: AC+VfDyNfSt5aZUtIbmS2RDIgJ/CNcp/8SIAsQPWX83hStI2hpFaJrNn
 IvXaG4X7eTRq9KGBqJwr2kjGJg==
X-Google-Smtp-Source: ACHHUZ5hlHejaHU5jlNuZeMW5cevHnRvyHVwiIHOuhObHOVK4r0Ifh+Y4UFnRCtLYlUAMdVar7JMhg==
X-Received: by 2002:a19:e059:0:b0:4d5:8306:4e9a with SMTP id
 g25-20020a19e059000000b004d583064e9amr6458878lfj.46.1686683298079; 
 Tue, 13 Jun 2023 12:08:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056512014500b004f73eac0308sm1148576lfo.183.2023.06.13.12.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 12:08:17 -0700 (PDT)
Message-ID: <cf515539-9a60-c3ae-18af-463651651a27@linaro.org>
Date: Tue, 13 Jun 2023 21:08:14 +0200
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
 <20230612092355.87937-27-brgl@bgdev.pl>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230612092355.87937-27-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 26/26] arm64: dts: qcom: sa8775p-ride:
	enable ethernet0
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
> Enable the first 1Gb ethernet port on sa8775p-ride development board.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
I don't know a whole lot about this, but it passes bindings checks
and looks good overall, so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 89 +++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index dbd9553aa5c7..13508271bca8 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -261,6 +261,95 @@ vreg_l8e: ldo8 {
>  	};
>  };
>  
> +&ethernet0 {
> +	phy-mode = "sgmii";
> +	phy-handle = <&sgmii_phy>;
> +	phy-supply = <&vreg_l5a>;
> +
> +	pinctrl-0 = <&ethernet0_default>;
> +	pinctrl-names = "default";
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,ps-speed = <1000>;
> +
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <11000>;
> +		reset-post-delay-us = <70000>;
> +
> +		sgmii_phy: phy@8 {
> +			reg = <0x8>;
> +			device_type = "ethernet-phy";
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +		snps,tx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
>  &i2c11 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&qup_i2c11_default>;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
