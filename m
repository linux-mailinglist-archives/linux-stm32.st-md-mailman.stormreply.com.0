Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF096C984
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 23:26:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37B24C78011;
	Wed,  4 Sep 2024 21:26:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61D8DC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 21:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725485178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aHg8j7v3tAkrGbKIx0peuwn2yfQMcilA5Qy8cOHgpzE=;
 b=OZxFQngLw2nQHWeUGPymH11caZv2XKWWnlWTI8ZaaVKfBD428AJ4EdG9XmRshybLV31OiR
 qk+ISc5UfJmvMNl5nc3bZlGr6GpC54cYZ+cHsY810ZL8wDaPRQ6qZVxIK2KQzQQ/ZvNGr7
 6qfYptpbJp/giWhuuVChe5yJKr1MmRM=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-iQVkFVh2MHe-WvpC_-T9IQ-1; Wed, 04 Sep 2024 17:26:15 -0400
X-MC-Unique: iQVkFVh2MHe-WvpC_-T9IQ-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-82a231e35ddso698339f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 14:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725485175; x=1726089975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHg8j7v3tAkrGbKIx0peuwn2yfQMcilA5Qy8cOHgpzE=;
 b=sUX8fEgSGHav8qLKVCu3nkVk0vbTssDRkfRtkAfA0JB11wWiXMQnW+p2SpZ+Gk22Wb
 EjEQTr9luzZeRppoVD/OcyTHJZbolTkFDfQEmysygEGpS7CmOnAuWlyKf3UwPd+oeLkl
 d/zTAmTMkT1Lu3YGClv8ZT1YoE3epNn9PVGWpu4v/ffYsAfUU3Q93JHxD9QVuZQhr2Ip
 MeZQZUumaW8FU4WLuXQxydKKWCdTwNX9F4tjniEhgGuS+dO9b5fsPkFyEbKmg6mPWhtt
 8Z0q3spajmr6+4Cltab7giqSPBOelg3BaXUUAyxwuNZCucsIH2jf+DGeBJXivRx+CnZa
 7kiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCMcmnIUoZWdHuwoTywbdJUuf/o/xBS3Frm2u/xxaM7bSckPBSu9zZut8ro2Oof3bdQ49aLCt/Oaj5wg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyvRtV0cm91S2ck/8WWhG6Iqj52qab5CWv2eEYpWLYdx3NYTIuE
 0Q3JnPOcrzvEgmtLFYp45TBUKFmiyxYku70UynLZwG5Pl+V8aDaWu4wusEwko8o9HAO6Ei3fHUh
 JBXtXqFYdOmS0ab9/A+by+q08gUsnAvjfAcrvIfp7tPnZkrh+hvh9AtpcXOnqGPZGCFhYezVmdD
 HBMg==
X-Received: by 2002:a05:6602:6307:b0:82a:4419:6156 with SMTP id
 ca18e2360f4ac-82a44196334mr1412310239f.14.1725485174776; 
 Wed, 04 Sep 2024 14:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS6tEkpDev46DvGWy32ljDhFfJQqROmsOKpChFn5k1kOh3E+WhWO8dKQaAJANfqBFpAGf7bQ==
X-Received: by 2002:a05:6602:6307:b0:82a:4419:6156 with SMTP id
 ca18e2360f4ac-82a44196334mr1412307439f.14.1725485174374; 
 Wed, 04 Sep 2024 14:26:14 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82a1a2f0d9fsm379507539f.7.2024.09.04.14.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 14:26:14 -0700 (PDT)
Date: Wed, 4 Sep 2024 16:26:11 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ce42fknbcp2jxzzcx2fdjs72d3kgw2psbbasgz5zvwcvu26usi@4m4wpvo5sa77>
References: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
 <rq2wbrm2q3bizgxcnl6kmdiycpldjl6rllsqqgpzfhsfodnd3o@ymdfbxq2gj5j>
 <ZrM8g5KoaBi5L00b@shell.armlinux.org.uk>
 <d3yg5ammwevvcgs3zsy2fdvc45pce5ma2yujz7z2wp3vvpaim6@wgh6bb27c5tb>
MIME-Version: 1.0
In-Reply-To: <d3yg5ammwevvcgs3zsy2fdvc45pce5ma2yujz7z2wp3vvpaim6@wgh6bb27c5tb>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Sneh Shah <quic_snehshah@quicinc.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v4 00/14] net: stmmac:
 convert stmmac "pcs" to phylink
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

On Thu, Aug 08, 2024 at 11:42:53PM GMT, Serge Semin wrote:
> On Wed, Aug 07, 2024 at 10:21:07AM +0100, Russell King (Oracle) wrote:
> > On Tue, Aug 06, 2024 at 09:56:04PM +0300, Serge Semin wrote:
> > > Hi Russell
> > > 

...

> 
> > I guessed that you would dig your heals in over this, and want to do
> > it your own way despite all the points I raised against your patch
> > series on my previous posting arguing against much of this.
> > 
> > So, at this point I give up with this patch series - clearly there is
> > no room for discussion about the way forward, and you want to do it
> > your way no matter what.
> 
> I actually thought that in general the approach implemented in my
> patches didn't meet much dislikes from your side. Just several notes
> which could be easily fixed in the next revisions.
> 
> Anyway thanks for understanding. I'll wait for your series to be
> merged in. Then I'll submit my patch set based on top of it (of course
> taking into account all the notes raised by you back then).
> 

Hmmm, I'll poke the bears :)

Any chance this series will be rebased and sent out again? I
really liked the direction of this and it seems a waste to end it at a
stalemate here despite some differing opinions on the design and
possible future changes.

I think we're all in agreement that stmmac's current PCS usage behind
phylink's back is not good, and this is a massive improvement.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
