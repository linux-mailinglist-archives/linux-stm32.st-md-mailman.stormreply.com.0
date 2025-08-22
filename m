Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D1B310FE
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 10:00:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB230C3F95B;
	Fri, 22 Aug 2025 08:00:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8685C3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 08:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A60E043974;
 Fri, 22 Aug 2025 08:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED615C4CEF1;
 Fri, 22 Aug 2025 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755849624;
 bh=3LSBrlgPclPcn4MCgtRigx2+6I/Y0aDUi3B5dRZXgJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EHsW+l5lBzW6kIrQPVMAzO+pLHcaO9NHZlYPxnKMkHMJ4t0v1jWgeqNJeriGCTOXy
 4mj7Yj0W1lhPZncT1Q1rcwbsRxk1frpx6p7fK521064HLZoSTKOaSv50jbwGhAff/R
 IGcREZsoQUt7Fy2BogPc0NRiig+ip1MyOv3g5ntKq2/8rWKboO7f4bhSaFhujEu5CZ
 PSfI/bxD8EFetgLxg7/grV6GwCEP0bCMmDdQfUc/FVg9Ha6gKVnLj846fyyFWodWhN
 B02F0I1VKT99cWB6hfO4VHiOUqLVdHXNy+xBcWZ0KRY78b6KttQ2Z+JJfMSCAYO9Kh
 018gCc3WKLGrw==
Date: Fri, 22 Aug 2025 10:00:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20250822-gifted-messy-fulmar-1eab63@kuoka>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 01/13] dt-bindings: display: st: add
 two new compatibles to LTDC device
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

On Thu, Aug 21, 2025 at 01:08:51PM +0200, Raphael Gallais-Pou wrote:
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp251-ltdc
> +    then:
> +      properties:
> +        clocks:

minItems: 2

> +          maxItems: 2
> +        clock-names:

minItems: 2

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
