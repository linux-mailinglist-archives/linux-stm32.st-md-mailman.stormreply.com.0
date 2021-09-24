Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4A416F7F
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Sep 2021 11:49:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E9BFC5A4F4;
	Fri, 24 Sep 2021 09:49:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB7E8C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 09:49:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F047461076;
 Fri, 24 Sep 2021 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632476984;
 bh=q3ICXikkwH5UtUHIuBaYtEaF6KNhkxjPlvfIZGiRwA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cgH+5Q7PyPTUuMVaLzy7qMzzJGLDRCEHN356hOwH/tQ1nlMVTG6fdN9KLCnWYx2Ks
 9wyvcf2JZFPvkPsAVYM9dW0fxcV1nLQdNsRpN9XCmEcCkX3cy8aYcVauvXkoPlSKTN
 CZ78TJw4um1DP+kM6L8mj9/fxQs/3TlRdiaWDchE=
Date: Fri, 24 Sep 2021 11:49:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Message-ID: <YU2fNiQh5or41pzT@kroah.com>
References: <20210924093719.16510-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924093719.16510-1-macpaul.lin@mediatek.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Fabien Parent <fparent@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Pablo Sun <pablo.sun@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bear Wang <bear.wang@mediatek.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] backport commit ("f421031e3ff0 net: stmmac: reset
 Tx desc base address before restarting") to linux-5.4-stable
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

On Fri, Sep 24, 2021 at 05:37:19PM +0800, Macpaul Lin wrote:
> Hi reviewers,
> 
> I suggest to backport 
> commit "f421031e3ff0 net: stmmac: reset Tx desc base address before
> restarting"
> to linux-5.4 stable tree.
> 
> This patch reports a register usage correction for an address
> inconsistency issue.
> "If this register is not changed when the ST bit is set to 0, then
> the DMA takes the descriptor address where it was stopped earlier."
> 
> commit: f421031e3ff0dd288a6e1bbde9aa41a25bb814e6
> subject: net: stmmac: reset Tx desc base address before restarting
> kernel version to apply to: Linux-5.4

Now queued up, thanks.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
