Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B7962F65
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 20:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A785BC6C855;
	Wed, 28 Aug 2024 18:10:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 990EFC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 18:10:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2E777AE2A1F;
 Wed, 28 Aug 2024 18:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12471C4CEC0;
 Wed, 28 Aug 2024 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724868647;
 bh=BLWFViZHyhfvUvUKzWyXSIKJCD0OeyNnNaETiXaafdA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z1sipsWpuNXKP+EOz6AL6w/fPKCe1izfUeP1TLDV4jTuBM8Pj5WwIHJZv/5wkVS5z
 fCAChL1rCsdgyblCaFMvYGC1soBs6KWFaWLkCJocYbXmltsjwOxeS5sSsU4cbA9kG/
 +iokNUm8LrSXg5Nm85d7OSywxmqqJGSjfbPAJryEHs6zlYK2OT/fPzLlXjbOVrVXXw
 33KIaV3vl08lsNHVR1EAZ/vlIN2sefXmfIoZagjtQvbapHyJpfYJgdNExUKjC5jPlA
 2jj4rn41vLLE9NH5gVZupLtUo5xV4HIPo4Wh0s84eJeF4Rs5XPG7sSbhoFaQcM5OP1
 RpmJnWcc/yPIA==
Date: Wed, 28 Aug 2024 11:10:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20240828111045.11dfc157@kernel.org>
In-Reply-To: <71deb322-4b54-4c1c-a665-d9de84ea9baf@kernel.org>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <6092e318-ae0c-44f6-89fa-989a384921b7@lunn.ch>
 <71deb322-4b54-4c1c-a665-d9de84ea9baf@kernel.org>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, linus.walleij@linaro.org,
 justin.chen@broadcom.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 samuel@sholland.org, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux@armlinux.org.uk, jernej.skrabec@gmail.com, wens@csie.org,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com, pabeni@redhat.com,
 ansuelsmth@gmail.com, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk,
 olteanv@gmail.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/13] net: Simplified with
	scoped function
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

On Wed, 28 Aug 2024 16:45:32 +0200 Krzysztof Kozlowski wrote:
> On 28/08/2024 16:32, Andrew Lunn wrote:
> > On Wed, Aug 28, 2024 at 11:23:30AM +0800, Jinjie Ruan wrote:  
> >> Simplify with scoped for each OF child loop and __free(), as well as
> >> dev_err_probe().
> >>
> >> Changes in v2:
> >> - Subject prefix: next -> net-next.
> >> - Split __free() from scoped for each OF child loop clean.
> >> - Fix use of_node_put() instead of __free() for the 5th patch.  
> > 
> > I personally think all these __free() are ugly and magical. Can it  
> 
> It is code readability so quite subjective. Jakub also rejected one of
> such __free() changes, so maybe all these cases here should be rejected?

Andrew's comments on refcounting on DT objects notwithstanding --
I do like the _scoped() iterator quite a bit, FWIW. I think it's one 
of the better uses of the auto-cleanup and local variable declarations.

Direct uses of __free() are more questionable in my opinion.

Using advanced constructs to build clean subsystem APIs is great,
sprinkling unreadable constructs to save LoC is what C++ is for. 
(Lets see how many people this offends ;))
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
