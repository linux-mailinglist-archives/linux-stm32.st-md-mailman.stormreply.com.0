Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 293473159FA
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Feb 2021 00:24:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2133C57B52;
	Tue,  9 Feb 2021 23:24:16 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9534EC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 23:24:14 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id h6so23088oie.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 15:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c0+mQvbUzr0QHjab9b+cDuiuwKG7CNWq4G/aggiV8ko=;
 b=ExdcmZwixEeWUFwA5PkTknuHNiQQ51fbR2VS/h1N1YRJPE9xDrqf7TzD4t855rtKQh
 caCRjuLfF6RHaYNpbkJVdCLO2vmlXbEAUGBYcloaXFA3kT5NTPn9xGQATR1OkluAZvyt
 +TvX6EEv/UAnROqane3BPGattzQCH/ha+aryHulu7ovJaH73XbnBX9rBDIIw7LRU5ZqI
 jgZs6213TcYkCQ8yxCfKQ8hkMN9arXs36Q8s1hN11vPC+UOaRbajQ5pFaiXy8KfnUQ+T
 vG0x6Da7TSwLFJ8Z3TAUOyeFkDEXv6VR8+eLwYtwEHjrkui+xmZgdEvoDX/71JWWI3OL
 KKjQ==
X-Gm-Message-State: AOAM532n9ZNYmJ4kCBPqzdVnyaUSxrvbuX5nrrAFEz3VORsg1/etcagq
 HFw7zVWX5qc9X9EyAhzz/Q==
X-Google-Smtp-Source: ABdhPJz6qtqiolUfmqOCucOTDw4UZsTDHjUdAxJoYxLAfMasBXNXmWyKEfqfN3viNqLICssfBelF6g==
X-Received: by 2002:aca:570d:: with SMTP id l13mr91914oib.159.1612913053378;
 Tue, 09 Feb 2021 15:24:13 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q3sm51946oih.35.2021.02.09.15.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 15:24:11 -0800 (PST)
Received: (nullmailer pid 428235 invoked by uid 1000);
 Tue, 09 Feb 2021 23:24:10 -0000
Date: Tue, 9 Feb 2021 17:24:10 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20210209232410.GA410815@robh.at.kernel.org>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140820.10410-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208140820.10410-3-Sergey.Semin@baikalelectronics.ru>
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
Subject: Re: [Linux-stm32] [PATCH 02/16] dt-bindings: net: Add Baikal-T1
	GMAC bindings
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

On Mon, Feb 08, 2021 at 05:08:06PM +0300, Serge Semin wrote:
> Baikal-T1 SoC is equipped with two DW GMAC v3.73a-based 1GBE ethernet
> interfaces synthesized with: RGMII PHY interface, AXI-DMA and APB3 CSR,
> 16KB Tx/Rx FIFOs and PBL up to half of that, PTP, PMT, TCP/IP CoE, up to 4
> outstanding AXI read/write requests, maximum AXI burst length of 16 beats,
> up to eight MAC address slots, one GPI and one GPO ports. Generic DW
> MAC/STMMAC driver will easily handle the DT-node describing the Baikal-T1
> GMAC network devices, but the bindings still needs to be created to have a
> better understanding of what the interface looks like.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Rob, please note I couldn't declare the axi-config object properties constraints
> without specifying the properties type and description. If I remove them the
> dt_binding_check will curse with the error:
> 
> >> .../baikal,bt1-gmac.yaml: properties:axi-config:properties:snps,blen: 'description' is a required property
> >> .../baikal,bt1-gmac.yaml: properties:axi-config:properties:snps,wr_osr_lmt: 'oneOf' conditional failed, one must be fixed:
>         'type' is a required property
>         Additional properties are not allowed ('maximum' was unexpected)
> >> ...
> 
> I did't know what to do with these errors, so I just created normal sub-node
> properties with stricter constraints than they are specified in the main
> snps,dwmac.yaml schema. Any suggestion what is a better way to apply
> additional constraints on sub-node properties?

Yes, that's known problem which I don't have a solution for. I think the 
solution is checking all properties have a type defined once and only 
once. That would also make sure we don't have 2 property names with 
different types. With that we can loosen the meta-schema checks. In the 
vast majority of cases though we need a type, so the exceptions like 
here will need to duplicate the type and description.


Reviewed-by: Rob Herring <robh@kernel.org>

> ---
>  .../bindings/net/baikal,bt1-gmac.yaml         | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/baikal,bt1-gmac.yaml
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
