Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CAB9A46AF
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 21:16:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14855C78023;
	Fri, 18 Oct 2024 19:16:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9C58C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 19:16:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32BCF5C57F7;
 Fri, 18 Oct 2024 19:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AD6C4CEC3;
 Fri, 18 Oct 2024 19:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729278968;
 bh=xYNvEAnbruKmoDP7ruTSaK5ufdaOcVknSAix/ef+r18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y1pJU95MTDQzWNjwBOGBqSBSc88jyOcaXW+B8btrDam5hYaxxwALh1I8mrN4YGae6
 JZZSZWz4GlaCN8MUEIHo/OuEjdN61Hc4f8aOT4Dap12KKOtHqTUybZeteKpXaPk2ca
 5snSdEhdbRJEb4jNzlFqJF2IX1uD1Yu/wbl344qlY34u8VGaWA1TuBtrmV+gIzGakM
 wjM94j2TUNLOxfKOH7yxwe6H3HW+lkeJBzZbWnLKj7iNwf4OSIRC89WH5jFtGH04Qx
 /+xqRy67uVAr4JTtV6fHlCAo6KJ5mv5c64paVHipX0UHnWLwAg8FHVr1VPybaB5Tl4
 Y2neu3CE10B6A==
Date: Fri, 18 Oct 2024 20:16:03 +0100
From: Simon Horman <horms@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20241018191603.GA1697@kernel.org>
References: <cover.1728980110.git.0x1207@gmail.com>
 <cover.1728980110.git.0x1207@gmail.com>
 <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
 <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
 <20241017171852.fwomny3wedypybhx@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241017171852.fwomny3wedypybhx@skbuf>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/5] net: stmmac: xgmac:
 Rename XGMAC_RQ to XGMAC_FPRQ
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

On Thu, Oct 17, 2024 at 08:18:52PM +0300, Vladimir Oltean wrote:
> On Tue, Oct 15, 2024 at 05:09:25PM +0800, Furong Xu wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > index 917796293c26..c66fa6040672 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > @@ -84,8 +84,8 @@
> >  #define XGMAC_MCBCQEN			BIT(15)
> >  #define XGMAC_MCBCQ			GENMASK(11, 8)
> >  #define XGMAC_MCBCQ_SHIFT		8
> > -#define XGMAC_RQ			GENMASK(7, 4)
> > -#define XGMAC_RQ_SHIFT			4
> > +#define XGMAC_FPRQ			GENMASK(7, 4)
> > +#define XGMAC_FPRQ_SHIFT		4
> 
> If you made use of FIELD_PREP(), you would not need the _SHIFT variant at all
> (though that would be a separate logical change).

+1

> >  #define XGMAC_UPQ			GENMASK(3, 0)
> >  #define XGMAC_UPQ_SHIFT			0
> >  #define XGMAC_RXQ_CTRL2			0x000000a8
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
