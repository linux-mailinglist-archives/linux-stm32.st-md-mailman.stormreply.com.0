Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3381BFE4
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 22:10:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77F74C6B46B;
	Thu, 21 Dec 2023 21:10:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68901C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 21:09:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9DED619E8;
 Thu, 21 Dec 2023 21:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3008C433C7;
 Thu, 21 Dec 2023 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703192997;
 bh=MOv2Ps6cE6dmQApM5Rwy2jg3rccLNITICS9IRnMhXiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u3z+8wD2mqTIkYTCtx608pczUdMSijGLS9F+KeWgjLDVZMfQMcFcYrOae2STvxjk0
 HC4DSuqXpyk0LAHxlS/YjGIBqM//J9GNOIZeAo7SuEm3wxokvThk6ezw6vIc+IWOq9
 BKMkhyRTTZZqjTrhbzfO2psZGghVzz4DHCIClhnNZUVKtJ497UKJSuM155QP/rUBna
 ntpmZ4cWXusPyJrN+jvsV/Z+6bF6aHziDSEHVZS29rQzKWAV7CUSTSkRCK7J5i9C6L
 vxtWSK4XgYEypvadURNqgTzwga2DJsAWB0MJmdGzWzrCvGUbzAaCZwDuBCpQf8g5qw
 ugthze1lpuTBA==
Received: (nullmailer pid 98899 invoked by uid 1000);
 Thu, 21 Dec 2023 21:09:54 -0000
Date: Thu, 21 Dec 2023 15:09:54 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <170319299428.98837.13859133240448825226.robh@kernel.org>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-2-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221124339.420119-2-raphael.gallais-pou@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH RESEND v1 1/8] dt-bindings: panel: lvds:
 Append edt, etml0700z9ndha in panel-lvds
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


On Thu, 21 Dec 2023 13:43:32 +0100, Raphael Gallais-Pou wrote:
> List EDT ETML0700Z9NDHA in the LVDS panel enumeration.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
