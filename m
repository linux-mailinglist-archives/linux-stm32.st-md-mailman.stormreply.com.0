Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECA121ABA
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 21:16:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84519C36B0B;
	Mon, 16 Dec 2019 20:16:18 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2927C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 20:16:16 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id 15so5241802lfr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 12:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=YLUuImzEeNdgR4wgqVgRBbAIWmyCTwR/wtnyDd3xIaE=;
 b=0EDEWKHIm56j47HaFMM23Z3l1LkmrWmnHY1vwaiC80joIxDNVf68/zHyaL5o/+Lno3
 jS607DFkpV9KSvysbU3IDwbrLZ1mLeiY7CX6/iqErTbFVxleUV8gIyNL+1JgaVcqSFsH
 1nnIVwAmIgGN7cAVMzgm0kfZ4hU+l67/r69M4dIzz2+/43LE/kZ1O2N70G6d4P+AivYw
 knkVpPKaJZlw9y26rrvgYDXTE3UJNnUZI3Zaj144jWyOaLMSMguaaOmz0ZzmHsc9rFcq
 OhTrIg9WMCIvoVT3FX3TXPMmq/qGg3NY4v2qt831uQs7kgAsBUASHHCN2qbpxRFaN3mf
 JInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=YLUuImzEeNdgR4wgqVgRBbAIWmyCTwR/wtnyDd3xIaE=;
 b=i6IcwVmwnUXxT/uXVU2ol3eYCVa1wZLrkvvIHa45ai1QmJnXykiE+iEoEwAsqsVdVL
 S9nGAfs45XG0BQ5BDdIRK8BD2ltDux20HASf3kPpH33/n0QdjOqi3A0qO2MhIXFpb/2D
 T9q+pQHcBrewVDfw3rzIcKTldJ9oq+i1wh0GWFwSsrWHX+ekZivEd8bqCMGnQcG7pHFA
 OHtxBFglX3TyM7sqq4hFzgMnMLMB6d//fqU4H53u1fvMqUDjls225yegbyoBiJrwTj29
 RsOTv2grjniuZiv0QtqwqazpeDtoGA+7PllTOQU1Xyum6a4CRjCVEHN9jKmeCcqFAlKB
 C0xg==
X-Gm-Message-State: APjAAAXoHr5HtEpcqVE1698R90U43fV/SsK4S600oEvzmz2RTk2phZrc
 jnq9FdevxWj4gYxJ00ljiGb6xB5rvrI=
X-Google-Smtp-Source: APXvYqyt/fVYTuNQcFJk0htjrTxRnckdp1ZR4t6oFaGjxai9lo0wTzQ8KMfd0AAc9f/0dPUfeLqsog==
X-Received: by 2002:ac2:4884:: with SMTP id x4mr559623lfc.92.1576527376259;
 Mon, 16 Dec 2019 12:16:16 -0800 (PST)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id a24sm11015145ljp.97.2019.12.16.12.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 12:16:16 -0800 (PST)
Date: Mon, 16 Dec 2019 12:16:05 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20191216121605.4780302d@cakuba.netronome.com>
In-Reply-To: <BN8PR12MB3266BDA48CE9F65D564B0918D3510@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1576007149.git.Jose.Abreu@synopsys.com>
 <23c0ff1feddcc690ee66adebefdc3b10031afe1b.1576007149.git.Jose.Abreu@synopsys.com>
 <20191214122837.4960adfd@cakuba.netronome.com>
 <BN8PR12MB3266BDA48CE9F65D564B0918D3510@BN8PR12MB3266.namprd12.prod.outlook.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Always use TX
 coalesce timer value when rescheduling
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

On Mon, 16 Dec 2019 09:20:53 +0000, Jose Abreu wrote:
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index f61780ae30ac..726a17d9cc35 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -1975,7 +1975,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue)
> > >  
> > >  	/* We still have pending packets, let's call for a new scheduling */
> > >  	if (tx_q->dirty_tx != tx_q->cur_tx)
> > > -		mod_timer(&tx_q->txtimer, STMMAC_COAL_TIMER(10));
> > > +		mod_timer(&tx_q->txtimer, STMMAC_COAL_TIMER(priv->tx_coal_timer));  
> > 
> > I think intent of this code is to re-check the ring soon. The same
> > value of 10 is used in stmmac_tx_timer() for quick re-check.
> > 
> > tx_coal_timer defaults to 1000, so it's quite a jump from 10 to 1000.
> > 
> > I think the commit message leaves too much unsaid.
> > 
> > Also if you want to change to the ethtool timeout value, could you move 
> > stmmac_tx_timer_arm() and reuse that helper?  
> 
> Yeah, it's a quick re-check but 10us can be too low on some speeds and 
> leads to CPU useless-looping. The intent is to let this always be 
> configurable by user.

Okay, please do mention the bump from 10us to the default of 1ms in the
commit message, though.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
