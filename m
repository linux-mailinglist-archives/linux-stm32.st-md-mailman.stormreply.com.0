Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 621A59A10B4
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 19:33:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CFD0C78032;
	Wed, 16 Oct 2024 17:33:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A7D7C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 17:33:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 758CDA41064;
 Wed, 16 Oct 2024 17:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F8BC4CEC5;
 Wed, 16 Oct 2024 17:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729100017;
 bh=wtfh80IvBuoxq9N6HapzeJouFtMVgk01N3a0zNQebwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bNS5eEYvRqJajb3r44E/MqXiN0sPJLO9zE0WvRZwP4EViidiEvNC3vMPyVD6iH39O
 22/xqfZUjLo7wVqgCl27Ysy+/3Ykt5RU0c4bJzujMJI+EfNzjK8gyv8cC1msNXDMjB
 hQstHfqn4her+5zt4L8TDXMHf/XL4aUsUtneUlJzy67G0H6fg9Kkj1K6W0ctNhKoxv
 M1F8Vtsj2tnMcGYDsl0bD6cjcZMfoERgwYLDWQPa/OhoGXIAjWu8LEcUb++quCxkut
 y4SiEXGFJ+15lnQaPLplTbpjqjTgzaCilWAxoMpch2tGc9mByUY/hLg43N3/DgKSE4
 WhrKcARfumXgw==
Date: Wed, 16 Oct 2024 12:33:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <172910001570.2076913.18277281938022731096.robh@kernel.org>
References: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
 <20241016-dma3-mp25-updates-v3-4-8311fe6f228d@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016-dma3-mp25-updates-v3-4-8311fe6f228d@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/9] dt-bindings: dma: stm32-dma3:
 prevent additional transfers
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


On Wed, 16 Oct 2024 14:39:56 +0200, Amelie Delaunay wrote:
> Some devices require a single transfer. For example, reading FMC ECC status
> registers does not support multiple transfers.
> Add the possibility to prevent additional transfers, by setting bit 17 of
> the 'DMA transfer requirements' bit mask.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Changes in v3:
> - Refine commit description as per Rob's suggestion.
> Changes in v2:
> - Reword commit title/message/content as per Rob's suggestion.
> ---
>  Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
