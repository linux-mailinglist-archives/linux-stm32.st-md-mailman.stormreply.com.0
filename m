Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E98722EE3
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jun 2023 20:46:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 847E7C6A5E7;
	Mon,  5 Jun 2023 18:46:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61852C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 18:46:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 296AE62362;
 Mon,  5 Jun 2023 18:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5104C433D2;
 Mon,  5 Jun 2023 18:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685990788;
 bh=FoDr5w3gdB61Azw86AvGtNPjt2Cdolk3qbB4WzHGalQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IW4HdDjW3vMaXCOSzfFWuU8epkHVPb52t8aNv5uQxG3dvkS5PQX+TAuLnGRPwmCFU
 qM1W9CISuOsOtzF9hTslqlJfnQeXhZ29FZYrlZeJfRnpSPkTrVXfZ7HQtpV0bpVvZ6
 dUXlIbIxe3QV2zZfsKyDKVo4fqvGSuJSXl4KoUN17RM5yT2Q5dh9iHYxyeQ/888ZIR
 eBK43FU3J2A8ncRxsIvm1yy5CPq/oBbA4+zVpsGiOPEkElNvAj+KHIQJvSZAAqwEhJ
 W+ZDHymL3WiK/9b9yHP2PpybWhjS6jJLLR9PGlGVdJAHLJea6yrP+hakyTs9r0bse2
 eN6yqevoQYSXQ==
Date: Mon, 5 Jun 2023 11:46:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20230605114626.188c357f@kernel.org>
In-Reply-To: <20230605142039.3f8d1530@pc-7.home>
References: <20230601141454.67858-1-maxime.chevallier@bootlin.com>
 <168596102478.26938.1530517069555858195.git-patchwork-notify@kernel.org>
 <20230605142039.3f8d1530@pc-7.home>
MIME-Version: 1.0
Cc: andrew@lunn.ch, f.fainelli@gmail.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, ioana.ciornei@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, linux@armlinux.org.uk, edumazet@google.com,
 broonie@kernel.org, alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 vladimir.oltean@nxp.com, simon.horman@corigine.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/4] net: add a regmap-based
 mdio driver and drop TSE PCS
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

On Mon, 5 Jun 2023 14:20:39 +0200 Maxime Chevallier wrote:
> Thanks for applying the patch, however as mentionned (maybe not
> stressed enough in the cover) this series depends on a patch that went
> through the regmap tree :
> 
> 
>  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?id=e12ff28764937dd58c8613f16065da60da149048
> 
> How can we proceed on that matter ?

I don't see a great solution, Mark already applied the change and 
so did Dave. Don't think we can put them on stable branches now..

Only altera and stmmac-sogfpga are going to break?
Maybe we're close enough to the merge window to put our heads 
in the sand and wait?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
