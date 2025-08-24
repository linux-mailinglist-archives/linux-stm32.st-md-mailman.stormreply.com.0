Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0797B32EB1
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Aug 2025 11:21:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F1DCC3F939;
	Sun, 24 Aug 2025 09:21:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22C1AC3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Aug 2025 09:21:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CBEFA40BE1;
 Sun, 24 Aug 2025 09:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA99C4CEEB;
 Sun, 24 Aug 2025 09:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756027273;
 bh=TePubqI9AcNR0qwMPahOp4rbJX0w3i3fs/cTg7AxDBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=stF7yeXZ5mOGTtkj4CiErJFbaGQkPc6jD4ShIx/+320L7sJ+H9Z3hJUFPA8Sc/TGN
 bIsal3EESgk6YXHGWDGTU8Jy+zONb2NYcE8exzsll9WFvkJuYB+IKGkly+k08dlIZs
 7AFKxJ2spcI6mgUuo+TllH6K/847OR/WkpXvv5Rnb3KIZgPZ/HFLiPqiKdlREArlzM
 NcwjGukxzx8o7mC1hffG+cF9sHwu+97j8lKO+Yum/MqOvjcBeLjgpSY2vJjYEZGDGf
 5PJrptVmXakzz+3HboG8ntIaKWvWHM0BqrbzleAvHW/iZ9Jnh1A85s+iw+6j7xk9st
 lRo+aDUnlN/3Q==
Date: Sun, 24 Aug 2025 11:21:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20250824-stimulating-herring-of-romance-df21ea@kuoka>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 01/13] dt-bindings: display: st: add
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

On Fri, Aug 22, 2025 at 04:34:10PM +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> and different mandatory clocks it is incompatible with existing IPs.  On
> STM32MP251, the device only needs two clocks while on STM32MP255 it
> needs four.
> 
> Add the new names to the list of compatible string and handle each
> quirks accordingly.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 52 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
