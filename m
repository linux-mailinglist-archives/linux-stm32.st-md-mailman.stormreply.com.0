Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD3BF437A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 03:03:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB822C5A4F1;
	Tue, 21 Oct 2025 01:03:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9454EC57170
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 01:03:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7958960348;
 Tue, 21 Oct 2025 01:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB3CC4CEFB;
 Tue, 21 Oct 2025 01:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761008591;
 bh=kZUG3ekjbgqMUNy0q3i+gFuqeUpAWQ8+S6giYThScJw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KoQlZE7fEp/69DTCsk3mks1FSpdb5anEGzXte01mSzflvCuUOU+bVpIhvRGX6o/iL
 4OTw5EJxosg4VkG/ckez1u8WrVPGStAgTIg3CU/bsYmzpqADp/q65xcqUTMbuPCOuC
 f/v5G3D9e9nIn2aw1rkiN2dPrdx70JHXNdrW/MaZf/Y7wtsbSSoFZtRZCv4eD61DCJ
 /B2b5Amdzzv9vGJgByWu+vKjA9fRj9qnHcmFLjXfOAuHF3frPYU8t74Jog1iMuUtHv
 SXqDtdgvs+YLiHAgwRpcOvy5L8B9aqpp05DwKSzlNIel5baHxPmf9AHQu5lbXEbDJ9
 5Ey8byknV+a+w==
Date: Mon, 20 Oct 2025 18:03:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20251020180309.5e283d90@kernel.org>
In-Reply-To: <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
 <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
MIME-Version: 1.0
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow
 supporting coarse adjustment mode
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

On Sat, 18 Oct 2025 09:42:57 +0200 Maxime Chevallier wrote:
> > If the HW really needs it, just lob a devlink param at it?  
> 
> I'm totally OK with that. I'm not well versed into devlink, working mostly with
> embedded devices with simple-ish NICs, most of them don't use devlink. Let me
> give it a try then :)
> 
> Thanks for taking a look at this,

FWIW I dropped this form PW in an attempt to unblock testing of
Russell's series. I'm not convinced that the tsconfig API is correct
here but I don't get how the HW works. Could you perhaps put together
some pseudocode?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
