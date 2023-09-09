Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B839C79954C
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Sep 2023 03:10:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4885AC6B44F;
	Sat,  9 Sep 2023 01:10:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346E3C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Sep 2023 01:10:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0A4FB8206A;
 Sat,  9 Sep 2023 01:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE70CC433C7;
 Sat,  9 Sep 2023 01:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694221827;
 bh=kML9hZ7IDaG4XktJeZe7x8+x5w4mrLeBCCe8e1QV/lA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aEY6pwn2Yeo9yuQW7sBAUzeurEYWQEbrf1TSbgln+HHTWG2SjmzWtPJWHaHU99PfG
 1BLtxCba3iXLP+xbQMnKCeyxTW3DGV38psO0doZlALLot6WZQrHgVjPr0A/nX2aSar
 4rgXfcrn0IGyPPCM4E04o9hO62JO06oAISyEMBma7xcryXYfRcNsX+nmtQ26/Gw+fe
 AMmzV+Wh/Ld+j2+sJKSPVkaHZ26G1h+CSZgJI0tADDe+HUuxk9/LWAy6Kzw9zNjhKP
 NMvEbS3Qz1JqlBcTo9LtxPyeffaLqkoYq3X3XFif28aWLJXAxL1Pg8bPGDEyKJjBoJ
 s4JnLD6DaGwqg==
Date: Fri, 8 Sep 2023 18:10:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Message-ID: <20230908181025.5a38c4f5@kernel.org>
In-Reply-To: <20230907-stmmac-coaloff-v2-1-38ccfac548b9@axis.com>
References: <20230907-stmmac-coaloff-v2-1-38ccfac548b9@axis.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxim Mikityanskiy <maxtram95@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@axis.com,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: fix handling of zero
 coalescing tx-usecs
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

On Thu, 7 Sep 2023 12:46:31 +0200 Vincent Whitchurch wrote:
> Setting ethtool -C eth0 tx-usecs 0 is supposed to disable the use of the
> coalescing timer but currently it gets programmed with zero delay
> instead.
> 
> Disable the use of the coalescing timer if tx-usecs is zero by
> preventing it from being restarted.  Note that to keep things simple we
> don't start/stop the timer when the coalescing settings are changed, but
> just let that happen on the next transmit or timer expiry.
> 
> Fixes: 8fce33317023 ("net: stmmac: Rework coalesce timer and fix multi-queue races")
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Felix, good enough?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
