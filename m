Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1911C9A4AFD
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Oct 2024 04:45:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1ED9C78023;
	Sat, 19 Oct 2024 02:45:35 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E7C9C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Oct 2024 02:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=XutD5Y/NJfkj+RgP2XX0derSZSZl9zc6S02LBDEAnn8=; b=Yu0v8Mf1PxE54xxKFPwtLPn7+B
 3tFtnePq2yyVQP83rRydTBD84FsQfxAc9fZfXjykRLCn9LYibRpe9dhbwI8R8n1zPt8ck2vHjtwDK
 j93VnKrPePPECnKwSGhYa482znZgGYG+uUxpNA60Drhg49Ve+c47ygotF4EOptS3m83k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t1zSu-00AaGK-8u; Sat, 19 Oct 2024 04:45:16 +0200
Date: Sat, 19 Oct 2024 04:45:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Message-ID: <60119fa1-e7b1-4074-94ee-7e6100390444@lunn.ch>
References: <20241018222407.1139697-1-quic_abchauha@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241018222407.1139697-1-quic_abchauha@quicinc.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, kernel@quicinc.com,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Disable PCS Link and
 AN interrupt when PCS AN is disabled
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

On Fri, Oct 18, 2024 at 03:24:07PM -0700, Abhishek Chauhan wrote:
> Currently we disable PCS ANE when the link speed is 2.5Gbps.
> mac_link_up callback internally calls the fix_mac_speed which internally
> calls stmmac_pcs_ctrl_ane to disable the ANE for 2.5Gbps.
> 
> We observed that the CPU utilization is pretty high. That is because
> we saw that the PCS interrupt status line for Link and AN always remain
> asserted. Since we are disabling the PCS ANE for 2.5Gbps it makes sense
> to also disable the PCS link status and AN complete in the interrupt
> enable register.
> 
> Interrupt storm Issue:-
> [   25.465754][    C2] stmmac_pcs: Link Down
> [   25.469888][    C2] stmmac_pcs: Link Down
> [   25.474030][    C2] stmmac_pcs: Link Down
> [   25.478164][    C2] stmmac_pcs: Link Down
> [   25.482305][    C2] stmmac_pcs: Link Down

I don't know this code, so i cannot really comment if not enabling the
interrupt is the correct fix or not. But generally an interrupt storm
like this is cause because you are not acknowledging the interrupt
correctly to clear its status. So rather than not enabling it, maybe
you should check what is the correct way to clear the interrupt once
it happens?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
