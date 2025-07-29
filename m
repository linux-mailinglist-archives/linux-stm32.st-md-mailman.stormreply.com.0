Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BBB15157
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 18:31:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C45B8C35E3F;
	Tue, 29 Jul 2025 16:31:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49691C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 16:31:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 330F243720;
 Tue, 29 Jul 2025 16:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE32C4CEF5;
 Tue, 29 Jul 2025 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753806703;
 bh=1dkxZGkmuXVhfESsKgV+CRMmTLpxdc9oKXATIi9vcIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p26GeTUqOA1PeWl1t8jitMJV6dUSclnyI8FTib78TlJdGSUqKco9fXR0TqdNL//2N
 1O4Jm8HPbyFdVhL5AvaUkL1Ovv0tI9tgZdxku4C4b6rLOYLNzVYnn3wMku55diK4/J
 cibZ0RSpKIy14kxmVDjBwj3bVQEVH+TXEmErN6mGswnMkGkH986dsBZbR/NC1a9JcR
 DCvLbCm03u4ykOdru21TAcXgzYpZuJZwGQ/2ZYNXCz09gFWbBs3/I6t92v3BZInM6o
 zhvpOgFZqSDqEHa4CCwTnHrEMd3Riy3zsnd4mHmVlgntTzqcyIx85jW6F5A61z8y5o
 8YfDKRtqeVBOw==
Date: Tue, 29 Jul 2025 11:31:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <175380670133.511931.13043391606503114133.robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-4-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-4-a59848e62cf9@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/12] dt-bindings: display: st,
 stm32mp25-lvds: add power-domains property
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


On Fri, 25 Jul 2025 12:03:56 +0200, Raphael Gallais-Pou wrote:
> STM32 LVDS peripheral may be in a power domain.  Allow an optional
> single 'power-domains' entry for STM32 LVDS devices.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
