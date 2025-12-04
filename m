Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00074CA3BB6
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Dec 2025 14:11:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F22DC58D77;
	Thu,  4 Dec 2025 13:11:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14A85C3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 13:11:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD883440A1;
 Thu,  4 Dec 2025 13:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793D7C4CEFB;
 Thu,  4 Dec 2025 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764853905;
 bh=+j/Dyt2kX1KcZTxk4BFPDXWyhzYkXuFwe5a7yW2SXhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EdbHbA+kiUZDRXwApyFbS8/kSEPio8MVHsoe7cCdxa4qu0+SShbA9HZKQRO5XVT5M
 5pI/eDL1skHttyIeVy3WtGPUeYg9ma4iCDaDGFbV/hHsELYZ6xKXAQTFN2x75BO3uw
 v5o9Z0DnZveASsbZZBDggo5nC2DeJR+QXmB3UuPGz9OH4u7iKiFvp4+xmQqBZJNihd
 XONQn+wZMmKFlPwFfZrQps4Bu1zFOsrtKKmLu2IyGDp57xbbiJrog6Io6NB4CBZdjk
 weHtGtAYyjKQ5pcvbggaYAAkFNWVi8mbhf0/eZRPzvILRbkw0hnmLfrklFx2Wgwhij
 krCwcXhQ2ut9A==
Date: Thu, 4 Dec 2025 13:11:40 +0000
From: Simon Horman <horms@kernel.org>
To: Jie Zhang <jzhang918@gmail.com>
Message-ID: <aTGIjNiHhWHd_RkN@horms.kernel.org>
References: <20251202025421.4560-1-jie.zhang@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251202025421.4560-1-jie.zhang@analog.com>
Cc: linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jie Zhang <jie.zhang@analog.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix oops when split header
	is enabled
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

On Mon, Dec 01, 2025 at 09:54:16PM -0500, Jie Zhang wrote:
> For GMAC4, when split header is enabled, in some rare cases, the
> hardware does not fill buf2 of the first descriptor with payload.
> Thus we cannot assume buf2 is always fully filled if it is not
> the last descriptor. Otherwise, the length of buf2 of the second
> descriptor will be calculated wrong and cause an oops:

...

As a bug fix this should have a Fixes tag here
(no blank line between it and your Signed-off-by line).
As a rule of thumb, it should cite the patch where
the bug was introduced.

Perhaps in this case the following is appropriate:

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")

> Signed-off-by: Jie Zhang <jie.zhang@analog.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
