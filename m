Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F78106D9
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Dec 2023 01:43:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65FE8C6C85B;
	Wed, 13 Dec 2023 00:43:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74515C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Dec 2023 00:43:14 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a1ceae92ab6so843353466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 16:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702428194; x=1703032994;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZKL5eU2NB9nJqOzdxObiNjRSKS27RY2ubeT3N5kNB70=;
 b=jKi3dIuSY7DfTPcWhIsellUMP5SkZvor0UdSHCd0r5JqPMUBrOBaqXdzi0lb2NNrXk
 KwFzRy6ZFEitWvq1bW9bEfTXsSyebF7wp0PmUH4V1WmL69/p8IsbFPb9Pss/a4m/yy4T
 qr+8Qm1II2s4wTojXYxJeha1h3rJoWfv8dZKV42PUjbu5T6XFDP7WmM0igxku3+PXXtw
 DKCP2ldPYHU316qcfpX59PU2cGoTRX5i/heXjNEejGWCsuOMTtPRUNQqHjhokDz/a3P/
 REmwbaBKR9GtVonMWapnrWHsiEhXTD8UPSWfavwbjAS08l/kTMeWkv+s7i0xoN6FFKoC
 w8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702428194; x=1703032994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZKL5eU2NB9nJqOzdxObiNjRSKS27RY2ubeT3N5kNB70=;
 b=JmrBCQLYFxTKV2x1/yO8bsxQjETHsGg1utFFK4r6pkzFXqMn5p4sHYElr6YQoJviBh
 /PLFlr4Zk3uCiCa9AchKybQQgPXQ0kLpUGfg02HX3CvIHA1RzSlGvufKrmfqYT5pDQ/Y
 yljvZAaPulRg8tN7yqHHTYYADfWIz53TpPGfSiG0qY/WTuYZ5P89P5KtttU0Lk9X0GQx
 80BfPNVm8VClgJXeRAmRRwR2jL2Y0PRbqlYM7c3u3hm7YqVZRirTX+cJve7auYgz5q+U
 W6kUyxAVwbucyKdBIZlcz8NG0XmN2DLi6frLcmpXf3nfJz283C306rw+Kaujsw/9Mr0+
 5jjQ==
X-Gm-Message-State: AOJu0YwjK0kq25RTpIKOhTOLaAQrCDJXFdHZROgq6ennIVBAAMkEH0Wb
 xFiAaeMDoRJ4gKSgjQS1aLE=
X-Google-Smtp-Source: AGHT+IE1ckr/Y+WwdH+1D99jBFmc9XRkamDadSJaJHL2vvr9zcPVxjWSaHcDF9Lfh65WvRBKX2UHFg==
X-Received: by 2002:a17:907:962a:b0:a1d:53d8:427e with SMTP id
 gb42-20020a170907962a00b00a1d53d8427emr4227324ejc.119.1702428193557; 
 Tue, 12 Dec 2023 16:43:13 -0800 (PST)
Received: from skbuf ([188.27.185.68]) by smtp.gmail.com with ESMTPSA id
 vq2-20020a170907a4c200b00a22faee6649sm119305ejc.117.2023.12.12.16.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:43:13 -0800 (PST)
Date: Wed, 13 Dec 2023 02:43:11 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <20231213004311.nptkcubaxuiineec@skbuf>
References: <CY5PR12MB63727C24923AE855CFF0D425BF8EA@CY5PR12MB6372.namprd12.prod.outlook.com>
 <20231212152347.167007f3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212152347.167007f3@kernel.org>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, James Li <James.Li1@synopsys.com>,
 Eric Dumazet <edumazet@google.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Martin McKenny <Martin.McKenny@synopsys.com>
Subject: Re: [Linux-stm32] [PATCH v2 net-next] net: stmmac: xgmac3+: add FPE
 handshaking support
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

On Tue, Dec 12, 2023 at 03:23:47PM -0800, Jakub Kicinski wrote:
> On Tue, 12 Dec 2023 14:05:02 +0000 Jianheng Zhang wrote:
> > Adds the HW specific support for Frame Preemption handshaking on XGMAC3+
> > cores.
> > 
> > Signed-off-by: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
> 
> I defer to Vladimir on whether to trust that the follow up with
> the ethtool API support will come later (and not require rewrite
> of existing code); or we should request that it's part of the same
> series.
> -- 
> pw-bot: needs-ack
> 

