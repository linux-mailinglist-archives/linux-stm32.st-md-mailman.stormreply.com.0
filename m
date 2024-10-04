Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E146991332
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Oct 2024 01:40:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFE58C7802B;
	Fri,  4 Oct 2024 23:40:50 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66ECCC78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 23:40:43 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5398e7dda5fso2767122e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Oct 2024 16:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728085242; x=1728690042;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wXB6FiMFGXfruSvEAC93ihWCz2mJmwl2xFZB57k5WVo=;
 b=b9/zR93WPEF0b6fr7tTfX2Y2ByIaTV492AEgmN8VIcbRnY2sMobJ1ZOc2fwpcl+WFf
 y7Wh5begVGaCHPNx7OOZ2DIjeVja0R/ptLN3iTOi5i0yG4aJTz605byVQkRqZX0y+160
 Y4H3lqlsDYUsHpRK3ZZovmOO/dFCgTv+QcvTiGBiPegAfcICj+04CgmuhLJWpHJur2Sx
 WPI3Z7Hp+B4uOVMz/RcAmYBgEpimM8j7PIonoYd6xGXOoaMllA/Nu8MacquZrWzgK31T
 JLVfuPR6rpV7xArHniguQT75eVkRMPRfXrQZE+plVWl6oMvoXTxBZd0CSOEb5LdGud5J
 dKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728085242; x=1728690042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXB6FiMFGXfruSvEAC93ihWCz2mJmwl2xFZB57k5WVo=;
 b=fVTUHzW2ePhlLFUkuh1v+X1DaK56YCaV7c4VvAWighCnVNIB81VYBqhDjttBDVHSBR
 sk+AvKKTWOYlt4V2JrVSkKRMf4Xy9uDuzh/skLfwK6FsCY1SB5giQ3KqL54f9vOy0vVJ
 bXrNMR9RlwPfFWVxlFL2MnC5N0ESvd4q01c3o6Pwmv6A+T4xt4qrc3li2hsOmXo5yuoK
 ojgjLT/7MssDi0Wsuo1WRJbiADuIObpNLHOR9cf5DA1o/JAh5JwUiDkuQRq5TFcvPsHf
 CyfvxRaNmMgb5TLYozXoAVQb+uq9ZtDEDozNdT8Yy4tZWXm9avvBTEQxz4lhql8OrzP6
 PD7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmuNUXrP7ldWq0as+mqXOsZBj566u3IInHFEIcB8Dy+CMKjyg9LW0moCd8H2SjAXKEiXdyyCypAvJrRA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgnAWNaubxbuliclkKx7EuauGLc+dYw1Ur8ogqpxDeZvDNUlEK
 5mHLXUtaMe0qc0XyNN2ohSgUN2jlo+WRO1eNR1fFFqX+lmKwL8RY
X-Google-Smtp-Source: AGHT+IE+zyxdE0SKKsLU2/zehxEygp6owIm1RLZc1ZCDM7Z5sL1pDTqegPs2EOPFXWC+TeLZdoIqng==
X-Received: by 2002:a05:6512:1193:b0:536:55cf:3148 with SMTP id
 2adb3069b0e04-539ab88ae61mr2847065e87.31.1728085242332; 
 Fri, 04 Oct 2024 16:40:42 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d277sm83263e87.155.2024.10.04.16.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 16:40:41 -0700 (PDT)
Date: Sat, 5 Oct 2024 02:40:38 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Message-ID: <vjmounqvfxzqpdsvzs5tzlqv7dfb4z2nect3vmuaohtfm6cn3t@qynqp6zqcd3s>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 00/13] net: pcs: xpcs: cleanups
	batch 2
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

Hi

On Fri, Oct 04, 2024 at 11:19:57AM GMT, Russell King (Oracle) wrote:
> This is the second cleanup series for XPCS.
> 
> Patch 1 removes the enum indexing the dw_xpcs_compat array. The index is
> never used except to place entries in the array and to size the array.
> 
> Patch 2 removes the interface arrays - each of which only contain one
> interface.
> 
> Patch 3 makes xpcs_find_compat() take the xpcs structure rather than the
> ID - the previous series removed the reason for xpcs_find_compat needing
> to take the ID.
> 
> Patch 4 provides a helper to convert xpcs structure to a regular
> phylink_pcs structure, which leads to patch 5.
> 
> Patch 5 moves the definition of struct dw_xpcs to the private xpcs
> header - with patch 4 in place, nothing outside of the xpcs driver
> accesses the contents of the dw_xpcs structure.
> 
> Patch 6 renames xpcs_get_id() to xpcs_read_id() since it's reading the
> ID, rather than doing anything further with it. (Prior versions of this
> series renamed it to xpcs_read_phys_id() since that more accurately
> described that it was reading the physical ID registers.)
> 
> Patch 7 moves the searching of the ID list out of line as this is a
> separate functional block.
> 
> Patch 8 converts xpcs to use the bitmap macros, which eliminates the
> need for _SHIFT definitions.
> 
> Patch 9 adds and uses _modify() accessors as there are a large amount
> of read-modify-write operations in this driver. This conversion found
> a bug in xpcs-wx code that has been reported and already fixed.
> 
> Patch 10 converts xpcs to use read_poll_timeout() rather than open
> coding that.
> 
> Patch 11 converts all printed messages to use the dev_*() functions so
> the driver and devie name are always printed.
> 
> Patch 12 moves DW_VR_MII_DIG_CTRL1_2G5_EN to the correct place in the
> header file, rather than amongst another register's definitions.
> 
> Patch 13 moves the Wangxun workaround to a common location rather than
> duplicating it in two places. We also reformat this to fit within
> 80 columns.

If you don't mind I'll test the series out on Monday or Tuesday on the
next week after my local-tree changes concerning the DW XPCS driver
are rebased onto it.

-Serge(y)

> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |   2 +-
>  drivers/net/pcs/pcs-xpcs-nxp.c                    |  24 +-
>  drivers/net/pcs/pcs-xpcs-wx.c                     |  56 ++-
>  drivers/net/pcs/pcs-xpcs.c                        | 445 +++++++++-------------
>  drivers/net/pcs/pcs-xpcs.h                        |  26 +-
>  include/linux/pcs/pcs-xpcs.h                      |  19 +-
>  6 files changed, 237 insertions(+), 335 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
