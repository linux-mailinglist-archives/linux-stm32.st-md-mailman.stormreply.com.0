Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2A6C08866
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 04:02:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61E34C5F1F0;
	Sat, 25 Oct 2025 02:02:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3345C3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 02:02:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 13F69444AD;
 Sat, 25 Oct 2025 02:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4FCC4CEF1;
 Sat, 25 Oct 2025 02:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761357720;
 bh=znXa4MTmgD2GT+6EgOiEt1q1x1IwgN2PdMxLNSJjMV0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=npHZ+2QhpzQZMTObG8byre7FkwKihYjra6KYY/j9g3Ru8obLrxwg2qn8OuY80aWmD
 sHybgiMWxnOnhvgAOjsSC7C+ovz9IKKgoFDQYOFjseY39UonVqos0RztPHLP6AljYZ
 S2fyn+qE7NB4qYFK7T7FRyUT4ao1BdHWBL5RqslhI8cCkJUwvSvaWHIkxIvYwzG2Fh
 r4/1xEc0JUP2HXgf+2NODGI1Gkegf0MJhnqmeEcfziM31bV02vWrhNZS6cOBBM89qD
 ig4OCLCwRDiZw0KEqlT3sYY65gmIknzdMiDcFeOqbbk9FivzQMqHK4hqcYaMAfeVBO
 knmLlYvM2XpIA==
Date: Fri, 24 Oct 2025 19:01:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20251024190159.60f897e5@kernel.org>
In-Reply-To: <E1vBrtk-0000000BMYm-3CV5@rmk-PC.armlinux.org.uk>
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
 <E1vBrtk-0000000BMYm-3CV5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: add
	stmmac_mac_irq_modify()
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

On Thu, 23 Oct 2025 10:46:20 +0100 Russell King (Oracle) wrote:
> Add a function to allow interrupts to be enabled and disabled in a
> core independent manner.

Sorry for a general question but I'm curious why stick to the callback
format this driver insists on. Looks like we could get away with
parameterizing the code with the register offset via the priv structure.

Is it for consistency? Do you like this code structure? Is there more
logic coming for .irq_modify variants? Or am I missing something else?

Mostly curious. Personally, I'm always annoyed having to dig thru the
indirections in this driver.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
