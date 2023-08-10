Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDE7777A01
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 15:59:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D14CCC6B469;
	Thu, 10 Aug 2023 13:59:38 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2191C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=1QxiuF75076c1wIGtoY4akQwbj9n+G/4IMmmLPB7RYw=; b=zftM9yg48Q9Hr0YPn2yo7s+b+P
 IWG/mmvva5GCA6TWxUJgfH+uib5Sahc22PKz/XpAQs/0ngWzPAglzqk7brVqG+0JKi65Rx9IKva8r
 BP367v+ko072NisI/z+V0cbF93TWiFniUzSU4vaX0P8jRuJslB6pYudbvtXwC5NLsMRI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qU6CD-003hOE-A7; Thu, 10 Aug 2023 15:59:25 +0200
Date: Thu, 10 Aug 2023 15:59:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <9b9635bd-2635-4115-bafb-8a07573c6556@lunn.ch>
References: <20230810095929.246901-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810095929.246901-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: dwmac4: extract
 MAC_HW_Feature regs MSB first
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

On Thu, Aug 10, 2023 at 05:59:29PM +0800, Furong Xu wrote:
> The bit extraction sequences are a little messy.
> No code changes, just reorder them.

How is this substantially better?

If bugs are found in this code, your change is going to make it harder
to back port the fixes to stable kernels. cherry-pick is unlikely to
work, it will need a human to look at it. Not hard, but still effort
for somebody.

So i think there needs to be a clear benefit to this, and you should
mention the benefit in the commit message.

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
