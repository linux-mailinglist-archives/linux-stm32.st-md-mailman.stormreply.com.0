Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A49263F4
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 16:56:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EDB5C71280;
	Wed,  3 Jul 2024 14:56:09 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1440C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 14:56:02 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52e8037f8a5so5539077e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720018562; x=1720623362;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=St5NTLDJGESzNQt0He5IT9eM28Qr7L3335ywq/nA+bw=;
 b=k230PRyPyeEtItNYvVtz/rbsaZZ8UibfTIdbTLKQIKv/5gsujzGhl2VoVCUT6cGN9N
 vOpKn2PBhPxQtRobJfZg37KoofbngYy6FfRAiMcFu5iOCRY/qY7JZhfDc7wzUZoe/svD
 ErlwcFXPhy/J7fODvFoDCj2a3k7UnLtw3Or7MY/HtH+25syfdNCh0fo5A3aXUkXoeUcO
 bCXKnBThFo1NpD6HK6gvRfk92tu+NodTIhwawITVM0BN6ZZFV3oFNRv6DJNwrW9jXyD+
 75iMOUO4eYo4wQ4V4ReoHEp0Oj7dSbaR+oYXMQZ1VAjRolWfGM1ERj2pRAVXoYTiu5aQ
 23Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720018562; x=1720623362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=St5NTLDJGESzNQt0He5IT9eM28Qr7L3335ywq/nA+bw=;
 b=azwgt7L4Zu2nAvonQgDmcXIyDcsN/vtfpC/LLzsU1khfCpanyxC2sjquGVyIRhsKT/
 bDsdmSrI7FJaFArwXSQ4MJ0/NnFHN2tuXwln4wRVb+e751bqdFmbKkYoFkoeWxlOuWQm
 wyIzgM+6p6OfgFvfHHZKx4cb7AJOi7Df4/c4P2nh/uIXDrhtciVhE5cC08Cf1FJf2O03
 gdus4+7P7eWi4HjHQs3gDhBBKRUZ1eBA3pnN/8S3Htw5llrciVpsSqfB+gE8uFwdYCKA
 Bq9swR4Y8FKQDWQ9Qf+iALDxODR/qpUsDCkYgV+FsxgMTeCQakKDkHecA8Bo+ziC7Zwc
 4iqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpp/gMAFHuUS3am/9srxd/7K1UwBcAHBEXIJDvg/XnAUG4+MxfRiGhyqwk+DngjDy05NU/EAgTlA/gHlonyuTx/vdAgzdPoGmL3KNyHIuXhPtfyhcNz9ht
X-Gm-Message-State: AOJu0YwONKnJS7J976x5WrLlEwRUAPhGopexNu26RdYS7fTJsw9DSG7Q
 NuN67p5QUP5KmFuwMsL7BcLsHZyWYipV8ah5klGuTCle0mwR98EK
X-Google-Smtp-Source: AGHT+IGl1J9vb+WFtLo8hl7UjT0IkBNw1LW1SITgCFkNqJlXxUn2U7tVH2jbngo5o3iR6BPcIZm1pA==
X-Received: by 2002:a05:6512:3d29:b0:52c:dba6:b4c8 with SMTP id
 2adb3069b0e04-52e8264da08mr11273998e87.13.1720018561740; 
 Wed, 03 Jul 2024 07:56:01 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e979d2318sm252988e87.109.2024.07.03.07.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:56:01 -0700 (PDT)
Date: Wed, 3 Jul 2024 17:55:58 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <ydspunec7webewlnluxgms5egx2beg7buto3o4b3ugxmq2v6jo@mvsjflg4cnjx>
References: <E1sOz2O-00Gm9W-B7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1sOz2O-00Gm9W-B7@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac4: fix PCS duplex
	mode decode
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

On Wed, Jul 03, 2024 at 01:24:40PM +0100, Russell King (Oracle) wrote:
> dwmac4 was decoding the duplex mode from the GMAC_PHYIF_CONTROL_STATUS
> register incorrectly, using GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK (value 1)
> rather than GMAC_PHYIF_CTRLSTATUS_LNKMOD (bit 16). Fix this.
> 
> Thanks to Abhishek Chauhan for providing a response on this issue.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Right. The PHYIF_CTRLSTATUS CSR has the link status bits defined
starting from 16-bit position. So the method has improperly detected
duplex mode. Bit zero is occupied with the TC-flag (transmit RGMII,
SMII, SGMII configs) which is never set and which means the method
always reported the half-duplex link mode.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index b25774d69195..26d837554a2d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -791,7 +791,7 @@ static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
>  		else
>  			x->pcs_speed = SPEED_10;
>  
> -		x->pcs_duplex = (status & GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK);
> +		x->pcs_duplex = (status & GMAC_PHYIF_CTRLSTATUS_LNKMOD);
>  
>  		pr_info("Link is Up - %d/%s\n", (int)x->pcs_speed,
>  			x->pcs_duplex ? "Full" : "Half");
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
