Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184A9B98D3
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 20:40:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DED8EC78013;
	Fri,  1 Nov 2024 19:40:07 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A22FC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 19:40:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 25F09A44BF7;
 Fri,  1 Nov 2024 19:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB8C4CECD;
 Fri,  1 Nov 2024 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730489999;
 bh=5+9HDlpS67+JWi5nzbq2AXQUu22Nar07vzHHwqy/OSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MnoVXOdrZPUOnM9cGquOLHBhymk3J6J9E8gDaTfNxb8EMhp3KqiAQBnzmd8ST8TaG
 Toe2zs350GKtznaD5wDnnP5vwr4DtYvhhJrRjeuj7Ut55Ja9mazExS+GEPqJYPObPJ
 oB9hMGv0KaZb7y+L+Fi93tNkIArjiw1nVPBXHnTXURh23XUORgJdWLxVIpzOxwLupR
 X4h9lNOljpW0wvnZmG+5XrJZ+LhGQqVXjgPECgcBmkLmP+/ghYX/yOle7RPvBPGb+a
 onT9WxXzi5bprjZ7clmNfkc2+8ftThDsPOujGbPR4DQ7bsIkKFoH9euTwfjx8XdKkN
 S/Ym04e01/mhw==
Date: Fri, 1 Nov 2024 14:39:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lothar Rubusch <l.rubusch@gmail.com>
Message-ID: <173048999498.4080241.4644127959389900220.robh@kernel.org>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
 <20241029202349.69442-13-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241029202349.69442-13-l.rubusch@gmail.com>
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 s.trumtrar@pengutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 12/23] dt-bindings: net: snps,
 dwmac: add support for Arria10
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


On Tue, 29 Oct 2024 20:23:38 +0000, Lothar Rubusch wrote:
> The hard processor system (HPS) on the Intel/Altera Arria10 provides
> three Ethernet Media Access Controller (EMAC) peripherals. Each EMAC
> can be used to transmit and receive data at 10/100/1000 Mbps over
> ethernet connections in compliance with the IEEE 802.3 specification.
> The EMACs on the Arria10 are instances of the Synopsis DesignWare
> Universal 10/100/1000 Ethernet MAC, version 3.72a.
> 
> Support the Synopsis DesignWare version 3.72a, which is used in Intel's
> Arria10 SoC, since it was missing.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
