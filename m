Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C706194D81D
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 22:29:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72C70C78021;
	Fri,  9 Aug 2024 20:29:16 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFBD2C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=isLbLvrwXTiBIaXavkcKvINqHF3YJCSZSXuu1C1UwDM=; b=yiD3owdv4/je/By6Ovp+AfbJa3
 tiNOosS+uRqMilg5a1oJjpDHtaAbAGe08MK5zFHvqRbDJHTPD+sz8uqoXDQ6hA7RO3F3XytTeWsM/
 zaWIvS+H/+1KiQcFL0wgSeN3WbUjpSyduQjvVSUC6yLcdrVGzPuP0l//IdU/8f1G3rjU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1scWEM-004PfJ-MO; Fri, 09 Aug 2024 22:28:58 +0200
Date: Fri, 9 Aug 2024 22:28:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: ende.tan@starfivetech.com
Message-ID: <6ad2c74c-b187-4ac7-9303-c661e02b9b1a@lunn.ch>
References: <20240809153138.1865681-1-ende.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809153138.1865681-1-ende.tan@starfivetech.com>
Cc: minda.chen@starfivetech.com, leyfoon.tan@starfivetech.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
 1/1] net: stmmac: Set OWN bit last in dwmac4_set_rx_owner()
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

On Fri, Aug 09, 2024 at 11:31:38PM +0800, ende.tan@starfivetech.com wrote:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Ensure that all other bits in the RDES3 descriptor are configured before
> transferring ownership of the descriptor to DMA via the OWN bit.

Please leave at least 24 hours between versions. If you notice
something wrong with your own patch, please reply to it and point out
the problem. And then wait the needed 24 hours before posting a new
version.

Also, this should be v2, and you should include under the --- how this
version is different to v1.

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
