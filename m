Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7874460C5C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 02:42:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A79AC57B6F;
	Mon, 29 Nov 2021 01:42:21 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59772C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 01:42:20 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id s139so31534638oie.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 17:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NLMqwF0EmPDQ3Y48I2ePNN2tNTC1F/SFNEaaZNweyAo=;
 b=1fT0PRpz4Es+CAVQEyuQ8gWfMFprxd/Zi7nl1s9g77xDfA90yP+v7rBTA9pXXkqv/4
 uemoJuBZkJfsLV1ndmkPBYr8pnrOkPKhZcgJR8Grq7sLPxv/rq9xUKNZkSJEGXodk96j
 ychlI16gBJbou6PzkNoW4fB5EJHsiWg+GhZTlzghZY0+WvHo7Dl26gRgl0XEpDDV69l7
 oo+7Z9BAfRZINEcjrFKZBO6fLTXiFYTwolp0dgaVu2txIGTyKSWHzXErAC55dnFseXFx
 aaUsK++KxoS1IQEFGhoo6+C46dtJTkV/nCt92n5VKOsUSiDq2TLLLsmaMKiPWItXqrS3
 lRiw==
X-Gm-Message-State: AOAM531ejnxOEau33nBRgZhBGkhi/piPSTJfyHNSy9gIIH+ouUR7D0PD
 imslSeKBXFbdrw4RKW+3KA==
X-Google-Smtp-Source: ABdhPJxoueZ6SMNTWyT3yXIxQbuLdMWBIsmFK0edLtMHsqqeekQQLEK9t3RSyvnxFl/CX4U0dLkCDw==
X-Received: by 2002:a05:6808:23d6:: with SMTP id
 bq22mr38370728oib.121.1638150139166; 
 Sun, 28 Nov 2021 17:42:19 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
 by smtp.gmail.com with ESMTPSA id b22sm2674651oib.41.2021.11.28.17.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 17:42:18 -0800 (PST)
Received: (nullmailer pid 2994044 invoked by uid 1000);
 Mon, 29 Nov 2021 01:42:16 -0000
Date: Sun, 28 Nov 2021 19:42:16 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <YaQv+IOPpZZ3bKJy@robh.at.kernel.org>
References: <20211112053856.18412-1-jagan@amarulasolutions.com>
 <20211112053856.18412-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112053856.18412-2-jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: arm: stm32: Add
 Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
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

On Fri, 12 Nov 2021 11:08:55 +0530, Jagan Teki wrote:
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> C.TOUCH 2.0 is a general purpose carrier board with capacitive
> touch interface support.
> 
> 10.1" OF is a capacitive touch 10.1" Open Frame panel solutions.
> 
> i.Core STM32MP1 needs to mount on top of C.TOUCH 2.0 carrier with
> pluged 10.1" OF for creating complete i.Core STM32MP1 C.TOUCH 2.0
> 10.1" Open Frame board.
> 
> Add bindings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - Fix line-length warning
> 
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
