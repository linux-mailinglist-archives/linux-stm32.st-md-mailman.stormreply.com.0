Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD5BCD832
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Oct 2025 16:25:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4514C555BE;
	Fri, 10 Oct 2025 14:25:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B9F7C555BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Oct 2025 14:25:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0432C6266E;
 Fri, 10 Oct 2025 14:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727E1C4CEF1;
 Fri, 10 Oct 2025 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760106328;
 bh=2cqoklTmnWcMBIxfli3d/ARO/y0tQWg6ESZXPMf9q0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lpzpcZ/dKsdtgEk2sydCmYgvR99u1H5iNfrZ6WIpCTfgdKaLAtChsAxBatdre8cI6
 mpqUg3lak6r+Pb1sJ1/kWOKdj75Vz6tsnHq1KQ9FfQTAJH1v0sLcqaPwXfeN7z//GV
 Z+K8aiV1pKme6p7fSxbEAy/lwmQJFJdjOffDf5ThZ6ISFlJ2apU2Sp3BhyeV3Fujuo
 tSX2icvdUoZ2pz7Efhc8TA7bpOYqvuEffH+yf2W411C7fW3KFTaycjCzzN7IzkXXk9
 IxXn7gPwybpY/E8CL9ry/3lwDr9gun4ZrVUQ8jsh3v4zTNC4y8JVXqbJuo2SJ7tdfi
 YO4UPHzhl451w==
Date: Fri, 10 Oct 2025 09:25:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Message-ID: <176010632601.241034.1894010503665386462.robh@kernel.org>
References: <20251007-backoff-table-support-v3-0-fd6e2684988f@simonwunderlich.de>
 <20251007-backoff-table-support-v3-1-fd6e2684988f@simonwunderlich.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251007-backoff-table-support-v3-1-fd6e2684988f@simonwunderlich.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH mt76 v3 1/3] dt-bindings: net: wireless:
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


On Tue, 07 Oct 2025 10:11:14 +0200, Sven Eckelmann (Plasma Cloud) wrote:
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
>  Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
