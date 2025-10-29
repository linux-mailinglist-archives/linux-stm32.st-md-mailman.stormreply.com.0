Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58251C1D9E1
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 23:50:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E029DC62D5E;
	Wed, 29 Oct 2025 22:50:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C9D7C62D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 22:50:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 33FD160273;
 Wed, 29 Oct 2025 22:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6B3C4CEF7;
 Wed, 29 Oct 2025 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761778243;
 bh=mTQHrDxKx7IV8KOA3AyIUBpcpmWdEWskPrlRI2H7uIo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BWxyrc1rNIVq3ghKKjMEPb+CHpbOQR4VH/HpURcGL3WkMqxVbgR5EA97L8sMLsTIo
 fUcumSh7i0QaKI057eCuOl6khpjKC1dPpmPPaWiBvHP9fJFVl9TbFCcCsgJMYZ2jzb
 70Eo7KdNpH+h5MNmGi6RnzTy+U/khF4kKQGf6J/wU847J1HdF5vZBwioqyRRRJYfM5
 BfigAmwxQ4Y5Ox8N+vasb29xMlsf7fpNqgTNL5uTOBY4WUfY7x/IfsJPcXP8Kl0MHH
 75dDEw9a0k5u0lPqlFK/y9E1bU05HR1EHGI6iadBlyqv9vHI3U5DL9KiQ5I4fAOorB
 DsCiy3Qkc042Q==
Date: Wed, 29 Oct 2025 15:50:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20251029155042.208ecff4@kernel.org>
In-Reply-To: <71310577-7cea-42ce-8442-49e09e0b958a@bootlin.com>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
 <20251024070720.71174-3-maxime.chevallier@bootlin.com>
 <20251028151925.12784dca@kernel.org>
 <71310577-7cea-42ce-8442-49e09e0b958a@bootlin.com>
MIME-Version: 1.0
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: Add a
 devlink attribute to control timestamping mode
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

On Wed, 29 Oct 2025 07:59:10 +0100 Maxime Chevallier wrote:
> The patch was applied, should we revert or add another patch to rename
> that parameter ?

I think an incremental patch is best here. You're using the register
naming in the driver code so I suppose you won't even have to make many
changes there.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
