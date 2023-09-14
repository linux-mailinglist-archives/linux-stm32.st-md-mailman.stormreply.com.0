Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9FC7A0B34
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 19:05:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20197C6A5EF;
	Thu, 14 Sep 2023 17:05:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CDF8C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 17:05:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2bcde83ce9fso19039251fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694711114; x=1695315914;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7PUq4z7Yde3HhHsl15RcXAi8VXTsK+aq00VAgDqTaQ=;
 b=UVn8qZhLQe8o++JBBQIHZ1voZ4rG8YMGFmAlH8vaN8Y9bkQadSAU7qmhZXHG3NKDAH
 2T2vEXAtdZdeDEN7hmwXo5uex8bIrhzXD3o+wPC4NUJJY+nRoX9hWPe6xLjD9mRG6lWy
 MsqHlmyyBcaF9nBC1EtEjrx1QN2V97GxnLCSOHiujw8DGld85V0q9QqUL1vmFp8MLYjB
 ChvLZH8Uirh1JkZMi9KChnoyp+meaHq2qLhAyMlSgvHv/x3jcPueA0maR/uTqf3krGFe
 DhCZlW+rdnzzU4296Wh+Ba9J7JqnRORUcnmht7hN9gaufYsU0rb4uX41mijTQy+D1V59
 0CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694711114; x=1695315914;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7PUq4z7Yde3HhHsl15RcXAi8VXTsK+aq00VAgDqTaQ=;
 b=NbyKEN+5xTT5e0ZfMlgkOPlCg4x+8fNYa3sjUUgkB39rSZsqocCSd74tYwzXWz+Usr
 ahXEDDCOTZsUP5eP0utqCEb3wnblhJ8olPKlvN+tiZCxvDwChBy0bo6kY7uwPJiNR8lx
 8m1eDzjmWWP9Jy5GgJYdKIWz4uuS3e4nTes6UTLcQchYxnP9v91PkqcCYE81BUV//6dg
 6ndeUBd71y6z7x5kIZlk2NXOh4C77DMZdMPepyKd/3Z3QF5sVtR8+3NkWYyZZ1BqbdQp
 NR0Y/O0IFHdXLokPhhHqBOTSgGy0WxzWrPY4TtkSio3DTwRTyV9O2JrirQNerLL4ax9q
 PCbQ==
X-Gm-Message-State: AOJu0YxCtiNlKbB9Gz7bftJgmj/aQYwJiXINxdRU8ICavzZiGj4GpQXc
 XgCUFZAWIlaCbGV64iyh/bc=
X-Google-Smtp-Source: AGHT+IEFFuiQcDwb16erYvK+paHa9WvWcimYHEOp/iMQZzEm5VGA0IKKzOIzxyflILVljh8SHNikrg==
X-Received: by 2002:a2e:9bcc:0:b0:2bc:b6ce:eab with SMTP id
 w12-20020a2e9bcc000000b002bcb6ce0eabmr5094658ljj.51.1694711113788; 
 Thu, 14 Sep 2023 10:05:13 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a2e0c4a000000b002b962ee0c14sm354310ljd.23.2023.09.14.10.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 10:05:13 -0700 (PDT)
Date: Thu, 14 Sep 2023 20:05:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>, 
 Russell King <linux@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>
Message-ID: <uzvjph54kg2jkfbmwrvmunqv64ig7j6szr6pxxbiesnz5lletg@zq57w7jj2up4>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmkp-007Z4s-GL@rmk-PC.armlinux.org.uk>
 <7vhtvd25qswsju34lgqi4em5v3utsxlvi3lltyt5yqqecddpyh@c5yvk7t5k5zz>
 <ZQMgtXSTsNoZohnx@shell.armlinux.org.uk>
 <rene2x562lqsknmwpaxpu337mhl4bgynct6vcyryebvem2umso@2pjocnxluxgg>
 <ZQMmV2pSCAX8AJzz@shell.armlinux.org.uk>
 <ZQMnA1PgPDDQzDrC@shell.armlinux.org.uk>
 <DM4PR12MB50888CA414C76F5C59C27E50D3F7A@DM4PR12MB5088.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR12MB50888CA414C76F5C59C27E50D3F7A@DM4PR12MB5088.namprd12.prod.outlook.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: rk: use
 stmmac_set_tx_clk_gmii()
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

Russel, Jose

On Thu, Sep 14, 2023 at 04:01:41PM +0000, Jose Abreu wrote:
> From: Russell King (Oracle) <linux@armlinux.org.uk>
> Date: Thu, Sep 14, 2023 at 16:30:11
> 
> > On Thu, Sep 14, 2023 at 04:27:19PM +0100, Russell King (Oracle) wrote:

> > > I won't be doing that, sorry. If that's not acceptable, then I'm
> > > junking this series.
> > 
> > In fact, no, I'm making that decision now. I have 42 patches. I'm
> > deleting them all because I just can't be bothered with the hassle
> > of trying to improve this crappy driver.

I am sorry to read that. In no means I intended to cause such
reaction, but merely to improve the suggested changes as I see it.

Speaking about the stmmac driver. I've got over _200_ cleanup, fix and
feature patches in my local repo waiting for me having a free time to
be properly prepared and finally submitted for review. So I totally
understand your initial desire to improve the driver code.

> 
> Hi Russell, Serge, Jakub,
> 
> My apologies for not being that active on the review. I totally understand
> there's a lot of revamps needed on "stmmac", somethings may even
> need to be totally re-written.
> 
> I'm also aware that Russell has contributed significantly for this process
> and was of great help when we first switched "stmmac" to phylink.
> 
> So, my 5-cents here is that, on this stage, any contribution on
> "stmmac" is welcomed and we shouldn't try to ask for more
> but focus instead on small steps.

I actually thought the driver has been long abandoned seeing how many
questionable changes have been accepted. That's why I decided to step
in with more detailed reviews for now. Anyway It's up to you to
decide. You are the driver maintainer after all.

-Serge(y)

> 
> Thanks,
> Jose
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
