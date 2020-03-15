Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B1185EEF
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2020 19:25:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22504C36B0B;
	Sun, 15 Mar 2020 18:25:17 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44C59C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 18:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=powrQRe80aGxECCk+dtKXN3HLIybmgxMPcgaJHiSaLo=; b=dAcfOEZLeXaGsh5vQBzTzYpWwQ
 QoBvIvwFJzEm7lg/gI+jxgbSj+tKI67zGiWkn2sB/cov0fXbMtF1TkZOn2UjLqKuMsIVoUZAgeqwq
 l/ChR1erxzLionAxTCXDjevryHRoejIn+qRqTo7H8NmWNNkTO2OIFi0ilnDo6ULD+noQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jDXwe-0002FB-B9; Sun, 15 Mar 2020 19:25:04 +0100
Date: Sun, 15 Mar 2020 19:25:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dejin Zheng <zhengdejin5@gmail.com>
Message-ID: <20200315182504.GA8524@lunn.ch>
References: <20200315150301.32129-1-zhengdejin5@gmail.com>
 <20200315150301.32129-2-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315150301.32129-2-zhengdejin5@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] net: stmmac: use
 readl_poll_timeout() function in init_systime()
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

On Sun, Mar 15, 2020 at 11:03:00PM +0800, Dejin Zheng wrote:
> The init_systime() function use an open coded of readl_poll_timeout().
> Replace the open coded handling with the proper function.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v1 -> v2:
> 	- no changed.
> 
>  .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> index 020159622559..2a24e2a7db3b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> @@ -10,6 +10,7 @@
>  *******************************************************************************/
>  
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/delay.h>
>  #include "common.h"
>  #include "stmmac_ptp.h"
> @@ -53,8 +54,8 @@ static void config_sub_second_increment(void __iomem *ioaddr,
>  
>  static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
>  {
> -	int limit;
>  	u32 value;
> +	int err;
>  
>  	writel(sec, ioaddr + PTP_STSUR);
>  	writel(nsec, ioaddr + PTP_STNSUR);
> @@ -64,13 +65,10 @@ static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
>  	writel(value, ioaddr + PTP_TCR);
>  
>  	/* wait for present system time initialize to complete */
> -	limit = 10;
> -	while (limit--) {
> -		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSINIT))
> -			break;
> -		mdelay(10);
> -	}
> -	if (limit < 0)
> +	err = readl_poll_timeout(ioaddr + PTP_TCR, value,
> +				 !(value & PTP_TCR_TSINIT),
> +				 10000, 100000);
> +	if (err)
>  		return -EBUSY;

Hi Dejin

It is normal to just return whatever error code readl_poll_timeout()
returned.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
