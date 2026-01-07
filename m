Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 405F4CFF7EE
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 19:38:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D345C8F283;
	Wed,  7 Jan 2026 18:38:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E378C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 18:38:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7AAA64360E;
 Wed,  7 Jan 2026 18:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92277C4CEF7;
 Wed,  7 Jan 2026 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767811116;
 bh=4gA87dpy4WxHWsQQHfKYdtr3VgTSzDJcgdqZ1ZKqS5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tQVaYSRrv57g3xq+kAmlC19X9l1YrEqk2QaB2GpoZTPFVevg3P3KkXc25r2GpHX8l
 ZObuwh7UZNmDoOnfmOlnyT/EFy9uhNPFrvrh3w0dG2Zjq+nLl2mYdAK5vL/CgFm2vs
 ZfuS2TgIGTuZ3VzQC0CfesccxDi7Z9+o45yJzO+JnyUTsgIhEbZLNc58LNsVhYBpUN
 bPH8qSM7xgULMJQ1KCY9XXYxm3g7Y7CumXp7WvPgip4nMI/pNVyKKTW/0zQUEkVfwb
 0JWT/LBEYHwITDg2rfoa3IyUD51V6P+R+vMy+9XU5LBNIX5l+wzkZK2+T+v5RTjMcv
 XuKDvuik7uCsA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed,  7 Jan 2026 12:38:22 -0600
Message-ID: <176781109972.3262943.12550481124214869830.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v3 00/11] Add support for
	Multimedia Clock controllers for Kaanapali
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


On Wed, 07 Jan 2026 15:13:03 +0530, Taniya Das wrote:
> Add support for Display clock controller, Video, Camera and GPU
> clock controller for the Qualcomm Kaanapali SoC.
> 
> Changes in v3:
>  - Add RB tag for CAMCC dt-bindings [Krzysztof]
>  - Add more description, commit message for the newly added GX Clock controller
>    for GPUCC dt-bindings. Update the complete region for the controller. [Krzysztof]
>  - Add RB tag for display clock controller [Konrad]
>  - Fix the below for the Video clock controller
> 	- use lowercase for mem_enable/mem_ack reg.
> 	- use GENMASK for mem_enable_ack_mask.
> 	- fix the indentation issue.
> 	- update to use regmap_set_bits().
>  - Fix the below for gx clock controller
> 	- update offset for gdsc as per new mapping
> 	- update regmap_config as per new mapping
>  - Link to v2: https://lore.kernel.org/lkml/20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[01/11] clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
        commit: 0f85ef379064b50ad573c6af4c0ffd39673f6968
[02/11] clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
        commit: 6d3e77facbce8e684321d9ba65137a76f2575372
[03/11] clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
        commit: a419f7bfb714703b9c12fab387b60cb0e0f7ec47
[08/11] clk: qcom: dispcc: Add support for display clock controller Kaanapali
        commit: 6c6750b7061ca5b12deaeb246439b5b64a84f9c1
[09/11] clk: qcom: camcc: Add support for camera clock controller for Kaanapali
        commit: 92aae35f667cd62359f5938e3259dc72e080e28c
[10/11] clk: qcom: Add support for VideoCC driver for Kaanapali
        commit: a4ceaf4b18dd4310c17852efbf880e1c5cd5dc36
[11/11] clk: qcom: Add support for GPUCC and GXCLK for Kaanapali
        commit: 685ec348339b118bec728458d0bc3b3e7da1ef0d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
