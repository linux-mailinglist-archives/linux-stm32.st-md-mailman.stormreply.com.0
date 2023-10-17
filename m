Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA2C7CC76B
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Oct 2023 17:26:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2885C6C837;
	Tue, 17 Oct 2023 15:26:22 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74CCFC6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 15:26:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C07B6B81E96;
 Tue, 17 Oct 2023 15:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914D1C433C8;
 Tue, 17 Oct 2023 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697556380;
 bh=6c9g+TsbNLPgQESWrmr2fOIsVB5tfJx/lE+QaNHkWkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E0fCTElf6Op4uqTcgXFqUTD1JmmUcWlep46ulGMHEZKW8ukh9HdjEbNOi7mVtOqBN
 Myx02rKPSHYd70LV6XfCSUDq9JSgUfOpbIEsaT9LU+dEorDfZWxW+hgIPJNP2h6XKG
 N+6r09diVSN+pEU8D2TzoA8rA4dRQg8hQwf8CrWk7lDS1fhHustRuKBt3WNzWDAq5t
 /P+lLp0b9R6EBDw5IGw8yFO8hE1HA9i3tkgjpyXDoqoUc4OIcect88iqY9yEDyzI+r
 CQOoHKA8kZnQ3VmPkU+46TbiJZjO7FCbijxsiheLX3BgHja8knyXh9GjMmYTclqJ9b
 fiMpPaDORRnhA==
Date: Tue, 17 Oct 2023 08:26:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <20231017082618.4558ad06@kernel.org>
In-Reply-To: <004d6ce9-7d15-4944-b31c-c9e628e7483a@pengutronix.de>
References: <20231010-stmmac_fix_auxiliary_event_capture-v1-0-3eeca9e844fa@pengutronix.de>
 <20231010-stmmac_fix_auxiliary_event_capture-v1-2-3eeca9e844fa@pengutronix.de>
 <20231014144428.GA1386676@kernel.org>
 <004d6ce9-7d15-4944-b31c-c9e628e7483a@pengutronix.de>
MIME-Version: 1.0
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: fix PPS capture
	input index
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

On Tue, 17 Oct 2023 11:12:53 +0200 Johannes Zink wrote:
> > If it is a bug fix then it should probably be targeted at 'net',
> > creating a dependency for the remainder of this series.
> > 
> > On the other hand, if it is not a bug fix then perhaps it is best to
> > update the subject and drop the Fixes tag.  
> 
> I added the fixes-Tag in order to make code archeology easier, but as it may 
> trigger picks to stable branches (which is not required imho), I have no 
> objections to dropping it for a v2.

Would be good to clarify what impact on device operation the problem
has. How would end user notice the problem?
Does it mean snapshots were always or never enabled, previously?

Note that if you submit this fix for net today it will still make it 
to -rc7 and net-next by tomorrow, so no major delay. We merge the trees
on Thursday, usually.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
