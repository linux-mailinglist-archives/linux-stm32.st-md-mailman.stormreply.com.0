Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC674AC00
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 22:43:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C8ABC0754A
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 20:43:11 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7FBDC0754A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 20:43:08 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id l15so7235523otn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 13:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyVmAgn2/ADZTeFvTvc5soQ9bwH2xTxtcHLwxv1lczw=;
 b=qa1wjVgI5rCT8ZKRcGF119YgCb/1p+uRb2IXiLAELUbmvypJNrkJKmdXVKbHWPNKc7
 kL5DmRPCHoXkd78jv4xuO06ZrFt5G8Kx8mvjb4CcEDPYTjQmBpCcJXtqgCJEE4pWq4sP
 1RzSc/9FHA7hI9rHoAUBNTY2wWtB+jKOubmvsByOLwOdbgyQZyyHntZjd6+8LkpXIXTi
 jZRBWRG6R6QvKIa0IGYysZ3MsX9E4eY+JZ1rrgqiAUwVOFIbZenlNkh7GgUwGO7JRuq0
 vHvHrsqZaDY9Sy8mG6vDSrudEZDKts9sd7RWptF1lO4SDVpbLuIInXC77PNaMb+9cFUT
 FUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyVmAgn2/ADZTeFvTvc5soQ9bwH2xTxtcHLwxv1lczw=;
 b=gp6AhREspKLFplz19irMBGg5sdFytOCuDF0T/GhFjMyzgsciPMFNJsernOSeddAC7S
 5YBM2ZRCsMI5gKFp4X0k1C8HWJ9bCksg/cxHu68zNgOMb+05f6KC3SbFvBlxaTvRLnYN
 eeDGTLcbNU06HSKfHd3y5Z3NTCcsJN0iMhA1KF4qzKbSt6gPEcLaDgJnhPQN6mOGCz44
 jsVAMyW6BAEMev8txvvfhXJVsrPG9twBBDu7Pgk9zwPp7xf/83qejyo37M2WeRWuoIsV
 Hm/gAuGtnVyBmXrtfjM5iA1nLMS0Ht95l9/rLfbg366s3F3cLMPyqQxQu4GP0KCVGW6C
 yhyA==
X-Gm-Message-State: APjAAAXkD1auOE6fpv6tnxC5AIyXoHf+H3qo4XrWboMHGuJOw+YdL+sL
 iEb0nzjpuGsCylS9X3QSysDrtvwXQYreKGr8f+M=
X-Google-Smtp-Source: APXvYqx3uypgm5u60182DZP002f1pXqni8MBRmNseHSnue/Gn6NM0Z6mwoXhO4bu4UBXMRrIuhYQlNWFgrS8bSAw4yQ=
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr23888615otb.81.1560890584820; 
 Tue, 18 Jun 2019 13:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <5d089fb6.1c69fb81.4f92.9134@mx.google.com>
 <7hr27qdedo.fsf@baylibre.com>
In-Reply-To: <7hr27qdedo.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 18 Jun 2019 22:42:53 +0200
Message-ID: <CAFBinCCrpQNU_JtL0SwEGbwWZ2Qy-b2m5rdjuE0__nDRORGTiQ@mail.gmail.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jose Abreu <joabreu@synopsys.com>, "kernelci.org bot" <bot@kernelci.org>,
 tomeu.vizoso@collabora.com, Andrew Lunn <andrew@lunn.ch>,
 guillaume.tucker@collabora.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 broonie@kernel.org, matthew.hart@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, mgalka@collabora.com,
 enric.balletbo@collabora.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] next/master boot bisection: next-20190617 on
	sun8i-h2-plus-orangepi-zero
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

On Tue, Jun 18, 2019 at 6:53 PM Kevin Hilman <khilman@baylibre.com> wrote:
[...]
> This seems to have broken on several sunxi SoCs, but also a MIPS SoC
> (pistachio_marduk):
>
> https://storage.kernelci.org/next/master/next-20190618/mips/pistachio_defconfig/gcc-8/lab-baylibre-seattle/boot-pistachio_marduk.html
today I learned why initializing arrays on the stack is important
too bad gcc didn't warn that I was about to shoot myself (or someone
else) in the foot :/

I just sent a fix: [0]

sorry for this issue and thanks to Kernel CI for even pointing out the
offending commit (this makes things a lot easier than just yelling
that "something is broken")


Martin


[0] https://patchwork.ozlabs.org/patch/1118313/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
