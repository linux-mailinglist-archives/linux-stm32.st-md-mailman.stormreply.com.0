Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA67562684
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Jul 2022 01:12:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB59FC56630;
	Thu, 30 Jun 2022 23:12:39 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16BD0C04005
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 23:12:38 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id a7so373501ilj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 16:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iHugPUU0MDR5+K9E0jP2XLgfCe7UY26FEf9lftsm730=;
 b=bC1h6eyBbsCyI/4HLpg+fB6sOxiA8/oxSywFzy53r8cx0y1/fVbYFn5ZCF92ci5854
 lL8GCaHOXv9fY7SPgsem3ITKJSrfm4zlHywgEI7yhJMn6Z8xnJDrBw3OvKCkZgBTqVvt
 nlf222Tmvoc//XW3r2SXajEY3SHxG2zOGXTm9WE3aj/ip2pJpsjH3zm+lWNuiz/iNdec
 X0BIm0SPwv6oap5qkTyHu9HPkepkp5jn/Lks3moR+zz57D/uhtHbDMz5dkING2LXjZbH
 swrqsh69/TkJastQa7jdl0noDFBKxBofIGcn83cUY5lUymCM6P1g1/+yfc1a30AKEZdx
 Vd4A==
X-Gm-Message-State: AJIora84lxHj588XieOsNvKdRwehewObkzydqAlNQtSNeHwwHPx9t1uU
 ANkj0sUI//CGAW2KMvVagw==
X-Google-Smtp-Source: AGRyM1tT5CG0yLSSc/va+12RRrHObFuWAOcrGlHu0n3+pHcA/vXqxOczeWF54MgY48MhFLDcGe3lww==
X-Received: by 2002:a92:d24c:0:b0:2d9:2b03:10d8 with SMTP id
 v12-20020a92d24c000000b002d92b0310d8mr7092646ilg.117.1656630756932; 
 Thu, 30 Jun 2022 16:12:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a6bd008000000b006755ae0679bsm4256075ioa.50.2022.06.30.16.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 16:12:36 -0700 (PDT)
Received: (nullmailer pid 3507068 invoked by uid 1000);
 Thu, 30 Jun 2022 23:12:34 -0000
Date: Thu, 30 Jun 2022 17:12:34 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20220630231234.GA3506992-robh@kernel.org>
References: <20220626002105.198854-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220626002105.198854-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/7] dt-bindings: arm: stm32: Add
 compatible string for DH electronics DHCOR DRC Compact
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

On Sun, 26 Jun 2022 02:20:59 +0200, Marek Vasut wrote:
> Add DT compatible string for DH electronics STM32MP15xx DHCOR on DRC Compact
> carrier board into YAML DT binding document. This system is a general purpose
> DIN Rail Controller design.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Split DHCOM and DHCOR SoM entries
> V3: No change
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
