Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FBAB26033
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 11:08:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AABAC36B3E;
	Thu, 14 Aug 2025 09:08:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4252DC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 09:08:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 265916020E;
 Thu, 14 Aug 2025 09:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441AFC4CEED;
 Thu, 14 Aug 2025 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755162529;
 bh=SrgIKHyQzZsNRjZjaedpryVUikg6Qu1TuEDXZ4F66GY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEhar6bMklvfkyPidpHaCkPhVHC2IBI1dey6oRukc416ApLx9OQoXpnokam4Iu3IO
 3EhE8j6+HI4tbeLxI0Jo5xc4UpYECb8jj0Xa0GKvLoUxlR6d8ueXSFChmDOuF/7H/e
 iFVDPVV3Y53BKP6ribAcTfPkS/Lf/9N63cEIYz7ZaZQIYG6iXdk6SPhQI2OT8cjEDV
 Krs1Zlt5macbMAGdvULwB1vLxE3+8jZehLY42zDEHBoE1XxG4FVWmE/WWqdriKWj+6
 DSAmRogyfDzfzNltXHf4B5+cT89ZfHionEfAof148q7RynLlADN8wBpD/T8pLCZKwi
 0JqK1RQh7lJvw==
Date: Thu, 14 Aug 2025 11:08:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20250814-resolute-lime-raven-de4fa5@kuoka>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-1-132fd84463d7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250812-drm-misc-next-v2-1-132fd84463d7@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 01/13] dt-bindings: display: st: add
 new compatible to LTDC device
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

On Tue, Aug 12, 2025 at 03:48:58PM +0200, Raphael Gallais-Pou wrote:
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 4

minItems instead

> +    clock-names:
> +      maxItems: 4

minItems instead

> +
>  additionalProperties: false

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
