Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A71984C9A4
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 12:34:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE0F7C6B463;
	Wed,  7 Feb 2024 11:34:40 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1970C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 11:34:39 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d066b532f0so8078751fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Feb 2024 03:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707305679; x=1707910479;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nPQzZxl5bE1RItDITVNujm+ZmvjYJeoOtU5sHIw4Szs=;
 b=Lm8yPSCGjzdSdMWTM1PzrjWf5ZQ+EepVZW9vBK3u6dTE/Ef/Yg5jwfntjIix0s+icT
 REqAHhEkof8BNVf3ndkCQClL47BrQElhvYMP6JFR1qp2iYSCt20eX06eV21RK1mCjFzq
 8i99cnaPEcgM1VpRfThDt4ePtj3tI/4Y53Z42uMZgcx83M5cogRMGqL6vLCDVXgryNuB
 5lMqCxn2SD7KwOezldMmhtszvSaofmb5BI7jTF9hrqwgyNvwfHLCEGgDcNhoLGiTIWtI
 E9QDgoBDjJLAPDR4MwYUV/TXKg9eOlcy/eJstQZXDEo8U2zjrKqdKmaelYbIGhJNijYJ
 tAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707305679; x=1707910479;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPQzZxl5bE1RItDITVNujm+ZmvjYJeoOtU5sHIw4Szs=;
 b=TbsDNYI/qdusiFCU0Zl79KdB7ACnpHr0KmmWE9mu2ekdkMfXMT8IO8OH2RIkOMpg8h
 AdfV5o/d9yJg6Ct/8VivkPjA0u+i9PKHEq3m3GdsFETRRrRlry00/cs0KkzSFcVKsiie
 4nbjVbbu9UvZETR/8EnubGGUX4s3HURH2IhuBo591walQCbJinGP96oD5H3siso+GWVY
 dtS0dsxrQhU9JXCscMiJtkOCgU9BlUZnxidxqtJ4iJsEMomL9qIPEYxu0MKVF0ewHe2V
 egbtzyseuaNsFG9KfsDOLDgyIfnwxIQvNeVQtWzl/ky6qOQdmsUYXovBAycjBDf0Ek0E
 Uhew==
X-Gm-Message-State: AOJu0YyrBLO9FqSKLJli1WQcJUCroIf1dmv/G8IjRQi+Rz4j/tDw1P+D
 of/EXdj8LcsQSIjFv9uUroDpExeteJ+6YhEdZunkm7DBCdnWUewe
X-Google-Smtp-Source: AGHT+IFtHTL1sJ/QvAt+78/YRYABzfZKnDNRbo56DjDqklw/3Z6EPdqKy3AIocI3PHi8NhHTSurcFg==
X-Received: by 2002:a2e:9992:0:b0:2d0:9076:e9cc with SMTP id
 w18-20020a2e9992000000b002d09076e9ccmr4268383lji.29.1707305678385; 
 Wed, 07 Feb 2024 03:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXPe5zFF9e6iqt4dBN6yTi7bU1Mk4W5dqeCN8tJ8xEbbnrz8Gc7cE2oCKwiHti8Gx/YzrcsG5BP0GT+OD+3SPL7hrhSNYfN2cMZ+dhbteqMsmeSVdRvQ8ED4C+NR0zJuO/zgFBHu1k6/CA7leb1eAO3OsvjdwJbgYTjQ+tompJjlsypzA1bZN8g8RnY46/H1MTgrHlDuEnbsnC1aBK+SOipw6QqbqRExkYsWKIZ9u8gGucNRpuJrVQeQ/1pdgnYl/3UDXE6VPZeRuB0p6TxVsbKkIBbXt30aR1JqHgDXn51fdn6pTxk84G1N/zXFL1mwNEoKnu57/1ude+sA/RSXrVyo/JD2G2XB4vAH0Le8bZjfYjtgrEydQn03O9JR7Zx+m3TTyDoj9XM8AFweb5P+YPDD7r75FZURhL4ingHlDtsbCHNYgmkrus/lvQIur4m8IULurTLu6c5svaOEwl5cAWd59WtRSVeFyikZO5v34Bkcu89QD6G7qNrYKNK7nTU
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a2e7801000000b002d0a6b9d0casm145443ljc.67.2024.02.07.03.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 03:34:38 -0800 (PST)
Date: Wed, 7 Feb 2024 14:34:33 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Simon Horman <horms@kernel.org>, Pavel Sakharov <p.sakharov@ispras.ru>
Message-ID: <tg2au3a524douxq6k37aa73zuotlx5sl6hbcokm7xwy3bumqxc@lothlyjh6ksg>
References: <20240203150323.1041736-1-p.sakharov@ispras.ru>
 <20240206150704.GD1104779@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206150704.GD1104779@kernel.org>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: Fix incorrect dereference in
	stmmac_*_interrupt()
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

