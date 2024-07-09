Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A3292C2AE
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 19:42:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F387EC6DD66;
	Tue,  9 Jul 2024 17:42:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93269C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 17:42:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4EB1D61668;
 Tue,  9 Jul 2024 17:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E133C3277B;
 Tue,  9 Jul 2024 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720546939;
 bh=ebW9j0Or29bAV/OIYS8+7Sgp+Pfi23j95sT/HNjJOEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rfYEGBbAmynhpSyZHeUQnL2N2IIoI1WBzjnjOUrC8QYYNbT1aAtAjGkmcif4ylXoH
 J4ZKX8RcICZpHp/t8deTJ6FeE+2LXMK9qqSpF3r//6DgLQu/iWGc+KDLdSS/lY0xi7
 a05sEC041+4R21N+LMTJ4NgQGHpQp6kB4VoXLWrVuO86CmjQJ/XqMUsEyDfuJnfsXn
 Zx9MA7VQQlb0UwbiJMh3qaMU+6B9DJN0oxOLNNGa9t4X92OUm3UCr6vQJRDT9S95Vp
 exiu0JgErVkBja86lV9E7w7eGAe/tQhDpwWJxmXuARBfHyNepEApKZYNsn6ZJrN/Bd
 lwmLIzbMVIi3A==
Date: Tue, 9 Jul 2024 18:42:12 +0100
From: Simon Horman <horms@kernel.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Message-ID: <20240709174212.GM346094@kernel.org>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-qcom-ethqos:
 Add QCS9100 ethqos compatible
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

On Tue, Jul 09, 2024 at 10:13:16PM +0800, Tengfei Fan wrote:
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.
> 
> The final dtsi will like:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
> 
> The detailed cover letter reference:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Changes in v2:
>   - Split huge patch series into different patch series according to
>     subsytems
>   - Update patch commit message
> 
> prevous disscussion here:
> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> ---
> Tengfei Fan (2):
>       dt-bindings: net: qcom,ethqos: add description for qcs9100
>       net: stmmac: dwmac-qcom-ethqos: add support for emac4 on qcs9100 platforms
> 
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml  | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml   | 2 ++
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
>  3 files changed, 4 insertions(+)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233

I'm assuming that this is a patch for net-next.
But the commit above is not present in net-next,
and this series doesn't apply to net-next.

Please rebase when preparing v3.
And please designate the target tree in the subject.

	Subject: [PATCH net-next v3] ...

Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
