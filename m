Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37753B31A7D
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 16:00:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB21EC3F95B;
	Fri, 22 Aug 2025 14:00:22 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B873C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 14:00:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E548AA57B27;
 Fri, 22 Aug 2025 14:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A0DC4CEED;
 Fri, 22 Aug 2025 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755871219;
 bh=NhcqNJcEWkTWGz8ovLpQi/hjQY3as5SmrOYUySgeg2E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pkOPw/WHe5B9a4j3FhXTTUyx/m4orDiZW+owegOeFJg3JhJTsM/i/35kfS2vO1ujh
 i6vIKqxsz4hm02PfMUhJK6hKGbg4TBRldoCfDxzZJjZSoP1pbeGshY+mwMbolz612G
 W3jH/tu707bGd5eT0GLly11JcMATjFRVYt7U2FT5MW21iGAIulz+piRLK10Hb6+Dje
 zma9YLw9ntGnz/zU6iWzEp3CVo1MvOttpOV4jDw0rlUzKeeWihIr2aG42kyBc8QEuG
 Bq73EDU+U0BxDy9V8+uW+4eboZ+DnYkj/XYoPQepHoH1NOXVpc2yjAKo2M1FhyWsjA
 4rA4pDSw/WfBg==
Date: Fri, 22 Aug 2025 07:00:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <20250822070018.35692c26@kernel.org>
In-Reply-To: <0f391b0a-6e9d-4581-9f3a-48e67ea90b31@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
 <20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
 <20250819182207.5d7b2faa@kernel.org>
 <22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
 <20250820085446.61c50069@kernel.org>
 <20250820085652.5e4aa8cf@kernel.org>
 <feb15456-2a16-4323-9d69-16aa842603f2@altera.com>
 <20250821071739.2e05316a@kernel.org>
 <0f391b0a-6e9d-4581-9f3a-48e67ea90b31@altera.com>
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

On Fri, 22 Aug 2025 18:19:01 +0530 G Thomas, Rohan wrote:
> On 8/21/2025 7:47 PM, Jakub Kicinski wrote:
> >> Currently, in the stmmac driver, even though tmo_request_checksum is not
> >> implemented, checksum offloading is still effectively enabled for AF_XDP
> >> frames, as CIC bit for tx desc are set, which implies checksum
> >> calculation and insertion by hardware for IP packets. So, I'm thinking
> >> it is better to keep it as false only for queues that do not support
> >> COE.  
> > Oh, so the device parses the packet and inserts the checksum whether
> > user asked for it or not? Damn, I guess it may indeed be too late
> > to fix, but that certainly_not_ how AF_XDP is supposed to work.
> > The frame should not be modified without user asking for it..  
> 
> Yes, I also agreed. But since not sure, currently any XDP applications
> are benefiting from hw checksum, I think it's more reasonable to keep
> csum flag as false only for queues that do not support COE, while
> maintaining current behavior for queues that do support it. Please let
> me know if you think otherwise.

Agreed.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
