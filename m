Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BFE8D1B10
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 14:23:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B8ABC6B47E;
	Tue, 28 May 2024 12:23:46 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEB30CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 12:23:39 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e964acff1aso7736221fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716899019; x=1717503819;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gQ6Bwt6k8qoK6vNlq9lM1iWxCwSqpepkOmDB+x80ufY=;
 b=WhC+Y76ySEzqMCZb7XtJchm9Dt6w5/15VenjPesuR6sV4ybm9yh2KcSehlGKfjM1yl
 sQDEYoN2npE5qXkUcyv0gfp5G/98zq9HvyJPl76SYxEjxcOJZPUk/SW5PVzPH/NIkAuT
 APy8dcsd4oYa8JdBTdqqQS6O9SUdioQ1mJaHHAYqAEBOmSs6euQn21akKZC1ee3f/CMH
 xHrJfXRviX5kP9xpnRXn7V0xdOmliaM99oih0JUYACxXFCleZVHhS9UviVzH9iKTV8yN
 kijQm1AG3x9W4nxIfWtH0Yz2SAhjvNaxrlMTdBno8e7TIfepLMKT3eeZfpzebMnmvo3W
 iKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716899019; x=1717503819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQ6Bwt6k8qoK6vNlq9lM1iWxCwSqpepkOmDB+x80ufY=;
 b=w5Jj6/LlRX6A2ijG+7uPMU+bXAYyAZWTiLPKC984sz6Dh8z3vYTaMWaCBQvbK9dLak
 Cc/XYKUP5B2pXytrFDs1/8KHeKRZa+Tn7RVdC1qtImTSNNlE/BylWGCy3EEHTcSUtkTp
 luemKOo87N5FPxBgu6diJMEcXhO7PbLSdZlGojR3IwfkONsqeT8Cj4WLOHMIuJfwSpQx
 OnfjqvwW/HCyAPEYoCCPKwEvToH/PYa/URm6hLxiVjwIAspXKz0AwyOv9fwuOjXjFYHC
 SnCdundUSFhrA2Ki07nBZQJ0ABIvMRCtB1/cdOvg4FZdiDjfIxwBmxkcgnCWwRZ+A4I+
 RmZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUemMKhWWFCWwRmXX1qd5h/xOTjLD2FF5DzLW+fSuz6Pelk/308ZaeH1clblhPLpS5UrqufMFXB/8585Ip/t4soFyrTkDZ5KoJjewe89t6I9m3VY1TFfgZs
X-Gm-Message-State: AOJu0YwtoBAPmY17oUKZjo9sabXZG6FecJku9f96zTe+sbwFr9JGLs7Y
 Ja8ysmbkU4dDZWYGxV5GL7kmz19Y0c/aL66eCVJ0hqTqyTcYus8q
X-Google-Smtp-Source: AGHT+IHz9ffk7NLOvFZgMKCrkgUQ1nrZnBgj6Z2qyuDmAybj85WSiQ54kGWQnsIP/wPIZZp0KHBKgA==
X-Received: by 2002:a2e:8203:0:b0:2e9:821a:82fd with SMTP id
 38308e7fff4ca-2e9821a83d7mr20353621fa.27.1716899018827; 
 Tue, 28 May 2024 05:23:38 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e9838eb29csm3340441fa.115.2024.05.28.05.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 05:23:38 -0700 (PDT)
Date: Tue, 28 May 2024 15:23:35 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <f73mceuqpbj7nwmefahhwacpbol6meomywupvxw5abpojbpqie@hhrg3mgfql24>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
 <20240524210304.9164-3-fancer.lancer@gmail.com>
 <ZlWwiQxvvAKd39gN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlWwiQxvvAKd39gN@shell.armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 3/3] net: stmmac: Drop
	TBI/RTBI PCS flags
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

On Tue, May 28, 2024 at 11:23:05AM +0100, Russell King (Oracle) wrote:
> On Sat, May 25, 2024 at 12:02:59AM +0300, Serge Semin wrote:
> > First of all the flags are never set by any of the driver parts. If nobody
> > have them set then the respective statements will always have the same
> > result. Thus the statements can be simplified or even dropped with no risk
> > to break things.
> > 
> > Secondly shall any of the TBI or RTBI flag is set the MDIO-bus
> > registration will be bypassed. Why? It really seems weird. It's perfectly
> > fine to have a TBI/RTBI-capable PHY configured over the MDIO bus
> > interface.
> > 
> > Based on the notes above the TBI/RTBI PCS flags can be freely dropped thus
> > simplifying the driver code.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> I think this patch can come first in the series, along with another
> few patches that remove stuff. Any objection?

No objection.

-Serge(y)

> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
