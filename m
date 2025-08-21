Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C76BFB2FC24
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Aug 2025 16:17:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBC90C3F956;
	Thu, 21 Aug 2025 14:17:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88CD1C3F954
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 14:17:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 378B85C66A6;
 Thu, 21 Aug 2025 14:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186A6C4CEEB;
 Thu, 21 Aug 2025 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755785860;
 bh=gW7zqHt7cuAakYbLK9BQKAYcDbTeaMYBUi5199VFuWI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nT2dFNMTdJafnR8SCtfTZ4mri3Lbf6Uobpr9VzI6B7WWWTWueKS2GpZsfOM4W5Nul
 jI3GCEU11vPSdLCtvy/MjJMPT8dny8Rwe4zbyNeKnHr7WHKP5mK5SdOIcYajHvymgT
 tW3YMrkNocdSeWpD4xypEwihTB9ldMoEaAKjOtBBSXxoRYrr1lsfkzqut+JG3kNJ4D
 YLmM0mIA/lEam7fPLNtPjInCYoGmaIxE7K7Lgdf4UT4vwjb81vIbXKKc9u7722DLm5
 x80sH/px/HKkEYCDcx1FDetplKayERaM+BZoFgVpNE8rFtH8FqIst1UYrvSwV0d0Bo
 H/fk60AGBEorQ==
Date: Thu, 21 Aug 2025 07:17:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <20250821071739.2e05316a@kernel.org>
In-Reply-To: <feb15456-2a16-4323-9d69-16aa842603f2@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
 <20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
 <20250819182207.5d7b2faa@kernel.org>
 <22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
 <20250820085446.61c50069@kernel.org>
 <20250820085652.5e4aa8cf@kernel.org>
 <feb15456-2a16-4323-9d69-16aa842603f2@altera.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>,
 netdev@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Set CIC bit
 only for TX queues with COE
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

On Thu, 21 Aug 2025 19:20:02 +0530 G Thomas, Rohan wrote:
> > To be clear -- this is just for context. I don't understand the details
> > of what the CIC bit controls, so the final decision is up to you.  
> 
> Currently, in the stmmac driver, even though tmo_request_checksum is not
> implemented, checksum offloading is still effectively enabled for AF_XDP
> frames, as CIC bit for tx desc are set, which implies checksum
> calculation and insertion by hardware for IP packets. So, I'm thinking
> it is better to keep it as false only for queues that do not support
> COE.

Oh, so the device parses the packet and inserts the checksum whether
user asked for it or not? Damn, I guess it may indeed be too late
to fix, but that certainly _not_ how AF_XDP is supposed to work.
The frame should not be modified without user asking for it..
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
