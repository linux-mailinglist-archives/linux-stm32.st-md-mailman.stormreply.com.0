Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC6B976DF1
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Sep 2024 17:39:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31C1CC78016;
	Thu, 12 Sep 2024 15:39:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BD24C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 15:39:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9D6C15C5B93;
 Thu, 12 Sep 2024 15:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D59C4CEC3;
 Thu, 12 Sep 2024 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726155558;
 bh=PsbP6YmUG40fnhWdGtrZKl7z1KBrwr8/1/qnLtehBvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tU6FOm+E2UPgzTBO+hPEN0MmR61pBecN9uxcn9dW2BCy7Ye5D2HVdvmet/hdO03gK
 xd3apWcCZNXHrlnMvA9vw0RMS5nZ7bPofqk20OFENcYhO4cQhssZD5WoyxvElnnFZp
 F8JpDjZ4LZXdDfqnqatLPmVr4bEpqLTYPO4bSvTiXjlgrapwyx4/Dlb/On7EU4d2VX
 Kmb8c/xhld7Iyjb0WEyWeHyKvYfIB5FmSet9B4aWu8vhOxa1qsz8gWe6FMqjt3ZeWU
 4EfkpgaTwtPFZVubrxoZco78iZ2M5rf6Eav7lob1/eMM6j3kVrUze46g0ilumRUbVD
 0NmIMieBI0qHg==
Date: Thu, 12 Sep 2024 16:39:13 +0100
From: Simon Horman <horms@kernel.org>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>
Message-ID: <20240912153913.GO572255@kernel.org>
References: <20240912015541.363600-1-khai.wen.tan@linux.intel.com>
 <20240912153730.GN572255@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240912153730.GN572255@kernel.org>
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Khai Wen <khai.wen.tan@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix zero-division
 error when disabling tc cbs
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

On Thu, Sep 12, 2024 at 04:37:30PM +0100, Simon Horman wrote:
> On Thu, Sep 12, 2024 at 09:55:41AM +0800, KhaiWenTan wrote:
> > The commit b8c43360f6e4 ("net: stmmac: No need to calculate speed divider
> > when offload is disabled") allows the "port_transmit_rate_kbps" to be
> > set to a value of 0, which is then passed to the "div_s64" function when
> > tc-cbs is disabled. This leads to a zero-division error.
> > 
> > When tc-cbs is disabled, the idleslope, sendslope, and credit values the
> > credit values are not required to be configured. Therefore, adding a return
> > statement after setting the txQ mode to DCB when tc-cbs is disabled would
> > prevent a zero-division error.
> > 
> > Fixes: b8c43360f6e4 ("net: stmmac: No need to calculate speed divider when offload is disabled")
> > Cc: <stable@vger.kernel.org>
> > Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> > Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> > Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>

...

One more thing, if you do post an updated patch, please
be sure to wait until 24h after the original patch was posted.

https://docs.kernel.org/process/maintainer-netdev.html
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
