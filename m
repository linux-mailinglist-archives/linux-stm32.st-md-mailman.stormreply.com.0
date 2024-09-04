Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7068E96C33A
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 18:00:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20AA5C78011;
	Wed,  4 Sep 2024 16:00:40 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 191BBC78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 16:00:33 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5c24b1ed83eso622944a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725465632; x=1726070432;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u562QhIJrAV/3yEwnR0FdisLkB+lO3ntNL3108Pvrss=;
 b=XuTlMWzEcyrfst4637XfLtbjHkzZ7ESBuy7xKoxIuecJou6SWJD2DTSHomgavfssiT
 HolIMgh31QmsgReD5pFEYvvKJ8N3fAlu3k4EkABR5b0hUW2rI9ROOpmE7+u+Lh9Fh6iJ
 Y5rOV/XTauG8jONHIYOnlbsNvCjRorTPCPg1W+cysw/yqWpKoYCINHBAKlv94lfS+urM
 zZa7hsQhEErZ7peMWW455fU0pxQHhUhynU5iNwBhpBJlc+a+jWWQA/5oWRiDxPifxg8h
 doVgzcf0gA4a7bajBmA3R2lSLHwJpGZPTiOkVW6ambpjKb4WtDelwDos1tubSTLHg5py
 zuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725465632; x=1726070432;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u562QhIJrAV/3yEwnR0FdisLkB+lO3ntNL3108Pvrss=;
 b=kDaqZM4xG4ImjuvEUYeRli4UcdgelGc2MOCQacazwFdjqt/p4nXbOFLc/G/gaIUCaF
 RTV1uC51+tzH4/Vygk8armIqXg13fWOdxsIETPi6/bLoQoI0Ll5pwF9goixI3oZ25/3x
 7iIuNdMQa17cs0SBzCDAmL4VI4lS4PeF1SxQNqm92nyEx5vZYcLQF7e/hmAs/11uCyar
 VAJ8I03XaRACKzokVK2r1+g+ED4nfOTZBDJN5yAeM7UhbyaVyYURILnzOmEHoxnai3Dd
 aqsK/Ne7MSnMEoVpJegRi5HKimPnGVijW2AyXz2Qsl+70nEN2AZrs9FjloDpIYJ7x9+l
 KRjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyiLZYWOSD7YXon+zUDrGRxvhVbm6VR2xn639pY3wcsIvLNNBK2cwvwsQ8CJWC4Dxidjjd1mSSr0nQAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLkDTuarp+2B+NhWklN5v+nLtVImSUifsB28fg+1O1ynws8I1Y
 fHscat77g60wWLBld7Jk7C42Wu26zr9OdGBza4h+oLGZqeU/b26L
X-Google-Smtp-Source: AGHT+IEFcd58xREyckVIyq3G5fmmOo1FJAe+mAd3TL6j9pcVBAaX2pHXbBv1SNKS0+RCOnrBGwCzHQ==
X-Received: by 2002:a05:6402:13d1:b0:5c2:5dda:973d with SMTP id
 4fb4d7f45d1cf-5c25dda9906mr3890079a12.2.1725465632250; 
 Wed, 04 Sep 2024 09:00:32 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc544a3esm76216a12.29.2024.09.04.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:00:31 -0700 (PDT)
Date: Wed, 4 Sep 2024 19:00:28 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240904160028.cjmnadqgcwynncmh@skbuf>
References: <cover.1725441317.git.0x1207@gmail.com>
 <3cc959e1ab2e6cc7a4b39d22e34c38df70f01125.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cc959e1ab2e6cc7a4b39d22e34c38df70f01125.1725441317.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 7/7] net: stmmac: silence FPE
	kernel logs
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Sep 04, 2024 at 05:21:22PM +0800, Furong Xu wrote:
> ethtool --show-mm can get real-time state of FPE.
> Those kernel logs should keep quiet.
> =

> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

I don't have a stmmac-based setup to judge in person. But to me, these
still look too chatty, for being things that user space can always query
through netlink.

1070 =BB       netdev_info(priv->dev, "configured EST\n");
1090 =BB       netdev_info(priv->dev, "disabled FPE\n");

Also, they don't seem to be balanced. We don't have "disabled EST" and
"enabled FPE"?! I wonder if "disabled FPE" is actually a typo and should
have been "disabled EST"?

What do you think, should these also be suppressed / deleted?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
