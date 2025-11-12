Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29092C5208A
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 12:42:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4F5AC5C842;
	Wed, 12 Nov 2025 11:42:26 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 784ACC57A52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 11:42:26 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B5CB13F91E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1762947744;
 bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
 h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=NhNVqzr1VT+2GzCShawqMHh484L0w9sDfTeFL1pbAwQrVDgzndzlutTLxUf1LbVQD
 NLqB/FIQQckH4TnF5qbLhpAeXqj5ZWaNVj1eCKWMcaIOxriCBPi6HVpgi7J1jvG2om
 CFQStvF+ICa1ypRj3wuECZr+belIo3Q4ljcbf3lQfBoX0K6G4f0S9WhNTg2aZM4RfU
 nG8xMKTFnSAOqS2Q1/rP+L1zZv36WE/dAGaVj+AzYNgX8Stjoows+J8NxmtHUO4ejY
 l/XNOvq+ORtNn27vKEHXxtAWi60ydYMjRZlt7LwhZD1opuC4p2DvkGUzPyE6ivDt2B
 LjalG+xZlnH5Yh2DowqIaHioumR31YfyySiOi5ab9NJWFlRujmaS8E9MOrIcyx02HY
 Wa1/fouRWasmsSn9zqNx1zQ+aJAB7MF8G4C3WcF0ipHEH9ZzsT8uz6PvDEFmJD7q9z
 Mb34Ej57leIwl2ZW4nCVA5fImbjRcAzIFDYI2l/k3RsDsv8Q1m2Ib1m2gDVAumVRfD
 ZHUhbS/oOSF74MZtrJJ7/uZt27BqRZwV4dMqVYMxPqaCRVolM7PbyNaO59AN9MQIRh
 lDtIOjzdDa9RFSCvW3VgP6+z52piMg6UZvidcKCWm21Nfp2F8yzrUq3Bcs2dMPpkUG
 knMaHBfF7yEaW/BIHVurYeDo=
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b70b2a89c22so69715566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 03:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762947742; x=1763552542;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
 b=XGgByZMRmBLYY75ffyqZPwpZOyjzbaytOIo2cU2cXcN0a8wOAYpxbJJc0UEZ4C96EZ
 sbuCYeBtqoH+A269Dxf89UqN93c9Gm7bYcHlKrU+zw8waZzce7bbVpIl34EFajCo2QMU
 1KzY1nG7gHRABRl1myq2/XtEbdyC+25CxkulsdxaLcN5YPUoTUIT0Mw7D48HTnM3a1zm
 MLn/VybX7L61/3YlULNgKhoXjsjQYiWzQhiLD7RLBA0Oi3HWTqBf2GsKKyXHum0vecYQ
 HqT5win3CTyZIIIXEMbEAM+ojCiJSstBwLcRlj8hJ9c3MRb9no7oHPknZNlVQ+QAEZ/1
 xNJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKjzZOEz5JTwAVh38XKicwiG8pZxzw9PZHThGcXXRUzWp4SSDRu5cKExX/WAQQh8jF7IGJUSmE/ayCRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxav2qd8dTJymYnqMICNDE5sy7E+MYHd+5V+zbJjsV9w5S2Dymc
 1vSL1T/hzV1u7/yKe8p9dPXo7cuqRx2wipotke/Pat3RBpRscJj0UKJHxaMi3jefawQZOfUcsdU
 XzAsckZ1hRY328rqEP6Lp+lB8bQxmNqIISUA7pZEMdt4u/5pX38S1wEJfQUSTtVd5XPJ1lf020i
 +oUnWY2FKZ8LOm45S4h/IC/m0EvL2SHCtzhljB2DpNz98lnl9Bd9BsCMPyDYEGKBdV792FieNu
X-Gm-Gg: ASbGnctIByonzqTdfYMJJF71IL4MhvsBgR6QphkoSLUYogaQgScxb8ZFg5D2pLC1WxN
 anWSkobiJMOfQOTT8eXiTedEIGkevVcreG0gbHm9aLmP4XHuSkKcforNASCiYgfk5rdHEx03736
 3ds/ui4bjEVxbGL95/j6zOQpXCfw42Qp/ELui2HGCHzKTmsulnPpC/TmSZPCX0TtpaVsABsELDI
 ZcTH9Dym2BH
X-Received: by 2002:a17:907:720a:b0:b6d:f416:2f3 with SMTP id
 a640c23a62f3a-b731d591ea2mr705787566b.19.1762947741640; 
 Wed, 12 Nov 2025 03:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+3IO/2NlBrJx08X6rQMz6PNqtbjwKXovV+gvszbh/YA3hqiRZ0MYX2aiKQ9RBTBWOP5/34tQ/P9NV3zbKqZg=
X-Received: by 2002:a17:907:720a:b0:b6d:f416:2f3 with SMTP id
 a640c23a62f3a-b731d591ea2mr705783766b.19.1762947741276; Wed, 12 Nov 2025
 03:42:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:42:20 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:42:20 -0800
MIME-Version: 1.0
In-Reply-To: <E1vIjUA-0000000Dqtb-0AfP@rmk-PC.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjUA-0000000Dqtb-0AfP@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 12 Nov 2025 03:42:20 -0800
X-Gm-Features: AWmQ_bnZR2XzkbNxNxbSAGVNFuRIk1DnPVqrA09Ovj5R5d5xHcMFQU01wJP-xi8
Message-ID: <CAJM55Z91wvTonahi=8SaGcHAXVrYEpQCzsH0qfecSoFeiBoZCg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 07/13] net: stmmac: starfive:
 use PHY_INTF_SEL_x to select PHY interface
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

Quoting Russell King (Oracle) (2025-11-11 09:12:18)
> Use the common dwmac definitions for the PHY interface selection field.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
