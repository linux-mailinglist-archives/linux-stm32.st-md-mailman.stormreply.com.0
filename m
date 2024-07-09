Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C7892BAF1
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 15:24:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 900EBC6DD66;
	Tue,  9 Jul 2024 13:24:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 306F9C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=6jUkBzHiAT9bXjlf+KGNc02ub5p+yihLBXghD8K9+AE=; b=UspMwV8EMl3KqdG2EQFU4nQHhp
 IOFAFcNa5ZWeGp425gwuzFEh+6em5oN7J48sv/ATxr6R0WdAOTIuyEmLowN7CEhiAV8gYGqApmBTh
 DrsTToyWFqZFo2nBMN4pRNtfTyAgLEhdSxOYbSnfbQo8b/mqLHiwJSKcC11jJLDccRKs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sRApQ-0028zp-Ek; Tue, 09 Jul 2024 15:24:20 +0200
Date: Tue, 9 Jul 2024 15:24:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <bb6398ca-9e03-486f-bcec-5b7a07367261@lunn.ch>
References: <cover.1720512888.git.0x1207@gmail.com>
 <98183e72d59cc8ce71dd9fd25a65983ff69dfcd1.1720512888.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98183e72d59cc8ce71dd9fd25a65983ff69dfcd1.1720512888.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 2/7] net: stmmac: gmac4: drop
 FPE implementation for refactoring
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

On Tue, Jul 09, 2024 at 04:21:20PM +0800, Furong Xu wrote:
> The FPE support for gmac4 is complete, still drop it temporarily.
> Once FPE implementation is refactored, gmac4 support will be added.

So you say this implementation does work. So sorry, no.

NACK.

What we want is lots of small patches which are obviously correct. If
this code is correct, you could simply move it to a shared
location. Code which disappears from one file and reappears in another
file, no other changes, is obviously correct. You can make this clear
in the commit message: Moving code into a shared location. No
functional changes intended.

Once moved, you can then do refactoring changes, which when combined
with a good commit message should be obviously correct.

In linux, you do not throw code away and replace it with a new
implementation. You step by step transform it.

	Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
