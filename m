Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61824A97C53
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 03:48:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC54BC6B47E;
	Wed, 23 Apr 2025 01:48:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF09ECFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 01:48:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 74E67614BA;
 Wed, 23 Apr 2025 01:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6879DC4CEE9;
 Wed, 23 Apr 2025 01:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745372895;
 bh=b2Ty2Y4IHTlG+wCuGIQJJ+LjqBQxitk5tYKjHEox70M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gw2Xi4CODtGpUsSD2n7vzegKZNAZrX7v7cP5MoWILH/deNzm1Mc6zYYPZyjAgzEUP
 b5RHT7XkZw9rcxU1kAdZouBfsUPF/Ea6MAS1C68foXvQn9KlVl1IUKD/p+MG0GKTiM
 e7OhHfTpWbI2gj2556A0HiCdv0k1eWyDTlWcfRaeLCq1PCYJo5Qt8Npe4cXlvMXjQI
 VGQ2xKKQRHKx628jjrIuDHLjjb4OtLDEEonf3W43a6W0ZNI6itZhkhcbkxzEAMvFtR
 +xBrfrLCLoDih5+yyQ3T9OaZ0DOQcb76WYojV5Dr/7OoVmG/CXNhQCNblxrZvQCD9f
 syV4wS6dwAtzw==
Date: Tue, 22 Apr 2025 18:48:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <20250422184813.02b21095@kernel.org>
In-Reply-To: <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, "Russell
 King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v8 4/4] MAINTAINERS: Add entry
 for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
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

On Thu, 17 Apr 2025 09:40:15 +0100 Prabhakar wrote:
> +RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
> +M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported

I'm going to make this Maintained when applying, please see:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#supported-status-for-drivers

> +F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
