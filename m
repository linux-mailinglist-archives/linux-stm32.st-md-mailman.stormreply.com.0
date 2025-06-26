Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C6AEAAC3
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 01:41:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D1D1C36B2C;
	Thu, 26 Jun 2025 23:41:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECC6BC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 23:41:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C66D5C61BA;
 Thu, 26 Jun 2025 23:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4146C4CEEB;
 Thu, 26 Jun 2025 23:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750981280;
 bh=nufpK4Nake12iu3u9jfr0M9zStpbPBpxmbakfnPf704=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WJ/QpE2B/GzkordjchYV5m/4fLjACW4smPYxkk8ImwOTXwMWGGPxz6uEiv3PwbUZH
 V6GWQdR82jvw+2fXaBrODv6QK/cP/lMIAlUy9JXcZjzyhPGnmTMX7JBirCVLcKUflN
 eAy65iQfvYpkokLNo60qeAO3rBrRyvIwTgytXObbPOdp4xpPKNxFEYIMSo7TwxurzX
 BmRRkjlFrEJP52q/9YP+wqHGvDPwVXkrPuXIY1jAg1BYrTHelcaf/EvbgJl3WWzbSH
 7dCCdwMmerDHMV5pk3XxH6VZcv1URgGmeMOBE5T6hKw2MxUHTBuUx4rbpJkWqMWPmG
 V9gfwJKXzXpEA==
Date: Thu, 26 Jun 2025 18:41:19 -0500
From: Rob Herring <robh@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20250626234119.GA1398428-robh@kernel.org>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
 <20250623111913.1b387b90@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623111913.1b387b90@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Mun Yew Tham <mun.yew.tham@altera.com>, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, pabeni@redhat.com,
 Matthew Gerlach <matthew.gerlach@altera.com>, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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

On Mon, Jun 23, 2025 at 11:19:13AM -0700, Jakub Kicinski wrote:
> On Fri, 13 Jun 2025 15:58:44 -0700 Matthew Gerlach wrote:
> > Convert the bindings for socfpga-dwmac to yaml. Since the original
> > text contained descriptions for two separate nodes, two separate
> > yaml files were created.
> 
> Hi DT Maintainers! Thanks for reviewing the IPQ5018 bindings!
> In case my pings are helpful, this is the next oldest patch in netdev
> queue. The v4 seem to have gotten some feedback:
> https://lore.kernel.org/all/20250609163725.6075-1-matthew.gerlach@altera.com/

No need to ping us. Like netdev, you can check the PW queue:

https://patchwork.ozlabs.org/project/devicetree-bindings/list/

In any case, we're a bit behind ATM.


It looks like we have 2 competing conversions of this binding. This one 
and this one which I reviewed:

https://lore.kernel.org/all/20250624191549.474686-1-dinguyen@kernel.org/

Looks like there are some differences which need resolving, so I revoke 
my review. Will follow-up separately on both.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
