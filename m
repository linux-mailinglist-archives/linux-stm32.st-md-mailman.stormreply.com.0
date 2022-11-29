Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD763C723
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 19:26:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 370FFC6507C;
	Tue, 29 Nov 2022 18:26:04 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30428C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=cy0Wc6FUl5cpTdVMiVOmfG61yLTXh8RJczd8KP8IoZA=; b=keVuLupjCmT6F9EPe36KrGtKkD
 LG5B2kQ3QljwPULHTAUg4iugMd1EkEVtyt2Jav4kfKeTdbsPdpp/svvkSm14nJG7SKd0vEJUMYC+y
 RvAMNfCW51VkEyDSO04sth7+Bs+os9FqGE0LnCC0uZGjwmojEWMmD5FTI0rii0WD8tPw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1p05Ib-003twF-QX; Tue, 29 Nov 2022 19:25:41 +0100
Date: Tue, 29 Nov 2022 19:25:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: yang.yang29@zte.com.cn
Message-ID: <Y4ZOpQL3daLPqXXl@lunn.ch>
References: <202211291502286285262@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202211291502286285262@zte.com.cn>
Cc: xu.panda@zte.com.cn, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH linux-next v2] net: stmmac: use
 sysfs_streq() instead of strncmp()
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

On Tue, Nov 29, 2022 at 03:02:28PM +0800, yang.yang29@zte.com.cn wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
> 
> Replace the open-code with sysfs_streq().
> 
> ---
> change for v2
>  - fix the mistake of redundant parameter.

> -		} else if (!strncmp(opt, "tc:", 3)) {
> +		} else if (sysfs_streq(opt, "tc:")) {
>  			if (kstrtoint(opt + 3, 0, &tc))
>  				goto err;

Vladimir made the comment:

> What's even worse is that the patch is flat out wrong. The stmmac_cmdline_opt()
> function does not parse sysfs input, but cmdline input such as
> "stmmaceth=tc:1,pause:1". The pattern of using strsep() followed by
> strncmp() for such strings is not unique to stmmac, it can also be found
> mainly in drivers under drivers/video/fbdev/.
> 
> With strncmp("tc:", 3), the code matches on the "tc:1" token properly.
> With sysfs_streq("tc:"), it doesn't.

It is not clear you have addressed this point.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
