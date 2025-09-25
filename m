Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC5B9F7B4
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 15:17:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBA43C3F952;
	Thu, 25 Sep 2025 13:17:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70ACDC36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 13:17:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 159EA44083;
 Thu, 25 Sep 2025 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B39C4CEF0;
 Thu, 25 Sep 2025 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758806234;
 bh=MNwrSXcKXVb9lJE4Au9UpLgsiO9I5p4DtiVl03+qqxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QopSPyqrmZNIGVMaIf/FZsoqAWBgXD6Cg6leY8pGjgq4zEF+kymOxOHHIlmn53E5r
 9Qml9Hy2DWQviqaFM+h/w2O40bTxtq+9KjK/Sysr3QOLUNCnt2Uv60rjpJUfcKaP9V
 in6Cveusjb5LGl6xZPerUheh39bHNo7I6oLxClbCFfd+2rbsvu+fQ+Vvy0wEmvJtlA
 1DQi3sfOnOodMpLgpinOE4BOZX0A8tYUrNJBgrS1CbyTyMFc5dAZlW6ugKm9Vs4LJP
 b2yzb8DLpbuWw5fqjRLE/nRTPhdrhJvf2IM3VTFoAb/2U0MnOJ+kf0u9vyH1DKSE57
 GR8y0ef+3tkUg==
Date: Thu, 25 Sep 2025 08:17:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Message-ID: <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, yijie.yang@oss.qualcomm.com,
 Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, aiqun.yu@oss.qualcomm.com,
 Stephen Boyd <sboyd@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 9/9] drivers: clk: qcom: Add support for
 GPUCC and GFXCLK for Kaanapali
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

On Wed, Sep 24, 2025 at 04:56:50PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks.

GFXCLKCTL is a new thing, please describe what it is.

> 
[..]
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
[..]
> +static struct platform_driver gx_clkctl_kaanapali_driver = {
> +	.probe = gx_clkctl_kaanapali_probe,
> +	.driver = {
> +		.name = "gxclkctl-kaanapali",
> +		.of_match_table = gx_clkctl_kaanapali_match_table,
> +	},
> +};
> +
> +static int __init gx_clkctl_kaanapali_init(void)
> +{
> +	return platform_driver_register(&gx_clkctl_kaanapali_driver);
> +}
> +subsys_initcall(gx_clkctl_kaanapali_init);

We're not starting up the GPU at subsys initlevel. Can't this just be
module_platform_driver()? If not please document why.

Regards,
Bjorn

> +
> +static void __exit gx_clkctl_kaanapali_exit(void)
> +{
> +	platform_driver_unregister(&gx_clkctl_kaanapali_driver);
> +}
> +module_exit(gx_clkctl_kaanapali_exit);
> +
> +MODULE_DESCRIPTION("QTI GFXCLKCTL KAANAPALI Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