On Tue, Feb 06, 2024 at 03:07:04PM +0000, Simon Horman wrote:
> On Sat, Feb 03, 2024 at 06:03:21PM +0300, Pavel Sakharov wrote:
> > If 'dev' is NULL, the 'priv' variable has an incorrect address when
> > dereferencing calling netdev_err().
> > 
> > Pass 'dev' instead of 'priv->dev" to the function.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > 
> > Signed-off-by: Pavel Sakharov <p.sakharov@ispras.ru>
> 
> Thanks Pavel,
> 
> I agree with your analysis that this can result in a NULL dereference.
> And that your proposed fix is good: netdev_err() can handle a NULL
> dev argument.
> 
> As this seems to be a fix I suggest it should be for net.
> And that it should be based on that tree and designated as such
> in the subject:
> 
> Subject: [PATCH net] ...
> 
> Also if it is a fix, it should have a fixes tag.
> Perhaps this one:
> 
> Fixes: 8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX")
> 
> 
> I don't think there is a need to respin for the above, though please
> keep this in mind when posting Networking patches in future.
> 
> 
> Looking at the patch above, and stmmac_main.c, it seems that the following
> functions also suffer from a similar problem:
> 
> static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
> {
> 	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)data;
> 	...
> 	dma_conf = container_of(tx_q, struct stmmac_dma_conf, tx_queue[chan]);
> 	priv = container_of(dma_conf, struct stmmac_priv, dma_conf);
> 
> 	if (unlikely(!data)) {
> 		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> 		...
> 
> And stmmac_msi_intr_rx(), which follows a similar pattern
> to stmmac_msi_intr_tx().
> 
> I also note that in those functions "invalid dev pointer" seems misleading,
> perhaps it ought to be "invalid queue" pointer.
> 
> As these problems seem to all have been introduced at the same time,
> perhaps it is appropriate to fix them all in one patch?

IMO we can just drop these and the noted in the patch checks. Before
actually making a decision about that there are three general
questions we'd need to answer to:

1. Do we trust the IRQ-subsystem to supply a correct cookie pointer
specified during the IRQ request procedure?

2. Do we trust the driver code for correctly performing the IRQs
request?

3. If we don't trust to any of that then what is caused if the problem
happens and there is no sanity checks implemented?

Here are my thoughts regarding that:

1. If no dev_id sanity checks implemented in the handlers then having
the IRQ requested with NULL argument passed even though the handlers
imply the netdev pointer will for sure cause troubles right away since
the driver won't work and the system will likely crash. So it will be
spotted during the initial test/debug stage of the respective change.

2. If for some reason the IRQ subsystem supplied a NULL pointer
instead of the cookie pointer, then something is really wrong and the
entire system likely won't work correctly. If this case is possible
to happen then all the kernel IRQ handlers should have been
implemented with such sanity check, which I don't see in practice.

3. If IRQ was caused by the DW *MAC controller, but NULL pointer is
passed and the handler returns IRQ_NONE state, then the actual IRQ
won't be handled AFAICS causing the spurious IRQs detected. Eventually
the IRQ will be effectively disabled. In anyway the driver will stop
working. But even if this happens see points 1. and 2. for the
problem cause implications.

4. The common IRQ handler doesn't have such check in the driver.
Though unlike the rest of the handlers it's assigned with the
IRQF_SHARED flag which requires the cookie pointer passed. Anyway the
sanity check was removed from the common IRQ handler in the commit
f42234ffd531 ("stmmac: fix pointer check after utilization in
stmmac_interrupt") with a justification as being _paranoidal_ and
pointless in the respective context. But in about a year afterwards
the individual IRQ handlers were introduced with the same check but
this time in a bit more reasonable context. Still it doesn't make
the check existence less paranoidal.

5. I took a look at first 20 Ethernet device drivers. None of them has
such checks implemented even though about half of them request IRQs as
non-shared (so the cookie pointer is optional).

6. Finally the checks are implemented in the hard IRQ handlers for
which the less code the better.

To sum all the above up from my point of view the checks are redundant
of course unless we turn on the paranoidal mode and stop trusting the
driver code and the IRQ subsystem.

-Serge(y)

> 
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 4727f7be4f86..5ab5148013cd 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5848,7 +5848,7 @@ static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
> >  	struct stmmac_priv *priv = netdev_priv(dev);
> > 
> >  	if (unlikely(!dev)) {
> > -		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> > +		netdev_err(dev, "%s: invalid dev pointer\n", __func__);
> >  		return IRQ_NONE;
> >  	}
> > 
> > @@ -5868,7 +5868,7 @@ static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id)
> >  	struct stmmac_priv *priv = netdev_priv(dev);
> > 
> >  	if (unlikely(!dev)) {
> > -		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> > +		netdev_err(dev, "%s: invalid dev pointer\n", __func__);
> >  		return IRQ_NONE;
> >  	}
> > 
> > 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
