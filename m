Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E2B822B0
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 00:33:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99237C32EA8;
	Wed, 17 Sep 2025 22:33:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16371C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 22:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D641760008;
 Wed, 17 Sep 2025 22:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7A8C4CEE7;
 Wed, 17 Sep 2025 22:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758148426;
 bh=AeEOjTrTrYWvH72UFkbwWuavt/5qgvpD1SHmR09SsvU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gLbGShqM98jOqHm37oS4ubwyuBbGytiQBlkfN3FynWD6yumF43D+pnm2kKZ7pCclt
 L3+yryrCXLitIEL+LQQzQXcg0zncYegJFkrruDRnkAm56i6RUvUxq3OX2OdjMCQP1q
 /TIU3srcNNwYP0vjJL8m4KMlX2ZhavisMnYA0jfP/Gg8UxSO88nGulQ1K+f+2N0Ilf
 6rYYWhRTBPb5vaauZvJj4yyxrKUuzoYsdBIHlCbiPcCnebtEyLgELq2ZSQ7KxsO81j
 4Qlesy9hz/aaOiRKnTJqsm2ZCw/v1xB6klS1LNPXYQKW2rzoa1Zz2oby/gXP4ZSo2I
 JQBJizKO/7Ssg==
Date: Wed, 17 Sep 2025 15:33:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Message-ID: <20250917153345.27598d55@kernel.org>
In-Reply-To: <20250915-hlbs_2-v2-1-27266b2afdd9@altera.com>
References: <20250915-hlbs_2-v2-1-27266b2afdd9@altera.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 rohan.g.thomas@altera.com, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: est: Drop frames
 causing HLBS error
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

On Mon, 15 Sep 2025 16:22:14 +0800 Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Drop those frames causing HLBS error to avoid HLBS interrupt
> flooding and netdev watchdog timeouts due to blocked packets.
> Also add HLBS frame drops to taprio stats.

I think these should be two separate commits.

Also are the HLBS and DFBS acronyms obvious to everyone who works 
on TSN? 
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
