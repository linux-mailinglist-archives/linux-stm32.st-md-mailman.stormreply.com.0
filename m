Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 516839262B8
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 15:58:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE50AC71280;
	Wed,  3 Jul 2024 13:58:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DCFEC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720015083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pYNDn0y2UwX0ohYZMBTbepKl+5H26DhfIFiMV92J61U=;
 b=bYKHouMIrC+ZEZyMuGitlCH9jkQ2khxfFMbkRj4RBOHVSlNbFbWco++HERM2BYP0oQs/A7
 PDg+NCvcVTuxb1kmAQN7iw3bK2VRqQZ4sfOQ5TqVmTZ2qNn2+gcFg/FNpEjcd1ZNPOU5M+
 jV2uI3fpebmhn2gU4KQCxiozeHTB9XQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-id16G-FePY2Kn9D_9tFvxw-1; Wed, 03 Jul 2024 09:58:02 -0400
X-MC-Unique: id16G-FePY2Kn9D_9tFvxw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-62d054b1ceeso89299347b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 06:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015081; x=1720619881;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYNDn0y2UwX0ohYZMBTbepKl+5H26DhfIFiMV92J61U=;
 b=tWgmCh/HBA7SDoRb2NZSrSUJglk+8m2f8r143uHbzdJ+DnATbLxa6WNuHo+2qUVFRD
 pmA9I/Q5HRxZuBPMOcIs/dFz9SJ5RyLnM6RKnOtZYWmzwqzRr50MBXvZ3e6EHOboYuBA
 MmqMiy9CxSemTK7+TMCHjiCaxuzlzC9x04F2aYm2ZzfIikRbV69oBW1KKxVAVk/GdVZR
 eKtcdXwkA2HvN8qqgn/Lw533j9zUgncIwqiA2ImVjhHxNf/cyz0XBepPtiXfPSNkqyCl
 PE9GCAdyADj7tfjgUtO+FMw8okcBkmEex2akQY4CeeByN+RNL2rYwhzz8sfSQQ0eLKkY
 Ee3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9OYNtjVJ9y78QByhZ3oCU6i85ekD9FlW1LwfDKT5QZEpgbhW3lGHxwk8RgIXO0pIWk6QSqZgCUjgclOycwg1ZnB1n2JZMcY1WNIHqs8yUQRmyv2kaGfQQ
X-Gm-Message-State: AOJu0YyWLq+kUtG8b5fNr2wuiHLqnyJaoYKlw+559JWf9wO4akMEB8F8
 AiU4xoKLmG1xQOasTFPklUrb/uslejzg62xu3xusIOauvjt/0fnPYmaBLtazkhj1vjWxNY8T6mg
 VjKkIInqF5JQJNMBVTHqC5CBgR1FfDN34zmEPXwFzvV8CI8xJvizR4gLYNsj82DNUL1fNv499cT
 NSMA==
X-Received: by 2002:a25:bac7:0:b0:e02:50f2:784d with SMTP id
 3f1490d57ef6-e036eb28e82mr12646108276.21.1720015081584; 
 Wed, 03 Jul 2024 06:58:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxHgUgpetMLrKPihZvI7LJnxM1ykQ7IPeHC6fC0Rby7GTglGg91Jc2cSNUr0pwm3OY3KUObg==
X-Received: by 2002:a25:bac7:0:b0:e02:50f2:784d with SMTP id
 3f1490d57ef6-e036eb28e82mr12646098276.21.1720015081297; 
 Wed, 03 Jul 2024 06:58:01 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e562916sm54005196d6.30.2024.07.03.06.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:58:00 -0700 (PDT)
Date: Wed, 3 Jul 2024 08:57:58 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <rp6fxpz7iaolxnh2hga4nyu7v5umajuvbktn4ltgcrv3asttge@553u2gsohdtv>
References: <E1sOz2O-00Gm9W-B7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sOz2O-00Gm9W-B7@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
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

On Wed, Jul 03, 2024 at 01:24:40PM GMT, Russell King (Oracle) wrote:
> dwmac4 was decoding the duplex mode from the GMAC_PHYIF_CONTROL_STATUS
> register incorrectly, using GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK (value 1)
> rather than GMAC_PHYIF_CTRLSTATUS_LNKMOD (bit 16). Fix this.
> 
> Thanks to Abhishek Chauhan for providing a response on this issue.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Fixes: 70523e639bf8c ("drivers: net: stmmac: reworking the PCS code.")
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

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

Since GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK is confusing and unused I think
removing it altogether would be a good call.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
