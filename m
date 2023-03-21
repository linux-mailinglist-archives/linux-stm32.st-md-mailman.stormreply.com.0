Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB286C3A8F
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 20:33:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93706C6A5EF;
	Tue, 21 Mar 2023 19:33:12 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDF93C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 19:33:10 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id a32so16670707ljr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679427190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DOJedXqzU4VqWJK2Ajbw3X3+PFnOG//f2bTihr6Ow9s=;
 b=GLM3DYS2JL2It4G6BzoIJ2VGfllIZyUTyFizD2iw7R1nQ/2Nxw7s1eUA4S475UZ30E
 RRYPrXV+WtXKvvHWVQA+mkJeFTUzRQ7PiclfuUNDSZQrSITkCUvu5MS5yIcyeiSw2xpG
 TJylosF3L45XsVG1r+7VfG+NiDUacqoboZLj91Yr50Fcw5URjdl8g8ThnfqbP7+U7R/v
 eKUxRfwh1Y3706MWwpv8qmqpPXKUm3Yl2lPgxYBzzgiFBPvu5xtuzrhREfL1hlPzNA8r
 yJEsi1N22r00cg0uXwTzXYRvGaCrs9z0gGgysEzANaA3egBRhHbyyRjwy0Qcru8YSOLj
 AqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679427190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DOJedXqzU4VqWJK2Ajbw3X3+PFnOG//f2bTihr6Ow9s=;
 b=w1UZMI+Uy2ApY1PYYXO+LMs76CfVEOIdfIrG5zHXHGO0jXLNP5w8xpCY9zaX+WXWa6
 0HFTBYRj5j6KlaV6xnJyMxsMDDygEicjwic2fokFkG2qCAGz7/Sj7Rto3fbru92JN1as
 0dkCgBNZ1rsrFBBsZTEZ+q8rfQ70ZLyye/oYOB/s7GC49m/EY0JkyLZwZqwCVDIfWU6b
 FvD+gEbRiVWXnQYNrm7fqounjA58/wxGQ9d7wI5n6eM2+VbJ1KPdhTcHEzXAthhXKiBs
 P2Z4+sZMz8nZ4X9C5xgeOMYK99UqMwtZ/lPCVYA6Wn5ZjRjBWkFbg9GBvsqDLtpMH9Bm
 4DqQ==
X-Gm-Message-State: AO0yUKXyRPhlRhoeRKIrCVeIfjlGnbzHmAFFCyy3Xww4wfLfCwXx0iHi
 oAM2b/S1bM2o9QWRtrCr92YhgQ==
X-Google-Smtp-Source: AK7set/Ex+jNMGHlNPs7MD/8WHLmtZjVZAaZIPc3DR+BKF/CGbp/oAxGt7AI1rUvwWvA4YPWwZQhAw==
X-Received: by 2002:a2e:9e53:0:b0:29b:aee8:29b3 with SMTP id
 g19-20020a2e9e53000000b0029baee829b3mr1074275ljk.38.1679427189980; 
 Tue, 21 Mar 2023 12:33:09 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a2e9d56000000b002991baef49bsm2349020ljj.12.2023.03.21.12.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 12:33:09 -0700 (PDT)
Message-ID: <013babf9-713b-b0ee-c70b-d12ab5e2b3eb@linaro.org>
Date: Tue, 21 Mar 2023 20:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-6-ahalaney@redhat.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230320221617.236323-6-ahalaney@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 05/12] clk: qcom:
	gcc-sc8280xp: Add EMAC GDSCs
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
> Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> I'm still unsure if Bjorn wants to take this patch or net-dev, and how I am
> supposed to indicate such other than commenting here (per Stephen's
> comment on v1): https://lore.kernel.org/netdev/e5cb46e8874b12dbe438be12ee0cf949.sboyd@kernel.org/#t
> 
> Changes since v1:
> 	* Add Stephen's Acked-by
> 	* Explicitly tested on x13s laptop with no noticeable side effect (Konrad)
> 
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
