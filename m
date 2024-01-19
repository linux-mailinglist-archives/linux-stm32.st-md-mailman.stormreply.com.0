Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC208330A0
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jan 2024 23:06:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FF56C6DD73;
	Fri, 19 Jan 2024 22:06:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D725C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 22:06:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8097C6160B;
 Fri, 19 Jan 2024 22:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E49C433F1;
 Fri, 19 Jan 2024 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705702012;
 bh=bAiP8neWkuFOr1UcviXY9sGWpEscgq5SMLZxG3s9Dt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H0eg5u8QwEQ6ypQgu+Ro/nkwaVoSk6fZjoWXqYEmXDBBypv3SaURpbSvuGPnkUm9o
 0iLO54XqFDrY5SKuQZx1PtWWdbaWIgzQTzV0z70555OEw/cl0wpl9rZN9FKfkiyBAu
 SnG9Ko2Xb/Ck170Mviz7ss9Pl+yNAe9Xg7Gdjqf86+CfI4wXVZ78Auk6i3XkpHvEn8
 o34tv8O0Sbg6s3KM1vurE0tBmVLz8HbPfZTpKnkQxTLGN+n1rFaTju4cEt2Sd0Ic8a
 RkPd0onKWlpH1K9oGo+Gggwbv4VFEK2eJRyldbIWTPpp09a5rhij2/rv2jp9evvYPK
 wyA/FwbQHedSA==
Date: Fri, 19 Jan 2024 16:06:48 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <170570200425.1132338.1743644162144723458.robh@kernel.org>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <20240105130404.301172-3-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105130404.301172-3-gatien.chevallier@foss.st.com>
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 catalin.marinas@arm.com, edumazet@google.com, netdev@vger.kernel.org,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andi.shyti@kernel.org,
 lars@metafoo.de, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, lee@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, wg@grandegger.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, peng.fan@oss.nxp.com,
 richardcochran@gmail.com, mkl@pengutronix.de, linux-serial@vger.kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 rcsekar@samsung.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, linux-crypto@vger.kernel.org, hugues.fruchet@foss.st.com,
 dmaengine@vger.kernel.org, davem@davemloft.net, jic23@kernel.org,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 02/13] dt-bindings: treewide: add
 access-controllers description
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


On Fri, 05 Jan 2024 14:03:53 +0100, Gatien Chevallier wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controller. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to a firewall bus. The firewall can then check the peripheral accesses
> before allowing its device to probe.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
> 	- Minor changes in commit message
> 	- Renamed access-controller to access-controllers
> 
> Changes in V5:
> 	- Discarded review tags as the content has changed
> 	- Renamed feature-domains to access-controller
> 
> Changes in V4:
> 	- Added Jonathan's tag for IIO
> 
> Changes in V2:
> 	- Add missing "feature-domains" property declaration
> 	  in bosch,m_can.yaml and st,stm32-cryp.yaml files
> 
>  Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml   | 4 ++++
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml   | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml       | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml    | 4 ++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 4 ++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml   | 4 ++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml   | 4 ++++
>  Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml | 4 ++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 ++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml   | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml    | 4 ++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml          | 4 ++++
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml    | 4 ++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml        | 4 ++++
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml  | 4 ++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml       | 4 ++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml       | 4 ++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml     | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml     | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml      | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 4 ++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml               | 4 ++++
>  26 files changed, 104 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
