Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C455826610
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jan 2024 22:24:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D37B5C6B476;
	Sun,  7 Jan 2024 21:24:29 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AC61C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jan 2024 21:24:28 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2cd3f7e2aa1so12685531fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 Jan 2024 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704662667; x=1705267467;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XFnIRrpkSbC/64HOL4C9Wb0js1kawE+Mq2O/pxg8xmk=;
 b=MX/VMzvgQfrCNq7gASqEpq/s/AB27eJi1akD7LSTaVuLQpDFJHl47pYiVdgK8kFBgP
 uwsytAQR4F7IhbCfn8O7YtO/kefbVx/nsT3lgPUXzJKfDaWS+b3RAp57Jr60LEUNvd3U
 hE0ww5pm3vXQXC6EvhDQAGED9ozKLrmq1RU2xNxLremyk+FWSGVp/eyC64sLj5u2ED3l
 cWlXhPXgD1TjdO5fb3Zu6HUvtfuL1STniA3TLrMLLbw7jM8OATVTYPD2E2HdCXZpALvJ
 5idhGjR4vxYDhrjvIXxsNfJip6ePpk7dKjgfOmUb46CJ5aF5CT4HOkmhpcDSBvUoGqIO
 w0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704662667; x=1705267467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFnIRrpkSbC/64HOL4C9Wb0js1kawE+Mq2O/pxg8xmk=;
 b=TIhilzrc7l1TRjUPKdoXDyJQDFnzjYlLKEdFzdTX5RLiz1L6InUOBGcOEAYJTPSC3H
 ZVthBkYRDvhlb2OANsRqSoML9sNal3YoiSNWNADjtyMP3/qr9sBoMjIMtiRHL6Qb2F63
 hz/FQBBUIHCsw8fhba3RajOMAtgAhrunSfw+S8b39FcgCNUOcsksD+FJDV7tMasPJHOY
 Fx91bjlTRX6qlo9mHjQ26betAxarX3iABruyHzQGn12Bw11aOPNIW5ZuoO1T4fA8IpaJ
 INRCho3FuBHiRjNqJduETvZM97PzAC/RRHpkuuGHViqo5SWD+riDoJZKFS8XWYAEOWFM
 ggjg==
X-Gm-Message-State: AOJu0YwusIN+9R+wOERZF0ld+m0kvHP9J77LOv5ZsC+324UPc14tUDK5
 vK9qmwZZRuMmLFs+PA8cxzw=
X-Google-Smtp-Source: AGHT+IER9MaKT2qvx1MI99o0WSTaPtwEj5cDYIJcz4ctg0ZfI0flzoX8d2s4lIT+IDI+w9kt9A4HVQ==
X-Received: by 2002:a2e:9d13:0:b0:2cd:c15:1b6e with SMTP id
 t19-20020a2e9d13000000b002cd0c151b6emr1038169lji.22.1704662667456; 
 Sun, 07 Jan 2024 13:24:27 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05651c141400b002ccd8e66dd1sm1301962lje.138.2024.01.07.13.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 13:24:26 -0800 (PST)
Date: Mon, 8 Jan 2024 00:24:24 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Leong Ching Swee <leong.ching.swee@intel.com>,
 "David S. Miller" <davem@davemloft.net>
Message-ID: <px2f336zjgibl43utjnnljzjweypu5jxovhgthc4xruidvpl3q@yobulxczk7vh>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
 <170464562363.18664.8264531122295136817.git-patchwork-notify@kernel.org>
 <2df9fe3e-7971-4aa2-89a9-0e085b3b00d7@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2df9fe3e-7971-4aa2-89a9-0e085b3b00d7@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 peppe.cavallaro@st.com, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 patchwork-bot+netdevbpf@kernel.org, kuba@kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/4] net: stmmac: Enable Per
 DMA Channel interrupt
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

On Sun, Jan 07, 2024 at 08:06:55PM +0100, Krzysztof Kozlowski wrote:
> On 07/01/2024 17:40, patchwork-bot+netdevbpf@kernel.org wrote:
> > Hello:
> > 
> > This series was applied to netdev/net-next.git (main)
> > by David S. Miller <davem@davemloft.net>:
> > 
> > On Fri,  5 Jan 2024 15:09:21 +0800 you wrote:
> >> From: Swee Leong Ching <leong.ching.swee@intel.com>
> >>
> >> Hi,
> >> Add Per DMA Channel interrupt feature for DWXGMAC IP.
> >>
> >> Patchset (link below) contains per DMA channel interrupt, But it was
> >> achieved.
> >> https://lore.kernel.org/lkml/20230821203328.GA2197059-
> >> robh@kernel.org/t/#m849b529a642e1bff89c05a07efc25d6a94c8bfb4
> >>
> >> [...]
> > 
> > Here is the summary with links:
> >   - [net-next,v2,1/4] dt-bindings: net: snps,dwmac: per channel irq
> >     https://git.kernel.org/netdev/net-next/c/67d47c8ada0f
> 
> Please wait for DT bindings review a bit more than one working day (I
> don't count Saturday and Sunday, because we all have some life...).

+1. Would be very nice to have some more time to review the rest of
the bits too. This would be specifically important for the STMMAC
driver which doesn't currently have active maintainer. What about 5-10
work days to make sure that no comment would be submitted? Besides I
thought that no features were supposed to be submitted during the
merge window. Are we over the merge window already? (I might have lost
track of time on the holidays.)

Leong, next time before re-submitting your patchsets please wait for
some more time than just two days. I waited for your response for
almost two weeks.

-Serge(y)

> 
> Best regards,
> Krzysztof
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
