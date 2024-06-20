Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C1591125F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 21:42:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67AC8C7128D;
	Thu, 20 Jun 2024 19:42:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 203C3C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 19:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718912567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1agS+ZvCUVxgkXGHHLIbPUJmAmNouL9iIY3PECE7ow4=;
 b=RSZiEagyXXw84zqLbEl/yN/gi9sv9s+3O2xBe33Zxb4aMXtB/rLB8sXDD08gPdtNcpecc1
 xnfdyxAP38ywRSbueZsydQnYTUOBgQZlZ9Zr8m/KwpOZZkoOovoty2N3OVqxidA8lT6aGq
 iUU5x98Myg3pJnkO6/vPUxLzv2a+C64=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-UW25jcMcNVuXI05i3wY2vQ-1; Thu, 20 Jun 2024 15:42:45 -0400
X-MC-Unique: UW25jcMcNVuXI05i3wY2vQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-dfdfe3d9fc8so2121528276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 12:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718912565; x=1719517365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1agS+ZvCUVxgkXGHHLIbPUJmAmNouL9iIY3PECE7ow4=;
 b=KamIv4jF2HesF2H/OAE+c3zFTT1HoB5UNxHhapRaPlxoaD5o/n0rgK80IgJaz14zKx
 QK0e2K/89WeYTdSU0IJIDpB1Rk86RksY2liOdWn6LNp01cdV0RYc4lA3HLUlMm7t+ys4
 3NzjoaLh9MzL7jhGLhNEDSMOnxTzwYe43q4WxZkdXNGqTh19AI71cdaTBT92SIowY30V
 lZ/8bPs9YTpqBJKS878/mW4DNcPmbU32OpM8BuCAJ/ouWErjoA2NGo6w2nlDlbxqB6bP
 E07l23wH+oaVs1iPIk7JjCi98DY+s1jWtEaUKYLOcIjr1iKYA4hnej6HYCy7WqFC09Q/
 Bnnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEJuijsGePln6al0oFPh9XQJ7QIq1tSTHH1OPxR+gi4ZeTxlOcKiaKYpTXZXskye9dli13+OmaHTuGbrZJF0BI9PUEEd0+8Ps8ByTSJhELfxFHcKfCmqt1
X-Gm-Message-State: AOJu0YwrvL42/2WuXy4sn/SniEGfDJL6OAd5iwlMjG9n1vu6JQIedLgp
 XvAdWt3cuBwmjSVSMgFYemLUgzYK8g2oo+OCXleElOGBC58vAyedBqDhm/gOK8nFBMwvxCBjv1k
 8F0dETe9mmtPn+zWnYNqV8/2APnulvXpfL1qI8I5+0ejtuZmblQ+pCKzN3SIWUxCQyBspG32iqU
 atrQ==
X-Received: by 2002:a25:ae95:0:b0:dfa:5895:7814 with SMTP id
 3f1490d57ef6-e02be17a2d8mr6265509276.36.1718912565196; 
 Thu, 20 Jun 2024 12:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE4ky/fERanNc8cBhQKDDDU0GeIhg6HjUx/IE8xx/ZXGSXJJZV61VB95Bm+AQ66PZaqk4hXA==
X-Received: by 2002:a25:ae95:0:b0:dfa:5895:7814 with SMTP id
 3f1490d57ef6-e02be17a2d8mr6265480276.36.1718912564724; 
 Thu, 20 Jun 2024 12:42:44 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::13])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b5180dd3a1sm5935796d6.31.2024.06.20.12.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 12:42:44 -0700 (PDT)
Date: Thu, 20 Jun 2024 14:42:41 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <4ts2ab5vwf7gnwqd557z62ozjdbl3kf7d64qfc6rjhuokav3th@brhzlsrpggk6>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-2-brgl@bgdev.pl>
 <bedd74cb-ee1e-4f8d-86ee-021e5964f6e5@lunn.ch>
 <CAMRc=MeCcrvid=+KG-6Pe5_-u21PBJDdNCChVrib8zT+FUfPJw@mail.gmail.com>
 <160b9abd-3972-449d-906d-71d12b2a0aeb@lunn.ch>
 <ZnNIib8GEpvAOlGd@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <ZnNIib8GEpvAOlGd@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/8] net: phy: add support for
	overclocked SGMII
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

On Wed, Jun 19, 2024 at 10:07:21PM GMT, Russell King (Oracle) wrote:
> On Wed, Jun 19, 2024 at 09:51:12PM +0200, Andrew Lunn wrote:
> > phylib supports out of band signalling, which is enough to make this
> > work, so long as two peers will actually establish a link because they
> > are sufficiently tolerant of what the other end is doing. Sometimes
> > they need a hint. Russell King has been working on this mess, and i'm
> > sure he will be along soon.
> 
> ... and I'm rolling my eyes, wondering whether I will get time to
> finish the code that I started any time soon. I'll note that the more
> hacky code we end up merging, the harder it will become to solve this
> problem (and we already have several differing behaviours merged with
> 2500base-X already.)
> 
> > What i expect will happen is you keep calling this 2500BaseX, without
> > in band signalling. You can look back in the netdev mailling list for
> > more details and those that have been here before you. It is always
> > good to search the history, otherwise you are just going to repeat it.
> 
> That's where things start getting sticky, because at the moment,
> phylink expects 2500base-X to be like 1000base-X, and be a media
> interface mode rather than a MAC-to-PHY interface mode. This is partly
> what my patches will address if I can get around to finishing them -
> but at this point I really do not know when that will be.
> 
> I still have the high priority work problem that I'm actively involved
> with. I may have three weeks holiday at the start of July (and I really
> need it right now!) Then, there's possibly quite a lot of down time in
> August because I'm having early cataract ops which will substantially
> change my eye sight. There's two possible outcomes from that. The best
> case is that in just over two weeks after the first op, I'll be able to
> read the screen without glasses. The worst case is that I have to wait
> a further two to three weeks to see my optometrist (assuming he has
> availability), and then wait for replacement lenses to be made up,
> fitted and the new glasses sent.
> 
> So, I'm only finding the occasional time to be able to look at
> mainline stuff, and I don't see that changing very much until maybe
> September.
> 
> At this point, I think we may as well give up and let people do
> whatever they want to do with 2500base-X (which is basically what we're
> already doing), and when they have compatibility problems... well...
> really not much we can do about that, and it will be way too late to
> try and sort the mess out.

I hope your holiday and operation go well Russell.

Pardon my ignorance, but I know of quite a few things you have in flight
and because of that I'm not entirely sure what specific patches you're
referring to above. Have those hit the list? I know you're cleaning
up stmmac's phylink/pcs usage, but I'm thinking that this is outside of
that series. Thanks in advance for helping me understand all that's in
progress around this mess of a topic!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
