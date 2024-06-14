Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEF7908CDE
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 16:00:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C6A2C6B460;
	Fri, 14 Jun 2024 14:00:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09DEEC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 14:00:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5DB35889EC;
 Fri, 14 Jun 2024 16:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718373639;
 bh=4+DN2i7csqmQcAXLvxkcKDrBrfSZbHHe/kZgUCJhXOI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a3kZRRhgOmNtheXARqqNagHPCshPBM7Gz0hWk44rNgmGJlEMoFnH7r83Jhr+nfyHa
 +RfsmHIroQ9Y9DcPkjHBv76qG5f5IFQGAPoKMVHvhZPsiDhfryxIZt7pvPuB3GTLMO
 +kve1Jlc30+9GuSIjpVPs8P8jaY44ux3jDEd28AtpiJosO+USCOBJq+KVwsBsaU5mP
 tkgTYMenPeVEkEoQy+jaXecH80U3DZF0ZoI3ALacht9er/PL9lzHYnyRRrx0jAv9LG
 moYl3iGrflhI4xX9uy8GuZBrnbhLQ3E25o8eMDY9wXh8HIIdQIJ7SyNC/GHiDuQI+P
 Zr0kEUDFKa9XQ==
Message-ID: <d7006e54-c0e8-445c-a589-9674235913a6@denx.de>
Date: Fri, 14 Jun 2024 15:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240614130812.72425-1-christophe.roullier@foss.st.com>
 <20240614130812.72425-2-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240614130812.72425-2-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH 1/2] dt-bindings: net: add STM32MP25 compatible in
 documentation for stm32
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

On 6/14/24 3:08 PM, Christophe Roullier wrote:
> New STM32 SOC have 2 GMACs instances.
> GMAC IP version is SNPS 5.30
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>   Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index f6e5e0626a3f..d087d8eaea12 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -23,12 +23,17 @@ select:
>             - st,stm32-dwmac
>             - st,stm32mp1-dwmac
>             - st,stm32mp13-dwmac
> +          - st,stm32mp25-dwmac
>     required:
>       - compatible
>   
>   properties:
>     compatible:
>       oneOf:
> +      - items:
> +          - enum:
> +              - st,stm32mp25-dwmac
> +          - const: snps,dwmac-5.20
>         - items:
>             - enum:
>                 - st,stm32mp1-dwmac
> @@ -121,6 +126,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - st,stm32mp25-dwmac
>                 - st,stm32mp1-dwmac
>                 - st,stm32-dwmac

Keep the list sorted please.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
