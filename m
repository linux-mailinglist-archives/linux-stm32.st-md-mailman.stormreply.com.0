Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 834845F788
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 13:54:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5A60C0CE07
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 11:54:31 +0000 (UTC)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 043D1C0CDF2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 11:54:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 705D03083394;
 Thu,  4 Jul 2019 11:54:28 +0000 (UTC)
Received: from carbon (ovpn-200-17.brq.redhat.com [10.40.200.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99A408E61A;
 Thu,  4 Jul 2019 11:54:15 +0000 (UTC)
Date: Thu, 4 Jul 2019 13:54:14 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190704135414.0dd5df76@carbon>
In-Reply-To: <BN8PR12MB3266BC5322AADFAC49D9BAFAD3FA0@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704120018.4523a119@carbon>
 <BN8PR12MB3266BC5322AADFAC49D9BAFAD3FA0@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 04 Jul 2019 11:54:28 +0000 (UTC)
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, brouer@redhat.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

On Thu, 4 Jul 2019 10:13:37 +0000
Jose Abreu <Jose.Abreu@synopsys.com> wrote:

> From: Jesper Dangaard Brouer <brouer@redhat.com>
> 
> > The page_pool DMA mapping cannot be "kept" when page traveling into the
> > network stack attached to an SKB.  (Ilias and I have a long term plan[1]
> > to allow this, but you cannot do it ATM).  
> 
> The reason I recycle the page is this previous call to:
> 
> 	skb_copy_to_linear_data()
> 
> So, technically, I'm syncing to CPU the page(s) and then memcpy to a 
> previously allocated SKB ... So it's safe to just recycle the mapping I 
> think.

I didn't notice the skb_copy_to_linear_data(), will copy the entire
frame, thus leaving the page unused and avail for recycle.

Then it looks like you are doing the correct thing.  I will appreciate
if you could add a comment above the call like:

   /* Data payload copied into SKB, page ready for recycle */
   page_pool_recycle_direct(rx_q->page_pool, buf->page);


> Its kind of using bounce buffers and I do see performance gain in this 
> (I think the reason is because my setup uses swiotlb for DMA mapping).
> 
> Anyway, I'm open to some suggestions on how to improve this ...

I was surprised to see page_pool being used outside the surrounding XDP
APIs (included/net/xdp.h).  For you use-case, where you "just" use
page_pool as a driver-local fast recycle-allocator for RX-ring that
keeps pages DMA mapped, it does make a lot of sense.  It simplifies the
driver a fair amount:

  3 files changed, 63 insertions(+), 144 deletions(-)

Thanks for demonstrating a use-case for page_pool besides XDP, and for
simplifying a driver with this.


> > Also remember that the page_pool requires you driver to do the
> > DMA-sync operation.  I see a dma_sync_single_for_cpu(), but I
> > didn't see a dma_sync_single_for_device() (well, I noticed one
> > getting removed). (For some HW Ilias tells me that the
> > dma_sync_single_for_device can be elided, so maybe this can still
> > be correct for you).  
> 
> My HW just needs descriptors refilled which are in different coherent 
> region so I don't see any reason for dma_sync_single_for_device() ...

For you use-case, given you are copying out the data, and not writing
into it, then I don't think you need to do sync for device (before
giving the device the page again for another RX-ring cycle).

The way I understand the danger: if writing to the DMA memory region,
and not doing the DMA-sync for-device, then the HW/coherency-system can
write-back the memory later.  Which creates a race with the DMA-device,
if it is receiving a packet and is doing a write into same DMA memory
region.  Someone correct me if I misunderstood this...

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
