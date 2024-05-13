Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74B8C43BA
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 17:06:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF90BC6B47A;
	Mon, 13 May 2024 15:06:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7094FC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 15:06:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2175D87F13;
 Mon, 13 May 2024 17:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715612811;
 bh=CLtRBcrV8ZA4r12w3/CUqBvLBUpcesXFzphIqIUvDqI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E5P2q4Xq5fp2GI3FBySbulplbyp7OSFmdeDoMVRX2M27BCFa+wJoh4amCTdiGNjbj
 xH7+IjNER94wmrkItXZwXbcgwpLrvefr8QdDQZmCL8Yy4S+scPB/1LEycZ2QD2GtnI
 MHUAK4PJ6MBiORbIe+RBqpVbcMzMZxHCRWajYKLBdpSS+foHjqENVDtsSvzVovDTIO
 seJJTZV99wJ2L8+LfRq6+Hf8q2KZ2+P2JoXrj8RUeDu+pO7Gp01s5CXNM5U+3wXK9N
 LY9NxpZRPNrUFgUCO1x9D7HwHTS5XJsGm3mrKbBgEa2n6lP3qI1q718kODYBpXo6/3
 XpxbGKKHs/6Pg==
Message-ID: <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
Date: Mon, 13 May 2024 16:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pascal Paillet <p.paillet@foss.st.com>
References: <20240513095605.218042-1-patrick.delaunay@foss.st.com>
 <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add compatible for STM32MP13
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

On 5/13/24 11:56 AM, Patrick Delaunay wrote:
> Add new compatible "st,stm32mp13-pwr-reg" for STM32MP13 SoC family.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v3:
> - Replace oneOf/const by enum; solve the V2 issues for dt_binding_check
> 
> Changes in v2:
> - update for Rob review, only add compatible for STM32MP13 family
> 
>   .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
> index c9586d277f41..c766f0a15a31 100644
> --- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
> +++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: st,stm32mp1,pwr-reg
> +    enum:
> +      - st,stm32mp1,pwr-reg
> +      - st,stm32mp13-pwr-reg

Should the st,stm32mp1,pwr-reg be treated as fallback compatible for 
st,stm32mp13-pwr-reg or not ?

In other words, should the DT contain:
compatible = "st,stm32mp13-pwr-reg", "st,stm32mp1,pwr-reg";
or
compatible = "st,stm32mp13-pwr-reg";
? Which one is preferable ?

I think the former one, since the MP13 PWR block could also be operated 
by older MP1(5) PWR block driver(s) without any adverse effects, except 
the SD IO domain configuration won't be available, right ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
