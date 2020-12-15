Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BAA2DB23C
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 18:14:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A183C3FAD4;
	Tue, 15 Dec 2020 17:14:21 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3196C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 17:14:18 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w124so21001149oia.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 09:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Qu4+kvBzm3PqXb1At7zY+1pW2euTQkxhk/cm9SbdHY=;
 b=jXGv2HEHFB8+G5qVeWVOFoBhpoAKr7DNDolsQ9miWWz7TPvamlVVgMexRhtvYv52hp
 TXG64ZQcqnlA8JbPdwAJ9jWcSIEpZxwdNM/TjF3nhL821T/EikcBd7/K0cya73++ckk9
 HO8VLTNWvVyLZVpiPKAiJOYQ9IwfscR5Y0lB4ik3I325mGhhqnevEaWHuB+yIoYsH4qs
 OJGTnqpKu8102Ur9TP1R/5n4AeO+a368l0lrw5cP51U7QEbV/iAEn+z3deuhrgx4T0/P
 +ILGxQqqsyZVIrG3vIXP1rekbgMytLhJDagsTwbDT1DV2hbUPjc9dse05SFEMHOFAMJk
 rHLw==
X-Gm-Message-State: AOAM531JRIgv0VHnYyrk/QoSRJcMCwZ+eLE6wE3Z/KCoG8T/S9lX8KWD
 2nAz/qbGGQ1cPxFJDQrIzA==
X-Google-Smtp-Source: ABdhPJzVpgelZd7N6boJkoJWy3kD5FQdlN3JtoRPvXPhm8+og2A32ilo2++TNDM964Exsl6NSovr0A==
X-Received: by 2002:aca:bc84:: with SMTP id
 m126mr22208391oif.169.1608052457156; 
 Tue, 15 Dec 2020 09:14:17 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l6sm548795otf.34.2020.12.15.09.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:14:16 -0800 (PST)
Received: (nullmailer pid 4046464 invoked by uid 1000);
 Tue, 15 Dec 2020 17:14:15 -0000
Date: Tue, 15 Dec 2020 11:14:15 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201215171415.GA4046412@robh.at.kernel.org>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214091616.13545-2-Sergey.Semin@baikalelectronics.ru>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, Joao Pinto <jpinto@synopsys.com>,
 netdev@vger.kernel.org, Lars Persson <larper@axis.com>,
 Johan Hovold <johan@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/25] dt-bindings: net: dwmac: Validate
 PBL for all IP-cores
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

On Mon, 14 Dec 2020 12:15:51 +0300, Serge Semin wrote:
> Indeed the maximum DMA burst length can be programmed not only for DW
> xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1]
> for Generic DW *MAC IP-cores. Moreover the STMMAC set of drivers parse
> the property and then apply the configuration for all supported DW MAC
> devices. All of that makes the property being available for all IP-cores
> the bindings supports. Let's make sure the PBL-related properties are
> validated for all of them by the common DW MAC DT schema.
> 
> [1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
>     October 2013, p. 380.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 69 +++++++------------
>  1 file changed, 26 insertions(+), 43 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
