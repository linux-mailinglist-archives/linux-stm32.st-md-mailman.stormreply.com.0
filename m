Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23ABA00C0
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 16:38:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4312EC3F94F;
	Thu, 25 Sep 2025 14:38:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83651C3F94D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 09:42:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 871DA60466;
 Thu, 25 Sep 2025 09:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFC1C4CEF0;
 Thu, 25 Sep 2025 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758793330;
 bh=F41QS3ZPsVh0OZ2B5xiSK7R/BbbchGf3UKyh+TVD1DA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=etu4+rfrzCqNV5ry38PWUR8lUBaF7Tkz89jm7s46OS1rLc5dCVMQuoJJty58GKXFG
 X0fE5tmYMcNnOpW1Dfidc7+UHW8hnRjzelLyYO379uEvMEXuXnZ7GqLxgzx63UJdME
 jNCIm0BcEt95rD7MNSPepRIypkQQzkc8TZ0wvRhzdgOHECkb/KztHZJ6DmWR7dNxjy
 BvY8zpyUihB5isMaTw6m93L6IZHarnEkiqmOSsu25gZM80MhI9fhgKSTJU2F78DvbF
 B6hf9hNNS2BRt/iD9Ymr0GCdvl+8mcohcL+1upVbQtQV9emsoX2IviYAE4Be6NT5Jc
 y4DBBcWd1Rxqg==
Date: Thu, 25 Sep 2025 10:42:05 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20250925094205.GC836419@horms.kernel.org>
References: <20250924152217.10749-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924152217.10749-1-0x1207@gmail.com>
X-Mailman-Approved-At: Thu, 25 Sep 2025 14:38:39 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Convert open-coded
 register polling to helper macro
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

On Wed, Sep 24, 2025 at 11:22:17PM +0800, Furong Xu wrote:
> Drop the open-coded register polling routines.
> Use readl_poll_timeout_atomic() in atomic state.
> 
> Compile tested only.
> No functional change intended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

I agree this is correct. Or at least, it looks correct to me.
But, FWIIW, I do have some hesitation about untested code of this nature
being accepted so close to the merge window.

Reviewed-by: Simon Horman <horms@kernel.org>

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
