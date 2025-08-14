Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9DB26857
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 16:01:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABF70C35E00;
	Thu, 14 Aug 2025 14:01:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 953E5C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 14:01:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 281A65C65AE;
 Thu, 14 Aug 2025 14:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EEAC4CEED;
 Thu, 14 Aug 2025 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755180080;
 bh=OJwgXQoKUoVQ6JMi/lzTSRWNwpU4o4E8nVxhmW1I3Ss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iXxvpwzh2EedlQ9q7ou5ppIO27ljUbxMV/BYUmWblGZ1axlrwXYBkLHJbakoVUplp
 FJisloc00zW1zUG09FJ7SC2dfPNqNth15fQHg3p56Km6tGXpkCdpDcO9H6zOnCWlCZ
 ekmvqIscoPehmfSCBl0RCOAw/PDt3VEhHv5Sq7QcZMl/2s09izsd7TOghFMXT5+GmK
 nTHkIry1mQfjv91Zyl2Qt2LudY3/1iR5ZfqKfi9egVQ3Zp0v5zNRnC599NTzcqM08d
 DjDCgL9SZg7CzXSM964X4m05Re4k5PN9KQIQRmXNIVdoLWD0REGYRtj14NWj+ktkcl
 KY8jAsbjcUlzw==
Date: Thu, 14 Aug 2025 09:01:19 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20250814140119.GA2748790-robh@kernel.org>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-3-132fd84463d7@foss.st.com>
 <20250814-dancing-nautilus-of-camouflage-ebb441@kuoka>
 <2c13bf48-5453-4302-9cde-eac51e314af1@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c13bf48-5453-4302-9cde-eac51e314af1@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 03/13] dt-bindings: display: st: add
 new compatible to LVDS device
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

On Thu, Aug 14, 2025 at 02:36:47PM +0200, Raphael Gallais-Pou wrote:
> 
> 
> On 8/14/25 11:09, Krzysztof Kozlowski wrote:
> > On Tue, Aug 12, 2025 at 03:49:00PM +0200, Raphael Gallais-Pou wrote:
> >> Update the compatible to accept both "st,stm32mp255-lvds" and
> >> st,stm32mp25-lvds" respectively.  Default will fall back to
> >> "st,stm32mp25-lvds".
> >>
> >> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> >> ---
> >>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> >> index 6736f93256b5cebb558cda5250369ec4b1b3033c..b777c55626e4b322d77ef411ad9e4a3afb6c9131 100644
> >> --- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> >> +++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> >> @@ -31,7 +31,13 @@ description: |
> >>  
> >>  properties:
> >>    compatible:
> >> -    const: st,stm32mp25-lvds
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - st,stm32mp255-lvds
> >> +          - const: st,stm32mp25-lvds
> >> +      - items:
> > Drop. This should be just enum or const, no need for items.
> 
> Why would items not be applicable in this case ? I want the compatible field to
> be either:
> 
> compatible = "st,stm32mp255-lvds", "st,stm32mp25-lvds";
> 
> or
> 
> compatible = "st,stm32mp25-lvds";

Krzysztof is only talking about the 2nd 'items' here. For cases with a 
single entry, you can skip 'items'. It's just a shorter version. Either 
way will work the same.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
