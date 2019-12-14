Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F1B11F3F5
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2019 21:28:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D86AEC36B0B;
	Sat, 14 Dec 2019 20:28:43 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B6ACC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2019 20:28:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id h14so1469533pfe.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2019 12:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=XaEVbBb580dizOkGCrPl3aky5kExYp09pR6s9oLfxlg=;
 b=gV1zMRDtDbnkngwtuQVwVmMdqJd0MOI0fNpU6Ahcqv24gDsTZqN7er/XEdhNFOIG2s
 Xefw1oqnnTQsDc4ng5Cy8vViWduwKTiEG5+r2soBzQ+XgrMccITVnWoUgRcZEvMN0qhF
 SyHwqKAw1126RdW6AkgKomQJestodaeQcGWLNA8Bo1YfcUDcUzm+IjAPhyyqM5sSU/UT
 pJvQh3SP0tVr3+ISCV7EJ15wzggPTmxXP2qAuC9n5g29422zcnRupqNxkgq3N913afDE
 yXlkrVCfPIQ3jUx6d5ySjT1pE0hJJRqikGo7Tf4wmiA88gVODXzbye5eaUYDTV1LIx6W
 hQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=XaEVbBb580dizOkGCrPl3aky5kExYp09pR6s9oLfxlg=;
 b=AaI3/bSWP6QN4YsIQSRvxaXFJSqXYVSN0qu1z96ygXNS2OgSM3OojQlG7SU0LtfguL
 CMamVJPeKmd8hAqoQ6DE4gSAqId6RNmRAzwnzrDu/TVFqUL6ggAbgiye2LW+PGqzX+vy
 Sr53R9hdhnDqkUq/vMydY/KdSTjbe4sdlhzTQOK8NrBGRCgKtT8AgKU6IxAJuXI+tXwK
 j/kfE9oPqmJTtPl8f93if/GBQABlyh02ga6x3UW5ljzF3z4xxUfdbGZ07Yna5f+tSw5d
 +yeZoKE8QGHDh4zk7lgqfTx7NPaIZiYtP8sswBf5ayHcPzWZ1UMdt5fah+XkYDSaOLNR
 igaw==
X-Gm-Message-State: APjAAAViPUIfRRF6Jaw3okCaPSzE2tit/D6TbhWPrqrypKdRgy1+3yDw
 aMDooGKiBQJ8tA0EpTIaD2/jzg==
X-Google-Smtp-Source: APXvYqz7r5mvCKhiJymgkgcgt9xu5gMGoR9VG64DTQi7xuM3hxBSuiZTj0eQuUJtNFn0EbRE+cxYuw==
X-Received: by 2002:a62:6342:: with SMTP id x63mr7050443pfb.103.1576355320580; 
 Sat, 14 Dec 2019 12:28:40 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id t63sm16959694pfb.70.2019.12.14.12.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2019 12:28:40 -0800 (PST)
Date: Sat, 14 Dec 2019 12:28:37 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20191214122837.4960adfd@cakuba.netronome.com>
In-Reply-To: <23c0ff1feddcc690ee66adebefdc3b10031afe1b.1576007149.git.Jose.Abreu@synopsys.com>
References: <cover.1576007149.git.Jose.Abreu@synopsys.com>
 <23c0ff1feddcc690ee66adebefdc3b10031afe1b.1576007149.git.Jose.Abreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Always use TX
 coalesce timer value when rescheduling
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

On Tue, 10 Dec 2019 20:54:44 +0100, Jose Abreu wrote:
> When we have pending packets we re-arm the TX timer with a magic value.
> Change this from the hardcoded value to the pre-defined TX coalesce
> timer value.

s/pre-defined/user controlled/ ?

> Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>
> ---
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f61780ae30ac..726a17d9cc35 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1975,7 +1975,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue)
>  
>  	/* We still have pending packets, let's call for a new scheduling */
>  	if (tx_q->dirty_tx != tx_q->cur_tx)
> -		mod_timer(&tx_q->txtimer, STMMAC_COAL_TIMER(10));
> +		mod_timer(&tx_q->txtimer, STMMAC_COAL_TIMER(priv->tx_coal_timer));

I think intent of this code is to re-check the ring soon. The same
value of 10 is used in stmmac_tx_timer() for quick re-check.

tx_coal_timer defaults to 1000, so it's quite a jump from 10 to 1000.

I think the commit message leaves too much unsaid.

Also if you want to change to the ethtool timeout value, could you move 
stmmac_tx_timer_arm() and reuse that helper?

>  
>  	__netif_tx_unlock_bh(netdev_get_tx_queue(priv->dev, queue));
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
