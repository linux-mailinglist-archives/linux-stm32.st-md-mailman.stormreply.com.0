Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE057AB242
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 14:39:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2ACAC65E4F;
	Fri, 22 Sep 2023 12:39:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05FF4C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 12:39:17 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso1952948f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695386357; x=1695991157;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=b6BtxNQ135MklppADA7lSErOJTbc2ar7TfLev75acd8=;
 b=KvEbhcBk0XUmW+4ReO5mmfLKBDNkiu2VRCvvvmp8XnOGQGAOZ9jshD88ssAFLIKe4U
 6QrOd5C9f3phYdaYO5XXL70iJA5PkRl47DnqSnH/ZvNZ76+jP69ZutmWd0gdY+hITmmO
 MOt3xg0Vw6qgPZHqqF1rPn4A/592shiHIqAG4m9CPstUYJHF0PDnqfhNoTgDeBcS5Ygd
 KnPFlqqcMbhiomWTiZRox9k45hHF9iOtKteiXutlfZ7j1H6482czhFycQpYNMZQQGlKQ
 fxxAj/+2lneUXzM9onHCLTOxE48KG+3NFgizXoWI4BEPJN2LTENai38OqCnA+W25EMNe
 ZlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695386357; x=1695991157;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6BtxNQ135MklppADA7lSErOJTbc2ar7TfLev75acd8=;
 b=N1ftZJQgYZv/20YtLDvr7shjhNU1FMwBbfsAOsj1hdUFqOD+HfVaurlG7ifBXD9DNi
 0to/As+7aATpGd0OkceNGhuwORlRMd4RJxvyEYF+dF9dDbFwM/thzWCb85iCkgs3DdcO
 Ajxgrls6Bqv7nb7IQfXtGzT0hBykeSSmv+lyfvaDLkcU5b0Knt2pUNIQLtxCrdQAF9cq
 DydvINK9P9Op5aPqiktvPlaEE21QxL6vBqjHwPknUJBRlBSZ8D2z6ELi6aPpXCgCKPA4
 891gAL2u8utkTMWLtbLLVtetdWt6FTW1f4E4T7cFVYEcbQGLlhvW6J0aKypxOyzulOz6
 e5iA==
X-Gm-Message-State: AOJu0Yzgkugt4ngwOpAC+TXIQi7B4YXXjvPmsCc9ddd1uFojkZWzo7wH
 Mq2f6cnoHkGMLGr5wtAkb00=
X-Google-Smtp-Source: AGHT+IGjgWaSR9uKGwFDbdBclTHJnKhiju4EMdgbX0VLMi2rEzBZwykMPgJj/mMOcTKBM7OAMgcEmg==
X-Received: by 2002:a05:6000:148:b0:31f:e1b4:5846 with SMTP id
 r8-20020a056000014800b0031fe1b45846mr8123988wrx.53.1695386357117; 
 Fri, 22 Sep 2023 05:39:17 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d634c000000b0031773a8e5c4sm4375252wrw.37.2023.09.22.05.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 05:39:16 -0700 (PDT)
Message-ID: <650d8af4.5d0a0220.5ce38.2c5e@mx.google.com>
X-Google-Original-Message-ID: <ZQ2K8ZRF+Kyq7pmD@Ansuel-xps.>
Date: Fri, 22 Sep 2023 14:39:13 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <20230922111247.497-3-ansuelsmth@gmail.com>
 <13bc074d-30c2-4bbf-8b4c-82f561c844b0@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13bc074d-30c2-4bbf-8b4c-82f561c844b0@lunn.ch>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH 3/3] net: stmmac: increase TX
 coalesce timer to 5ms
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

On Fri, Sep 22, 2023 at 02:28:06PM +0200, Andrew Lunn wrote:
> On Fri, Sep 22, 2023 at 01:12:47PM +0200, Christian Marangi wrote:
> > Commit 8fce33317023 ("net: stmmac: Rework coalesce timer and fix
> > multi-queue races") decreased the TX coalesce timer from 40ms to 1ms.
> > 
> > This caused some performance regression on some target (regression was
> > reported at least on ipq806x) in the order of 600mbps dropping from
> > gigabit handling to only 200mbps.
> > 
> > The problem was identified in the TX timer getting armed too much time.
> > While this was fixed and improved in another commit, performance can be
> > improved even further by increasing the timer delay a bit moving from
> > 1ms to 5ms.
> > 
> > The value is a good balance between battery saving by prevending too
> > much interrupt to be generated and permitting good performance for
> > internet oriented devices.
> 
> ethtool has a settings you can use for this:
> 
>       ethtool -C|--coalesce devname [adaptive-rx on|off] [adaptive-tx on|off]
>               [rx-usecs N] [rx-frames N] [rx-usecs-irq N] [rx-frames-irq N]
>               [tx-usecs N] [tx-frames N] [tx-usecs-irq N] [tx-frames-irq N]
>               [stats-block-usecs N] [pkt-rate-low N] [rx-usecs-low N]
>               [rx-frames-low N] [tx-usecs-low N] [tx-frames-low N]
>               [pkt-rate-high N] [rx-usecs-high N] [rx-frames-high N]
>               [tx-usecs-high N] [tx-frames-high N] [sample-interval N]
>               [cqe-mode-rx on|off] [cqe-mode-tx on|off] [tx-aggr-max-bytes N]
>               [tx-aggr-max-frames N] [tx-aggr-time-usecs N]
> 
> If this is not implemented, i suggest you add support for it.
> 
> Changing the default might cause regressions. Say there is a VoIP
> application which wants this low latency? It would be safer to allow
> user space to configure it as wanted.
>

Yep stmmac already support it. Idea here was to not fallback to use
ethtool and find a good value.

Just for reference before one commit, the value was set to 40ms and
nobody ever pointed out regression about VoIP application. Wtih some
testing I found 5ms a small increase that restore original perf and
should not cause any regression.

(for reference keeping this to 1ms cause a lost of about 100-200mbps)
(also the tx timer implementation was created before any napi poll logic
and before dma interrupt handling was a thing, with the later change I
expect this timer to be very little used in VoIP scenario or similar
with continuous traffic as napi will take care of handling packet)

Aside from these reason I totally get the concern and totally ok with
this not getting applied, was just an idea to push for a common value.

Just preferred to handle this here instead of script+userspace :(
(the important part is the previous patch)

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
