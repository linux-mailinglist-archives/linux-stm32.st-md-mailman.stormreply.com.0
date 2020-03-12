Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD26183643
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2020 17:37:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F855C36B0E;
	Thu, 12 Mar 2020 16:37:41 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93CC1C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 16:37:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g62so7102880wme.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 09:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KLvR3Pv/VwwdNVMVEz53VHzZpwW5bYvxWCFzM4Vnud4=;
 b=CzukxYm//beRotTxT2Qf+ERZzXI1VAI7lJNakQoHciY8x9FJXbvEdagxVxd72auQHD
 L/CVnNVF/F+15+hV+B5JiAc2sJHtwVDSHuj3QqDU+F0hVyNyVMvMcfA/YJUP1LmIr1PU
 usV2f1cx6hiPfVfeHBAMOM+cCR2A+Qr3TE0wM7PGejfxLm9umejsmE4kSK53w7TzBVNO
 y/3ZhQjL1Svvb13zHh2Vksf/Sjj1CXg9zxX34hpnJU2wrAEOMfd+za6Xzz2q3OIr+xts
 Mz8JSJRhjHi6EjqxYIoEo/YsJRQsrn5zIyPn4XRQS49dyqULZw22d1QGB/u4bghsMK2P
 1vQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KLvR3Pv/VwwdNVMVEz53VHzZpwW5bYvxWCFzM4Vnud4=;
 b=kGziwHP+ykcUHvaAbDsBZcXDXQareay/D03mWTUhcn6lyUQ5Fot6jsSNBpNDDBTAA5
 xEYD6nbJL1LwZSpbG6HWVRs6uqahrMIfX2Ue0AxE7dbBghNavRBV3x9zq8rxS3uwLQ4T
 vqtDECylnsa+Gndk0Usga+nWI4hDzNJsRMUDZnYYSQSLCKMk2PKMsfvnLcHy2sm/tGde
 ++xQI7NnjijYoAZAsKSX6Hg9PUBFfmkfZRKcawg5ZUgpAFFKwtVmlDMgRyew5A9qyNQa
 IFhjithQDfcf8LPjpzyikIRJvenutA8hZnHF+Q3+RGQtEi4m2fDdhRBHokQJtV3WJuTq
 zi6Q==
X-Gm-Message-State: ANhLgQ35Xf456Er8/y75tQjDreLASGa2a51aGOe3vgsjzMWdwUrk+Mex
 A6vFWbjBXY/9X6x3rIWWbTH/YmGmTN0DLpGK+v0=
X-Google-Smtp-Source: ADFU+vujZJQfx4KphaFkawHaVUhWqSnD+Jc07o1eQPnzLq4j7h7Sllg9lla+v7QtoWS4saFzOjAPrMn40v+CV+K24U8=
X-Received: by 2002:a05:600c:204:: with SMTP id
 4mr5394271wmi.112.1584031057921; 
 Thu, 12 Mar 2020 09:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200306163848.5910-1-mklntf@gmail.com>
 <20200311.230402.1496009558967017193.davem@davemloft.net>
In-Reply-To: <20200311.230402.1496009558967017193.davem@davemloft.net>
From: Markus Fuchs <mklntf@gmail.com>
Date: Thu, 12 Mar 2020 17:37:26 +0100
Message-ID: <CADv+quf+7Uh+-soXrN7kLnkre3dL6JACwRimN_KsuQ=01C84zw@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: platform: Fix misleading
	interrupt error msg
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

On Thu, 12 Mar 2020 at 07:04, David Miller <davem@davemloft.net> wrote:
>
> From: Markus Fuchs <mklntf@gmail.com>
> Date: Fri,  6 Mar 2020 17:38:48 +0100
>
> > Not every stmmac based platform makes use of the eth_wake_irq or eth_lpi
> > interrupts. Use the platform_get_irq_byname_optional variant for these
> > interrupts, so no error message is displayed, if they can't be found.
> > Rather print an information to hint something might be wrong to assist
> > debugging on platforms which use these interrupts.
> >
> > Signed-off-by: Markus Fuchs <mklntf@gmail.com>
>
> What do you mean the error message is misleading right now?
>
> It isn't printing anything out at the moment in this situation.

Hello,

the error messages are
[    1.206363] socfpga-dwmac ff700000.ethernet: IRQ eth_wake_irq not found
[    1.213023] socfpga-dwmac ff700000.ethernet: IRQ eth_lpi not found

I tried to explain this in my original post between the --- lines of the patch.
Maybe this was wrong, so I repost it.


On my cyclone V socfpga platform I get error messages after updating to
Linux Kernel 5.4.24

Starting kernel ...

Deasserting all peripheral resets
[    1.206363] socfpga-dwmac ff700000.ethernet: IRQ eth_wake_irq not found
[    1.213023] socfpga-dwmac ff700000.ethernet: IRQ eth_lpi not found

These interrupts don't matter for my platform and many other stmmac based
ones, as we can see by grepping for 'macirq'.

socfpga.dtsi:                   interrupt-names = "macirq";
socfpga.dtsi:                   interrupt-names = "macirq";
sun7i-a20.dtsi:                 interrupt-names = "macirq";
spear600.dtsi:                  interrupt-names = "macirq", "eth_wake_irq";
artpec6.dtsi:                   interrupt-names = "macirq", "eth_lpi";
rk322x.dtsi:                    interrupt-names = "macirq";
sun9i-a80.dtsi:                 interrupt-names = "macirq";
spear1310.dtsi:                 interrupt-names = "macirq";
spear1310.dtsi:                 interrupt-names = "macirq";
spear1310.dtsi:                 interrupt-names = "macirq";
spear1310.dtsi:                 interrupt-names = "macirq";
stih407-family.dtsi:            interrupt-names = "macirq", "eth_wake_irq";
stm32f429.dtsi:                 interrupt-names = "macirq";
sun6i-a31.dtsi:                 interrupt-names = "macirq";
meson.dtsi:                     interrupt-names = "macirq";
rk3288.dtsi:                    interrupt-names = "macirq", "eth_wake_irq";
sun8i-r40.dtsi:                 interrupt-names = "macirq";
sunxi-h3-h5.dtsi:               interrupt-names = "macirq";
spear3xx.dtsi:                  interrupt-names = "macirq", "eth_wake_irq";
lpc18xx.dtsi:                   interrupt-names = "macirq";
stm32h743.dtsi:                 interrupt-names = "macirq";
socfpga_arria10.dtsi:           interrupt-names = "macirq";
socfpga_arria10.dtsi:           interrupt-names = "macirq";
socfpga_arria10.dtsi:           interrupt-names = "macirq";
rv1108.dtsi:                    interrupt-names = "macirq", "eth_wake_irq";
spear13xx.dtsi:                 interrupt-names = "macirq", "eth_wake_irq";
stm32mp151.dtsi:                interrupt-names = "macirq";
ox820.dtsi:                     interrupt-names = "macirq", "eth_wake_irq";
sun8i-a83t.dtsi:                interrupt-names = "macirq";

So, in my opinion, the error messages are missleading. I believe
the right way to handle this would require more changes though. Some
kind of configuration information, telling which interrupts are required
by the platform and than conditionally call platform_get_irq_byname().
This would print an error message, if something is wrong, on the right
platforms and nothing at all on the others.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
