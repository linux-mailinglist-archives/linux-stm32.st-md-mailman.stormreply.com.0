Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FFB11E14F
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2019 10:58:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C4D2C36B0B;
	Fri, 13 Dec 2019 09:58:08 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01D0DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 09:58:05 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k8so1966315ljh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQvjoAIq1lwY1cihw0edTlVsvS4hblrvKhZLt2o7yRo=;
 b=U/gCvQa0C8fp3iVKJhx0vBUt0PKFuNFM6SSSB6ihOGiYf8DrW7iq+1YekeCTTxXOVW
 wA9kO32dpsd0uQM8TAz8UtneQN+P/STd9y7C3oklU8IKWKq4HLmauGD6BnpmZ7iDuZng
 SQo0ak1qNqQdQLAdjdJpaRZMNsmlbROrTck2PxWSMWA1pEXtJHWUll0tFoE44sU342Nf
 +iVXD4rDz2GqEaL+j34YCkxDq6MgJkT5saOWL12O+djrWRrzFUS/8TEWdE85vTOOgq0/
 p+FTg/6IfT6Yw6EICXB0kxMXmQY+b4urp1jV9t48Nuj+ruxYKT1BlDjg1hghnJZ+lVvZ
 t1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQvjoAIq1lwY1cihw0edTlVsvS4hblrvKhZLt2o7yRo=;
 b=Fg7hMEulhVqvX1x3QIhBxIoTWTf1ogNhaA4Gk/1YYfS7Es2PtpNBcIRaacpAqsOL0L
 kTxdgkGPjGIyH24cYr7CjoMLBGRmf0iFxP3ncLFSThZmDRU7tnTSpjuKapNImEwA98G/
 82GqltkZuCxoLHHyn52+YQCkUMr6l4gd4PZJ6n+BUSuvwH/XFLiThMuUmLI4wG2iZ1sy
 64IaeaKiyxgSKJuZM7j1JIhEsn2DPX5KFqRRYR2Ex6O6aDcw+Xt8KMYnbTGzxn9Xainf
 Ug63LZvlOi+6HycPB2Is6PegyVyAjkXVMiRMHk6+uvXnS9MC1eD95nCkYzgyMgCCpajn
 MSjA==
X-Gm-Message-State: APjAAAXjh4zErx90hcptcuBAUbjQBUDyA/zPTI95s/REDvQyMnW56YBD
 XKossWWU8NR81a/YT2XY4EvKyzI7/rRWrhuUfUuj9g==
X-Google-Smtp-Source: APXvYqzu8HOUUFv2+ceRlEgeqgx8XNvHnW+7dom4XrnAzRcH0CCbokozbEW15A+wcVH7XZt92FtVTGxMTi9B00CIqHI=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr9102521ljk.77.1576231085018;
 Fri, 13 Dec 2019 01:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20191204144106.10876-1-alexandre.torgue@st.com>
In-Reply-To: <20191204144106.10876-1-alexandre.torgue@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Dec 2019 10:57:53 +0100
Message-ID: <CACRpkdb30kFbpxb52GALXJM67tFvJ8tR83NR+44PMOKJzJjruQ@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: pinmux: fix a possible null
	pointer in pinmux_can_be_used_for_gpio
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

On Wed, Dec 4, 2019 at 3:41 PM Alexandre Torgue <alexandre.torgue@st.com> wrote:

> This commit adds a check on ops pointer to avoid a kernel panic when
> ops->strict is used. Indeed, on some pinctrl driver (at least for
> pinctrl-stmfx) the pinmux ops is not implemented. Let's assume than gpio
> can be used in this case.
>
> Fixes: 472a61e777fe ("pinctrl/gpio: Take MUX usage into account")
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
