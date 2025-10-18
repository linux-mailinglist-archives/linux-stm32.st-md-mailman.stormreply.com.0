Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F3BEC378
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Oct 2025 03:24:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2922C36B30;
	Sat, 18 Oct 2025 01:24:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3442BC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 01:24:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 06513604C6;
 Sat, 18 Oct 2025 01:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EB2C4CEFE;
 Sat, 18 Oct 2025 01:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760750640;
 bh=VZ+0PK7Xowje368lQGozH1qMIaGZqErCNscmB4ue3mY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SuH8G0SFf8tnTa5DujFZD38xFGUFaxQuFoKV51uK4JH1z7LFyPmflJHVuSnJ8FrWC
 AO3b/oG0nZu8YZG2uxVcRtARPIAN0jBNn7tZOoeymv06i36LKIxB3Lfpcfoss8KqxN
 erm/41d9xXprtVZePAzU9m8ygIk8Xi/qlI3JJqYBa4Xg0JTip9jUrADT/srN4SlXZ9
 qMv4A+Py4QrSFDUBy436rj9bXzEpBOfm87/3JqL9mg0vhOhXePQuc0QXAADLQMSZQH
 HHg5++uP8wvG24Ume/bZ3TaZyHvVVc0lIGSNyVLq656h5A28f+S46Y9g1Mdy/SYcrH
 Kbztuc1thO0qg==
Date: Fri, 17 Oct 2025 18:23:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20251017182358.42f76387@kernel.org>
In-Reply-To: <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow
 supporting coarse adjustment mode
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

On Wed, 15 Oct 2025 12:27:22 +0200 Maxime Chevallier wrote:
> The DWMAC1000 supports 2 timestamping configurations to configure how
> frequency adjustments are made to the ptp_clock, as well as the reported
> timestamp values.
> 
> There was a previous attempt at upstreaming support for configuring this
> mode by Olivier Dautricourt and Julien Beraud a few years back [1]
> 
> In a nutshell, the timestamping can be either set in fine mode or in
> coarse mode.
> 
> In fine mode, which is the default, we use the overflow of an accumulator to
> trigger frequency adjustments, but by doing so we lose precision on the
> timetamps that are produced by the timestamping unit. The main drawback
> is that the sub-second increment value, used to generate timestamps, can't be
> set to lower than (2 / ptp_clock_freq).
> 
> The "fine" qualification comes from the frequent frequency adjustments we are
> able to do, which is perfect for a PTP follower usecase.
> 
> In Coarse mode, we don't do frequency adjustments based on an
> accumulator overflow. We can therefore have very fine subsecond
> increment values, allowing for better timestamping precision. However
> this mode works best when the ptp clock frequency is adjusted based on
> an external signal, such as a PPS input produced by a GPS clock. This
> mode is therefore perfect for a Grand-master usecase.
> 
> We therefore attempt to map these 2 modes with the newly introduced
> hwtimestamp qualifiers (precise and approx).
> 
> Precise mode is mapped to stmmac fine mode, and is the expected default,
> suitable for all cases and perfect for follower mode
> 
> Approx mode is mapped to coarse mode, suitable for Grand-master.

I failed to understand what this device does and what the problem is :(

What is your ptp_clock_freq? Isn't it around 50MHz typically? 
So 2 / ptp_freq is 40nsec (?), not too bad?

My recollection of the idea behind that timestamping providers
was that you can configure different filters for different providers.
IOW that you'd be able to say:
 - [precise] Rx stamp PTP packets 
 -  [approx] Rx stamp all packets
not that you'd configure precision of one piece of HW..

If the HW really needs it, just lob a devlink param at it?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
