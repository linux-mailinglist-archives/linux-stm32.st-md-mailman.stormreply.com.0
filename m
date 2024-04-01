Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B3894475
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 19:48:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD840C69067;
	Mon,  1 Apr 2024 17:48:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D45BECFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 17:48:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41568096c4aso5221415e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Apr 2024 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711993703; x=1712598503;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zrigaZFXWcx1kCyKa9oGq8jbBkbvJ11REE5OiYoomxk=;
 b=KORpJNaL5n0ek8fvwlA7G7tDIOar/+gSV8H+oeFj8eRR2CNjwFT8SVGzSus6vMS+PK
 +QjRNsoCzBB4caNSarv6wItO0DlbTJD1KmlTcPQA71rFPiUxHmeRzdLHbMtBujsFzrhH
 Oq5hYh0waFysuoXXMdu1D1DA4iAVy4V/W0SMnEzYvhDVYcFTTt2wjGfPJgF4/ZPdUy3O
 Ti53akcZYs3BJnYDXQvLfOW4e1NmCkt+1i7rIPf0Ntrh+gd2cHf+j0ruH93beOUQo2I0
 R1EuGXRXxrTwYW+y8bNj8JLKF8B19k2rVNlQ4GybY8rcvza6GvHsi/DMgj72zy6DTjPR
 z6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711993703; x=1712598503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrigaZFXWcx1kCyKa9oGq8jbBkbvJ11REE5OiYoomxk=;
 b=lt86nzcnGjnVFjf8QDpB7fg4WK8ccMqc1LB2JrDFFn+HhcJmaR5eWDHjinQxCUUr26
 2gWcMLacfVm/6hYYdbyd7qCOQziRTKXHDhlwStyAvStxx1sg81KS9YlvChs0U9+qdgDM
 ZjlAYtTL9AbV2To8j3rVJ20keFdz6mmcelo8jBVirTH5kbhaiAJZotm7v5SsEHCDD8af
 g0qGvuSKPnBzdW5VLfJp2GsKasOXRisADe8swhp8RmwKm9EcjZi7hy1/Ov4ZrxX67tUA
 IDGmm5u4t/ot+JMLG6yxA7iCRuVETJeBBf1rOKLF1YzaDX02Ei41CnEYs0PtW8Milz/t
 Vysw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9C/wfPE2Bs44RT7wdUHSUBKPVSB0V41yLwxjSfOAHsKDxxqkY1g9Gnx48JOXv5VeI6zOTaQlsgDGw1APjsNO2XE9ABj0u478vHzn9E9zUJi0LZtmCA7cp
X-Gm-Message-State: AOJu0Yy7/MHvYGcGirOeRVHNWWyTPzl3MwkNbcTCOGHN6mWNGDcL2vKa
 QdcfiHzWvfTH3hF8NqG8+TYUTRpqIyVfR5b48Dahm+sTZ6VUzm9U
X-Google-Smtp-Source: AGHT+IFFKEPqYBqhXPvo3d9e2KGAB3GpC18x3pZ1hRTgMveG4viHnSGaLgA5CQDjSMLrjG8QFtrf1A==
X-Received: by 2002:a05:600c:1907:b0:414:869b:dbd9 with SMTP id
 j7-20020a05600c190700b00414869bdbd9mr7334584wmq.9.1711993702998; 
 Mon, 01 Apr 2024 10:48:22 -0700 (PDT)
Received: from Kalray-lp320 ([2a01:e0a:a92:c660:38e3:78b9:48eb:4246])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b0041493aae77esm18603515wms.23.2024.04.01.10.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 10:48:22 -0700 (PDT)
Date: Mon, 1 Apr 2024 19:48:20 +0200
From: Piotr Wejman <piotrwejman90@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20240401174820.GA22684@Kalray-lp320>
References: <20240303190339.52496-1-piotrwejman90@gmail.com>
 <20240311134144.7b1e1a34@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240311134144.7b1e1a34@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: fix rx queue priority
	assignment
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

On Mon, Mar 11, 2024 at 01:41:44PM -0700, Jakub Kicinski wrote:
> On Sun,  3 Mar 2024 20:03:38 +0100 Piotr Wejman wrote:
> > The driver should ensure that same priority is not mapped to multiple
> > rx queues. Currently rx_queue_priority() function is adding
> > priorities for a queue without clearing them from others.
> 
> Do you know what user-visible mis-behavior this may result in?

When changing priority to rx queue mapping with tc qdisc taprio command (man tc-taprio),
all packets with priority assigned to multiple queues are dropped.

> 
> > From DesignWare Cores Ethernet Quality-of-Service
> > Databook, section 17.1.29 MAC_RxQ_Ctrl2:
> > "[...]The software must ensure that the content of this field is
> > mutually exclusive to the PSRQ fields for other queues, that is,
> > the same priority is not mapped to multiple Rx queues[...]"
> > 
> > After this patch, rx_queue_priority() function will:
> > - assign desired priorities to a queue
> > - remove those priorities from all other queues
> 
> But also you seem to remove clearing all other prios from the queue:
> 
> -	value &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
> 
> and 
> 
> -	value &= ~XGMAC_PSRQ(queue);
> 
> is that intentional? Commit message should explain why.

Yes, that keeps other priorities assigned to that queue and only clears
the same priorities from all other queues.

> 
> > The write sequence of CTRL2 and CTRL3 registers is done in the way to
> > ensure this order.
> 
> Ensure which order? Looks like you're actually writing in the opposite
> order than what I'd expect :S First the register you want to assign to,
> and then the register you only clear from.
> 

I meant the order you wrote: first assign new priorities to a queue,
then clear them from others queues.

> When you repost please include a Fixes tag.
> -- 
> pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
