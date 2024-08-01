Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26210945061
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Aug 2024 18:17:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7C09C7129D;
	Thu,  1 Aug 2024 16:17:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2736BC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2024 16:17:31 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428163f7635so46208655e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Aug 2024 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722529050; x=1723133850;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wQTuU6qR13EFs2NHQ6BL0OXr6g/v/sER4c6CH9DF12Q=;
 b=FKS2ZyB0O03KN32nj66A7MAhPVmpx896fqp3iQbfZGWlTl1NBuYFZB/mkYq2RPbUvi
 7BNcU0Vfb59ukFM8h/78FdhCBbI4hMqnwXu5nuEeR2WoLqtkYiVgQFxtkKdPDcedAyCR
 fUPmHLzfFnqJEGuQTgsxA00e4+kQwoaw01v3jhim+bftR49RLRCzhl5UMBMpqeYTAJvo
 wx9VlxQLv8AkEc8GXnJijBtMT2H9fcnPuDLdCPyCzUCTWVe8QoOBHtw8gfj3APUsalCq
 JCuWxQ3tHLI2j0CjrVLpl9d9aX0HCiulqrlsfa4duLGp921K++1Mc37D31M03dTHHPxr
 BPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722529050; x=1723133850;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQTuU6qR13EFs2NHQ6BL0OXr6g/v/sER4c6CH9DF12Q=;
 b=u6NW4AiUayerx1S5+h4fpIqIlL54zLAeV9xcjxa5tW2CG7KRlL7FjkIz5pHX2Y45NP
 +vRWY8h7Q9+tOAvtRLU8PgJsBu9SfErmqdMRv7dsZh80Fv5Bv7DonLipwVq4I0aDNJ1H
 NW7gvPDE7eciy65koeALnjlupwvb+O2M0ME0Dy2GUH1Iu6su00I5ZDtKifwfuuWU+ft1
 hYouHNYiOfJn/ztoujVLQ6SLmV6l/Tp5aLN7Erhj6Q8WtmvRfvTRTSZO+EPH7YG6ezz0
 rDI7ABKzzYuBC+Dt6/72RMZbbm9EKFGMMnO7c1d0rzT0rAOWljlV0WuYpRu1J6TWk7/Z
 sgXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIanLoc3qRsKRCju1XELu2wVNDqTjDKKGNmdeBqmVrWTAdlP2xOdnyKVVgzF6/BuQ3vbX6UhOqEy/5/rWX/7KzS3ce0deqhEZMIcqsTh+vGsyj7cwSJZSS
X-Gm-Message-State: AOJu0YzvnUnl4oxYVIbLfi4cYK3gdmrwl0YTnqs71+13kqNOoR2k24z8
 I3DcIMS3SPS5CH9GTP34vXKGBF//KmXf4Y1EnNl2tYkBpWMn9OFD
X-Google-Smtp-Source: AGHT+IGuLHUEFnctKFyPwjPEKmH5d3EB5yKodwzaywc+e/ly12Fwykc2aBaSwkWpDaN1Zd26GPaDsw==
X-Received: by 2002:a05:600c:524f:b0:428:14b6:ce32 with SMTP id
 5b1f17b1804b1-428e6aefb96mr3406355e9.9.1722529050114; 
 Thu, 01 Aug 2024 09:17:30 -0700 (PDT)
Received: from skbuf ([188.25.135.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6d6b935sm2036285e9.6.2024.08.01.09.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 09:17:29 -0700 (PDT)
Date: Thu, 1 Aug 2024 19:17:26 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240801161726.mhyv6af43ync7q56@skbuf>
References: <cover.1722421644.git.0x1207@gmail.com>
 <20240801160224.4f54tanxs5dz5hwq@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801160224.4f54tanxs5dz5hwq@skbuf>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 0/5] net: stmmac: FPE via
	ethtool + tc
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

On Thu, Aug 01, 2024 at 07:02:24PM +0300, Vladimir Oltean wrote:
> Hi Furong,
> 
> On Wed, Jul 31, 2024 at 06:43:11PM +0800, Furong Xu wrote:
> > Move the Frame Preemption(FPE) over to the new standard API which uses
> > ethtool-mm/tc-mqprio/tc-taprio.
> 
> Thanks for working on this! I will review it soon.
> 
> On the DWMAC 5.10a that you've tested, were other patches also necessary?
> What is the status of the kselftest? Does it pass? Can you post its
> output as part of the cover letter?

Can you additionally test FPE across a suspend/resume cycle, in 2 cases:
- FPE was enabled before suspend, make sure it runs again automatically
  after resume, and that there are no deadlock issues (to be confirmed
  with CONFIG_PROVE_LOCKING)
- FPE was disabled before suspend, make sure it can be enabled successfully
  after resume
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
