Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D138986076C
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 01:09:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7832AC69063;
	Fri, 23 Feb 2024 00:09:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3115EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 00:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C60F861967;
 Fri, 23 Feb 2024 00:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A932C433C7;
 Fri, 23 Feb 2024 00:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708646995;
 bh=RhRSFH5NSNo6CkhyLrfKQ5w4p4swe1ANA4xMk2MzezU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPd7uYEmx+5AqH45QTZDVE/QqqrIRqRVliCaONRWsT0EttfngXCdL6t9fvJmNJX9q
 DL5q0N7U3aQHxTPe0hTjITppjBbMCqegTZhyYh9pcdRCI2wkGBNrvztZO4WKvMnGH6
 G26n2TC3XiIS/Z39B4qG95W+6raAP0dZ9mLCv9h27f1WwteRDAQDsgMZ2gMp63nAN3
 Cb4qi/Fy/ziIaDR2E1hl6bQJ6bgJ2bU+8uS9yAVJYuiX3xWWfbZJ6/Lglaqm9njm95
 NK3HBP0nC4u8OMPurCV8m3XqZlXZj1nhwnboA50I5S+cN2XW4eniu1WGpWVzVSEhtg
 C2BwAOwHa6u6Q==
Date: Thu, 22 Feb 2024 17:09:46 -0700
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20240223000946.GA3848625-robh@kernel.org>
References: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
 <20240217-ltdc_mp13-v2-4-50881f1b394e@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240217-ltdc_mp13-v2-4-50881f1b394e@foss.st.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/4] dt-bindings: display: simple:
 hardware can use several properties
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

On Sat, Feb 17, 2024 at 12:02:58PM +0100, Raphael Gallais-Pou wrote:
> Setting a panel-timing in the device-tree overwrite the one specified in
> the driver and set it as preferred.  In that case 'height-mm',
> 'width-mm' and 'panel-timing' are properties that can be use for simple
> panels, according to panel-common.yaml
> 
> Fixes following warnings:
> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: panel-rgb: 'height-mm', 'panel-timing', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 634a10c6f2dd..c02cbbc7a100 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -352,6 +352,9 @@ properties:
>    no-hpd: true
>    hpd-gpios: true
>    data-mapping: true
> +  height-mm: true
> +  width-mm: true
> +  panel-timing: true

Instead, just change 'additionalProperties' to 'unevaluateProperties' 
and drop all these 'prop: true' lines. Pretty much anything from 
panel-common.yaml should be allowed.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
