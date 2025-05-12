Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4725AB3075
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:24:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80B04C78F91;
	Mon, 12 May 2025 07:24:19 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 969B3C78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1747034657; x=1778570657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PeXyXIHP/RU8DBQh7ZsPnR78m2y+ncwDffB4JH/enLM=;
 b=Pjlyd0tlnm6JgdB2dRrxVoXafI0fLCjFToR3ggR3lnJpYLqraQOllxPA
 Se+m0H+nlA/gu6ErhYzcpd2BG0GXgZEMm13+WLU/BsT0RycArdFfB+cAb
 yBrl7daCh6k2d/hn2Dj8mIi7qQqqxzTRGWTRSuwASoJ+wxeIhvuXjy1VY
 Ih/ZUGekUdUZGyfnTsObxspIzntj5MgqNA7CxmhPO1oEpv3JyOQBgNxgr
 tO7dqZPEGhq60nPfRNTkI9V7xQ3OWdvdrp8uqDpkJzpNYBn979kr2KT/G
 oXvRgJychBtyovL8ygTBdM4VVNdNIc2AqVetGydBjoIhZ+Z4l3qjYEvU5 w==;
X-CSE-ConnectionGUID: 091CbATtSFuA8m3t6yrqew==
X-CSE-MsgGUID: /Wt3H8mkQnCi7uvGKztFrQ==
X-IronPort-AV: E=Sophos;i="6.15,281,1739862000"; d="scan'208";a="41986285"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 May 2025 00:24:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 12 May 2025 00:23:55 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 12 May 2025 00:23:54 -0700
Date: Mon, 12 May 2025 09:22:27 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20250512072227.wseiy7kfxyxbnj2l@DEN-DL-M31836.microchip.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
 <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
 <20250508142157.sk7u37baqsl7yb64@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250508142157.sk7u37baqsl7yb64@skbuf>
Cc: willemb@google.com, Jason Xing <kerneljasonxing@gmail.com>,
 irusskikh@marvell.com, netdev@vger.kernel.org, bharat@chelsio.com,
 linux-stm32@st-md-mailman.stormreply.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, edumazet@google.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 ayush.sawal@chelsio.com, kuba@kernel.org, horms@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, sgoutham@marvell.com, Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: lan966x: generate
 software timestamp just before the doorbell
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

The 05/08/2025 17:21, Vladimir Oltean wrote:
> 
> Horatiu,

Hi Vladimir,

> 
> On Thu, May 08, 2025 at 11:41:56AM +0200, Horatiu Vultur wrote:
> > > > > -       skb_tx_timestamp(skb);
> > > >
> > > > Changing this will break the PHY timestamping because the frame gets
> > > > modified in the next line, meaning that the classify function will
> > > > always return PTP_CLASS_NONE.
> > >
> > > Sorry that I'm not that familiar with the details. I will remove it
> > > from this series, but still trying to figure out what cases could be.
> > >
> > > Do you mean it can break when bpf prog is loaded because
> > > 'skb_push(skb, IFH_LEN_BYTES);' expands the skb->data area?
> >
> > Well, the bpf program will check if it is a PTP frame that needs to be
> > timestamp when it runs ptp_classify_raw, and as we push some data in
> > front of the frame, the bpf will run from that point meaning that it
> > would failed to detect the PTP frames.
> >
> > > May I ask
> > > how the modified data of skb breaks the PHY timestamping feature?
> >
> > If it fails to detect that it is a PTP frame, then the frame will not be
> > passed to the PHY using the callback txtstamp. So the PHY will timestamp the
> > frame but it doesn't have the frame to attach the timestamp.
> 
> While I was further discussing this in private with Jason, a thought
> popped up in my head.
> 
> Shouldn't skb_tx_timestamp(skb); be done _before_ this section?
> 
>         /* skb processing */
>         needed_headroom = max_t(int, IFH_LEN_BYTES - skb_headroom(skb), 0);
>         needed_tailroom = max_t(int, ETH_FCS_LEN - skb_tailroom(skb), 0);
>         if (needed_headroom || needed_tailroom || skb_header_cloned(skb)) {
>                 err = pskb_expand_head(skb, needed_headroom, needed_tailroom,
>                                        GFP_ATOMIC);
>                 if (unlikely(err)) {
>                         dev->stats.tx_dropped++;
>                         err = NETDEV_TX_OK;
>                         goto release;
>                 }
>         }
> 
> The idea is that skb_tx_timestamp() calls skb_clone_tx_timestamp(), and
> that should require skb_unshare() before you make any further
> modification like insert an IFH here, so that the IFH is not visible to
> clones (and thus to user space, on the socket error queue).
> 
> I think pskb_expand_head() serves the role of skb_unshare(), because I
> see skb_header_cloned() is one of the conditions on which it is called.
> 
> But the problem is that skb_header_cloned() may have been false, then
> skb_tx_timestamp() makes skb_header_cloned() true, but pskb_expand_head()
> has already run. So the IFH is shared with the clone made for TX
> timestamping purposes, I guess.
> 
> Am I completely off?

Sorry for late reply.
I think you are right!. I just want to double check by actually trying
it.

> 
> Also, I believe you can set dev->needed_headroom = IFH_LEN_BYTES,
> dev->needed_tailroom = ETH_FCS_LEN, and then just call
> skb_ensure_writable_head_tail().

Thanks for the advice. I will look also into this.

-- 
/Horatiu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
