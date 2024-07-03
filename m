Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E6926897
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 20:50:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00EEBC71280;
	Wed,  3 Jul 2024 18:50:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D1E6C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 18:49:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED48A60DD8;
 Wed,  3 Jul 2024 18:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B6EC2BD10;
 Wed,  3 Jul 2024 18:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720032596;
 bh=tL3e/ur6/KMkg7mh3t7r3ZIFeZQ4xi5Q34S/7FlZ2qA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SQ7eo1AkC8LjRWberzbfTrXdEmn8AVAPTH1nI5h830+ubxo1C5MaKmEtPRy9gsG1o
 M8aW67LDGZEnsrCM4Q/GRKRYn+r39JIjjMUn4+wwhQ4mb+Nyw7/6h4NQGIjateXcmW
 XAfTSrhx2kUyLwJweon5gGjsH9sMGD6YpKO/TIf9EwzO/u3UL14SYAuIKAMoMlbYkK
 bxKEJlfNCtFdikjht8PVx57e+Ez2TZA0kY1xDB4xr5o96jrOLhYPq5oX8riaz0aLMe
 pQxRIT/WAYj12CgJvmnxQibErDTaKj3syhCujN4MjJ27ACtbE6kpJopp6TU3GIN89Q
 vkEmm7DBvS+3g==
Date: Wed, 3 Jul 2024 11:49:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: patchwork-bot+netdevbpf@kernel.org
Message-ID: <20240703114952.6013f05e@kernel.org>
In-Reply-To: <171998042970.21654.12559535993133117436.git-patchwork-notify@kernel.org>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <171998042970.21654.12559535993133117436.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
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
 robh@kernel.org, quic_tingweiz@quicinc.com, mantas@8devices.com,
 luca@z3ntu.xyz, danila@jiaxyga.com, pabeni@redhat.com,
 bhupesh.sharma@linaro.org, athierry@redhat.com, quic_devipriy@quicinc.com,
 conor@kernel.org, konrad.dybcio@linaro.org, abel.vesa@linaro.org,
 davem@davemloft.net, Tengfei Fan <quic_tengfan@quicinc.com>,
 otto.pflueger@abscue.de, linux-riscv@lists.infradead.org,
 quic_wcheng@quicinc.com, quic_rgottimu@quicinc.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, joro@8bytes.org,
 vkoul@kernel.org, quic_sibis@quicinc.com, agross@kernel.org,
 rui.zhang@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 wim@linux-watchdog.org, quic_shashim@quicinc.com, netdev@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, quic_aiquny@quicinc.com
Subject: Re: [Linux-stm32] [PATCH 00/47] arm64: qcom: dts: add QCS9100
	support
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

On Wed, 03 Jul 2024 04:20:29 +0000 patchwork-bot+netdevbpf@kernel.org
wrote:
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:

> Here is the summary with links:
>   - [01/47] dt-bindings: arm: qcom: Document QCS9100 SoC and RIDE board
>     (no matching commit)
>   - [02/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 SoC dtsi
>     (no matching commit)
>   - [03/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 PMIC dtsi
>     https://git.kernel.org/netdev/net-next/c/df18948d331e

This is some bug / false positive in the bot, to be clear.
Commit df18948d331e is ("Merge branch 'device-memory-tcp'").
No idea how it got from that to DTS.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
