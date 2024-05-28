Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C608D1AFA
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 14:20:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05068C6B47E;
	Tue, 28 May 2024 12:20:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29F87CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 12:20:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52742fdd363so865939e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716898812; x=1717503612;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BPKynHoA1RZiJcMOYXRI1Hw3OSBgUrOAHrq/dZgZeTk=;
 b=f7Q5q51+nen6j1wvDWarocjbZVK+p9uVOUIGxZbONG6po63+/RyA+gwQycg8132dSJ
 HN16KkmE2V+QssNiZS1HEBWrJv13TXSeeeijrtIMvS47Jws5BRKYAEJ9/GGVGjzXV4XA
 A95B8ktKJXQLUd9cv2NTdIbYay4no9D65/knu0zuuIzOz4GCd32sL3Vz3Bop96Ao/RxJ
 IR+x8t7nuk1KxTQi/3NGVg+r+eatqH+7Nu6zTCy6cmUDYb7BdNfgSymY18N3OyGwg9Nl
 qbUdhmQMm9sKiuf7COe3Khiq8lFmgo3g5xZhuX5AAQz2qZTPog3NCEPC63KbQEniIFW9
 DB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716898812; x=1717503612;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BPKynHoA1RZiJcMOYXRI1Hw3OSBgUrOAHrq/dZgZeTk=;
 b=kwtTXvofYThR/gZ/Uqrca75EkG8PcHuz7K1lY8+cEAMEABopQyHcWfqX3xNMR/rx5z
 F25AbmL3H+F/jHxvzDA7l3IyYZ+2Davf7lC6SU5m7kpx51lj7erXCN3NHgzwnezAt859
 S9zXxOwHbr3MyNp8dGVXtRD6em4GVLInkYtnZtjp5X7edof1xrMPWI2cyQOgI6ie9nF5
 e6XhB6x8TfuwlUQVpFO1O1xKJxVrznmUNT+jFo8Yx8K9TQZvnBZExc6dkUKvu5D6uPu0
 7OvdTye8R9n//RGESIMx5UmdyFC2PTIpPOCQ52hwpqm557g26JflRfVnDbRpWeR8ApiO
 34PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFLukoj/vDaPThiTYzLppAE40DNaZGSppsPn5pwKF+BOQE7eWXtW0b0nmKV1HotzhOly/1wZdoLiEaGM7MI1qwqkBmNe+r9+rLp+XZTGMa0u518/UxEVER
X-Gm-Message-State: AOJu0Yw1qWtpcWIWpkBrpAhBdYRNPoa5VSCKkfthRY8OygcYReQVtwtu
 0oTL7O/TWeyNNOmc8uHDipb+0AG2Co3V9DJRk6Bv9NCTw9/1wM8l
X-Google-Smtp-Source: AGHT+IFd9FmeuCiizQK6KkHMRIGCvCqTEl6HKh6TZkn0NQYapBUStdMJunq8pk+wjXVdH5HQ+5qNng==
X-Received: by 2002:a19:ca44:0:b0:51f:5872:dd8c with SMTP id
 2adb3069b0e04-529651991afmr6873605e87.39.1716898811701; 
 Tue, 28 May 2024 05:20:11 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4bfabsm937711e87.84.2024.05.28.05.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 05:20:11 -0700 (PDT)
Date: Tue, 28 May 2024 15:20:08 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <fg7ib32lqeeuzef4eoskdnwrufwpdm6cdm2bdjlro7e3gtmp4u@mrni2hltc32o>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
 <ZlWw3hJdOARzdl2S@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlWw3hJdOARzdl2S@shell.armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/3] net: stmmac: Prevent
	RGSMIIIS IRQs flood
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

On Tue, May 28, 2024 at 11:24:30AM +0100, Russell King (Oracle) wrote:
> On Sat, May 25, 2024 at 12:02:57AM +0300, Serge Semin wrote:
> > Without reading the GMAC_RGSMIIIS/MAC_PHYIF_Control_Status the IRQ line
> > won't be de-asserted causing interrupt handler executed over and over. As
> > a quick-fix let's just dummy-read the CSR for now.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> I think it would make sense to merge these into the patches that do the
> conversion to avoid a git bisect hitting on a patch that causes an
> interrupt storm. Any objection?

Of course, no objection. This patch content was intended to be merged
into yours.

-Serge(y)

> 
> (I'm now converting these two in separate patches, so would need to
> split this patch...)
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
