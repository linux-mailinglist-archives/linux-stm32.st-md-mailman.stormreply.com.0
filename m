Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 366087C039F
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 20:42:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6A36C6A61D;
	Tue, 10 Oct 2023 18:42:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA6EEC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 18:42:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C43AECE1DF1;
 Tue, 10 Oct 2023 18:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754C9C433CC;
 Tue, 10 Oct 2023 18:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696963337;
 bh=ldKKDLNL5IeRM0a07A6s6AJub50EGR8AJO6LTn0Obwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LqzM4D1MlLdeXjle0S/VafEl40lMghLhLKm+9gJtf+ozhX1rdh7dMp9TxumYlErj6
 hfFl58cakIJNbknsQMdeOerVRiHoWTUZimBOIaMG2Er7wDuh+ofNCrIildBOEkgcyF
 iHst+Szlw1LPgbq0idM4X1NB53u3zx2lyIXz6XM9scQtjG/o0kAoQJz5cALTiLeS4h
 P6O/43fv9eqa2gfm+cl9uXuK8WPOBWHa+gVOYYWs0n9289SeXGnWrjjm8Uyv2M2J41
 MyzucIxozLIO/j0LhciFjLR46qrcTuYTics1mybYkX073932KlLSdDEBL0ov4kHqG8
 2tXMZTrLHMb7w==
Received: (nullmailer pid 1358279 invoked by uid 1000);
 Tue, 10 Oct 2023 18:42:12 -0000
Date: Tue, 10 Oct 2023 13:42:12 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20231010184212.GA1221641-robh@kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010125719.784627-11-gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a
 system bus for STM32MP15x boards
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

On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
> ETZPC is a firewall controller. Put all peripherals filtered by the
> ETZPC as ETZPC subnodes and reference ETZPC as an
> access-control-provider.
> 
> For more information on which peripheral is securable or supports MCU
> isolation, please read the STM32MP15 reference manual.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
>     	- Renamed access-controller to access-controllers
>     	- Removal of access-control-provider property
> 
> Changes in V5:
>     	- Renamed feature-domain* to access-control*
> 
>  arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 +++++++++++++------------
>  arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
>  arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
>  3 files changed, 1450 insertions(+), 1377 deletions(-)

This is not reviewable. Change the indentation and any non-functional 
change in one patch and then actual changes in another.

This is also an ABI break. Though I'm not sure it's avoidable. All the 
devices below the ETZPC node won't probe on existing kernel. A 
simple-bus fallback for ETZPC node should solve that. 

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
