Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0B6BC709
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 08:28:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55459C6904C;
	Thu, 16 Mar 2023 07:28:07 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C4E1C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 15:13:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id n2so20417106lfb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678806801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aWquE/66XhiUdKcAjOZcdT8JwAjOV0jdF3ZReJh+jhU=;
 b=A70OxIRflPWeFRqLRBN8qDh9Nnpwl6mYudE01YgkwWijNkevncaAafkm4hhBFkYlPY
 B+r3GEwqp0NgXcsOp5XuGK9r6rRnB/Obx5FjFgTAiep+FKTJN4Wf8YdFdeEt+FGeianQ
 HKZRv9Gxy6ZXY22rJYBwB5fqIrxLopllTUZDbEXoT8/sDmpetnaCfVfzZjKfHbsVw5Ma
 sKRrOmFpYtj4/IWOdsY6LEdG6eur/ataMRIvXZhgMnc/+DueCevIubHxa7SwxkyI+bBL
 soT9s0BQKP1rOM59EGlR7NRgMnjXylMelTjMehReRdJPPj/aP3dV4uNWBeArjdPde47F
 bsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678806801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aWquE/66XhiUdKcAjOZcdT8JwAjOV0jdF3ZReJh+jhU=;
 b=ofin13q/aid5/8mdZaGUXJbmsqExqrwNlVRQvKzUUgcOJZxeqTKINNH7Eu7v/TnFwv
 /VzNftsjo4T/+m1stp45C0NMGSeZ4gIt2uJPWeU6rYxnVn0dMCSZ1oeo1WZXWXnRdgbp
 rCDQTKUSLWuaIaXc1ao8Dq9CQyazLuQgsHpFiHg+d35vF7GUzYiNW+073qfwhz8Z6oFj
 mW69VWGY3ng+HSRIF+fLkIEvE9ZUGe+N2hBEO3b5a3JB063ut841xHahUUzKHOemEhvu
 vw6aYg2GZxzmvq0pe3fTp8ivLej7oycmI0b9QZCYy1Ch439O0EScdACWbUjDez4jQ7qn
 R23A==
X-Gm-Message-State: AO0yUKWVeiNCoyzZTAHMqMb+xIDRx7lM/X9xQDAKrzgCrJAgnEj/bTf0
 whMJbVJlKIamDAn/GKqXshwHOQ==
X-Google-Smtp-Source: AK7set+0FwZrp2Kqmgi11czNIWqOTIdgsRQEqlYZ+eN8f1lZ8ifft3X4RqJNjukpilWNLQkafq+Kxg==
X-Received: by 2002:ac2:43ad:0:b0:4dc:4bda:c26f with SMTP id
 t13-20020ac243ad000000b004dc4bdac26fmr973810lfl.23.1678806801649; 
 Tue, 14 Mar 2023 08:13:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 l7-20020ac24a87000000b004d23763fe96sm431973lfp.72.2023.03.14.08.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 08:13:20 -0700 (PDT)
Message-ID: <3f37eede-6d62-fb92-9cff-b308de333ebd@linaro.org>
Date: Tue, 14 Mar 2023 16:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230313165620.128463-6-ahalaney@redhat.com>
X-Mailman-Approved-At: Thu, 16 Mar 2023 07:28:05 +0000
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
 agross@kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp:
	Add EMAC GDSCs
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



On 13.03.2023 17:56, Andrew Halaney wrote:
> Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
Was it tested to not cause issues on access on "normal" 8280xp?
AFAICS if there would be any, they would happen at registration
time, as gdsc_init already accesses its registers

Konrad
>  drivers/clk/qcom/gcc-sc8280xp.c               | 18 ++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  2 ++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index b3198784e1c3..04a99dbaa57e 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -6873,6 +6873,22 @@ static struct gdsc usb30_sec_gdsc = {
>  	.pwrsts = PWRSTS_RET_ON,
>  };
>  
> +static struct gdsc emac_0_gdsc = {
> +	.gdscr = 0xaa004,
> +	.pd = {
> +		.name = "emac_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
> +static struct gdsc emac_1_gdsc = {
> +	.gdscr = 0xba004,
> +	.pd = {
> +		.name = "emac_1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
>  static struct clk_regmap *gcc_sc8280xp_clocks[] = {
>  	[GCC_AGGRE_NOC_PCIE0_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie0_tunnel_axi_clk.clkr,
>  	[GCC_AGGRE_NOC_PCIE1_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie1_tunnel_axi_clk.clkr,
> @@ -7351,6 +7367,8 @@ static struct gdsc *gcc_sc8280xp_gdscs[] = {
>  	[USB30_MP_GDSC] = &usb30_mp_gdsc,
>  	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
>  	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
> +	[EMAC_0_GDSC] = &emac_0_gdsc,
> +	[EMAC_1_GDSC] = &emac_1_gdsc,
>  };
>  
>  static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
> index cb2fb638825c..721105ea4fad 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
> @@ -492,5 +492,7 @@
>  #define USB30_MP_GDSC					9
>  #define USB30_PRIM_GDSC					10
>  #define USB30_SEC_GDSC					11
> +#define EMAC_0_GDSC					12
> +#define EMAC_1_GDSC					13
>  
>  #endif
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
