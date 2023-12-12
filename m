Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A5A80F5AB
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 19:48:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3496CC6C856;
	Tue, 12 Dec 2023 18:48:20 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43210C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 18:48:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A489CE1AEC;
 Tue, 12 Dec 2023 18:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3A6C433C8;
 Tue, 12 Dec 2023 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702406895;
 bh=UQ8sRE4qQ4n3OeWeQ/x2EijHj4zYvZuf5iO56KaYMYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=USdyD2jjP4yLtkFomWlwuqeB16OP1NFH0y8en3wYXly3blUxasIjop5aSKBQClcMy
 7TEHzV1KpNlBCEXV5OyJ2IeSSYgMtwZioUQczT+/Ki2WC+urZD4zn03bLxXaaLHTW9
 IZhZIqGFUsdvnAawqVuuVFK7wS71SnwP+LmNWYOxSid5xLQrEVK71TvyRgkhThsY28
 INaElF8vnTYJPDMifK73H9UtxGnB9YqgzHCT6rhmrhpsaZGwQSfe9/DseSbPPKoFJb
 jEHA/jemjJMx1/hTgoPRf4uUdN43QstmbUE6ks4X/o0MtQSJiTPU/HbzrWlwYgUgvn
 cyRaw9O+rUbxg==
Date: Tue, 12 Dec 2023 18:48:09 +0000
From: Simon Horman <horms@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20231212184809.GA5817@kernel.org>
References: <20231211-b4-stmmac-handle-mdio-enodev-v1-1-73c20c44f8d6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211-b4-stmmac-handle-mdio-enodev-v1-1-73c20c44f8d6@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Handle disabled MDIO
 busses from devicetree
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

On Mon, Dec 11, 2023 at 03:31:17PM -0600, Andrew Halaney wrote:
> Many hardware configurations have the MDIO bus disabled, and are instead
> using some other MDIO bus to talk to the MAC's phy.
> 
> of_mdiobus_register() returns -ENODEV in this case. Let's handle it
> gracefully instead of failing to probe the MAC.
> 
> Fixes: 47dd7a540b8a (net: add support for STMicroelectronics Ethernet controllers.")

nit: the tag above is malformed, there is a '"' missing before 'net:'.

  Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")


> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
