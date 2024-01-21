Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6600B8356B5
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jan 2024 17:46:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1157DC6B457;
	Sun, 21 Jan 2024 16:46:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DAE7C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jan 2024 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=BHOFZcuTxHKtAFe+5SXsdTjosX9ZtBXP8Ft5m35WZew=; b=rJIjmPmDd+Ls+Hr9hu4nE6G5vU
 P+4nn6S6zoEq1QaRKrNmnKbBQXlQey7L64fNlXwpar8zVrsIuvXfct4SNX8HYYHQAgtCRlWpTb3TX
 Xz83hyOOws5wjAE37qqzF+/NYHSoLWQkvgf181YS+chDM4AVLVSjvgD9j5zGdoDcluZw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rRaxL-005f5v-RN; Sun, 21 Jan 2024 17:45:59 +0100
Date: Sun, 21 Jan 2024 17:45:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <b8510b38-3669-4a04-9ca6-dbe937ecbec3@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556FA040B07F48AFE544680C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556FA040B07F48AFE544680C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 7/8] arm64: dts: qcom: ipq5018: enable
	ethernet support
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

On Sun, Jan 21, 2024 at 08:42:36PM +0800, Ziyang Huang wrote:
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 120 +++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index e502a3ecf4b7..b36e5c2136b7 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -94,6 +94,63 @@ soc: soc@0 {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0xffffffff>;
>  
> +		mdio0: mdio@88000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "qcom,ipq5018-mdio", "qcom,qca-mdio";
> +			reg = <0x88000 0x64>;
> +			resets = <&gcc GCC_GEPHY_MDC_SW_ARES>,
> +				 <&gcc GCC_GEPHY_DSP_HW_ARES>;

What do these two resets do? An MDIO bus controller is unlikely to
have a DSP in it. That is something a PHY is more likely to have. An
MDIO bus controller does have an MDC line, but why is it
GCC_GEPHY_MDC_SW_ARES not GCC_MDIO_MDC_SW_ARES? So this again makes me
think this is a PHY reset, so should be in the PHY node.

A device tree binding will help sort this out.


    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
