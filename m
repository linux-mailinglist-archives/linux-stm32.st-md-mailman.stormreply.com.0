Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF668D4104
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 00:02:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DC33C6C855;
	Wed, 29 May 2024 22:02:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05A5DC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 22:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717020128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=32CzNa62jddabKFggnPjJ1ZOuhMzVDs8eJ1sh3z1xGg=;
 b=MvFIlA9uWid1qFnYbF1rnL4Zv9VVbtk7V8A70nqTD4kFvnrEdYkspx5DOrUIrReuQ8+nsq
 XpMgPyR2Z407qfvExmLJCTwrmuPDxJXVYcjwb3KSHhaAyHU8UM64LnJokRPWJpQLvPmPFF
 cTmosyFKcQo0TJ4qW4zv0YFJKE13/7Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-feyjJPrQOHm4TFGaMCpP7w-1; Wed, 29 May 2024 18:02:06 -0400
X-MC-Unique: feyjJPrQOHm4TFGaMCpP7w-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-794b5cd9468so33725685a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 15:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717020126; x=1717624926;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=32CzNa62jddabKFggnPjJ1ZOuhMzVDs8eJ1sh3z1xGg=;
 b=GoYuKwlS+IbqI4MhUwxQGP4AvEd2JET83ZrOzxo8ZH70KarYyNf/Ugk8PUu6pA8V8x
 etume6kGbZKshP6jDZlmlwWy2Aiilji3k7FsFjkspTbmwXfCLKsIHqZhQqqdIn9qYBus
 CMXregDSMaLVXhf6w8bXolimyWy/F1jY30RGDoHsIK/PigbK+DDpDynVFLOqRSjoolhi
 GMutBVrJ7kCaZJ2n8AFA8ZfRoWH94PtjN1LblG5ABL0XjXW9UrURcmo4XJ+BLcGEv4dI
 5D0CXPdX6bgdqzSBC3ac610Z3Z2Cj2qkqmY8yXx/lotxxUUhM+KwES6gelpvT/9dR6nJ
 AeDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAM/mPUFQU9DeJlCUBDw8y4LdALMgKhQuaGDQiSfBiYmF0qo746WsVJgF1Y9TaJzcMOB1WsOcbX+B1+QGlsEHT5Sevbbvtf7KyPAm/yHHG1TNsX1A19LGQ
X-Gm-Message-State: AOJu0YybzKLtBqMYWOUWTC/5kIBmVGzhRXHlspugwzY5wRDGDHSxVDEm
 Us1M+qKINdaNRYEFYus9lX/jKisZkD8n+zL9ngxlgcIXFXnFoDucCuWucC8SP26qdVpu8yBUq6o
 C5tjsVAnB3NiYLHZQbv1aPQ8sdUa4lc0SfFGkE/FmybYcYABxju5LI+eplhSXRn+ri6c5iXoXsm
 ADIA==
X-Received: by 2002:a05:620a:15b9:b0:792:c473:f645 with SMTP id
 af79cd13be357-794e9e11ebbmr49434885a.54.1717020125987; 
 Wed, 29 May 2024 15:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFltyeZE22UFFRHWLdfe4j9lK7hQIYxgrXrWxKRxQ+NAs6sdTr1G6ajFGS0Ru7QKzBiG/eA==
X-Received: by 2002:a05:620a:15b9:b0:792:c473:f645 with SMTP id
 af79cd13be357-794e9e11ebbmr49430685a.54.1717020125523; 
 Wed, 29 May 2024 15:02:05 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794c1130acfsm308726185a.129.2024.05.29.15.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 15:02:05 -0700 (PDT)
Date: Wed, 29 May 2024 17:02:02 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <7wmrxqrkruuvk3ceqy37gtu23axhm5aun3afi4pfs5lohtzwku@dmedpa32pf6v>
References: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, Madalin Bucur <madalin.bucur@nxp.com>,
 Sean Anderson <sean.anderson@seco.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: phylink: rearrange
 ovr_an_inband support
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

On Wed, May 29, 2024 at 02:28:42PM GMT, Russell King (Oracle) wrote:
> Hi,
> 
> This series addresses the use of the ovr_an_inband flag, which is used
> by two drivers to indicate to phylink that they wish to use inband mode
> without firmware specifying inband mode.
> 
> The issue with ovr_an_inband is that it overrides not only PHY mode,
> but also fixed-link mode. Both of the drivers that set this flag
> contain code to detect when fixed-link mode will be used, and then
> either avoid setting it or explicitly clear the flag. This is
> wasteful when phylink already knows this.
> 
> Therefore, the approach taken in this patch set is to replace the
> ovr_an_inband flag with a default_an_inband flag which means that
> phylink defaults to MLO_AN_INBAND instead of MLO_AN_PHY, and will
> allow that default to be overriden if firmware specifies a fixed-link.
> This allows users of ovr_an_inband to be simplified.
> 
> What's more is this requires minimal changes in phylink to allow this
> new mode of operation.
> 
> This series changes phylink, and also updates the two drivers
> (fman_memac and stmmac), and then removes the unnecessary complexity
> from the drivers.
> 
> This series may depend on the stmmac cleanup series I've posted
> earlier - this is something I have not checked, but I currently have
> these patches on top of that series.
> 
>  drivers/net/ethernet/freescale/fman/fman_memac.c  | 16 ++++++----------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 15 ++-------------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++--
>  drivers/net/phy/phylink.c                         | 11 ++++++++---
>  include/linux/phylink.h                           |  5 +++--
>  include/linux/stmmac.h                            |  2 +-
>  6 files changed, 22 insertions(+), 31 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

This all seems more clear to me now for what it is worth:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
