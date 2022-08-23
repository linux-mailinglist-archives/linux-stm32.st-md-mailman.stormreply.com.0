Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DBE59EFA0
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Aug 2022 01:23:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 055B0C640F1;
	Tue, 23 Aug 2022 23:23:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F391C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 23:23:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3ADD6170D;
 Tue, 23 Aug 2022 23:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C0BC433C1;
 Tue, 23 Aug 2022 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661296980;
 bh=LP1XVIKMUulWV8jrChoFwZ1vXqm8uX8Dgevyzd6rOFc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kGzaaW19VZlh30mmP/BwAYqxtpW5dWiaBc97gE3QuWZKFFDXrvK5PwtMFnArJ9bMH
 3IuzIs4ikuXjn+fY5oIodsdYdvOn7U9BCk+yZ4buKQzsVHEuJMN4yQezm1A9rag3KW
 Ioa7tu8B5+Z64j9AbMoS/a0xJfVJKA0LAUdjawEv7qJt8AtMvCwBAPq7MVlbyU9QRB
 oxuWwhEuFdgZhec3Vvgvb1DwnJ4gT+7j1l34QvE3V/FZSvN8dVJXCBMcRDEx+3qfPE
 7VVD3j/gG2MCnatgUeM5hWqBThxsIrdsF1lghqD8GuvwUfvI8GcEDHsRzqQZZ3XrGV
 NA12nwsTSphQA==
Date: Tue, 23 Aug 2022 16:22:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <20220823162259.36401af0@kernel.org>
In-Reply-To: <72755b6b-f071-1c54-c2fd-5ea0376effe1@gmail.com>
References: <72755b6b-f071-1c54-c2fd-5ea0376effe1@gmail.com>
MIME-Version: 1.0
Cc: Da Xue <da@lessconfused.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Qi Duan <qi.duan@amlogic.com>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: work around sporadic tx
 issue on link-up
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

On Sat, 20 Aug 2022 17:20:37 +0200 Heiner Kallweit wrote:
> This is a follow-up to the discussion in [0]. It seems to me that
> at least the IP version used on Amlogic SoC's sometimes has a problem
> if register MAC_CTRL_REG is written whilst the chip is still processing
> a previous write. But that's just a guess.
> Adding a delay between two writes to this register helps, but we can
> also simply omit the offending second write. This patch uses the second
> approach and is based on a suggestion from Qi Duan.
> Benefit of this approach is that we can save few register writes, also
> on not affected chip versions.
> 
> This patch doesn't apply cleanly before the commit marked as fixed.
> There's nothing wrong with this commit.

I don't think this is right, please do your best to identify where
the bug was actually introduced and put that in the Fixes tag.

IIRC this is not the first time you've made this choice so let's
sort this out, we can bring it up with Greg if you would like,
I don't see it clarified in the docs.

My understanding and experience doing backports for my employer is 
that cutting off the Fixes tag at the place patch application fails 
is very counter productive. Better to go too far back and let 
the person maintaining the tree decide if the backport is needed.

> [0] https://www.spinics.net/lists/netdev/msg831526.html
> 
> Fixes: 11059740e616 ("net: pcs: xpcs: convert to phylink_pcs_ops")
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
