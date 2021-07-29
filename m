Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1893DADB2
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jul 2021 22:34:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DA78C597AF;
	Thu, 29 Jul 2021 20:34:58 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A8A7C57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 20:34:56 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id f11so8748184ioj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 13:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CqALBB8XhPNYm5eLzHeFRxLWidIlyWJVj8jddlP39GU=;
 b=TVWOxYJNKH+4EzbRYkTyWNN9yyLGU1+TKNEDY5Ot+yr5LYpco3YtSyiNSAPaIcfekw
 i9gTK8STIdC9CHxrRCGMxqWaIOXVgOEzLew57Z27WK9Jng+umuqz4PFW4RNiXzNgLB+s
 OZSe0luPC0mpDtr0pDrA2GHjeYz3ZA9/ltV8h6Az+PrVk24wreB3OxNg+LY4RPaRFnDB
 BG8swvS5k772/GuQQDSz+VaGGmo13rAKLYCrBsW7OslUdO30bVsxQ3EUlHd8jdAP0JSM
 1aWEil6V55sh9KSkBNU6l3bjF9tiCL5NcPYto+3ENm0fe4cKm00l5gCNjughcJw3aV6H
 QZcA==
X-Gm-Message-State: AOAM532w9ge99Jayw1irYfhH5a7Q9ufVw02bztaGM4iB2wVzxS2rXS8S
 CK8nyrQh1VGmL2YRoZ+OuA==
X-Google-Smtp-Source: ABdhPJxdly129GaGJvxacE8bh5T0mHrK/8Bw2MEIumv9TdtuedugLkq1vJTHXmibL/FhkpLtlTkrew==
X-Received: by 2002:a5d:8b03:: with SMTP id k3mr5389228ion.203.1627590895542; 
 Thu, 29 Jul 2021 13:34:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id j2sm2552163ilr.80.2021.07.29.13.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:34:53 -0700 (PDT)
Received: (nullmailer pid 840743 invoked by uid 1000);
 Thu, 29 Jul 2021 20:34:52 -0000
Date: Thu, 29 Jul 2021 14:34:52 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YQMQ7CWKB2vK7GwZ@robh.at.kernel.org>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <20210723132810.25728-7-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723132810.25728-7-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, linux-gpio@vger.kernel.org,
 robh+dt@kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olof Johansson <olof@lixom.net>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/7] dt-bindings: stm32: document
	stm32mp135f-dk board
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

On Fri, 23 Jul 2021 15:28:09 +0200, Alexandre Torgue wrote:
> Add new entry for stm32mp135f-dk board.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
