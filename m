Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FD66C2005
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 19:36:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5F6CC6A603;
	Mon, 20 Mar 2023 18:36:47 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA3CEC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 18:36:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A334B8108F;
 Mon, 20 Mar 2023 18:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95840C433EF;
 Mon, 20 Mar 2023 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679337405;
 bh=Fgd797KbI1PdqMhgivAXqb+TVSCPpLGekpk5fhvJ4iw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AHqYzPWiw8XfNThoV8pZWy5B257SS/zOz3PWCdhCNnLOYro+JUcL70ZyYdlmETquW
 5i3YL9HAl0ENz6kJcLXRAkbu2zj1YIBbnZOKBrm9DayELc9ILXa7W/fqygsXsO0DII
 farvhzxHOJ2b38f72RBgztjq4+OEJKmCdddbPTcg3l+oDofPH54QZdMMEE7zRB64ko
 GDg0zxnBfmX6Jp+5GofcV842klfBBqbqubyE3q30D6K5tTHTEs+cXsVeMKUm95Xcpy
 757ApuM+H8bTVcj+Pv1Xg2gcxFDlxDUWqaIbFDTUq1uZ5ZbAs8lBQGRNm4sqJKX5rG
 dXORHp5MsPujw==
Date: Mon, 20 Mar 2023 11:36:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jochen Henneberg <jh@henneberg-systemdesign.com>
Message-ID: <20230320113643.53bbf52d@kernel.org>
In-Reply-To: <87r0tj23eh.fsf@henneberg-systemdesign.com>
References: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
 <20230316075940.695583-2-jh@henneberg-systemdesign.com>
 <20230317222117.3520d4cf@kernel.org>
 <87sfe2gwd2.fsf@henneberg-systemdesign.com>
 <20230318190125.175b0fea@kernel.org>
 <87r0tj23eh.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net V2 1/2] net: stmmac: Premature loop
 termination check was ignored on rx
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

On Mon, 20 Mar 2023 10:04:54 +0100 Jochen Henneberg wrote:
> For the ST and Synopsys people:
> I could imagine that you would be able to fix this much faster than
> I can, so if they want to work on this please let me know so I don't
> waste my time on doing double work.

Don't hold your breath, we haven't heard from any of the maintainers 
in 2 years :( 

The drivers for CoTS IPs are really not great in general, I'm guessing
delivering solid code is both difficult for them (given customer
parametrization of each instance) and hard to fit into their business
process :(

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
