Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A57B987519
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2024 16:07:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F735C6DD72;
	Thu, 26 Sep 2024 14:07:00 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 925C7CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 14:06:52 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a8a87c7c68dso12933966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727359612; x=1727964412;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dnBN6W/2Yn8YL1xAQTroO/UvJGFrAyxdRIvWWWIPJng=;
 b=NGG4q77BXyjogqztx7lywKqSaSHRuxayp8Q7BDeHLgVXmvufTx87leUlpcb15TK9/Y
 jrtXbgNJ43yt/IBpGt+dyPcjLZoLLFf6KVauDvId1licIGQqjy/bT/Ar2Yp2zZFpCina
 zgpyTpguVu3xGcUpSwecsdf42jpPKAGIstGoSklJSpPCwF3QDzb/DJxvuj8VFx+H97OJ
 RC7WqigUhxorSc6MSbckuNzRyMfNTkvt2tBXOfxc1HzzocwTElNNZ8cEzMVCuYeIp4VV
 Tc/zbW1bSqabdikxqcLN9zqFTPiwzaI8m35rEjZ0qAlSi3lP1L5ZLczpH1fCq1y84hrU
 /CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727359612; x=1727964412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnBN6W/2Yn8YL1xAQTroO/UvJGFrAyxdRIvWWWIPJng=;
 b=KOsKNushcLpryUYv+reIsZm0irbpsnqjHhqj/Kyb45TVcpdOTVasepU8/HzerfSo5V
 9Gec/ArwfTLBtKa1ZGUUtlnpNtS7cxOtqo2pcRX6inuzFI+4lrf+mMYzKXyHOEYi5jyF
 iZBJMjIlRoVJ1v+uWxhSU5qz7LGEUjfZlBjtRM+Z4hsM0PpXcwaF4fjWgVXC5qNL2KI/
 xjl2j/0huNHly8aWKYOolwZtD8FtEkAoid1tDs1dBsKdGRojvcYv0PImqdcm5gp4qezo
 54wPdpasS6wBRImHjRn+0FEnELzWJUB2apZGUfBSSx1PNou4F+ioq3uPD7XtXkLbNHUA
 MV6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbz/jgAAf0C/c/6iZQXGywbooJDiQpOBR5XNbc4+n1h9v/xpbtTLFlWlQ6JphFk7TkhbiVDgzOf8L3tg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzziCMkbJUSkNP9Jqo/ZBAKTU1ZSuIhjONgJnycRcf2Kyimr0Jc
 8ft0Xl5OofaPH6YFR16tY0gggEhOa8vN3IMMTccAUQ1zy20MFtET
X-Google-Smtp-Source: AGHT+IFvq+Q1MRytKOktEY4oDr+KD7iY0K65f5kEblT+8Z7cHRq/M6AykZXCgjHzqYpBKIWv2L2yRA==
X-Received: by 2002:a17:907:d2a:b0:a8d:2623:cd4a with SMTP id
 a640c23a62f3a-a93a06b1221mr247104366b.12.1727359604576; 
 Thu, 26 Sep 2024 07:06:44 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775d23sm2027766b.4.2024.09.26.07.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 07:06:40 -0700 (PDT)
Date: Thu, 26 Sep 2024 17:06:34 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20240926140634.kpiwi7xjhkrq3kaq@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjcz-005Ns9-D5@rmk-PC.armlinux.org.uk>
 <20240925131517.s562xmc5ekkslkhp@skbuf>
 <ZvRmr3aU1Fz6z0Oc@shell.armlinux.org.uk>
 <20240925211613.lmi2kh6hublkutbb@skbuf>
 <ZvVNWxIRhKyNLM/J@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvVNWxIRhKyNLM/J@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 06/10] net: dsa: sja1105:
 simplify static configuration reload
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

On Thu, Sep 26, 2024 at 01:02:35PM +0100, Russell King (Oracle) wrote:
> On Thu, Sep 26, 2024 at 12:16:13AM +0300, Vladimir Oltean wrote:
> > On Wed, Sep 25, 2024 at 08:38:23PM +0100, Russell King (Oracle) wrote:
> > > > There are 2 more changes which I believe should be made in sja1105_set_port_speed():
> > > > - since it isn't called from mac_config() anymore but from mac_link_up()
> > > >   (change which happened quite a while ago), it mustn't handle SPEED_UNKNOWN
> > > > - we can trust that phylink will not call mac_link_up() with a speed
> > > >   outside what we provided in mac_capabilities, so we can remove the
> > > >   -EINVAL "default" speed_mbps case, and make this method return void,
> > > >   as it can never truly cause an error
> > > > 
> > > > But I believe these are incremental changes which should be done after
> > > > this patch. I've made a note of them and will create 2 patches on top
> > > > when I have the spare time.
> > > 
> > > ... if we were to make those changes prior to this patch, then the
> > > dev_err() will no longer be there and thus this becomes a non-issue.
> > > So I'd suggest a patch prior to this one to make the changes you state
> > > here, thus eliminating the need for this hunk in this patch.
> > 
> > That sounds good. Are you suggesting you will write up such a patch for v2?
> 
> Actually, the three patches become interdependent.
> 
> Let's say we want to eliminate SPEED_UNKNOWN. Prior to my patch in this
> sub-thread, we have this:
> 
>                 speed_mbps[i] = sja1105_port_speed_to_ethtool(priv,
>                                                               mac[i].speed);
> ...
>                 rc = sja1105_adjust_port_config(priv, i, speed_mbps[i]);
> 
> sja1105_port_speed_to_ethtool() can return SPEED_UNKNOWN if
> mac[i].speed is not one of the four encodings. If we can't guarantee
> that it is one of the four encodings, then SPEED_UNKNOWN may be
> passed into sja1105_adjust_port_config().
> 
> Similarly, as for the default case, we can't simply delete that,
> because that'll leave "speed" uninitialised and we'll get a build
> warning without my changes. We could change the default case to
> simply:
> 
> 	default:
> 		return 0;
> 
> but that just looks perverse.
> 
> So, I think rather than trying to do your suggestion before my patch,
> my patch needs to stand as it currently is, and then your suggestion
> must happen after it - otherwise we end up introducing more complexity
> or weirdness.
> 
> Hmm?

Ok, if we're back to my original proposal, I'm implicitly okay with that.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
