Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 956DE985CA0
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 14:51:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B54BC78006;
	Wed, 25 Sep 2024 12:51:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54FDCC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 12:51:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8a92e8c840so80902766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727268663; x=1727873463;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wJRe0aE/XPSgOSaWUXWFi7Rt4+XrkIZvwePNRoQDYDg=;
 b=UTM57OFuq3G57i8hK3Fl0WVx/631rrC8UYvZCIwCc4ROUe1oklz4miZYHutuNX7bLR
 LC5+TaR7Qr/AAAzOcDNBXCKQZKXdup5DhriWodA2K2t4J2jYHxRriwy9upx+VTZJpAji
 BY/pzYmF25U7gNOmvGkw6vqhPrRwXjuZMXcGX653aR78O9y2UuObofpKRyAYHpr2rWYC
 8u+DpfQk3PoUvCvyq1a/FwvV+JpfSOLIjUS4ptkbDorWYhv+kIJPvCE5+PdacVaTBr88
 v9mwShGQWRc3uDiX+fhwHGNq58vu3jusMThdW28qDY1xHzIxjflOc/ULu8Gb/rJxRqcz
 bp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727268663; x=1727873463;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJRe0aE/XPSgOSaWUXWFi7Rt4+XrkIZvwePNRoQDYDg=;
 b=gLv3IW6MOTmcDmvY/kM6WvM0MW899Uv3Q5U82ewwPt79bjuOwbqQG0RiygNQjSDboe
 RRM2qLbTV/XUebtWNk6rnnBiGSlRY3dttamJW07jVXw8LiOjDw2eNt4scLxV7bqarOOj
 hs1PoyLoNYcLCEmPQaVrOvSDS1aLv++NQrx8jqcyFIfHBIBYcV3xy1UgCQq9qOFZDb5M
 cFPAlr414GiQiMYeOxe48ewxd6fhoAXUsPe6gBA9R6OXkKHtx5/YnUM6JtlD935GQ4Xb
 /mSWFmZqGnLultu7jlFz2Vsvz/NlRu2Z0rcH9OmDrG7d5v3eH2Kk2aGy45srHOi6LtQA
 0iHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxfxeszE4fJKM3FYfz9qSbr9j4br0khhCEssEh/Uu4h2tzCLG4oBJV95R+0e/RmGHwapLuXA9D9620XQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwSvKsVazLrS+3hyrlZn7/p+RXJ3j8bVqXOLvVOepoqKnqDxpHZ
 EkJFRGdwmTGI8L9He/bU8pQR7ww/OFhwgbiQaHbeDNh0dIF4dyF5
X-Google-Smtp-Source: AGHT+IG0DC/OqgrT7+Qyi3AtTwFkAKGfrsdCwjfCP+YZms3bu/zLabQ5ns5kQkU5a25DHmLym9v+eQ==
X-Received: by 2002:a17:906:4789:b0:a80:a193:a509 with SMTP id
 a640c23a62f3a-a93a031e18fmr108887266b.2.1727268662598; 
 Wed, 25 Sep 2024 05:51:02 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cb095sm203381666b.112.2024.09.25.05.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 05:51:01 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:50:58 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240925125058.zsid3cbwnrqxr56i@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjcp-005Nrx-5r@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ssjcp-005Nrx-5r@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 04/10] net: pcs: xpcs: add
 xpcs_destroy_pcs() and xpcs_create_pcs_mdiodev()
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

On Mon, Sep 23, 2024 at 03:01:15PM +0100, Russell King (Oracle) wrote:
> Provide xpcs create/destroy functions that return and take a phylink_pcs
> pointer instead of an xpcs pointer. This will be used by drivers that
> have been converted to use phylink_pcs pointers internally, rather than
> dw_xpcs pointers.
> 
> As xpcs_create_mdiodev() no longer makes use of its interface argument,
> pass PHY_INTERFACE_MODE_NA into xpcs_create_mdiodev() until it is
> removed later in the series.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
