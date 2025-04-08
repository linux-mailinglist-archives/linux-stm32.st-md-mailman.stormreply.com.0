Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 641ADA81606
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 21:50:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12B33C78F95;
	Tue,  8 Apr 2025 19:50:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EBE1C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 19:50:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0AD2F68442;
 Tue,  8 Apr 2025 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B76C4CEE5;
 Tue,  8 Apr 2025 19:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744141853;
 bh=Cl6FMiR8V/WqCdufAIYky9qQP+eWaJzEf8Abe6gD4do=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oAXWz1SxIH94bJE5hQcX3QcDb7RE41fDs5qfkhPHCjriewW32cSx64hKSoTVD8C4T
 PdmYuHtgTBh+pkh4EVaKfcTEWqUjo5R+obn7NdcvUb/In/eDBrpoABs74s+PAye+U/
 5Bl4BbX+sOsbhrWiNYcLFrJn/PZtfWQTdbRTLmmiqUxP1VPgIODC5VzzYXJ1hpmQPD
 zZhlMmyrksSzjYFLRsqxrrLp18hbU4NCxk4tfLM9FfhNvrjFBABL7mqZDyHgTHgtLa
 cUGwwHjEcHpOnYA07e7fvmTW1YuHJnxFuv9OVG6QbwVUcTwbJbeYuWqJp91+UD/2JY
 2Tbt2M9uNgP7w==
Date: Tue, 8 Apr 2025 12:50:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250408125052.50615419@kernel.org>
In-Reply-To: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32]
 =?utf-8?q?=5BPATCH_net-next_0/5=5D_net=3A_stmmac=3A?=
 =?utf-8?q?_remove_unnecessary_initialisation_of_1=C2=B5s_TIC_counter?=
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

On Mon, 7 Apr 2025 19:58:01 +0100 Russell King (Oracle) wrote:
> In commit 8efbdbfa9938 ("net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER
> register"), code to initialise the LPI 1us counter in dwmac4's
> initialisation was added, making the initialisation in glue drivers
> unnecessary. This series cleans up the now redundant initialisation.

Failed to apply patch:
Applying: net: stmmac: dwc-qos: remove tegra_eqos_init()
error: sha1 information is lacking or useless (drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
Patch failed at 0001 net: stmmac: dwc-qos: remove tegra_eqos_init()
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
