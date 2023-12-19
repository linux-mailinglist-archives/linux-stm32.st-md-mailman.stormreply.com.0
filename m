Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F0818B9E
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 16:54:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0D27C6B461;
	Tue, 19 Dec 2023 15:54:03 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2CD7C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 15:54:02 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2cc61d4e5aeso38636931fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 07:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703001242; x=1703606042;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t+/0NojnEKyeTXrrsJnCjkci5dAMTlrQZF+wpXNcSGQ=;
 b=m5m11B2iWkOSN5PQKqw2wV0xcHJuRYhUBubeHctI9gXOyVuYG2wCgexCkx7beccwGE
 5JbEeyUBGtH/rTsjqY4cbsl4oZ5+eQxg+4Y/VVl9pZ2pAfh1m/jPP/hU91iI1mSW1l1K
 I3yumW5YmucqqCwzXgWstcOnIy7Ln755icwrY9bP9QuN0T/RZrOzn/LH67fYtcrFEvcN
 dtVMg4Zp68iz/FEoqn/C4cNB9Q1aZQghUeq9nLdQPj5AuyVVB/x4qixIYoY+Uk3iZzjS
 jHyLx38wbj8gFqKKxWu6+e6pYdM7BXjQzkpHQ1Dk4b9DN1HtKza18pLdlneO9j+qBgeZ
 rCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703001242; x=1703606042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+/0NojnEKyeTXrrsJnCjkci5dAMTlrQZF+wpXNcSGQ=;
 b=OGTZ7VrlgdaDqQ+UK3uzbOVzVZvBEINLl8C6HPuEQ6h6+mGlbD6GDOg31EvyZ2v25N
 XcZaQ+z021YLVvNtEvJzBLJR0COKi5YxCqJHro7TKGot6nvX6R+Ps1pcyXe7GGCks2jg
 m5gdNalzFBXZL3BzweA1WrBAySYpZrXZYWGn2GMpoBqnYrU1kuvxfcNUz0K81J+qBGTD
 G/ScIf9l+KDZT5yid2breVPfaVkWYT3Ewg0/SUqqQBKdBJUg53uYCXeeVm6HYNqC2WUd
 Yr4dX365zr4Ow/N0S68xGHTc3KzSVq2Hw9qgzdYK3ktBhKaHFWaIYZP3W8I071R32tdM
 Wicg==
X-Gm-Message-State: AOJu0YzOAD+vZFgd/yhqzPAS9B//5jv3VcqHk9v7BxoyC8zblgaYmLDG
 OnZgxOpHd7QnZbv7CPmCJfQ=
X-Google-Smtp-Source: AGHT+IGxgJlS76KKbhiIvrV4SZ9jaaRyya80b/MRTuQcf4q27hcVV0Tzdk0NnqtpF7D4YgggeMnAPA==
X-Received: by 2002:a05:651c:b09:b0:2cc:88bd:d4dd with SMTP id
 b9-20020a05651c0b0900b002cc88bdd4ddmr325821ljr.63.1703001241537; 
 Tue, 19 Dec 2023 07:54:01 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a2e3516000000b002cc6a6d6a33sm1026846ljz.115.2023.12.19.07.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 07:54:01 -0800 (PST)
Date: Tue, 19 Dec 2023 18:53:58 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Lai Peter Jun Ann <jun.ann.lai@intel.com>
Message-ID: <bhw5l75erhcci7z55vrcos43qtyn7txsspv6qtazhlulpbn7km@dp6yg6sf2gwk>
References: <1702885892-30369-1-git-send-email-jun.ann.lai@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1702885892-30369-1-git-send-email-jun.ann.lai@intel.com>
Cc: linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: fix incorrect
 flag check in timestamp interrupt
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

On Mon, Dec 18, 2023 at 03:51:32PM +0800, Lai Peter Jun Ann wrote:
> The driver should continue get the timestamp if STMMAC_FLAG_EXT_SNAPSHOT_EN
> flag is set.
> 
> Fixes: aa5513f5d95f ("net: stmmac: replace the ext_snapshot_en field with a flag")
> Cc: <stable@vger.kernel.org> # 6.6
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>

Right. The blamed commit has wrongly converted that conditional
statement.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
> v2 changelog:
>  - Add fix tag and stable@vger.kernel.org in email cc list.
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> index 540f6a4..f05bd75 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> @@ -237,7 +237,7 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
>  	 */
>  	ts_status = readl(priv->ioaddr + GMAC_TIMESTAMP_STATUS);
>  
> -	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
> +	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
>  		return;
>  
>  	num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
> -- 
> 1.9.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
