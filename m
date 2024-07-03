Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 554ED92519A
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 06:20:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09B05C7129D;
	Wed,  3 Jul 2024 04:20:40 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E75CC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 04:20:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 566EACE28B6;
 Wed,  3 Jul 2024 04:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E524CC4AF12;
 Wed,  3 Jul 2024 04:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719980430;
 bh=5+RRC9YtK/dpU9PvT6M4Kinr+sN6vQFSkkmB2wAChzw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=k4GZm3W301fozxrlMm1PKo9FsrahhfCRNckbTsGEZa9SeQ+BWLat/mKmf07qyo2G3
 7HtwKjoOP3sIsaFy2XjRZDzVRuUes1+zYsx28GSHReW4r/TAnQGMOEEKRLYmD64oC3
 5HP9MPj/nxQA+V27pTEIfcLwguB9ztP53hOcAocJ8K9oNSLPKWKOorDcVlvgMFJF1s
 +n2tF3wXBYNtPARGAecITkoFb4M6nTKpdWYYZeYAdYbdYZZKaSoWocmvH6J+ZT8brS
 VN8xCBQKSwOqbotAq8HYrCEO3PdOEojLlkxDblTHAb20rLyhxfhjNFZbG6OokWLJZa
 gK2QnmHcjiCBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C5DF7CF3B95; Wed,  3 Jul 2024 04:20:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171998042979.21654.8518238511530738014.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jul 2024 04:20:29 +0000
References: <20240703035735.2182165-2-quic_tengfan@quicinc.com>
In-Reply-To: <20240703035735.2182165-2-quic_tengfan@quicinc.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, linus.walleij@linaro.org,
 quic_cang@quicinc.com, alim.akhtar@samsung.com, quic_rjendra@quicinc.com,
 linux-clk@vger.kernel.org, kishon@kernel.org, kernel@quicinc.com,
 bvanassche@acm.org, bartosz.golaszewski@linaro.org, jassisinghbrar@gmail.com,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, lpieralisi@kernel.org,
 linux@roeck-us.net, linux-pm@vger.kernel.org, avri.altman@wdc.com,
 robimarko@gmail.com, tglx@linutronix.de, quic_kbajaj@quicinc.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, djakov@kernel.org,
 lukasz.luba@arm.com, kw@linux.com, thara.gopinath@gmail.com,
 quic_msarkar@quicinc.com, edumazet@google.com, srinivas.kandagatla@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_kaushalk@quicinc.com,
 quic_bjorande@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, iommu@lists.linux.dev,
 ahalaney@redhat.com, linux-watchdog@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com,
 linux-gpio@vger.kernel.org, quic_rohiagar@quicinc.com, bhelgaas@google.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, quic_tsoni@quicinc.com,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, ulf.hansson@linaro.org,
 quic_gurus@quicinc.com, linux-pci@vger.kernel.org, mturquette@baylibre.com,
 amitk@kernel.org, linux-phy@lists.infradead.org, will@kernel.org,
 robh@kernel.org, quic_tingweiz@quicinc.com, luca@z3ntu.xyz, danila@jiaxyga.com,
 pabeni@redhat.com, bhupesh.sharma@linaro.org, athierry@redhat.com,
 quic_devipriy@quicinc.com, conor@kernel.org, konrad.dybcio@linaro.org,
 abel.vesa@linaro.org, davem@davemloft.net, mantas@8devices.com,
 otto.pflueger@abscue.de, linux-riscv@lists.infradead.org,
 quic_wcheng@quicinc.com, quic_rgottimu@quicinc.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, joro@8bytes.org,
 vkoul@kernel.org, quic_sibis@quicinc.com, agross@kernel.org, kuba@kernel.org,
 rui.zhang@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 wim@linux-watchdog.org, quic_shashim@quicinc.com, netdev@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, quic_aiquny@quicinc.com
Subject: Re: [Linux-stm32] [PATCH 01/47] dt-bindings: arm: qcom: Document
 QCS9100 SoC and RIDE board
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 3 Jul 2024 11:56:49 +0800 you wrote:
> Document the QCS9100 SoC and RIDE board.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [01/47] dt-bindings: arm: qcom: Document QCS9100 SoC and RIDE board
    (no matching commit)
  - [02/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 SoC dtsi
    (no matching commit)
  - [03/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 PMIC dtsi
    https://git.kernel.org/netdev/net-next/c/df18948d331e
  - [04/47] arm64: dts: qcom: qcs9100: Add QCS9100 RIDE board dts
    (no matching commit)
  - [05/47] dt-bindings: firmware: qcom,scm: document SCM on QCS9100 SoC
    (no matching commit)
  - [06/47] dt-bindings: interconnect: qcom: document the interconnect compatibles for QCS9100
    (no matching commit)
  - [07/47] dt-bindings: clock: document QCS9100 GCC compatible
    (no matching commit)
  - [08/47] dt-bindings: mailbox: qcom-ipcc: Document the QCS9100 IPCC
    (no matching commit)
  - [09/47] dt-bindings: phy: Add QMP UFS PHY comptible for QCS9100
    (no matching commit)
  - [10/47] dt-bindings: crypto: ice: Document QCS9100 inline crypto engine
    (no matching commit)
  - [11/47] dt-bindings: crypto: qcom,prng: document QCS9100
    (no matching commit)
  - [12/47] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings for QCS9100
    (no matching commit)
  - [13/47] dt-bindings: ufs: qcom: document QCS9100 UFS
    (no matching commit)
  - [14/47] dt-bindings: phy: qcom,qmp-usb: Add QCS9100 USB3 PHY
    (no matching commit)
  - [15/47] dt-bindings: usb: dwc3: Add QCS9100 compatible
    (no matching commit)
  - [16/47] dt-bindings: clock: qcom: describe the GPUCC clock for QCS9100
    (no matching commit)
  - [17/47] dt-bindings: arm-smmu: Document QCS9100 GPU SMMU
    (no matching commit)
  - [18/47] dt-bindings: phy: describe the Qualcomm SGMII PHY for QCS9100
    (no matching commit)
  - [19/47] dt-bindings: cache: qcom,llcc: Add QCS9100 description
    (no matching commit)
  - [20/47] dt-bindings: interrupt-controller: qcom,pdc: document pdc on QCS9100
    (no matching commit)
  - [21/47] dt-bindings: thermal: qcom-tsens: document the QCS9100 Temperature Sensor
    (no matching commit)
  - [22/47] dt-bindings: soc: qcom,aoss-qmp: Document the QCS9100 AOSS channel
    (no matching commit)
  - [23/47] dt-bindings: pinctrl: add qcs9100-tlmm compatible
    (no matching commit)
  - [24/47] dt-bindings: soc: qcom: add qcom,qcs9100-imem compatible
    (no matching commit)
  - [25/47] dt-bindings: watchdog: qcom-wdt: document QCS9100
    (no matching commit)
  - [26/47] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS9100
    (no matching commit)
  - [27/47] dt-bindings: cpufreq: cpufreq-qcom-hw: Add QCS9100 compatibles
    (no matching commit)
  - [28/47] dt-bindings: power: qcom,rpmpd: document the QCS9100 RPMh Power Domains
    (no matching commit)
  - [29/47] dt-bindings: net: qcom,ethqos: add description for qcs9100
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
