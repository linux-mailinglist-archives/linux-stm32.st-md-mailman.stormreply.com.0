Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D281F9FD585
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Dec 2024 16:19:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D535C78027;
	Fri, 27 Dec 2024 15:19:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB42BC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Dec 2024 15:18:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2CCBBA4192A;
 Fri, 27 Dec 2024 15:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF17C4CED0;
 Fri, 27 Dec 2024 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735312731;
 bh=F6s7hJRFnqwtVpl84yOmcA6diAh5+fNZK0zM5H7eyqs=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=BWDZ8i3CdANnV79TD8EM84ZfwN0Zwea5YPdowKbjMxJrMt8oiows+rIzPaTUbc/ji
 7NaK1dfG6JqBXsInpl2+sg6gCmONa4jakyaxG8ImXLKcEem1hkGGQdbuWzE4fDIp7W
 ddTYzTvZ0I8c3W9ZelEAVz84VaoA9pN4vX1beYbukijsCaTwYPmv8vkhT1QGQ2jmgK
 dxLjdA/i0MOyiHhTTw0cDAAmJT4MzLcU3QJnganUy4KGq+rzRxVyPjZoyWVH6yqXUG
 6rgvpr+GpD4u3zgbxlud7WQtqeSgMU+JKLJK8I1wCD6WLKmMrT/1ZoYeVhlakPIea1
 DIoK12JxfphjQ==
Date: Fri, 27 Dec 2024 09:18:49 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
Message-Id: <173531253248.3886388.7160234857723146083.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Support tuning the RX sampling swap
	of the MAC.
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


On Wed, 25 Dec 2024 18:04:44 +0800, Yijie Yang wrote:
> The Ethernet MAC requires precise sampling times at Rx, but signals on the
> Rx side after transmission on the board may vary due to different hardware
> layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
> occasion between the rising edge and falling edge of the clock to meet the
> sampling requirements. Consequently, the configuration of this bit in the
> Ethernet MAC can vary between boards, even if they are of the same version.
> It should be adjustable rather than simply determined by the version. For
> example, the MAC version is less than 3, but it needs to enable this bit.
> Therefore, this patch set introduces a new flag for each board to control
> whether to open it.
> The dependency patch set detailed below has introduced and enabled an
> Ethernet node that supports 1G speed on qcs615. The current patch set now
> allows tuning of the MAC's RX swap, thereby supporting 10M and 100M speeds.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
> This patch series depends on below patch series:
> https://lore.kernel.org/all/20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com/
> 
> ---
> Yijie Yang (3):
>       dt-bindings: net: stmmac: Tune rx sampling occasion
>       net: stmmac: qcom-ethqos: Enable RX programmable swap on qcs615
>       arm64: dts: qcom: qcs615-ride: Enable RX programmable swap on qcs615-ride
> 
>  .../devicetree/bindings/net/qcom,ethqos.yaml       |  6 ++++
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  1 +
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 36 ++++++++++++----------
>  3 files changed, 27 insertions(+), 16 deletions(-)
> ---
> base-commit: 532900dbb7c1be5c9e6aab322d9af3a583888f25
> change-id: 20241217-support_10m100m-16239916fa12
> prerequisite-message-id: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
> prerequisite-patch-id: ab55582f3bfce00f051fddd75bb66b2ef5e0677d
> prerequisite-patch-id: 514acd303f0ef816ff6e61e59ecbaaff7f1b06ec
> 
> Best regards,
> --
> Yijie Yang <quic_yijiyang@quicinc.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/qcs615-ride.dtb' for 20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ethernet@20000: compatible: ['qcom,qcs615-ethqos'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ethernet@20000: snps,tso: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ethernet@20000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs615-ethqos'] is too short
	'qcom,qcs615-ethqos' is not one of ['qcom,qcs8300-ethqos']
	'qcom,qcs615-ethqos' is not one of ['qcom,qcs404-ethqos', 'qcom,sa8775p-ethqos', 'qcom,sc8280xp-ethqos', 'qcom,sm8150-ethqos']
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ethernet@20000: Unevaluated properties are not allowed ('compatible', 'max-speed', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'resets', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
