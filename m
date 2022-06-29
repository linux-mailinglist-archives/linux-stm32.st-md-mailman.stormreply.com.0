Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC7D55FDA7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 12:44:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 101B2C5F1EE;
	Wed, 29 Jun 2022 10:44:57 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44954C04001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 10:44:56 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id h23so31642493ejj.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:from:to:cc:subject:references:mime-version
 :content-disposition:in-reply-to;
 bh=kOaVpaz5661w2bixlQiYEfULRrUSFVOS6Ar20pgYWdM=;
 b=LF2lslnh++0WUUFSJgCf7GvK+7VGZjFnE9ZBbYiMfeRwO2yaf9Ln/SJBTKjRsgHGjc
 ynpjUtRsZ1U+KbtMClec0oNoSnSzavFKBv8njhon7gRuhr3D9yqZx+M0GyZBrZ509Qw4
 +mAKJE7HVZDa3sxZJcmTWL2hEm87MW+sDgJZPFJm6b/JWqG+Jgi45KQCc1t+/H5jK2W+
 fRUCYvZLfdWcmZ/OqgdqLjsS7Ts50BTbwOuUcWRGWj8jTXAfAA6UUa8uG14kqK44fCdx
 nOKfMf8WkJf2JJUqV6PRX94klpxmWXkgKjnuYXfHFkSZZELKHNI3wP3heKqRmRkRJF8u
 CqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:references
 :mime-version:content-disposition:in-reply-to;
 bh=kOaVpaz5661w2bixlQiYEfULRrUSFVOS6Ar20pgYWdM=;
 b=oNQmPAp5pRVAY/WO2yDcz2d0Avk0NcB14wPfjQO2E8ThFtNy0NJ0B3QzErgJENQBr8
 NsXXbzzpjEo/MYt7gPjkfatIDRN/GjnRXAx6NJua63+wHyeI86K+RQi6lxVHOrghDbGx
 R4Y/89YcwQ3nWfsOj/8vtjtMt1yung+H1byIvvBp0mVrK2yh5DadIsIaPS7yxjIUPiE3
 t+EDpTvocOmQ2YQnjpTFCkQBJtczRZe1LqUupgW5AZA8B6l0rZ0mryfFAovje1bIraeO
 HhtV3cGup3IOak3aU2M4RlKRemtIjkVEQdlkBhg+GiJup0En/YZ8V5IGwPONYLp6umLI
 to0A==
X-Gm-Message-State: AJIora/1xPdLE7M1UsEmd4t/zrEjgTXVEKShuZxB3PSKQI546LdKgp8k
 1hypeeaBZ5hk1IbVxC73BdI=
X-Google-Smtp-Source: AGRyM1sEQsEwoJqoLD3KZMvpu1kGdNVgPe7HSW37VlXIh+dBpCD8gQzpF8VkmufZxyX5eF3MYN2amQ==
X-Received: by 2002:a17:907:c14:b0:726:9118:3326 with SMTP id
 ga20-20020a1709070c1400b0072691183326mr2749834ejc.68.1656499495587; 
 Wed, 29 Jun 2022 03:44:55 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a1709063bca00b00706e8ac43b8sm7560722ejf.199.2022.06.29.03.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 03:44:54 -0700 (PDT)
Message-ID: <62bc2d26.1c69fb81.8efff.df8d@mx.google.com>
X-Google-Original-Message-ID: <YrwtJVZZJ6QvaXEr@Ansuel-xps.>
Date: Wed, 29 Jun 2022 12:44:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20220628013342.13581-1-ansuelsmth@gmail.com>
 <20220628013342.13581-3-ansuelsmth@gmail.com>
 <20220628205435.44b0c78c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628205435.44b0c78c@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH RFC 2/5] net: ethernet: stmicro:
 stmmac: first disable all queues in release
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

On Tue, Jun 28, 2022 at 08:54:35PM -0700, Jakub Kicinski wrote:
> On Tue, 28 Jun 2022 03:33:39 +0200 Christian Marangi wrote:
> > +	stmmac_disable_all_queues(priv);
> > +
> > +	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
> > +		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
> 
> IIRC this hrtimer is to check for completions. Canceling it before
> netif_tx_disable() looks odd, presumably until the queues are stopped
> the timer can get scheduled again, no?
> 

My concern is that at the time hrtimer_cancel is called there may be
some packet that still has to be processed and this cause kernel panic
as stmmac_release free the descriptor (and tx_clean try to free garbage
pointer)

Bu honestly I put the hrtimer_cancel up to be extra safe, the main
problem here was disabling napi polling after tx_disable that I think
was wrong from the start.

> >  	netif_tx_disable(dev);
> >  
> >  	if (device_may_wakeup(priv->device))
> > @@ -3764,11 +3769,6 @@ static int stmmac_release(struct net_device *dev)
> >  	phylink_stop(priv->phylink);
> >  	phylink_disconnect_phy(priv->phylink);
> >  
> > -	stmmac_disable_all_queues(priv);
> > -
> > -	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
> > -		hrtimer_cancel(&priv->tx_queue[chan].txtimer);

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
