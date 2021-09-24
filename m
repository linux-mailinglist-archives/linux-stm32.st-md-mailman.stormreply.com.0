Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC6A416EF3
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Sep 2021 11:29:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04A47C5A4F4;
	Fri, 24 Sep 2021 09:29:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B1ABC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 09:29:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A51961039;
 Fri, 24 Sep 2021 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632475784;
 bh=2oeuxZrFJB0Hk8Nems2Au4UGPvKYbwE2jCoLgMnV170=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dwg4PcKLO18rhE5rH3va7pTooZV7yJ1/yJq4hnzGROeGcBpJ4B+IrN9Pv31l+UKYX
 qvfp4YbbCZSWu+InhrhmUXxPOEi1amOuEeNG84phnjFD01oHAq1twZDFqB0sItrIIT
 K2i67BChS7gOPfTATaHeFkQ+sCVYyI5Crt7nVIB8=
Date: Fri, 24 Sep 2021 11:29:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Message-ID: <YU2ahYG+mbriOevz@kroah.com>
References: <20210924091020.32695-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924091020.32695-1-macpaul.lin@mediatek.com>
Cc: Miles Chen <miles.chen@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Fabien Parent <fparent@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Pablo Sun <pablo.sun@mediatek.com>,
 Petr Oros <poros@redhat.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bear Wang <bear.wang@mediatek.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] backport commit ("e96bd2d3b1f8 phy: avoid
 unnecessary link-up delay in polling mode") to linux-5.4-stable
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

On Fri, Sep 24, 2021 at 05:10:20PM +0800, Macpaul Lin wrote:
> Hi reviewers,
> 
> I suggest to backport 
> commit "e96bd2d3b1f8 phy: avoid unnecessary link-up delay in polling mode"
> to linux-5.4 stable tree.
> 
> This patch reports a solution to an incorrect phy link detection issue.
> "With this solution we don't miss a link-down event in polling mode and
> link-up is faster."
> 
> commit: e96bd2d3b1f83170d1d5c1a99e439b39a22a5b58
> subject: phy: avoid unnecessary link-up delay in polling mode
> kernel version to apply to: Linux-5.4

Now queued up, thanks.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
