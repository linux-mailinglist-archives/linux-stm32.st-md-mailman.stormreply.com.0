Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F6BBF3A2
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Oct 2025 22:45:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F3C7C349C0;
	Mon,  6 Oct 2025 20:45:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81259C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Oct 2025 20:45:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 035BE43A6E;
 Mon,  6 Oct 2025 20:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05CEC4CEF5;
 Mon,  6 Oct 2025 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759783530;
 bh=Msplel+2vngn0wszovGQc3AienJz2287rwZ/jQ5RlKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sY8ueBp4USjv/gu/UnTqZMG68tY83xRGMo/6KwFUFSiB7ZHymiqy6+FGbDlOosqd/
 jUf6llB99AsWoXliaizf7WLEnpJV7/8nDASOPfyjfzWgznS+cJepG1T7AflpjDGxVE
 iH0fRjGfBAEetLI4RmqCzLUxK4K7OlcG2Vlu10NgJEEFocL1zUdYEr5yBsYIrn3bVR
 Mw0tXM5mzGlVDwX3NcGbRgQOKEf4EmAMb71RYnH9sPUKPiDRH9edifCvqVOTCIAoyr
 B5cJmodEifygc6Hk7cYt3zIrjUyc2d6mkKjN97cupcmbIbJQjJdaZkWDXS5Po3W+Eo
 SXRNrDIkUgnkQ==
Date: Mon, 6 Oct 2025 15:45:29 -0500
From: Rob Herring <robh@kernel.org>
To: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Message-ID: <20251006204529.GA549972-robh@kernel.org>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20250926-backoff-table-support-v2-1-16d3726646c4@simonwunderlich.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926-backoff-table-support-v2-1-16d3726646c4@simonwunderlich.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [Linux-stm32] [PATCH mt76 v2 1/3] dt-bindings: net: wireless:
 mt76: Document power-limits country property
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

On Fri, Sep 26, 2025 at 12:04:52PM +0200, Sven Eckelmann (Plasma Cloud) wrote:
> The commit 22b980badc0f ("mt76: add functions for parsing rate power limits
> from DT") added filtering of the power limits based on two properties:
> 
> * regdomain
> * country
> 
> If either the country or the regdomain matches, the power limits are
> applied and the search is aborted. If none of the two is defined for the
> power limit, it is a global (or "fallback") power limit. The last
> "fallback" power limit in the list will be returned when not matching
> regdomain or country was found.
> 
> The idea is here to allow to specify "overwriting" country limits in front
> of the list - just in case a regdomain is shared but a country has
> additional limitations.
> 
> But this property was forgotten to be defined in commit 2de6ccebe0e7
> ("dt-bindings:net:wireless:mediatek,mt76: introduce power-limits node").
> 
> Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
> ---
>  Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index eabceb849537c418650697da86682ef04c979193..f8f72f3f1b1dd185b4797be38b87c621ef3eac08 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -151,6 +151,11 @@ properties:
>                - ETSI
>                - JP
>  
> +          country:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            description:
> +              ISO 3166-1 alpha-2 country code for power limits

This would be constrained to something like this?:

pattern: '^[A-Z]{2}$'

> +
>          patternProperties:
>            "^txpower-[256]g$":
>              type: object
> 
> -- 
> 2.47.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
