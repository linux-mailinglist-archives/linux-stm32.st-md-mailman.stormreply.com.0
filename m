Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0926C0CCF
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:11:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1525C6A5EF;
	Mon, 20 Mar 2023 09:11:50 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B46F6C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:11:49 +0000 (UTC)
Received: from maxwell ([109.42.113.5]) by mrelayeu.kundenserver.de (mreue010
 [213.165.67.97]) with ESMTPSA (Nemesis) id 1N1x6X-1qc2JF1po9-012FOD;
 Mon, 20 Mar 2023 10:11:36 +0100
References: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
 <20230316075940.695583-2-jh@henneberg-systemdesign.com>
 <20230317222117.3520d4cf@kernel.org>
 <87sfe2gwd2.fsf@henneberg-systemdesign.com>
 <20230318190125.175b0fea@kernel.org>
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Mon, 20 Mar 2023 10:04:54 +0100
In-reply-to: <20230318190125.175b0fea@kernel.org>
Message-ID: <87r0tj23eh.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tKJ0B9oTVyS1ml3UhWUrS3OK4UsHl+6Uz5UYfd2v2NzIMMMLzFx
 NWbpSN1jEiYRdXnOGkWutm9rF+J9kVeNJJDr2vGVteLJRBjBlamV5mRuVBUrzpucl+xflwf
 G1iD6q/Z3ypO2q7A6DXokVxlUsF4dQQBw/D6sytO7nVLdWBDzkd5NX2PtU2pGO+6DH31v/k
 A1VN0p6lnH3kCIWCO5LMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z2lW1P+dd9A=;WneYJpRDoZhZC3HUgHBM4TYZS1x
 BzlBOgkelPt88QxkeIfVk/AblHPQpJWDN3tew8b5a8OUzNBMtLoOowE0iNO7inhnHm4+nRRLA
 B67bjBUL0kGaQNtnMCPDpsybDor04Jl0bK4iyzeJ1DytfoAair9IGT4PhNt6AjwrfHZVStECO
 M+KF4bik1cs2OMyfMOIjoSbzI7jjAvm2BaJOs237zFWDUW+rPRV6PChRomo/XYnMC11+cLV10
 72byDSQe/gvVFPsvBqV6LAWpCDsRTUpsrsp8pQEHPkjL06Dz3MVf5x90EAhxUk9FJ+HvHHPar
 EI7wpHQ6YFG7BIYPzxZ0xqW6b/kOIGpyyHfFnQ0wxmpafRFcM5dhddXH9oil97GUvFd61r3AH
 RvGcUBBD/J+Vign4TZP8sjic9kvqToU1RuAYY3ETWnXXhDTsnjyl+FellF7U/XAVUQSI4pWF7
 CxL0iEFWkk7PtulnvmDgZCwHCbTS4ObGm+kdUqfVfsXHEXfdy1yOkQH7hP6l/9gs+ByIBqXPM
 dSD48hRFT5NNESvW3EN7PwLvEu8TZGXWYif9WPzFyW262AIseRGyOpWHDHA+VehzCoLUr8U3T
 EUTcXTgDGlWjT9Uqe/iDlb9D63jk7fOOuhDl+NqbeSVwOE3/0HTV1v9Lj8LlHRYdXJXnzccak
 wdYY0pPIxXgSjoNZAb0lTkXPQYYfBLN8fXKGCy1SMA==
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


Jakub Kicinski <kuba@kernel.org> writes:

> On Sat, 18 Mar 2023 09:38:12 +0100 Jochen Henneberg wrote:
>> > Are you sure? Can you provide more detailed analysis?
>> > Do you observe a problem / error in real life or is this theoretical?  
>> 
>> This is theoretical, I was hunting another bug and just stumbled over
>> the check which is, I think you agree, pointless right now. I did not
>> try to force execute that code path.
>
> If you have the HW it's definitely worth doing. There is a fault
> injection infra in Linus which allows to fail memory allocations.
> Or you can just make a little patch to the driver to fake failing
> every 1000th allocation.
>

I have the hardware available and will do the check.

>> > As far as I can tell only path which jumps to read_again after doing
>> > count++ is via the drain_data jump, but I can't tell how it's
>> > discarding subsequent segments in that case..
>> >  
>> >> -read_again:
>> >>  		buf1_len = 0;
>> >>  		buf2_len = 0;
>> >>  		entry = next_entry;  
>> 
>> Correct. The read_again is triggered in case that the segment is not the
>> last segment of the frame:
>> 
>> 		if (likely(status & rx_not_ls))
>> 			goto read_again;
>> 
>> So in case there is no skb (queue error) it will keep increasing count
>> until the last segment has been found with released device DMA
>> ownership. So skb will not change while the goto loop is running, the
>> only thing that will change is that subsequent segments release device
>> DMA ownership. The dirty buffers are then cleaned up from
>> stmmac_rx_refill().
>
> To be clear - I'm only looking at stmmac_rx(), that ZC one is even more
> confusing.
>
> Your patch makes sense, but I think it's not enough to make this code
> work in case of memory allocation failure. AFAIU the device supports
> scatter - i.e. receiving a single frame in multiple chunks. Each time
> thru the loop we process one (or two?) chunks. But the code uses 
> skb == NULL to decide whether it's the first chunk or not. So in case
> of memory allocation error it will treat the second chunk as the first
> (since skb will be NULL) and we'll get a malformed frame with missing
> chunks sent to the stack. The driver should discard the entire frame
> on failure..
>

Understood. However, this forces me to read the code and datahseet very
carefully to understand the details. I will do that, however, it will
take me some time.

For the ST and Synopsys people:
I could imagine that you would be able to fix this much faster than
I can, so if they want to work on this please let me know so I don't
waste my time on doing double work.

>> I think the driver code is really hard to read I have planned to cleanup
>> things later, however, this patch simply tries to prevent us from
>> returning a value greater than limit which could happen and would
>> definitely be wrong.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
