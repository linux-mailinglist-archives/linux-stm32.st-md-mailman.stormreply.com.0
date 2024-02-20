Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4E85B72E
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 10:21:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D53DC6A61D;
	Tue, 20 Feb 2024 09:21:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89D39C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 09:21:01 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512bce554a5so1810316e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 01:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708420861; x=1709025661;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fdhB/OebAUjm/AFv0XF6TY7b9nkZEns3B+QEhrz2u2s=;
 b=J+DqHWp6x59GPzu+M5PLbG9n6ESu+TxiK2a1PACfbt8Fdcw99vhMeXMgX+bFX/uM8d
 XNZLhCEvqNbc8e2kGmALVuBLeufMilAPd9pHecD5MNigHn9LHqaliWP3+5T8QHzSLPmj
 bzThYCFU66i31B6s2ixO+x+holEWnh18mRrmOs82Rqd0EWReLYmwZvMj4fmXCRqMt9tf
 meUVIC+BeGx3ToAfn9UPniXo54qab2pCFqhKUeiRpfFx34IqrqQrTx/IN6ukna/Q6fZc
 qmGyD69YuX8TE/bhItl+fN6tpN4rOUOgDUTfw4KhsQmrC2KMCvrpFzASRft8Nzyyivyr
 fBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708420861; x=1709025661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fdhB/OebAUjm/AFv0XF6TY7b9nkZEns3B+QEhrz2u2s=;
 b=IybA8DBEmuJ3QjD5T8BRmsFGIxGkS5CNmPibguWFZJS/nV0FOvfxxyc61Es3QZ0Dc8
 Q7jpuuhXUVxZPWIn5mdtRrc4opGQZBYFttUds/ykT9p++xSeVAl107iNqA6uXIfCGvXg
 +M62r9hw7YGNMJIZmaCu/MaXSLTM+KwOBZoPE6umXBbeef3/6lKb9FnlQACGyhgi9O4D
 NDwkZwtQFSdpnrnsIJnxzQI74gMsoWySjDtx8kA3hR3EUUFvfsWiKk4QwwTDSztRxEjp
 h9nh6o6coz3TW3zzEncanE9QVEuCkN4IQMgCJ75D7cZyF+oZB9KhUMwxHVAq4FkSodf/
 kYzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUXhZsKrgTA9j22FapQPU3g2z7S1T+GI5hMFXFPJqcB1Y3R59kigJRezrr6C9wY41Zt2D6INPZXwZCDmrp8Xrv2Vb+ATa+5MgfetuuU5pdtz9oKFtNcqrq
X-Gm-Message-State: AOJu0YwLFmGQdiAJGgnfQL11M8EWbpGZJI/ayEElrhTOb/eko8oxZsCv
 C75PjaRMN8/3nTVOEX/D8B6O5Ezrfz6NId0lgzKlkhN9x0ei5dag
X-Google-Smtp-Source: AGHT+IFENXQ2/kIvaynag/3ye0EYbZr1RqBX2LzSkz1tqwcz87hMFLb+HYFe/A4uzUmPS1D8iGWrkA==
X-Received: by 2002:a19:655d:0:b0:512:ab03:f4 with SMTP id
 c29-20020a19655d000000b00512ab0300f4mr4763035lfj.37.1708420860434; 
 Tue, 20 Feb 2024 01:21:00 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 x28-20020ac25ddc000000b00512a3f5322fsm1151146lfq.8.2024.02.20.01.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:21:00 -0800 (PST)
Date: Tue, 20 Feb 2024 12:20:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Message-ID: <mmjrlyzhegve5u3s3lhw4hmhooxixn3pwxkkdikxgxno4teqyz@rtetljwg6ffg>
References: <20240220-stmmac_est-v1-1-c41f9ae2e7b7@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220-stmmac_est-v1-1-c41f9ae2e7b7@linutronix.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Rohan G Thomas <rohan.g.thomas@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Fix EST offset for dwmac
	5.10
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

Hi Kurt

On Tue, Feb 20, 2024 at 09:22:46AM +0100, Kurt Kanzenbach wrote:
> Fix EST offset for dwmac 5.10.
> 
> Currently configuring Qbv doesn't work as expected. The schedule is
> configured, but never confirmed:
> 
> |[  128.250219] imx-dwmac 428a0000.ethernet eth1: configured EST
> 
> The reason seems to be the refactoring of the EST code which set the wrong
> EST offset for the dwmac 5.10. After fixing this it works as before:
> 
> |[  106.359577] imx-dwmac 428a0000.ethernet eth1: configured EST
> |[  128.430715] imx-dwmac 428a0000.ethernet eth1: EST: SWOL has been switched
> 
> Tested on imx93.
> 
> Fixes: c3f3b97238f6 ("net: stmmac: Refactor EST implementation")
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 1bd34b2a47e8..29367105df54 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -224,7 +224,7 @@ static const struct stmmac_hwif_entry {
>  		.regs = {
>  			.ptp_off = PTP_GMAC4_OFFSET,
>  			.mmc_off = MMC_GMAC4_OFFSET,
> -			.est_off = EST_XGMAC_OFFSET,
> +			.est_off = EST_GMAC4_OFFSET,

Unfortunate c&p typo indeed. Thanks for fixing it!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

>  		},
>  		.desc = &dwmac4_desc_ops,
>  		.dma = &dwmac410_dma_ops,
> 
> ---
> base-commit: 40b9385dd8e6a0515e1c9cd06a277483556b7286
> change-id: 20240220-stmmac_est-ea6884f9ba3c
> 
> Best regards,
> -- 
> Kurt Kanzenbach <kurt@linutronix.de>
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
