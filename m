Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E93448A6940
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 13:01:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE1CEC6B47E;
	Tue, 16 Apr 2024 11:01:22 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DABCC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 11:01:21 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d872102372so31802921fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713265280; x=1713870080;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ytr2gjGDi6MOUgYACZdiW0scYQdKsmNLgN4Zn17oOZo=;
 b=OGm4rrObJlHx8kM43gzry9mVIxwAWJVrBgzzZ2Zb7zOV5lNqMIRoLCrjZRYzHUZVef
 dyTt224G5CicFQiUzQ05bJ+7ELtr2CP9R17ljnIwQFayB6tboVKxNzB0tQy3ThUtINHv
 4T/s82gS09FJepXjOkEVucv75U6uZN5n2+AIJXHRwGtRYoFZ/x3jAdgX9qmK0fE4h1it
 6GvX9l5fK0Wk2KEjgnibGEJH3jCCimFrTrXZ/Oip9EvqWgJs0aVaDqPQo0qmriNMiIwz
 zF0SO8byEcxhDzq8pajpdUEZI7VI7ddoYTX2j99F7/9Hr/36MDq6rEMWiBnRCvDCmWww
 JeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713265280; x=1713870080;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ytr2gjGDi6MOUgYACZdiW0scYQdKsmNLgN4Zn17oOZo=;
 b=E02UEluPFjsvSmnpm39yGwSsGjWBn3pNrRfzRFluZiV08InFOsBAMJrKUV0z44ErIo
 twkfFpVoedE/QAo4QUddNh6oIqyR8zsGAv2x/ul8rIsGmyQg/fVXIz7a7IL8bEWl/apH
 Z1SEEEsK6sHKHa+IdoN8562D2SZZAm4NQfeolD4J8KoOdd67C2nqG4nCLeoBum8RzTwc
 IwyCxL6VTSIYhItzA4NYAkuBxhPwrpPa7/7uA252zXMTZ88nrdxdqcr+RKjtGoE+iBr9
 e2ImCu2EyAp4uxqEsUwex/tGdnr8P6L3ovdxBljg4kHhn15uXgazvPn6UIGwTHu74y/7
 qbeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFcsdGYWcn0a8taYKJ1Ah4ycgLd37Co+p3f2I66XqWLrPo7nRpuzLkZ9JkGgXZ+YTgyqsMjFWFaHKKpmaRHhcZFg0x36Oo0cv4t++1xHOt/rwN8b/+zOLs
X-Gm-Message-State: AOJu0YygaVPWYCxqGxzNsu05ePMMXB89marYtgp0bCzZqlf/hoDcoJtc
 0Mkq1EkQahE47CwRxC0fvJMb7RabxrCVmP7zGKbxtU57OsBtJEpR
X-Google-Smtp-Source: AGHT+IG0D+e1m7dFn1q9C4/cK5VHSr2W95LT82IU7SVm/yesKp+FKUPQjomsggxh50eO2gSxhqVoAQ==
X-Received: by 2002:a2e:7406:0:b0:2d9:f301:9771 with SMTP id
 p6-20020a2e7406000000b002d9f3019771mr654146ljc.5.1713265280208; 
 Tue, 16 Apr 2024 04:01:20 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a2e8ec8000000b002d860a40f9dsm1535007ljl.136.2024.04.16.04.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:01:19 -0700 (PDT)
Date: Tue, 16 Apr 2024 14:01:17 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <uaq3tbsogvuv6vjm7ga63boltao2vvi55yzyw75z7yido2a5zr@h26npwx3pdwa>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-5-fancer.lancer@gmail.com>
 <9644a96d17152014c8e7f91e9786dde26f67d7a5.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9644a96d17152014c8e7f91e9786dde26f67d7a5.camel@redhat.com>
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Move MAC caps
 init to phylink MAC caps getter
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

On Tue, Apr 16, 2024 at 12:27:29PM +0200, Paolo Abeni wrote:
> On Fri, 2024-04-12 at 21:03 +0300, Serge Semin wrote:
> > After a set of fixes the stmmac_phy_setup() and stmmac_reinit_queues()
> > method have turned to having some duplicated code. Let's get rid from t=
he
> > duplication by moving the MAC-capabilities initialization to the PHYLINK
> > MAC-capabilities getter. The getter is called during each network device
> > interface open/close cycle. So the MAC-capabilities will be initialized=
 in
> > normal device functioning and in case of the Tx/Rx queues
> > re-initialization as the original code semantics implies.
> > =

> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> =

> This is a net-next follow-up for the previous 3 patches
> targeting=A0'net', right?

Right. The last patch in the series is a cleanup patch which gets rid
from the duplicated code by moving it to the PHYLINK MAC-capability
getter.

> =

> If so, you should have posted this one separately after the other would
> have been merged back into net-next.

I thought about that initially. But since this patch content is
connected with the rest of patches and the maintainers/reviewers may
ask to do things differently than it's provided in the initial
patches, I decided to submit the entire series as is but indicating
that the last patch is intended for 'net-next'.

> =

> We can apply the first 3 to 'net', but you will have to repost 4/4
> after ~Thu.

Agreed. I'll repost 4/4 after the initial 3 patches get to be merged
in.

Thanks
-Serge(y)

> =

> Thanks,
> =

> Paolo
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
