Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF83158F6
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 22:54:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A2A2C57B54;
	Tue,  9 Feb 2021 21:54:08 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62F16C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 21:54:05 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id l3so11158979oii.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 13:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bOiEgQJc9F4c/q7bHFCKm4lcHmd+4+4DEwd4LTgy3IY=;
 b=o7d93w7m2i4rHt4iHzQdLY5Pg4d3NQkaRwmFYCsuKj5SzGQN0gX4oJL1YSdRL9DYIs
 BaWZ4O5/n6MsbsAVq2IOOHgCwux31ofeyCho0SXABilXRBNycu3aLgCy6mGEE0+ZEZf3
 7ftV6PW9MnyXxgK596Xl93zWTx+tO6Qdy46pYSL4XXRXk7mRZcIbkFF9YLRl1RigSUfw
 A1+f/QBBQtHpM8R1HeCK+dyokb7Ylex0CQYFqRmhSl+BrqB8eB0RaeKikzq/sBIBMsPz
 Qy60nSY/hFGl0TdgzJsDDu+YwFPHEysJ/J2RTcsiw3tim5NzWgn31ZmAkoJDe35N6oJs
 9jBw==
X-Gm-Message-State: AOAM532CdkIgy0+9ZFsNXh9O7CgfQ+iF+0Ni9w3g/LPBsRBLqCof83Ze
 A2fqyrVv+n05PJYBZFwnVw==
X-Google-Smtp-Source: ABdhPJx4uyiqqNf8J2Db0GfnFr86BDYIdEH1ii5Rx3XOwGmxWp5YiGpid9GYa8CRIZoTR6fO/8pZuw==
X-Received: by 2002:a05:6808:a01:: with SMTP id
 n1mr3914674oij.19.1612907644210; 
 Tue, 09 Feb 2021 13:54:04 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a18sm4791oia.0.2021.02.09.13.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 13:54:02 -0800 (PST)
Received: (nullmailer pid 268551 invoked by uid 1000);
 Tue, 09 Feb 2021 21:54:00 -0000
Date: Tue, 9 Feb 2021 15:54:00 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20210209215400.GA268498@robh.at.kernel.org>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
 <20210208135609.7685-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208135609.7685-4-Sergey.Semin@baikalelectronics.ru>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, Joao Pinto <jpinto@synopsys.com>,
 netdev@vger.kernel.org, Lars Persson <larper@axis.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32] [PATCH v2 03/24] dt-bindings: net: dwmac: Fix the
 TSO property declaration
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

On Mon, 08 Feb 2021 16:55:47 +0300, Serge Semin wrote:
> Indeed the STMMAC driver doesn't take the vendor-specific compatible
> string into account to parse the "snps,tso" boolean property. It just
> makes sure the node is compatible with DW MAC 4.x, 5.x and DW xGMAC
> IP-cores. The original allwinner sunXi bindings file also didn't have the
> TSO-related property declared. Taking all of that into account fix the
> conditional statement so the TSO-property would be evaluated for the
> compatibles having the corresponding IP-core version.
> 
> While at it move the whole allOf-block from the tail of the binding file
> to the head of it, as it's normally done in the most of the DT schemas.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Note this won't break the bindings description, since the "snps,tso"
> property isn't parsed by the Allwinner SunX GMAC glue driver, but only
> by the generic platform DT-parser.
> 
> Changelog v2:
> - Use correct syntax of the JSON pointers, so the later would begin
>   with a '/' after the '#'.
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 52 +++++++++----------
>  1 file changed, 24 insertions(+), 28 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
