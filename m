Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F2A90EB2
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 00:38:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F142BC78F95;
	Wed, 16 Apr 2025 22:38:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C147C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 22:38:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E5D516156A;
 Wed, 16 Apr 2025 22:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B09C4CEE2;
 Wed, 16 Apr 2025 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744843080;
 bh=ZbunFVDc+z4ZNinhUozXF0DHGNkTGheh1l4/+ElGHqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E/X2YL400qWMrxAg+hIq73VEMNHFiId2k2Opfic6Sq38awI1C2UzakpJejoi72Ix6
 bLSj5m8BuF5SxVEnOcnB6EM1hmbL1KzxtBeLHUmEWg6kFnmaYj4L7ydrYFjlDwqJir
 /IgqZ9KKrjFfb1vrZ8Y4ohZOfi9c0qwfTGAy8cBVZF9o6HSLSYZkJ+xfi3b0cyW8Ou
 4Vwm2ZdCDo0FaBPpD917lz+B1Heb42XfFHn5C6cRh1QApEvajKczPAiK2VDTORg2Qq
 KSXXUZEucpeut6mJS3Hh47LpSOF0TZrd+x72bTh343o5ORvUZJ1saIzQTzpaFSk412
 LtJEDJgeWlsNA==
Date: Wed, 16 Apr 2025 15:37:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250416153758.3f0b7dfc@kernel.org>
In-Reply-To: <Z__w52jL05YbqSTW@shell.armlinux.org.uk>
References: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
 <E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
 <20250414174342.67fe4b1d@kernel.org>
 <Z_4s5DmCPKB8SUJv@shell.armlinux.org.uk>
 <Z__w52jL05YbqSTW@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: call
 phylink_start() and phylink_stop() in XDP functions
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

On Wed, 16 Apr 2025 19:03:19 +0100 Russell King (Oracle) wrote:
> "This change will have the side effect of printing link messages to
> the kernel log, even though the physical link hasn't changed state.
> This matches the carrier state."

So I did misunderstand. I thought we lose physical link. This paragraph
looks good, then, it'd correct my guess.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
