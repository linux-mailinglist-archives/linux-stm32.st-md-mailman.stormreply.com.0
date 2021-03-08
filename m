Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 735D93314B7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 18:25:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CC35C57195;
	Mon,  8 Mar 2021 17:25:23 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40B62C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Mar 2021 17:25:21 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id f10so9536045ilq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Mar 2021 09:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vIVJn0dfzyuEu1fc1pG9IIEiq5Z5cVODUyeYv5JKrec=;
 b=AywKj0aW9vmg3q94Q3x9usYk7KWwuXndHx0SStcokHzdhBgGZ05FeSw0X6a5CwHO9T
 bW413fAQNJhvlyEyKNroM+sbef2b0J27zJchmOxksJONI8Vv8bTJM0/ndiEjtC4Fu1hs
 DFCWIswjTX//FXhUK3vuWUtwGTqE7tH34uyFRwjcQ0Ihx+r1Tvj0s/yFfz/lDAS7WTTD
 gdpfm5KQuORJwaWsm8vCIcmSZG0prI5eKx2Q5+9HA4Q/cqPkvJ86m1SL8xezbsUsrKYC
 WIK2CMyk3eZsqJtVoHJvbESRFjxyo68m0cWlC0X/AmGGIQiC5hxsSQ+mLzRI0r5wdg4D
 ceRw==
X-Gm-Message-State: AOAM531zOYamcq+0VqoChZrWG1amuLRyJTtEQbnEwvCqexJtweHOKlgE
 HwCVkeQgzRBVrUcKAn4whw==
X-Google-Smtp-Source: ABdhPJx7pdAdChDvnGroL7a9Jyeo6qMHW8ZnqjNuqGEkpdo4TBM/DOewoxvAoegPEztBQOdvd9G93Q==
X-Received: by 2002:a92:c052:: with SMTP id o18mr21120330ilf.84.1615224320209; 
 Mon, 08 Mar 2021 09:25:20 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o23sm6488114ioo.24.2021.03.08.09.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:25:19 -0800 (PST)
Received: (nullmailer pid 2660270 invoked by uid 1000);
 Mon, 08 Mar 2021 17:25:17 -0000
Date: Mon, 8 Mar 2021 10:25:17 -0700
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20210308172517.GA2660220@robh.at.kernel.org>
References: <20210228154323.76911-1-jagan@amarulasolutions.com>
 <20210228154323.76911-10-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210228154323.76911-10-jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 09/10] dt-bindings: arm: stm32: Add
 Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
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

On Sun, 28 Feb 2021 21:13:22 +0530, Jagan Teki wrote:
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> EDIMM2.2 Starter Kit is an EDIMM 2.2 Form Factor Capacitive Evaluation
> Board from Engicam.
> 
> i.Core STM32MP1 needs to mount on top of this Evaluation board for
> creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
> 
> Add bindings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - none
> 
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
