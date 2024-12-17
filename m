Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D14119F48C6
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 11:23:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F3E1C78011;
	Tue, 17 Dec 2024 10:23:37 +0000 (UTC)
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 258C2C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1734430907;
 bh=8SBd5SJv87i4jOo+5k9uOKrUg6sUQ45A9jsFMVMrJ2k=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=orFzDA8aSiVmjuOLI0FczHf+sV6rgHbBwY1rCLoQZmN26RYgL8j2l+X3/iatdnKmY
 b8xoAYr56vlGH60Ft6JeBplQUpzhM40PlzJfTjbHedeSxJdabLMGJCbSdHHixcphi1
 lb9E7LRcfOgG2yq8vh7PQWtwuyEPxoqMurXdC9Kwq5ORhdK6MpFfzAtZQ9zVkfrtD6
 TPj7Qb3S/WcXNcjSdr1gd/QrjiY2WJuGIDAk5IvCcqmaVzeHjzDsszfXwcIcv6osD4
 wJPUa1C/p8SqxiNZIErbJs9gq/mrmhBCHLyQopmkKF7TvAMHnJrpalgvWU7PTcZCZ+
 JAEERiw5hHxIA==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH] ARM: dts: stm32: Swap USART3 and UART8 alias on
 STM32MP15xx DHCOM SoM
Thread-Index: AQHbTa+SkhqBiEt7mEeimKcVLbuCf7LqPx2A
Date: Tue, 17 Dec 2024 10:21:35 +0000
Message-ID: <2a960747f48e44daaa3cffe93ceb8ea3@dh-electronics.com>
References: <20241213223658.99802-1-marex@denx.de>
In-Reply-To: <20241213223658.99802-1-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 kernel <kernel@dh-electronics.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Swap USART3 and UART8
 alias on STM32MP15xx DHCOM SoM
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

From: Marek Vasut <marex@denx.de>
Sent: Friday, December 13, 2024 11:36 PM
> Swap USART3 and UART8 aliases on STM32MP15xx DHCOM SoM,
> make sure UART8 is listed first, USART3 second, because
> the UART8 is labeled as UART2 on the SoM pinout, while
> USART3 is labeled as UART3 on the SoM pinout.
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2
> board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> index 086d3a60ccce2..142d4a8731f8d 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> @@ -15,8 +15,8 @@ aliases {
>  		rtc0 = &hwrtc;
>  		rtc1 = &rtc;
>  		serial0 = &uart4;
> -		serial1 = &usart3;
> -		serial2 = &uart8;
> +		serial1 = &uart8;
> +		serial2 = &usart3;
>  	};
> 
>  	chosen {

Reviewed-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
