Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F987C52096
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 12:43:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF272C5C842;
	Wed, 12 Nov 2025 11:43:11 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22A17C57A52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 11:43:11 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6137A3FFD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1762947790;
 bh=JH9RQWDlZksP3A5WjT/Tdcm9mFgNLOafV5repVUVXmQ=;
 h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=hwgqECDsQzlV6AkQZet/s6MW6kquiGQf88sNdGh4gEQ7/0u/341o10m6Eqjcp7YTT
 YJ3n4dwsOFKkuRkFZHFQ9I1IYTKpFj2NdNAHKZvw+UoxmQJKWcvGZKhkf11Dpl1N2F
 3dxvIw9MweMvZCrUSK3IB1aoiJBnHhvj7VwNQLivzJXVWF+AN0bqIuPKwZghteRu9I
 uLUk+KidzELo/6A2YP0z6l756KVR2cT2SBgxK2gPerQhcSyfVGLTcMreYhVJzBYMd9
 PNbc/p7Mmh9KVomp3OL6t6ihENY3c3jQsoN0Nz/X73BKLxcWftalvCZlkC/nnHpn21
 ZCjG8WNfi9xOUzNOauBCld4Tq0aH5rgmmymdHgzHElJOorZ4uS0wqlpYsqlWRGFujp
 QA+N/+hjJICMLh4+b9hmIwDVwTBIeya8e9R9ex1kmLdkpLI3QV2xbO34DZSBbqX2vr
 pMZo1w7onvqDEnXdvW9ZxpiaD9l14LaYZATkY7sESRzlHwSalawuNFriZ+mJPBS9IQ
 qbf8JkdWJ6gM/xiWCdt5kzzdamWTsUHJAUDzVXy+KL9xPkoQhF3QX6pMtrWHOD0YQR
 2PuxYpi8pj5+7POz6rIgi6To+YSRht4s+TV89jY4e9pNpkhxwdAy+BMNRSYBtnkBTc
 l5urrNTKcGbtH5AH9HpRTfes=
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b70a978cd51so77286566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 03:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762947789; x=1763552589;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JH9RQWDlZksP3A5WjT/Tdcm9mFgNLOafV5repVUVXmQ=;
 b=iA5T7wgiCsJdAVc+QmlGnCSpSO3CR0WjlOQo1NRrMSgDU81b0uKN4UY9aVvOL+c/PC
 YvkVomNLdiDWePcud5+8afmfxnCw63HIu4IrSCtONdFHZ2zGXRnufSv1rHTCiWTDQXuk
 VqGO9JELPzynBJ1Mu/E/amGiTGWbdfvbD4OwbewBAzFf+/XA/bMr3ULEgUupm1YSgRXj
 OS81HHcvZkfAlSHTfYhL19klag25W5JpTvIaneRvV2sVG4VNoaZA+smC1/Smk4lXMxD/
 B3XDY9CQRXqZ+CtKDWf7GqAphv4gBCT6HGwXnED94hJdA7Yf95hz5eKSklUf2mrCbzP1
 WgPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf56qEP3wLzAStmnu8VhgnI42l/p0Wwu9hGaBanlAyCEZ0nFAKkiSBzABWo76lS8MKDC4OL9K1w6lyKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxP35CrYoNEa/pLGykLiaBW9rrf/dmZOcFA1T8DTOJ9Ujy6Gf80
 YwfdxLsc1kcO6mOwY9LqYOE7d+ehyLXU8RyowzvrbuEnQaJZYeTMupOe9n8kzH52cqpt4CGEyrK
 LtXMJZAx3ddTYKYfYN/rS5nn9csQNV2OlL8Di7IGBYsDuZ1rp2cYtOGkblyKjI+ieK5JIhvXh5D
 zP+2GdN5SG9hYr1LQanxrpKwpxepbPNAeip5YZWjIdE+sLOdKqDxnZmzAkwkNE4MGe/xmALzDg
X-Gm-Gg: ASbGncu/0FwtfacS5cicSDCztRHAzTNDO9cR8n25n1tgW1edfqya0MSLaDmf3iMwgl7
 Akr+V62MmHCDJGtQG0anQMJDQYsh/Y6HTtIg3ArE/P7bqurNMliODc6Q5WASzmRa03ZmNj6dYaG
 Ye9Zz2yW6Nx92n8eCRcFTxL7Y5YZEmbMeQC9OAkSAF555A0GLrkDSxseDfzdWQ+7MvZq1JhRkWg
 hvPMxCJEDeu
X-Received: by 2002:a17:907:9713:b0:b72:5a54:1720 with SMTP id
 a640c23a62f3a-b7331ae8bbbmr239079366b.57.1762947789518; 
 Wed, 12 Nov 2025 03:43:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEACqB0mCN3EX0p95RUNEAUTyaZ39pandxW0+rdirFn7EUt3COrqPK8HKamiHijsSU/fq2Kt0hi/1uzUL2rjsY=
X-Received: by 2002:a17:907:9713:b0:b72:5a54:1720 with SMTP id
 a640c23a62f3a-b7331ae8bbbmr239077666b.57.1762947789084; Wed, 12 Nov 2025
 03:43:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:43:08 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:43:08 -0800
MIME-Version: 1.0
In-Reply-To: <E1vIjUF-0000000Dqth-0gwD@rmk-PC.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjUF-0000000Dqth-0gwD@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 12 Nov 2025 03:43:08 -0800
X-Gm-Features: AWmQ_bkenMvacX26pAHg6nt10w-7MV8cO1nbkR5cqs-fMNBqO4TpuSWeehZ0dCc
Message-ID: <CAJM55Z9O3BTejaAnTH4nTXT3VcRU701BWdSusRNArt-9vkCFYg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 08/13] net: stmmac: starfive:
	use stmmac_get_phy_intf_sel()
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

Quoting Russell King (Oracle) (2025-11-11 09:12:23)
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
