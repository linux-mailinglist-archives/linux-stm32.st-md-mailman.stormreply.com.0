Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E37C6BBF623
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Oct 2025 22:48:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 981BFC349C0;
	Mon,  6 Oct 2025 20:48:26 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C71EC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Oct 2025 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=VIKAcr7AiKo1tJTrh+bk2m2hYbyR4gITRIGMmYNi20Y=; 
 t=1759783705; x=1760993305; b=pG6G3THD/sdNheUiviI/XbH5xPQ8JzQshOX9RPgXkoiDmMH
 vWyQyFPoEN/r1Rt9XMLmYwqa9Jiu6wCLfKGBKiOHdUUmKuxJLodF2J5z42cGGkjOFhOXUsPSE8SOM
 r5z4lq0l8fNzY1y+1SoXFXv4SsRrnaFslcgk0TEPuOMPxzEH+PtvHt1/5N/73EYMAgf0weV2wGRt1
 /akHIk9cU9yC4KyFplsHVnq4QDsXh59lbqrkMBfStBbGQ40ud9VV46/cHdfmrZyPtmmSIDSfIypiJ
 38P19aq+yOtt6W0AJs9HY7ZxJtWFzQsNHaoah6JKsXFYFXxnCpsCxzRCyZxgLRTw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.2) (envelope-from <johannes@sipsolutions.net>)
 id 1v5s80-0000000FBWk-3fK8; Mon, 06 Oct 2025 22:48:17 +0200
Message-ID: <1697b64e2b64682dbf83186f17f42c50ecf88fa8.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Rob Herring <robh@kernel.org>, "Sven Eckelmann (Plasma Cloud)"
 <se@simonwunderlich.de>
Date: Mon, 06 Oct 2025 22:48:15 +0200
In-Reply-To: <20251006204529.GA549972-robh@kernel.org>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20250926-backoff-table-support-v2-1-16d3726646c4@simonwunderlich.de>
 <20251006204529.GA549972-robh@kernel.org>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
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

On Mon, 2025-10-06 at 15:45 -0500, Rob Herring wrote:
> 
> > +          country:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description:
> > +              ISO 3166-1 alpha-2 country code for power limits
> 
> This would be constrained to something like this?:
> 
> pattern: '^[A-Z]{2}$'

There's a "00" special case for "world roaming", so maybe that would
have to be '^([A-Z]{2}|00)$'? Not sure you'd ever want to specify that
though. We also use '99' internally for even more special cases, but I'm
pretty sure that shouldn't be specified externally.

johannes
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
