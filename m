Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E0D6C3AA8
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 20:33:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD676C6A5EF;
	Tue, 21 Mar 2023 19:33:56 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CE9AC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 19:33:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id k37so7583651lfv.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 12:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679427234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JMHhMtonsK7206fFrguTPhzlan6ylHN3dFzR3FtCHqU=;
 b=DCkVJgx5M23kD7k2bq7WLI2pRpSdvanRfk8ncagMTwNUQVu7Bjxka0AtqfeIH53IVq
 ut6KpJq0gwl4w0bKU7woofqTwlkgHMYggthFa3SCl+F7I97qFXkWpyDVkHx8yyRAlS6n
 aNXbeNTBmjPs8frGvwiueaLoTnIrbSLW0YIlW7IfVtI8xH3+JWrbeAyy7CY5PgEOrMdJ
 WOj35tpXYPJCbKYONREBkVppfJ7IAtd/S43GdbRnMfvIAkghy6lzWoU/B79NpRVmCNGL
 5rAfZyHrHv4mxOJACUAEH8duhcXsVg1ynpYJYhr6gvNVsyww0ZUkpLmVHGIKSJHGGEqi
 fnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679427234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JMHhMtonsK7206fFrguTPhzlan6ylHN3dFzR3FtCHqU=;
 b=z2uPxZBczzEKYJ/cW/olXnIaGAJHVT8ieTCn+WcRnE9JITypb9rQJC2s3t/smxoYN/
 FUCJjfw60itCEDbwR7eUH6vfqSdz1LeJQ9fyzdJGH+c5/irmSZcaPnmdAUHKdniSBHyh
 4fJd7fdkz1+eiod8ZDbCMOHU0sRehM67F9FTnFgdzXV6Fj5xfnCvw9PbIhEcS+QxjdSH
 UOwZfRbXVsf8lfUc6ZqubB0aS5Txm8VsYHAP9sfCuPRU6BLXNa0hCopEur+Dn6n8O+fh
 tj9R5XPlJknGv8LvvUHSIsM+G97vLsp2AFtr8GEdDUn4aYlz6l+jeoazU78mIlRVKdwq
 krQg==
X-Gm-Message-State: AO0yUKXrLFNKPJxvto26a7psSWJlvQF9eRprrPJmDF3/Wq3cmrxxY9R8
 tZIptkeZzl62oSQNHfxX1XsXnA==
X-Google-Smtp-Source: AK7set/7NLnyEkxDSUA9YVO7IO07SEYU/d89whtJ6yXcPqhZfZ0byhUFUgX/8egdo7Ka51f2/nft4w==
X-Received: by 2002:ac2:44da:0:b0:4ea:c730:aac3 with SMTP id
 d26-20020ac244da000000b004eac730aac3mr1356890lfm.3.1679427233818; 
 Tue, 21 Mar 2023 12:33:53 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 y3-20020ac24463000000b004db00b4c671sm2295208lfl.7.2023.03.21.12.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 12:33:53 -0700 (PDT)
Message-ID: <7d4f9662-2eb1-e2d2-193c-e6453dc7b93b@linaro.org>
Date: Tue, 21 Mar 2023 20:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-7-ahalaney@redhat.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230320221617.236323-7-ahalaney@redhat.com>
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, vkoul@kernel.org, echanude@redhat.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 06/12] arm64: dts: qcom:
 sc8280xp: Add ethernet nodes
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



On 20.03.2023 23:16, Andrew Halaney wrote:
> This platform has 2 MACs integrated in it, go ahead and describe them.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> 
> Changes since v1:
> 	* None
> 
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 53 ++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 0d02599d8867..a63e8e81a8c4 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -761,6 +761,59 @@ soc: soc@0 {
>  		ranges = <0 0 0 0 0x10 0>;
>  		dma-ranges = <0 0 0 0 0x10 0>;
>  
> +		ethernet0: ethernet@20000 {
> +			compatible = "qcom,sc8280xp-ethqos";
> +			reg = <0x0 0x00020000 0x0 0x10000>,
> +				<0x0 0x00036000 0x0 0x100>;
Please correct the indentation here.

> +			reg-names = "stmmaceth", "rgmii";
> +
> +			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
> +				<&gcc GCC_EMAC0_SLV_AHB_CLK>,
> +				<&gcc GCC_EMAC0_PTP_CLK>,
> +				<&gcc GCC_EMAC0_RGMII_CLK>;
Please correct the indentation here.

> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
Please turn this into a vertical list.

> +
> +			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>;
Please correct the indentation here.

Same for the other node.

Konrad
> +			interrupt-names = "macirq", "eth_lpi";
> +			iommus = <&apps_smmu 0x4c0 0xf>;
> +			power-domains = <&gcc EMAC_0_GDSC>;
> +
> +			snps,tso;
> +			snps,pbl = <32>;
> +			rx-fifo-depth = <4096>;
> +			tx-fifo-depth = <4096>;
> +
> +			status = "disabled";
> +		};
> +
> +		ethernet1: ethernet@23000000 {
> +			compatible = "qcom,sc8280xp-ethqos";
> +			reg = <0x0 0x23000000 0x0 0x10000>,
> +				<0x0 0x23016000 0x0 0x100>;
> +			reg-names = "stmmaceth", "rgmii";
> +
> +			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
> +				<&gcc GCC_EMAC1_SLV_AHB_CLK>,
> +				<&gcc GCC_EMAC1_PTP_CLK>,
> +				<&gcc GCC_EMAC1_RGMII_CLK>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
> +
> +			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 919 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq", "eth_lpi";
> +
> +			iommus = <&apps_smmu 0x40 0xf>;
> +			power-domains = <&gcc EMAC_1_GDSC>;
> +
> +			snps,tso;
> +			snps,pbl = <32>;
> +			rx-fifo-depth = <4096>;
> +			tx-fifo-depth = <4096>;
> +
> +			status = "disabled";
> +		};
> +
>  		gcc: clock-controller@100000 {
>  			compatible = "qcom,gcc-sc8280xp";
>  			reg = <0x0 0x00100000 0x0 0x1f0000>;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
