Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D166BFEFA
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 03:01:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F1FAC69067;
	Sun, 19 Mar 2023 02:01:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7ADFC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 02:01:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E6326069A;
 Sun, 19 Mar 2023 02:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A7EC433EF;
 Sun, 19 Mar 2023 02:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679191287;
 bh=exiHemNUX9DPCs6M0yJUnMPMY+ihjoyNwkj4aowcREE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V3V75VHSr3huRv+39rmVI3WZuzwvaCUuBzSXXgKWrmSjYyuwRK5Ct9OlkOKcvrZlS
 DYhWeOlde75cWT2sSHd2w8Bwa7UIuWGuRVnUJUdqGZ09g3hvRRPSk2ZRLvKoZt6SQd
 nkgwSo2m37ihUl8ewujDoNxAEs9Z9/eGRncy3AzN6dApiS0jqx13x/UE79g1gjsLlg
 rN3MtvonOVlZE1YdVeIBS+FI6MU5lD6u2pNTNgbsFQscH2K7G1s9ThHRU+taNa3YVT
 3LHo1zmmL3MJm5eBjMHT9pPc5Ktv15Hk5/chexBjQOA8Ump1X1Hec9G0WtSZ/8J+vp
 Lfz2mHKDjNrZg==
Date: Sat, 18 Mar 2023 19:01:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jochen Henneberg <jh@henneberg-systemdesign.com>
Message-ID: <20230318190125.175b0fea@kernel.org>
In-Reply-To: <87sfe2gwd2.fsf@henneberg-systemdesign.com>
References: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
 <20230316075940.695583-2-jh@henneberg-systemdesign.com>
 <20230317222117.3520d4cf@kernel.org>
 <87sfe2gwd2.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Topics: 
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

On Sat, 18 Mar 2023 09:38:12 +0100 Jochen Henneberg wrote:
> > Are you sure? Can you provide more detailed analysis?
> > Do you observe a problem / error in real life or is this theoretical?  
> 
> This is theoretical, I was hunting another bug and just stumbled over
> the check which is, I think you agree, pointless right now. I did not
> try to force execute that code path.

If you have the HW it's definitely worth doing. There is a fault
injection infra in Linus which allows to fail memory allocations.
Or you can just make a little patch to the driver to fake failing
every 1000th allocation.

> > As far as I can tell only path which jumps to read_again after doing
> > count++ is via the drain_data jump, but I can't tell how it's
> > discarding subsequent segments in that case..
> >  
> >> -read_again:
> >>  		buf1_len = 0;
> >>  		buf2_len = 0;
> >>  		entry = next_entry;  
> 
> Correct. The read_again is triggered in case that the segment is not the
> last segment of the frame:
> 
> 		if (likely(status & rx_not_ls))
> 			goto read_again;
> 
> So in case there is no skb (queue error) it will keep increasing count
> until the last segment has been found with released device DMA
> ownership. So skb will not change while the goto loop is running, the
> only thing that will change is that subsequent segments release device
> DMA ownership. The dirty buffers are then cleaned up from
> stmmac_rx_refill().

To be clear - I'm only looking at stmmac_rx(), that ZC one is even more
confusing.

Your patch makes sense, but I think it's not enough to make this code
work in case of memory allocation failure. AFAIU the device supports
scatter - i.e. receiving a single frame in multiple chunks. Each time
thru the loop we process one (or two?) chunks. But the code uses 
skb == NULL to decide whether it's the first chunk or not. So in case
of memory allocation error it will treat the second chunk as the first
(since skb will be NULL) and we'll get a malformed frame with missing
chunks sent to the stack. The driver should discard the entire frame
on failure..

> I think the driver code is really hard to read I have planned to cleanup
> things later, however, this patch simply tries to prevent us from
> returning a value greater than limit which could happen and would
> definitely be wrong.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
