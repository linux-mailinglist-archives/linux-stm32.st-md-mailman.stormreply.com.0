Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D9A4458E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 17:12:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0F80C78F9C;
	Tue, 25 Feb 2025 16:12:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7692C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 16:12:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98A5C5C7240;
 Tue, 25 Feb 2025 16:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7572C4CEDD;
 Tue, 25 Feb 2025 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740499940;
 bh=6TPSx9DDdcDsDZc4Z3MH/7GdfIzQc59GGd56ID/Sx5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NU2EeJ8FyzWf7HI2/8kGM+qhJabN/O1VJNuarGCTaaTAf7SR0p+tXbOv0rNLPxQ1P
 GkqL3qVSbuxuVt9WmUtYt4eLECgRNhSgxMT0XJ/QUI9wAN5TWpY3nPWU8jNdGjfQJ1
 LEUk04YN6vDTgqNHfkNpZ21fN8T0YcAAhr04EjLYBM4jAXdRaS7W4XTBxCiIxrqv4P
 57Y+JoPZ9jyr40AvmvoOKNnT4zak99uCOcC7BXyI5g+RhLFg7ZZKkroT5cbSGKYFZx
 /ZFM9Ce6EOdxSFVina9oQWVocBhDIDX72LveN6lPTQLAoVJoBBHIB2h6yRFVQvtex7
 lT6g4Vkayq9QA==
Date: Tue, 25 Feb 2025 10:12:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <174049993788.2634473.18262936778020471573.robh@kernel.org>
References: <20250225-b4-stm32mp2_new_dts-v2-0-1a628c1580c7@foss.st.com>
 <20250225-b4-stm32mp2_new_dts-v2-4-1a628c1580c7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250225-b4-stm32mp2_new_dts-v2-4-1a628c1580c7@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 04/10] dt-bindings: stm32: add
 STM32MP21 and STM32MP23 compatibles for syscon
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


On Tue, 25 Feb 2025 09:54:07 +0100, Amelie Delaunay wrote:
> Add the new syscon compatibles for STM32MP21 syscfg = "st,stm32mp21-syscfg"
> and for STM32MP23 syscfg = "st,stm32mp23-syscfg".
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
