Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C295DB495F2
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Sep 2025 18:47:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D8E3C3F959;
	Mon,  8 Sep 2025 16:47:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83FCEC3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Sep 2025 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=/u5AQIai1HRb95AsGPoewpc6br1Ojaok+gPX0CM2nPk=; b=XDx42iKzbJgFG3SaKLMOrBIAxg
 tF3l44SeFJoymz52z7ZeoAUiGqJ/PHjQ5zGYCfDA+3ESGhX+X7TPT0Q0HWVmhZxE0/RHYe9RRoWvk
 txvOed+HKGL1WO2knB5FIYLdzGzAmTAPg0Fa31UH0Cu8yqTMyvTWjtmM39hXUw7hTgbc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uvf1a-007gqz-2I; Mon, 08 Sep 2025 18:47:26 +0200
Date: Mon, 8 Sep 2025 18:47:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Message-ID: <c3183a23-21da-435d-b599-7003ae7ba79b@lunn.ch>
References: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
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

On Fri, Sep 05, 2025 at 07:06:50PM +0300, Sergey Shtylyov wrote:
> In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
> and if stmmac_config_sub_second_increment() fails to set it to some non-0
> value, the following div_u64() call would cause a kernel oops (because of
> the divide error exception).  Let's check sec_inc for 0 before dividing by
> it and just return -EINVAL if so...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: df103170854e ("net: stmmac: Avoid sometimes uninitialized Clang warnings")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> The patch is against the master branch of Linus Torvalds' linux.git repo.

Wrong tree. Please see:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

This also needs reviewing by somebody who know the STMMAC
hardware. There is a comment:

	/* For GMAC3.x, 4.x versions, in "fine adjustement mode" set sub-second
	 * increment to twice the number of nanoseconds of a clock cycle.
	 * The calculation of the default_addend value by the caller will set it
	 * to mid-range = 2^31 when the remainder of this division is zero,
	 * which will make the accumulator overflow once every 2 ptp_clock
	 * cycles, adding twice the number of nanoseconds of a clock cycle :
	 * 2000000000ULL / ptp_clock.

So i'm wondering if the subsecond adjustment is sufficient, the
sec_inc might be zero, and rather than returning an error, the
hardware just needs programming differently?

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
