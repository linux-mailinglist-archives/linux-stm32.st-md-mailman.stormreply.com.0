Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BF66AC05
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jan 2023 16:10:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA877C65E55;
	Sat, 14 Jan 2023 15:10:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EF1BC65E45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jan 2023 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Pd8XWrHTZcbCfMNT/i6MsIqkST/pHeVYMBqNhxl9+HQ=; b=abfWvaRkyX29jyqlxgt7D5br+r
 K++KY3ANInELjwiXuYm1SpSgerBoWBhmktvnKTHiXftGi3RWuBtPp+TIBIzH5LJeBt2qTCXMWbPKR
 fqhYbHW9wJ9Dt7Ct0M+OOprtWX2kKbuvw8yVBsJV1IyGRdKi13dfb1tVndE7scukp+8w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pGiAU-0025FR-1m; Sat, 14 Jan 2023 16:10:02 +0100
Date: Sat, 14 Jan 2023 16:10:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kurt Kanzenbach <kurt@linutronix.de>
Message-ID: <Y8LFyqcpi6RjcjMo@lunn.ch>
References: <20230114120437.383514-1-kurt@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230114120437.383514-1-kurt@linutronix.de>
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

On Sat, Jan 14, 2023 at 01:04:37PM +0100, Kurt Kanzenbach wrote:
> Correct queue statistics reading. All queue statistics are stored as unsigned
> long values. The retrieval for ethtool fetches these values as u64. However, on
> some systems the size of the counters are 32 bit.

> @@ -551,16 +551,16 @@ static void stmmac_get_per_qstats(struct stmmac_priv *priv, u64 *data)
>  		p = (char *)priv + offsetof(struct stmmac_priv,
>  					    xstats.txq_stats[q].tx_pkt_n);
>  		for (stat = 0; stat < STMMAC_TXQ_STATS; stat++) {
> -			*data++ = (*(u64 *)p);
> -			p += sizeof(u64 *);
> +			*data++ = (*(unsigned long *)p);
> +			p += sizeof(unsigned long);

As you said in the comment, the register is 32 bits. So maybe u32
would be better than unsigned long? And it would also avoid issues if
this code is every used on a 64 bit machine.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
