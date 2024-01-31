Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D38844D1E
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Feb 2024 00:41:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47CB4C6DD6D;
	Wed, 31 Jan 2024 23:41:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9DB1C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 23:41:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1E1A1CE232B;
 Wed, 31 Jan 2024 23:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97879C433C7;
 Wed, 31 Jan 2024 23:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706744514;
 bh=Cxry7gNqW2doRhJEQkZIqtEdzMs9aiFd0Dqs4XIolps=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k9c1ot3iIXBALfeUAu3wqIIJ7Ti8ktIInBfVbWNZhd1coiGlvHEg/G7EFO4mB2vR3
 tCnJ5dWRDePTI5zb3mVZzlXawgGgnmwTJuV2A04LjKjcictcYm5SXybHee+VtGT/lg
 dUax5FimBswXB5IlU2zZlSGiaznW3aCVYxH2mvEqd1CwTHIcVniV/3Cw0xGkP/3ZIH
 SgUm/bpRtF6R0dgePswepsAgLm9BLA+S5pu/r82Zqdbms5RmuJXRRMJ61TfPmXqxLW
 HgFNjRnXlbkc189WnNNSXT9HavAuiCpcrVvTMjBwdDyCqWDmQl7Qol3VyBhsBxcNyM
 7DWjvyFUBV+YA==
Date: Wed, 31 Jan 2024 15:41:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20240131154148.00d9d318@kernel.org>
In-Reply-To: <ual3c4fuuz5trgn2ekklsfeslwvswfjg5nij5epbnuf5mihfay@pp32fs6btwxk>
References: <20240129-remove-dwmac-qcom-ethqos-reviewer-v1-1-2645eab61451@redhat.com>
 <ZbkWwn-oN5wqoPfJ@matsya>
 <ual3c4fuuz5trgn2ekklsfeslwvswfjg5nij5epbnuf5mihfay@pp32fs6btwxk>
MIME-Version: 1.0
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: Drop unreachable reviewer
 for Qualcomm ETHQOS ethernet driver
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

On Tue, 30 Jan 2024 09:53:22 -0600 Andrew Halaney wrote:
> > Looks like Bhupesh sent the patch changing but never followed up with a
> > v2 for this:
> > lore.kernel.org/r/20230915191600.3410862-1-bhupesh.linux@gmail.com
> > 
> > Would prefer if this is changed to his email (copied him as well)
> >   
> 
> Thanks for finding that! Bhupesh, do you plan on spinning a v2 soon? If
> so I will not send a v2, otherwise I can respin this with your email and
> no .mailmap change.

The lack of response is not inspiring confidence. We can add Bhupesh
back if he wants to be active again..
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
