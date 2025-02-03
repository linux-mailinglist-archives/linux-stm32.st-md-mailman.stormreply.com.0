Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB4A26687
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 23:23:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE22DC78034;
	Mon,  3 Feb 2025 22:23:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33E1FC7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 22:23:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE5D65C60F4;
 Mon,  3 Feb 2025 22:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C93C4CED2;
 Mon,  3 Feb 2025 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738621423;
 bh=QDO9GVeXAOaaRZkSWSLtvHPPP50q6hnF5jk/+ZuAFCo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=odAS0O7+0BpU5Lz+GlKYMGQ6c4ARoLckDjtLnhs8REL6A5uZgF1zTxV5NDNXJD8om
 M8fSprvOVg3y5Fr9qU/2ggqb/XMEPTVVcO5GS/cP5vbjoJ/FaBi1czc80yrdigPSaU
 sht0CkU3zWTLkYPlFF8eRXXnEGVC9YAFsqj3S+jtwd8OdbiQUJXAmK4YZ8og5R2SnJ
 ZrJ9dSpKHeNgb/Q59p2FDVNYhY3x9S6FOslm2m88S4Ob4Ah44GDMJFp/ZzloWLRqhc
 Fi1sDvBpk28JWpKvKy3s42spNVNCkwNjQJPf4TP1C2VfsZhqjXveKY1PLInfYyOKei
 f5XmO3mH2VpOg==
Date: Mon, 3 Feb 2025 14:23:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250203142342.145af901@kernel.org>
In-Reply-To: <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Petr Tesarik <petr@tesarici.cz>, linux-kernel@vger.kernel.org,
 Yanteng Si <si.yanteng@linux.dev>, linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Steven Price <steven.price@arm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Xi Ruoyao <xry111@xry111.site>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Allow zero for
	[tr]x_fifo_size
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

On Mon, 3 Feb 2025 11:16:34 +0000 Russell King (Oracle) wrote:
> > I've no opinion whether the original series "had value" - I'm just 
> > trying to fix the breakage that entailed. My first attempt at a patch 
> > was indeed a (partial) revert, but Andrew was keen to find a better 
> > solution[1].  
> 
> There are two ways to fix the breakage - either revert the original
> patches (which if they have little value now would be the sensible
> approach IMHO)

+1, I also vote revert FWIW
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
