Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 001EEBA809B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Sep 2025 07:57:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54E37C3F92F;
	Mon, 29 Sep 2025 05:57:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0F8AC36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Sep 2025 00:26:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9719061FAB;
 Sat, 27 Sep 2025 00:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A27C4CEF4;
 Sat, 27 Sep 2025 00:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758932773;
 bh=ldQkQDaE7kzwJlWbrIdbMhU3peP+xUqWXqOsC0kAejY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bJmDaiJA3Sy8PeR9f0QUdQK3FN51BDqZafta3nVKF/8ArMCpUJyzulo+fcR6GHF1X
 D2dFWz9JPOHN2yUo7K1owfpk4OOiVicLQ1AI6T7vC5lakv6jYXe8hDY7FVcdGxqRk1
 rI/WWrwib7y1xCQTcHiBh24N9OzKd0Vi1JpOIG+GSIA6B1JMQn7TytisiJdZbmJK5y
 +0M8K9eSkfj5bxCR7RBrnFbgzPQBXMreZN8ywTTYUGpM7Pm5WPnFZv3KTkv90b0Kvc
 mTXgvW/6DgXEuambGU9TFbYw0xy1ZZgmm95nP5+0i8/roPnOMp7BiQ1+wD8DD5V+rB
 5JNNKW+YlNSyg==
Date: Fri, 26 Sep 2025 17:26:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20250926172611.32d60205@kernel.org>
In-Reply-To: <20250924152217.10749-1-0x1207@gmail.com>
References: <20250924152217.10749-1-0x1207@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Sep 2025 05:57:42 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Convert open-coded
 register polling to helper macro
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

On Wed, 24 Sep 2025 23:22:17 +0800 Furong Xu wrote:
>  	writel(addend, ioaddr + PTP_TAR);
>  	/* issue command to update the addend value */
> @@ -144,23 +143,15 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
>  	writel(value, ioaddr + PTP_TCR);
>  
>  	/* wait for present addend update to complete */
> -	limit = 10;
> -	while (limit--) {
> -		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
> -			break;
> -		mdelay(10);
> -	}
> -	if (limit < 0)
> -		return -EBUSY;
> -
> -	return 0;
> +	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
> +				!(value & PTP_TCR_TSADDREG),

Why the strange alignment ? I think you can start the continuation line
under the opening bracket and still easily fit in 80 chars?

> +				10, 100000);

You say in the commit message "no functional changes intended"
but you changed the frequency of polling from 10msec to 10usec.
Seems like a reasonable change, but the commit message is lying.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
