Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6202836FD
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 15:54:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3D8DC32EA7;
	Mon,  5 Oct 2020 13:54:39 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B2D9C32EA5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 13:54:38 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id m11so3038118otk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Oct 2020 06:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ywT1ID75hKID+KWrvt8jbDCqAy1lsMMxjENEdx2Y1RY=;
 b=Ccrq26rlfLfkgK1BnvKJaIFlgDSIhJLhvHe9W/0KKNyltAQAtPNxbsJc4VtwzLYl2i
 9dVYh0/LMh19Ijl7usR8mQhAvSB9avc9ZixzXwSrglSrxdTXfhhHFQKnHkbgAm+wEg9Q
 3olhIVDCEsvdRj80D313uNVXtpmmZR7djR6AvDNJYfnafJOFOkwBRb7PvKr++1YvxZ1P
 x3Kw4wJPEEDgfPgdUbWzXtjhCNxGwuOc81pgKzO7+dKjZ3EFkE9N2i3Q7LNPEra7xmq7
 wq5lQWUuJrCBZ1ukSvnFqH0EqSeR0DNryTmTC4w11NJAZzaph/3I+Z6h3B1udurS7bF7
 XN6A==
X-Gm-Message-State: AOAM5327jG0xbP6OzwtL7T5gwDPcA/BvG3jGccXMICeGwQO3waLoBmyP
 uZ3tc2LRQDSRCeUhnQU6MJnusf7Cm3iD
X-Google-Smtp-Source: ABdhPJy27lxmlMYfHdDW0sQLWWCljDxFmokHsIy9JCpxiH5FWa61WQb3hBS728MrEMCDCS4Vzx1c2A==
X-Received: by 2002:a05:6830:30a8:: with SMTP id
 g8mr10929780ots.370.1601906077165; 
 Mon, 05 Oct 2020 06:54:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x18sm1477902otq.61.2020.10.05.06.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:54:36 -0700 (PDT)
Received: (nullmailer pid 86477 invoked by uid 1000);
 Mon, 05 Oct 2020 13:54:35 -0000
Date: Mon, 5 Oct 2020 08:54:35 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20201005135435.GA86443@bogus>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Subject: Re: [Linux-stm32] [PATCH v6 2/7] dt-bindings: leds: Convert pwm to
	yaml
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

On Thu, 01 Oct 2020 01:46:32 +0200, Alexander Dahl wrote:
> The example was adapted in the following ways:
> 
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules
> 
> License was discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
>     v5 -> v6:
>       * removed pwm nodes from example (Rob)
>       * renamed led-controller node in example (Rob)
> 
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
> 
>     v3 -> v4:
>       * added Cc to original author of the binding
> 
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
> 
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
> 
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
