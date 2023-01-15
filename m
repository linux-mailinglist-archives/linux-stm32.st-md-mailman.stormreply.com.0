Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986AF66B2A4
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Jan 2023 17:48:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 257E1C6410A;
	Sun, 15 Jan 2023 16:48:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D937C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Jan 2023 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=VDN4ZcMTm2XXAkD1jevXmk+JGFJznA8SYQizYocoJ/s=; b=k1ok4xo2PPrSDV/7QpXTR6DZia
 QKtxlY9//tK9r/oOITIKeymXmH+rZrKTFGZpfZ+fQxAcB9i52Eb3IzmZ4iUgcL1kE5dOpOwm2tl4f
 Lt+cO0pR8pxP0pRcI/zyPB4e9l/6xLLRBhWowufSOQyJgEJGAG1rUPrCP4kehve9Rxaw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pH6B0-0028s5-Av; Sun, 15 Jan 2023 17:48:10 +0100
Date: Sun, 15 Jan 2023 17:48:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kurt Kanzenbach <kurt@linutronix.de>
Message-ID: <Y8QuSiFkIyRv1Lqf@lunn.ch>
References: <20230114120437.383514-1-kurt@linutronix.de>
 <Y8LFyqcpi6RjcjMo@lunn.ch> <87fsccvy2o.fsf@kurt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fsccvy2o.fsf@kurt>
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Fix queue statistics
	reading
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

On Sun, Jan 15, 2023 at 12:25:51PM +0100, Kurt Kanzenbach wrote:
> Hi Andrew,
> 
> On Sat Jan 14 2023, Andrew Lunn wrote:
> > On Sat, Jan 14, 2023 at 01:04:37PM +0100, Kurt Kanzenbach wrote:
> >> Correct queue statistics reading. All queue statistics are stored as unsigned
> >> long values. The retrieval for ethtool fetches these values as u64. However, on
> >> some systems the size of the counters are 32 bit.
> >
> >> @@ -551,16 +551,16 @@ static void stmmac_get_per_qstats(struct stmmac_priv *priv, u64 *data)
> >>  		p = (char *)priv + offsetof(struct stmmac_priv,
> >>  					    xstats.txq_stats[q].tx_pkt_n);
> >>  		for (stat = 0; stat < STMMAC_TXQ_STATS; stat++) {
> >> -			*data++ = (*(u64 *)p);
> >> -			p += sizeof(u64 *);
> >> +			*data++ = (*(unsigned long *)p);
> >> +			p += sizeof(unsigned long);
> >
> > As you said in the comment, the register is 32 bits.
> 
> Maybe the commit message is a bit misleading. There are no registers
> involved here.

Ah!

In that case, yes, unsigned long. Maybe reword the commit message to
mention the values are being read from struct stmmac_txq_stats and
struct stmmac_rxq_stats which use unsigned long. That would avoid my
confusion of thinking it is being read from a register.

With that change made, you can add my Reviewed-by.

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
