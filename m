Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A282DC90
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jan 2024 16:47:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E052C6B457;
	Mon, 15 Jan 2024 15:47:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B8F5C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 15:47:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44CD860EDF;
 Mon, 15 Jan 2024 15:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87F6C433C7;
 Mon, 15 Jan 2024 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705333621;
 bh=CKlMsBgiRFguC4EeGf8G4YmTN9XESV+58mgkD1W4SPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skFXbUDCV/2M/7goc7hXpkMmxJNhc6isLScK4FQwrlU9+0IKA2Ue7/tEKI/9xiUcl
 QMuMMNeQlAtjNBoBcuqibBIwMirN0OAwrDE89FoCcS/zC8USBomywfB6cY22ZYX/cB
 WfElSbPDp0DqEDhYvF9DjIc/m0jAXJeVo26uom6+1s9eMYAizNjiZ6j6BPOUaCMPps
 A7iUNWfw7taRvEDEbpmWkgyHies6OKZfU9QqJgvDrvRT3onnSi/8H//NLXGRPYyIKg
 ydN83g3LT/GqiV7q21OZUw3K82CE2bJ1mAyVVq/xskSlX+TRtrH7GOYq5x/mPoz7da
 tx48yxQpVT/XA==
Date: Mon, 15 Jan 2024 09:46:59 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20240115154659.GA815331-robh@kernel.org>
References: <20240115132009.101718-1-raphael.gallais-pou@foss.st.com>
 <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/6] dt-bindings: display: add
 dt-bindings for STM32 LVDS device
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

On Mon, Jan 15, 2024 at 02:20:04PM +0100, Raphael Gallais-Pou wrote:
> Add "st,stm32mp25-lvds" compatible.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Depends on: "dt-bindings: stm32: add clocks and reset binding for
> 	    stm32mp25 platform" by Gabriel Fernandez
> 
> Changes in v3:
> 	- Clarify commit dependency
> 	- Fix includes in the example
> 	- Fix YAML
> 	- Add "clock-cells" description
> 	- s/regroups/is composed of/
> 	- Changed compatible to show SoC specificity
> 
> Changes in v2:
> 	- Switch compatible and clock-cells related areas
> 	- Remove faulty #include in the example.
> 	- Add entry in MAINTAINERS
> ---
>  .../bindings/display/st,stm32-lvds.yaml       | 119 ++++++++++++++++++

Filename matching compatible.

> +properties:
> +  compatible:
> +    const: st,stm32mp25-lvds


> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    lvds: lvds@48060000 {
> +        compatible = "st,stm32-lvds";

Wrong compatible.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
