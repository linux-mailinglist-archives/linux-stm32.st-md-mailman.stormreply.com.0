Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B01933159E3
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Feb 2021 00:13:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CB16C57B52;
	Tue,  9 Feb 2021 23:13:58 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22B12C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 23:13:56 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id m7so21271353oiw.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 15:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iqog8CsMHZIPOPeN6dyy7RBD2+MWiYCuwU7gMHDgn+E=;
 b=DKtnynmIGBM5oZJ+VzpSNHmprS0ny+tNLtIL4EXWxeSz4mQ7/pQDNPyfnkYFC4pKxn
 h5NTHJVEXnaoV1Hs6eGthGQ4Zmdp2f4dRUfeD1z90e3t2OOzno8QnV12BCu+nGSmbrgr
 KVosEH5mlwcwtZ1brhvfV7cAmtluRnCv73Q+JtHAZ+dUW7XqV5cHa90Q6/U3M3rSZJiR
 gqfWjphxEIP3klVr/6h2UX2wWPn0e0NEFR674zB3AUTFEBjDz1oTVq96o4YQ0gRi0gqg
 Y1gpddIkKACAR/1ohxjxdSMHxltnj6n/Qu8qP7zfA6kmvGgnBHWX8M/SOQFeu0oUWp0Q
 FrSA==
X-Gm-Message-State: AOAM530/JK54BjYmQSB8lRYU60mKz/V4e2b6xWAzxyEfuEYIR4TSv4MO
 dTZK1Aj0wIaymCl8w65PmA==
X-Google-Smtp-Source: ABdhPJzM6bjqNck+607mXDy9PNLPvWoFJltI+hjArBy4hP5rzbxs58R6CIAoKNThG27jqmChAp+4ng==
X-Received: by 2002:aca:4b43:: with SMTP id y64mr86780oia.156.1612912434949;
 Tue, 09 Feb 2021 15:13:54 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i16sm7022oto.45.2021.02.09.15.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 15:13:53 -0800 (PST)
Received: (nullmailer pid 410105 invoked by uid 1000);
 Tue, 09 Feb 2021 23:13:52 -0000
Date: Tue, 9 Feb 2021 17:13:52 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20210209231352.GA402351@robh.at.kernel.org>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140820.10410-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208140820.10410-2-Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/16] dt-bindings: net: dwmac: Add DW
 GMAC GPIOs properties
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

On Mon, Feb 08, 2021 at 05:08:05PM +0300, Serge Semin wrote:
> Synopsys DesignWare Ethernet controllers can be synthesized with
> General-Purpose IOs support. GPIOs can work either as inputs or as outputs
> thus belong to the gpi_i and gpo_o ports respectively. The ports width
> (number of possible inputs/outputs) and the configuration registers layout
> depend on the IP-core version. For instance, DW GMAC can have from 0 to 4
> GPIs and from 0 to 4 GPOs, while DW xGMAC have a wider ports width up to
> 16 pins of each one.
> 
> So the DW MAC DT-node can be equipped with "ngpios" property, which can't
> have a value greater than 32, standard GPIO-related properties like
> "gpio-controller" and "#gpio-cells", and, if GPIs are supposed to be
> detected, IRQ-controller related properties.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index bdc437b14878..fcca23d3727e 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -110,6 +110,23 @@ properties:
>    reset-names:
>      const: stmmaceth
>  
> +  ngpios:
> +    description:
> +      Total number of GPIOs the MAC supports. The property shall include both
> +      the GPI and GPO ports width.
> +    minimum: 1
> +    maximum: 32

Does the driver actually need this? I'd omit it if just to validate 
consumers are in range.

Are GPI and GPO counts independent? If so, this isn't really sufficient.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
