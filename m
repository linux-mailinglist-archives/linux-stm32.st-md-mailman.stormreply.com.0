Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA513500899
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 10:43:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52F33C628AB;
	Thu, 14 Apr 2022 08:43:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE554C6049B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 08:43:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A3AE6206E;
 Thu, 14 Apr 2022 08:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3406C385A5;
 Thu, 14 Apr 2022 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649925791;
 bh=iHZqK4K6Vu+KtomeHU+dePQzrkU7Y2MgGUiDicf1Wms=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YfpsG3DHQxvqsl7laZpVeqMWas0uw1WWEfQ7MdGYXDkI0ZdQnz/wgk09mSVBb2cp+
 uGskG3PDsJrK3Z8JEcgBj4VxDusYggKK5JoLf8MzikpDfm7rLDUcQv5qWLWuQXJAz7
 AETSy1Xar9DIGuU+nARBCnLJkDXTKWFu+1dY/4Jp2bsY+luai/i7tHt4D547WhPFi/
 WjbNX37dYJtr5eh7qViBy/zt2jXJziDaxiq0sawamgjY7vg4voXnK5E/LaV0lp9ET+
 pWBh3d0F3tyBLP7Z3Pjo/93FqilmSqUNCoI7keU14fNphnYJMQ8LngUZOnQSyDnGSk
 4qKTDEfb58k2Q==
Date: Thu, 14 Apr 2022 10:42:59 +0200
From: Jakub Kicinski <kuba@kernel.org>
To: Tan Tee Min <tee.min.tan@linux.intel.com>
Message-ID: <20220414104259.0b928249@kernel.org>
In-Reply-To: <20220414072934.GA10025@linux.intel.com>
References: <20220413040115.2351987-1-tee.min.tan@intel.com>
 <20220413125915.GA667752@hoboy.vegasvil.org>
 <20220414072934.GA10025@linux.intel.com>
MIME-Version: 1.0
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add fsleep() in HW
 Rx timestamp checking loop
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

On Thu, 14 Apr 2022 15:29:34 +0800 Tan Tee Min wrote:
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > > @@ -279,10 +279,11 @@ static int dwmac4_wrback_get_rx_timestamp_status(void *desc, void *next_desc,
> > >  			/* Check if timestamp is OK from context descriptor */
> > >  			do {
> > >  				ret = dwmac4_rx_check_timestamp(next_desc);
> > > -				if (ret < 0)
> > > +				if (ret <= 0)
> > >  					goto exit;
> > >  				i++;
> > >  
> > > +				fsleep(1);  
> > 
> > This is nutty.  Why isn't this code using proper deferral mechanisms
> > like work or kthread?  
> 
> Appreciate your comment.
> The dwmac4_wrback_get_rx_timestamp_status() is called by stmmac_rx()
> function which is scheduled by NAPI framework.
> Do we still need to create deferred work inside NAPI work?
> Would you mind to explain it more in detail?

fsleep() is a big hammer, can you try cpu_relax() and bumping the max
loop count a little?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
