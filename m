Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF17986839
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 23:16:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F27AC6C841;
	Wed, 25 Sep 2024 21:16:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C50E8C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 21:16:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42ee66c2c49so359435e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 14:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727298977; x=1727903777;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hserkp0XoO/xaxszPyfe2XUusNXhdSGovTKNC7GSS08=;
 b=HkEK0EmOiwbmuTbxik+9bzhd+AC6l+oJlE+qpH3Naj7zFi7E/nTI9veWRbxZ05Susw
 I3rJM1Z84GiAvstd3U6RC0Khxo6SB7/ma+Ucbqmkk4YGZQ1oFKYpBJHi7bYoRt7yCTsj
 YQYcB5v2vkSE/exHWQtKMtiWE4AN9tW5eIwNijNuip++5BP6CVg8z90O5q262N3esA1g
 yOKtGO2J3WS1MqnlPCmAztFeKgW7O+HoQBcG95NBuflHwZ9Q/oMg4Dr3wvSgFNiX+A9J
 mF29KnHE67yoHId38/mh/RhQblJtLl4+ersfZn5Fjw4d21LZCVxkJueXce93Lh+wsI9N
 D9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727298977; x=1727903777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hserkp0XoO/xaxszPyfe2XUusNXhdSGovTKNC7GSS08=;
 b=ZjlLB/GVJPjhDrixspUf52H0mr1ftKjG3dDKDTCx2ZmUAhz5LQibzEbo8d97Giq2hD
 joL5fkR0TlF3u16/YyUi/oc9aLW55jstUjlpW1OrltQ3/DCgxOBUKnQTWH/o5pQCNpkS
 7Ck1vwOMxpev5TB7y1xw577KBVWXM3xMuSf5JRo6wU7u8WYLlq3dBrfuzqVo/aIfnW4R
 MvsTo0dB8cmtMfyGRObblcaO2liWFYXJ32BIm7r1L1IhZ7n+NlKFXFHffRESDWVeVYph
 417Me0IoOCLZuIeosv1D129W4Mpvfyykuljj6quOeYcgTw+dCm0glbySUMhWmLTQwZRQ
 ccsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7XA6zBmf9qdirKP+n3iUG14wqnglqfC0pN9HD1fK8sxJRm9xRYcet2pc+70URupMVwjEmk5o2eKozuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5ItsKY0qWonilwptV0KQcaoUo590A8LAH3ZDTGlszAuNIYTmA
 yMvR5sFojf9FqaktQYsulU3z5qHndx/WTUkybRrrYe08rqix9zFv
X-Google-Smtp-Source: AGHT+IHBkP25fB4BC5hSAT45OKJ8Gcfe1I3/jKVfbWU3juyKG2hV4TbANIux7w2Ze32P428dDIwKzg==
X-Received: by 2002:a05:600c:1d25:b0:42c:ba6c:d9a7 with SMTP id
 5b1f17b1804b1-42e96144adcmr14013805e9.4.1727298976991; 
 Wed, 25 Sep 2024 14:16:16 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2c13cesm4876658f8f.29.2024.09.25.14.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 14:16:16 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:16:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20240925211613.lmi2kh6hublkutbb@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjcz-005Ns9-D5@rmk-PC.armlinux.org.uk>
 <20240925131517.s562xmc5ekkslkhp@skbuf>
 <ZvRmr3aU1Fz6z0Oc@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvRmr3aU1Fz6z0Oc@shell.armlinux.org.uk>
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

On Wed, Sep 25, 2024 at 08:38:23PM +0100, Russell King (Oracle) wrote:
> > There are 2 more changes which I believe should be made in sja1105_set_port_speed():
> > - since it isn't called from mac_config() anymore but from mac_link_up()
> >   (change which happened quite a while ago), it mustn't handle SPEED_UNKNOWN
> > - we can trust that phylink will not call mac_link_up() with a speed
> >   outside what we provided in mac_capabilities, so we can remove the
> >   -EINVAL "default" speed_mbps case, and make this method return void,
> >   as it can never truly cause an error
> > 
> > But I believe these are incremental changes which should be done after
> > this patch. I've made a note of them and will create 2 patches on top
> > when I have the spare time.
> 
> ... if we were to make those changes prior to this patch, then the
> dev_err() will no longer be there and thus this becomes a non-issue.
> So I'd suggest a patch prior to this one to make the changes you state
> here, thus eliminating the need for this hunk in this patch.

That sounds good. Are you suggesting you will write up such a patch for v2?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
