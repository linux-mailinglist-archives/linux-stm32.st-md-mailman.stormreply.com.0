Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF9B2D14E
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 03:20:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29F5DC36B29;
	Wed, 20 Aug 2025 01:20:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3B40C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 01:20:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B66C5C578C;
 Wed, 20 Aug 2025 01:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A1DC4CEF1;
 Wed, 20 Aug 2025 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755652833;
 bh=Mt3tseJjycqq+91W06SzoBlKRR5su31bUW3zAc7vzWY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HG2aM9mgicAGjOvLZDbZfHKUAi9cNYbGj4HLb/kIR4spjkfhmeEqbz8R5OZecCN40
 DQj+zgYEHuZMtlJo4dppMQgsQDopEZ0gZvoY5ha5HCZuezwR24gZVf9hWSV7FUWWW2
 oXRjm8WIx3SLQ6n1/lRMu3hM+V+yyqa4eVbyRxPzXL8gHbrotIfQT8pv6Je7oKSbmV
 JlUjPY8QvkAyYc4LPmKWtD2qNT1NmPUD17fiP5QMU1d+WBqZVFN5ApgHZ4Cyh482R+
 y6B5SE1c9S2tzDQvqgBkfMzi+WxdLA5vuf98vmQad0kbTz6MduOgEcuZCuGFwkrfkY
 5PeJ/4J1hM9Wg==
Date: Tue, 19 Aug 2025 18:20:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Message-ID: <20250819182031.58becfe7@kernel.org>
In-Reply-To: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, rohan.g.thomas@altera.com,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: xgmac: Minor
	fixes
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

On Sat, 16 Aug 2025 00:55:22 +0800 Rohan G Thomas via B4 Relay wrote:
> Subject: [PATCH net-next v2 0/3] net: stmmac: xgmac: Minor fixes

I left one nit, when you repost please use [PATCH net] rather than
net-next as these will go to the net tree, and 6.17-rc3. Rather
than net-next and therefore 6.18.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
