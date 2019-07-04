Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE595F79E
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 14:04:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80A9DCBB4C1
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 12:04:47 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30161CBB4A9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 12:04:45 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w9so5143048wmd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2019 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=amr/MLN9cI5Ec8HWgSABL9rUXzQlcR+yO98qbl8sqQQ=;
 b=reCYBa/HDiyEd6CU/NQNeECZ0TGiSTj8f8SEw4WFvGQo59bH5871qj/oJ9PYzgM4GP
 zA95ZBUcbKacoYmCK12EVNylEKYfkwbrorMv9FA5F0SvbjQHxdo8QpW1OmqvBTDGYNak
 zkF4lXTMeJnHNJRfmUlhCwG7yFK7GzrKEx2gRXlMS6sgu712/cFTieIviLBBe/2wP+x6
 oBfEeXDD9MTQs5r9JnNseOOa9Q4u0PoebNFFoi4vfhDYpljevyDegYuh1dD1kWAYAmsL
 8tQjrV6Klmf/TwqngR513k5F/mMIIr1dUgGU4aw0KWGD5w7OQcLph+aEc3Tt0DgWYslh
 mZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=amr/MLN9cI5Ec8HWgSABL9rUXzQlcR+yO98qbl8sqQQ=;
 b=W3BMOCLHCT/bU4o25ffy/gK6GdgmIRrr7GAfYckbn/gBSNwEdj2w91Ey8iGCc5pYRS
 uGN56SOqpGt/hKJvZjPobE8n6pE1VQugzCMD9oJ0rrG+p8aOOee9XC58ooZpg1nzFfAt
 yfV+s3d9ScVs7sEQQka2nakS5Mcf/W3EJq4SGPKGVTv5vPYtJ2F55fh/Jqlg+y5imQt4
 6aeFbOLc1OAsTaJcJb5PsJSDCOx9d4+u8WZRfAM7Ur1qsdJ5IS7XhtfXbCdzJwLq9RMn
 MjjwgeeC+dAdsJqOp73SIsMVaPVWQnNECH7EYlvJOBNlOObEdi7GnNNUq+RjFWV5QWvX
 8gsg==
X-Gm-Message-State: APjAAAUtrYEOwqadfn0MmKSIFpkBd0TmXNaYY+TWayTNzH8FcN6R3Ve0
 NLEdE8qu+1yCj9rbYu9kfmSLIg==
X-Google-Smtp-Source: APXvYqyT6y+9T+/VeJfNymSjJVbJMJkxGcTutUA49l/YNxwHZmt9KNlRem6wZWge7DDaiLLPkOPVCA==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr12611948wmj.65.1562241885365; 
 Thu, 04 Jul 2019 05:04:45 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
 by smtp.gmail.com with ESMTPSA id z9sm7475960wrs.14.2019.07.04.05.04.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 05:04:44 -0700 (PDT)
Date: Thu, 4 Jul 2019 15:04:41 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <20190704120441.GA6866@apalos>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704120018.4523a119@carbon>
 <BN8PR12MB3266BC5322AADFAC49D9BAFAD3FA0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190704135414.0dd5df76@carbon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704135414.0dd5df76@carbon>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
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

Hi Jesper,

> On Thu, 4 Jul 2019 10:13:37 +0000
> Jose Abreu <Jose.Abreu@synopsys.com> wrote:
> > > The page_pool DMA mapping cannot be "kept" when page traveling into the
> > > network stack attached to an SKB.  (Ilias and I have a long term plan[1]
> > > to allow this, but you cannot do it ATM).  
> > 
> > The reason I recycle the page is this previous call to:
> > 
> > 	skb_copy_to_linear_data()
> > 
> > So, technically, I'm syncing to CPU the page(s) and then memcpy to a 
> > previously allocated SKB ... So it's safe to just recycle the mapping I 
> > think.
> 
> I didn't notice the skb_copy_to_linear_data(), will copy the entire
> frame, thus leaving the page unused and avail for recycle.

Yea this is essentially a 'copybreak' without the byte limitation that other
drivers usually impose (remember mvneta was doing this for all packets < 256b)

That's why i was concerned on what will happen on > 1000b frames and what the
memory pressure is going to be. 
The trade off here is copying vs mapping/unmapping.

> 
> Then it looks like you are doing the correct thing.  I will appreciate
> if you could add a comment above the call like:
> 
>    /* Data payload copied into SKB, page ready for recycle */
>    page_pool_recycle_direct(rx_q->page_pool, buf->page);
> 
> 
> > Its kind of using bounce buffers and I do see performance gain in this 
> > (I think the reason is because my setup uses swiotlb for DMA mapping).
> > 
> > Anyway, I'm open to some suggestions on how to improve this ...
> 
> I was surprised to see page_pool being used outside the surrounding XDP
> APIs (included/net/xdp.h).  For you use-case, where you "just" use
> page_pool as a driver-local fast recycle-allocator for RX-ring that
> keeps pages DMA mapped, it does make a lot of sense.  It simplifies the
> driver a fair amount:
> 
>   3 files changed, 63 insertions(+), 144 deletions(-)
> 
> Thanks for demonstrating a use-case for page_pool besides XDP, and for
> simplifying a driver with this.

Same here thanks Jose,

> 
> 
> > > Also remember that the page_pool requires you driver to do the
> > > DMA-sync operation.  I see a dma_sync_single_for_cpu(), but I
> > > didn't see a dma_sync_single_for_device() (well, I noticed one
> > > getting removed). (For some HW Ilias tells me that the
> > > dma_sync_single_for_device can be elided, so maybe this can still
> > > be correct for you).  
> > 
> > My HW just needs descriptors refilled which are in different coherent 
> > region so I don't see any reason for dma_sync_single_for_device() ...
> 
> For you use-case, given you are copying out the data, and not writing
> into it, then I don't think you need to do sync for device (before
> giving the device the page again for another RX-ring cycle).
> 
> The way I understand the danger: if writing to the DMA memory region,
> and not doing the DMA-sync for-device, then the HW/coherency-system can
> write-back the memory later.  Which creates a race with the DMA-device,
> if it is receiving a packet and is doing a write into same DMA memory
> region.  Someone correct me if I misunderstood this...

Similar understanding here

Cheers
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
