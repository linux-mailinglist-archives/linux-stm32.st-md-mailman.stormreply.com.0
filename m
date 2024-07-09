Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F65F92C1DE
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 19:10:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33F81C6C820;
	Tue,  9 Jul 2024 17:10:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B179DC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 17:10:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso723835e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2024 10:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720545022; x=1721149822;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B7UZKmcE2rW2GXX3bgYnLtnkQIb55kJXHNrapjoEJ90=;
 b=j5aJVWgqBwgZ7ds57uttWn3wBqUeqt0rhTfXTA59ZnOZUCJBFlRRN8ujby5+z/7ajx
 DnLm91ytXIa1QF1DWbHVmbP3pIL1OjTAsXExJvWocGiDvUu2XZ+3JEBhXSDU/VpnsfuZ
 xchmYUsQ1jyvi2fGSzMRejQJKUK4B62/V1KMeAjEfete8SrXQt9J8mQUN7g/jI8H25Vv
 1I8+PYpAPsIW3dxtQ2aooECYjwQG8G5VO9pjB1U1M575Bl8SVPLk4coAfo7yLCVEqN9O
 bR229kqTbrbfnJGLvWsfG4tcm4eghS01/UCg4v8R3GaMfWFnfxPkzMscjm3YRMPC2Q9x
 MLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720545022; x=1721149822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7UZKmcE2rW2GXX3bgYnLtnkQIb55kJXHNrapjoEJ90=;
 b=UjhmnEsMOK1v/qq7beu0BNVAJ92rMpzmuEiFIFKbcAnS0Zgry79QjvsMFz0JMMJYrd
 Emp1yHVTm9eEU5xCRyZU1MVntTubFD2EEPGRLS3k3F1Ka1u24LNMuWLZhXsDwSkKfbh9
 X8wA8KfsL9ciBV9SAwT1/Mpwg7+tch3R76wD+EO+dBqFeQ9tqQE7TtKhIGx7G2gA8m13
 uC1yMO4UnaTo4l68k3DK+0wDYXk+wW1ScjHP+qYbrkKy0lrXxbsfNHwrgOHLCBmZ49DM
 9OYtqV4Rq+/EqTat/m7Xh0S30VB0ZgE/wbprBOaqpB67bASCJzvYsVE8vdPd++/mZuiB
 psXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR4/LEVo7+EhgFCrd+0EOzaXSnMsbHcZMqEoiRYKWApiPlj9uvYdofC50Z7IC+rCC923XuHNMepq9tGTbIyfCWHZl8GcFb55wobYtkk/u9lp6BHRYyI/rt
X-Gm-Message-State: AOJu0Yxu7inCP2rskvlukSykWHJkKKXrK3xVpyDvQLfBc24rOSgOIsQm
 a4HKs1nxw4tu51dhk0gEqTpGcg166gd4U8ZsLxmhTSTh0izPeewG
X-Google-Smtp-Source: AGHT+IHkO0uXExOBNSEEs8y3mlUuaeJd107eAQ+DLn8Jeer/KspdrN5GrCY5LpSsAWLOkTnLqQJIcQ==
X-Received: by 2002:a05:6000:ac9:b0:367:8a6f:8c0e with SMTP id
 ffacd0b85a97d-367cea67f4dmr2130410f8f.21.1720545021824; 
 Tue, 09 Jul 2024 10:10:21 -0700 (PDT)
Received: from skbuf ([81.196.28.31]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab080sm3041923f8f.104.2024.07.09.10.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 10:10:21 -0700 (PDT)
Date: Tue, 9 Jul 2024 20:10:18 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Furong Xu <0x1207@gmail.com>
Message-ID: <20240709171018.7tifdirqjhq6cohy@skbuf>
References: <cover.1720512888.git.0x1207@gmail.com>
 <d142b909d0600b67b9ceadc767c4177be216f5bd.1720512888.git.0x1207@gmail.com>
 <b313d570-e3f3-479f-a469-ba2759313ea4@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b313d570-e3f3-479f-a469-ba2759313ea4@lunn.ch>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Jianheng Zhang <Jianheng.Zhang@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/7] net: stmmac: xgmac: drop
 incomplete FPE implementation
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

Hi Andrew, Furong,

On Tue, Jul 09, 2024 at 03:16:35PM +0200, Andrew Lunn wrote:
> On Tue, Jul 09, 2024 at 04:21:19PM +0800, Furong Xu wrote:
> > The FPE support for xgmac is incomplete, drop it temporarily.
> > Once FPE implementation is refactored, xgmac support will be added.
> 
> This is a pretty unusual thing to do. What does the current
> implementation do? Is there enough for it to actually work? If i was
> doing a git bisect and landed on this patch, could i find my
> networking is broken?
> 
> More normal is to build a new implementation by the side, and then
> swap to it.
> 
> 	Andrew
> 

There were 2 earlier attempts from Jianheng Zhang @ Synopsys to add FPE
support to new hardware.

I told him that the #1 priority should be to move the stmmac driver over
to the new standard API which uses ethtool + tc.
https://lore.kernel.org/netdev/CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com/
https://lore.kernel.org/netdev/CY5PR12MB63727C24923AE855CFF0D425BF8EA@CY5PR12MB6372.namprd12.prod.outlook.com/

I'm not sure what happened in the meantime. Jianheng must have faced
some issue, because he never came back.

I did comment this at the time:

| Even this very patch is slightly strange - it is not brand new hardware
| support, but it fills in some more FPE ops in dwxlgmac2_ops - when
| dwxgmac3_fpe_configure() was already there. So this suggests the
| existing support was incomplete. How complete is it now? No way to tell.
| There is a selftest to tell, but we can't run it because the driver
| doesn't integrate with those kernel APIs.

So it is relatively known that the support is incomplete. But I still
think we should push for more reviewer insight into this driver by
having access to a selftest to get a clearer picture of how it behaves.
For that, we need the compliance to the common API.

Otherwise, I completely agree to the idea that any development should be
done incrementally on top of whatever already exists, instead of putting
a curtain on and then taking it back off.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
