Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD70A90A6D
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 19:48:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85279C78F87;
	Wed, 16 Apr 2025 17:48:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1DBFC78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 17:48:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 399EA5C3A54;
 Wed, 16 Apr 2025 17:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0408C4CEE2;
 Wed, 16 Apr 2025 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744825727;
 bh=v4XwhaUeZk3BYsAXaR29UkZdFjLWFGa044ZokdLWR8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdBVAovmhB1UljmHHNyLhF0hxqGhhRuRKXZwqcyO/adBY48zZBRbdDbJB9M7PJs+9
 0j2ko3cmHZdfFrkH5ZvxYdo9QFPEclZ3dj/jgrPIp3sr9duFHwG5JT2pijcIt27V07
 ZNX2u2l/RkL/hLsy/MtGuWmctwaG39Vfk7ejLVl+rzVAMCzANGUNVa9rlfzZYwIuNl
 AxFhvAvI0iDRRAQnzJZ3nFXpyy0F9M4Jmp8pKWFsEjPqMUDzjlZl99QnYpNx1IAIHf
 xvazOMDRyHkBglCDin7oFj4gJXMJRW+IYMi4GP7mzpkt1qGQpeus7aotP6Kaj8CDgY
 wlFKWO6r1sP8A==
Date: Wed, 16 Apr 2025 10:48:45 -0700
From: Kees Cook <kees@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <202504161047.79ED8EF5@keescook>
References: <20250416010210.work.904-kees@kernel.org>
 <20250416110351.1dbb7173@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250416110351.1dbb7173@kmaincent-XPS-13-7390>
Cc: imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>, Ziwei Xiao <ziweixiao@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Joshua Washington <joshwash@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Furong Xu <0x1207@gmail.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>,
 Petr Tesarik <petr@tesarici.cz>, Ido Schimmel <idosch@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Shailend Chand <shailend@google.com>,
 Wei Fang <wei.fang@nxp.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Jeroen de Borst <jeroendb@google.com>, linux-arm-kernel@lists.infradead.org,
 Petr Machata <petrm@nvidia.com>, Willem de Bruijn <willemb@google.com>,
 Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 Shannon Nelson <shannon.nelson@amd.com>
Subject: Re: [Linux-stm32] [PATCH] net: ethtool: Adjust exactly
 ETH_GSTRING_LEN-long stats to use memcpy
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

On Wed, Apr 16, 2025 at 11:03:51AM +0200, Kory Maincent wrote:
> On Tue, 15 Apr 2025 18:02:15 -0700
> Kees Cook <kees@kernel.org> wrote:
> 
> > Many drivers populate the stats buffer using C-String based APIs (e.g.
> > ethtool_sprintf() and ethtool_puts()), usually when building up the
> > list of stats individually (i.e. with a for() loop). This, however,
> > requires that the source strings be populated in such a way as to have
> > a terminating NUL byte in the source.
> > 
> > Other drivers populate the stats buffer directly using one big memcpy()
> > of an entire array of strings. No NUL termination is needed here, as the
> > bytes are being directly passed through. Yet others will build up the
> > stats buffer individually, but also use memcpy(). This, too, does not
> > need NUL termination of the source strings.
> > 
> > However, there are cases where the strings that populate the
> > source stats strings are exactly ETH_GSTRING_LEN long, and GCC
> > 15's -Wunterminated-string-initialization option complains that the
> > trailing NUL byte has been truncated. This situation is fine only if the
> > driver is using the memcpy() approach. If the C-String APIs are used,
> > the destination string name will have its final byte truncated by the
> > required trailing NUL byte applied by the C-string API.
> > 
> > For drivers that are already using memcpy() but have initializers that
> > truncate the NUL terminator, mark their source strings as __nonstring to
> > silence the GCC warnings.
> 
> Shouldn't we move on to ethtool_cpy in these drivers too to unify the code?

I decided that the code churn wasn't worth it. Perhaps in a follow-up
patch if folks want to see the removal of the explicit memcpy() uses?

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
