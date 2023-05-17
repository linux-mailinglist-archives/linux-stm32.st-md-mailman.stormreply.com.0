Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B1706D11
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 17:41:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B634C6B442;
	Wed, 17 May 2023 15:41:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26445C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 15:41:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A079A846BF;
 Wed, 17 May 2023 17:41:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684338115;
 bh=yu+HBQ+xsF7Vdw92aEE9A/go0SCqzU/xKdNUXvOwEPA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Jod5jwz3UbECy2pApjdZKKmx9LfmUwR0C3LKq+MPolY/ieAuWh/CUTuNU4BwSrC4A
 PAm9tS+DtaOTkWicX9m0rC+utJPR/3TFzWH7M04hccR8vxYfenU3enqR5H08XpcjMD
 I/zDYk0cdSkV4YXHaCHqCTWU2VqXBQXsl/SlLRkLPnt1+1CKj1dVYOKyiEYvbPQExh
 F3eD0RgqAn5oOEWMuiPqpHgR/83/cQ8vG+IA8p1uP9SFxnhb28kL1deQG6TI2yO85P
 fP5jyAfh0oOZ2/cnFf1Yn2ikYTM5hWciIv7MPZg4+kJhVKm8xq+1n+JBoUTA6PgegX
 LvshId/EEoehw==
Message-ID: <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
Date: Wed, 17 May 2023 17:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: fix several DT
 warnings on stm32mp15
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

On 5/17/23 16:35, Raphael Gallais-Pou wrote:

Hi,

> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index 0f1110e42c93..a6e2e20f12fa 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -457,8 +457,7 @@ &ltdc {
>   	status = "okay";
>   
>   	port {
> -		ltdc_ep0_out: endpoint@0 {
> -			reg = <0>;
> +		ltdc_ep0_out: endpoint {
>   			remote-endpoint = <&sii9022_in>;
>   		};
>   	};

This LTDC port/endpoint stuff always scares me, because I always feel I 
get it wrong.

I believe the LTDC does have one "port" , correct.

But I think (?) that the LTDC has two endpoints, endpoint@0 for DPI 
(parallel output out of the SoC) and endpoint@1 for DSI (internal 
connection into the DSI serializer) ?

Only one of the endpoints can be connected at a time, but there are 
actually two endpoints in the LTDC port {} node, aren't there ?

So the original description should be OK I think , maybe 
#address/#size-cells are missing instead ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
