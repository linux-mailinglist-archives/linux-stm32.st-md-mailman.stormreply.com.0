Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7CA926453
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 17:08:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0CAFC71280;
	Wed,  3 Jul 2024 15:08:05 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8584C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 15:07:58 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52e9b9fb3dcso353553e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720019278; x=1720624078;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o77kjbwlD9Z3c6BS+RuGYrL8FzGeJxJRgdv2p8GCZbk=;
 b=UOVd+7AsQxVolES7T+F9j7N5bGChMsGpzd7kYqw2Q/Ednx3G4dNR/fePNvUoCLJdRZ
 PiFDLUMo1uOZTQXWAaMo6CXZ8/Ff2aqALQsY7Kdv1sfTZeUZ6drOH+fttU5EX2S8DD94
 mqfamHJqC1qhWkf4Ee3jAgjDf5uoA4MmtYRRzVGOB5vHK0oZDaxAI+8T61H/33TlX6KU
 k+oxKWmCSAdYPV8r0AHLz42S6OAJamA2tMo+3WinDS+8Jog2BS24QgWkDnXTQztnafwf
 JLIul3OzhDxK44ymIwWL8kezZhPGlt19U2FUGdkwIk1EriCLXbM1w4cUXl+I9d6lFOZ0
 7P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019278; x=1720624078;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o77kjbwlD9Z3c6BS+RuGYrL8FzGeJxJRgdv2p8GCZbk=;
 b=gPtiQgT6RDJwbZ0KjMoSZFo5n9LjEK0P3zv7Q9KyOKk3P/DYptgiKnD33KlwUb3enm
 BAjoTTrp9SZchyqjzrbY9LDcvyPWB1M8x4sO3uTIg727pModTi9/djXVGO/7JJUXEkDA
 4yuC86guXX+u+Xcz6UROCQveY3cun3xAuNSTcuBMpaz69zRRsCnZIxhvJPtZlDBpmcVH
 o2/Zq05Gdz7ackc5Uhgsjtu6DnSUkIqiT8Y7c0PHidaEcXVFbnmxc6R9RNhnlh91zUNe
 oo3iDZ/GPuHIdiN4XBD8m7shw5lnwEe37NyPJXybgwneyv7g/DDmOxkzjCc66/TOu6fI
 TaQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV9aQxaa7Y5KrJDqUvKjs4XxHOT2MRi/XE8mNVHS7cKoUwTK8AaqXMKyN2hZTxEAAjBfdOxPVWvPZZuHPW74iBY6x5taVo7rKdNC86Sj2jpVG3xNISs9Fn
X-Gm-Message-State: AOJu0YwjVqsWeCdZ1z7gmhSiIXhoinNzOXN/2JBDTVWKyNhdsDPDanSd
 LmbMNG/+LoASsZFNh6Him0PjRMvdCvu/d8c17HCYifluMU17X5z+
X-Google-Smtp-Source: AGHT+IHdcMZi2lT1OmnivTCIy0RDYNDcq2ZLvwE9OMuR0+m5xHJb9jnuS0hZjfFM/bb+bVXr5gZvCQ==
X-Received: by 2002:a05:6512:224b:b0:52c:9725:b32b with SMTP id
 2adb3069b0e04-52e8266df2dmr7006603e87.17.1720019277758; 
 Wed, 03 Jul 2024 08:07:57 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab1030bsm2188120e87.99.2024.07.03.08.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 08:07:57 -0700 (PDT)
Date: Wed, 3 Jul 2024 18:07:54 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Andrew Halaney <ahalaney@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <xgqybykasoilqq2dufnffnlrqhph2w2tb7f3s4lnmh3urbx4jd@2e7nl2qkxtrb>
References: <E1sOz2O-00Gm9W-B7@rmk-PC.armlinux.org.uk>
 <c26867af-6f8c-412a-bdd4-5ac9cc6a721c@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c26867af-6f8c-412a-bdd4-5ac9cc6a721c@lunn.ch>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
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

On Wed, Jul 03, 2024 at 04:06:54PM +0200, Andrew Lunn wrote:
> On Wed, Jul 03, 2024 at 01:24:40PM +0100, Russell King (Oracle) wrote:
> > dwmac4 was decoding the duplex mode from the GMAC_PHYIF_CONTROL_STATUS
> > register incorrectly, using GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK (value 1)
> > rather than GMAC_PHYIF_CTRLSTATUS_LNKMOD (bit 16). Fix this.
> 
> This appears to be the only use of
> GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK. Maybe it should be removed after
> this change?

There is a PCS-refactoring work initiated by Russell, which besides of
other things may eventually imply dropping this macro:
https://lore.kernel.org/netdev/20240624132802.14238-6-fancer.lancer@gmail.com/
So unless it is strongly required I guess there is no much need in
respinning this patch or implementing additional one for now.

-Serge(y)

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
