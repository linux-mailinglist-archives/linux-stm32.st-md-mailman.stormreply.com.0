Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83DC06276
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 14:05:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74F03C5F1D5;
	Fri, 24 Oct 2025 12:05:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63DABC5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 12:05:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EA4F3604ED;
 Fri, 24 Oct 2025 12:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC34C4CEF1;
 Fri, 24 Oct 2025 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761307523;
 bh=SoTqsQyeJsNHR+NjV5RVJfzLtjEZs9jDVX9K8tQd7VQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MtzvBRZ2QznIMWkDD8LXC05vVfSz54eV+CSiyFUDrQpPPDKOy274P9UHODkl8bzRw
 XLpz4bQi/UlOmqd1+PiFh1mv48mQtysnDrKWluwlZ1RwZvHu5tmO6VDIfva8YhUh0M
 Pgg9cgsSdMPsNNOmvSK1IdrStowqm3dxiixgC7o/36+MB8+CiYC5RA/vAEjtbLc148
 l6XtgEQFMhcCaSVpio+X4tstvezR/mDrzl8ROAbZpKfRCaMqnenvdZW9b1YVSkS62z
 Gj8MZQwyfEQexesICFIKXxvRN6ihqs1yDG7/eY5QB7xxEhRZvqADN1TeoW4LqNDoUF
 pw8BRS6IB2XYA==
Message-ID: <9559cde8-8dc4-4f4b-8e9f-973656bb575c@kernel.org>
Date: Fri, 24 Oct 2025 07:05:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-4-4c4a51159eeb@pengutronix.de>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-4-4c4a51159eeb@pengutronix.de>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>, linux-kernel@vger.kernel.org,
 Austin Zhang <austin.zhang@intel.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 04/10] arm64: dts: socfpga: agilex5:
	smmu enablement
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 10/24/25 06:49, Steffen Trumtrar wrote:
> From: Austin Zhang <austin.zhang@intel.com>
> 
> Add iommu property for peripherals connected to TBU.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 4f7ed20749927..4ccfebfd9d322 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -303,6 +303,7 @@ nand: nand-controller@10b80000 {
>   			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&clkmgr AGILEX5_NAND_NF_CLK>;
>   			cdns,board-delay-ps = <4830>;
> +			iommus = <&smmu 4>;
>   			status = "disabled";
>   		};
>   
> @@ -329,6 +330,7 @@ dmac0: dma-controller@10db0000 {
>   			snps,block-size = <32767 32767 32767 32767>;
>   			snps,priority = <0 1 2 3>;
>   			snps,axi-max-burst-len = <8>;
> +			iommus = <&smmu 8>;
>   		};
>   
>   		dmac1: dma-controller@10dc0000 {
> @@ -346,6 +348,7 @@ dmac1: dma-controller@10dc0000 {
>   			snps,block-size = <32767 32767 32767 32767>;
>   			snps,priority = <0 1 2 3>;
>   			snps,axi-max-burst-len = <8>;
> +			iommus = <&smmu 9>;
>   		};
>   
>   		rst: rstmgr@10d11000 {
> @@ -468,6 +471,7 @@ usb0: usb@10b00000 {
>   			reset-names = "dwc2", "dwc2-ecc";
>   			clocks = <&clkmgr AGILEX5_USB2OTG_HCLK>;
>   			clock-names = "otg";
> +			iommus = <&smmu 6>;
>   			status = "disabled";
>   		};
>   
> @@ -553,6 +557,7 @@ gmac0: ethernet@10810000 {
>   			snps,tso;
>   			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
>   			snps,clk-csr = <0>;
> +			iommus = <&smmu 1>;
>   			status = "disabled";
>   
>   			stmmac_axi_emac0_setup: stmmac-axi-config {
> @@ -665,6 +670,7 @@ gmac1: ethernet@10820000 {
>   			snps,tso;
>   			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
>   			snps,clk-csr = <0>;
> +			iommus = <&smmu 2>;
>   			status = "disabled";
>   
>   			stmmac_axi_emac1_setup: stmmac-axi-config {
> @@ -777,6 +783,7 @@ gmac2: ethernet@10830000 {
>   			snps,tso;
>   			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
>   			snps,clk-csr = <0>;
> +			iommus = <&smmu 3>;
>   			status = "disabled";
>   
>   			stmmac_axi_emac2_setup: stmmac-axi-config {
> 


I have a similar patches for this and 3/10 queued up for v6.19.

The DTS patches are staged in my repo under the branch 
socfpga_updates_for_v6.19

Dinh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