Here's the thing - my understanding of what Synopsys is doing is that
they use TC_TAPRIO_CMD_SET_AND_HOLD and TC_TAPRIO_CMD_SET_AND_RELEASE
as implicit hints to the stmmac driver that FPE should be enabled.

Hold/Release is merely one use case for frame preemption. The "fp"
argument in the tc framework gives you access to the rest: preemption
without scheduling, preemption with scheduling but without hold/release.

And the ethtool-mm framework gives you compatibility with LLDP, so you
can adjust the minimum fragment sizes according to the link partner.
Roger Quadros is adding am65-cpsw support for FPE using the generic
framework, and the TI device has an erratum that the minimum fragment
size that can be received cannot be lower than 124 bytes. LLDP allows
link partners to discover that and still interoperate - which is very
important, because if first-gen TSN hardware, with all its pre-standard
quirks, does not deliver, there may not be a second-gen.

By using LLDP, you can also enable the FPE handshake based on user space
input - when the LLDP daemon gets an LLDPDU with an Additional Ethernet
Capabilities TLV, rather than during each and every stmmac_mac_link_up(),
and hoping for someone to respond. Depending on your hardware design,
this can even lead to power savings, because you can power on your pMAC
only when LLDP says the link partner is also capable, and it will be required.

Ethtool also gives you the ability to report standardized stats per eMAC
and per pMAC, and standardized stats for the MAC Merge layer itself.

Also, the FPE state machine from the stmmac driver is so chatty and
spams the kernel log so bad, because it has nowhere else to report its
current (fragile) state. The ethtool MAC Merge layer gives the driver
a way to report its verification state ("FPE Handshake" as Synopsys
calls it) in a standardized enum.

A small note that the mainline iproute2 does not even expose the
TC_TAPRIO_CMD_SET_AND_HOLD and TC_TAPRIO_CMD_SET_AND_RELEASE netlink
attribute values. To quote from the manpage (which is not out of date
with the code; I checked - again): 'The only supported <command> is "S",
which means "SetGateStates"'.

So I can only guess that Synopsys and anyone else who wants to turn on
FPE on stmmac has to patch their iproute2. A Github code search made me
land here:
https://github.com/altera-opensource/meta-intel-fpga-refdes/blob/7b050ca9968f5ff71598e86bb3a10bb8e011439c/recipes-connectivity/iproute2/iproute2/0003-taprio-Add-support-for-the-SetAndHold-and-SetAndRele.patch

In principle there's nothing wrong with not sharing patches on community
software with the rest of the world. But I cannot help but get the
impression that stmmac support for FPE is abandonware / extremely low
priority / code written to tick the boxes. It's not in the best state
even in the "good" case where the XGMAC3+ support gets accepted.
Jianheng, please contradict me by showing what testing is currently
conducted with this implementation. If none or close to that, let's get
it to a more "observable" state, where at least others' tests could be
reused.

Even this very patch is slightly strange - it is not brand new hardware
support, but it fills in some more FPE ops in dwxlgmac2_ops - when
dwxgmac3_fpe_configure() was already there. So this suggests the
existing support was incomplete. How complete is it now? No way to tell.
There is a selftest to tell, but we can't run it because the driver
doesn't integrate with those kernel APIs.

There are long periods of radio silence from Synopsys engineers in upstream,
and as maintainers we simply don't know what stmmac's FPE implementation
does and what it doesn't do. If a future user gets into trouble, having
a "known good" bisection point, by means of a selftest that passes, is
going to allow even non-expert maintainers like us provide some help,
even if Synopsys engineers go radio silent again.

It may be that Jianheng just needs a little nudge to help the management
prioritize, by getting a NACK. It's a simple "help us help you" situation:
the framework is there and it is a gateway for better Linux user space
support for your platform, you just need to use it. And what better time
to integrate with new API than with new hardware... :) Because it's not
as if FPE on XGMAC3+ ever worked in mainline given my reading of the code.
So why would users not start learning to use it with what is becoming
the common tool set for everybody else.

Allow me to change the "needs-ack" into:

pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
