Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9EB484884
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jan 2022 20:26:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E4BBC5F1F9;
	Tue,  4 Jan 2022 19:26:22 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E78BDC5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 19:26:20 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 g79-20020a9d12d5000000b0058f08f31338so48509947otg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jan 2022 11:26:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YKrA0VG5088QppXxlOYC79pk7hClbKGMriiqTjf+5V0=;
 b=dp0EeK4M3F2KNn3k7QtXpcpdy2eKNpWUCO2Fjr0Dy3rj7i2N5Gm3j8sYNnQ03llAdu
 XYD3M16oIN2kr9pzhcneoc3fenDWfl2iUOF3jchXoNC3wCkPLE02K/vDijTWkFetBZv/
 btvcC1H/Wr248MGU4lUfm+e7S2wPfOm6yhWAjQ+zPQXhz035PgQ4D6J12eelkbCgdq/I
 XTkDdvGDFIzkGkVS56nYr6TEuCBOLAameb4U0KZH4V6o7W9i7YKsUIfsqpZUW813aVcv
 SNsIz7CJXDkc0p1q2ThSwss6lml/2g9pucNX3jJW6+67z6LqWt8KO7yjsyVZk6f82lT+
 XCJA==
X-Gm-Message-State: AOAM530JLVClasdtEgu9OVtUCk99Ykrr9Vevohda4YXVt9Sk4e9i0odX
 HjHyvwNAZvKsHWOoT3h4QA==
X-Google-Smtp-Source: ABdhPJxCXU9/2UnfSX6FTnORjLMwzO5dNGz4FBXb+4cI/iN163LD8/6FZ+ptpnnF6UXfyvHIEKWbJg==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr37296906oth.94.1641324379789; 
 Tue, 04 Jan 2022 11:26:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j99sm7957678otj.15.2022.01.04.11.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 11:26:19 -0800 (PST)
Received: (nullmailer pid 1261017 invoked by uid 1000);
 Tue, 04 Jan 2022 19:26:18 -0000
Date: Tue, 4 Jan 2022 13:26:18 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YdSfWqj34Ragg+Yj@robh.at.kernel.org>
References: <20211221125145.1195234-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221125145.1195234-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: display: st,
 stm32-dsi: Fix panel node name in example
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

On Tue, 21 Dec 2021 08:51:45 -0400, Rob Herring wrote:
> With 'unevaluatedProperties' support enabled, the st,stm32-dsi binding
> has a new warning:
> 
> Documentation/devicetree/bindings/display/st,stm32-dsi.example.dt.yaml: dsi@5a000000: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
> 
> The documented child node name is 'panel', so update the example.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
