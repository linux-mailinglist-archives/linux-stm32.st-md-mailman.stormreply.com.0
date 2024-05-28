Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C91288D2671
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 22:48:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CF8DC6B47E;
	Tue, 28 May 2024 20:48:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1435C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716929290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=udCxeFic4ovPz9NMjk9vC8Aj4vL6U+9qgfTd7ZRGbUE=;
 b=N5hiToBLFfx/lzZ/RLWffF33Qx5FKOjWu6G1jo398vTqUsWbgPoqVU6ebbtAHvFSW7ETlU
 oR0AP2URGt5gjvVhRyz00WXmPEDote7lh8o36HUz3HCi/S0snmqqEc0LKXsbIQk0Yd4p0S
 jbmkjjkqG8eqrmJr0/s+nt67aju+13w=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-op_kMOprO1uiAmUy1_3YwQ-1; Tue, 28 May 2024 16:48:07 -0400
X-MC-Unique: op_kMOprO1uiAmUy1_3YwQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3d1ba3543e8so1521201b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 13:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716929287; x=1717534087;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udCxeFic4ovPz9NMjk9vC8Aj4vL6U+9qgfTd7ZRGbUE=;
 b=UBKGKM+5WSL8Mc/DsZPMLhsPLOS/qMKibVd2uYwGkkg6oi7uN8G6wq2h7P8WT3+iyO
 QJR7mQqpngOKlj7XZX7wwtP6YW671wq8qoFREP/XdAohIBTKPy+BKn8cWbobkVh5gswm
 IT5Hf+F2tnNtO78V4UOucJK87T4y0SHuB7PMPCChgJ10DzA+r+F76xIIAQB8uLg02Ddw
 MOrApNpbd0ToetE5KBHkApPrewpUVwtNxZwcOlp/N7G5I1IwVEgC+ir6rxNNTg8uTnjN
 jvFKT8zv4NTLRhkuuz0qtbMfroBSjNuYVxyH/GjNfj0oZ9EWBH2ehmWq21+AsVx9CAYR
 aKlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVPcbyrwnDlCYVygaqo5qmQV4+QGixzERy+Wu/gBp+wzTUFRYgIJnLRzcrmefDIiyzBmFn17RyyXKAdGCky11qRXLoJC7TeW+O/4wSaKgud7ZVLXZF8Gfc
X-Gm-Message-State: AOJu0YzAyb/eIiae9xg+W6i2+hNqnoqcvnJ1NDuPJyeHYnXTN8Ldv4cs
 T1EC3omRskG2j0d7Zp/xPQUanJ8aZ5K3uJH89df5w7O1xefZOXZuM5FAa7KsdrYYbJHmgb2UatB
 HCVwFs8c8xZBXCHs1b0Flyma98Krue+VrQwsL9QWfaYZ3QDYyp2C4Pg2JuStL0IUWLHVJsQvsEP
 +xcw==
X-Received: by 2002:a05:6808:624d:b0:3c9:6692:dae9 with SMTP id
 5614622812f47-3d1a745c373mr12545709b6e.43.1716929287033; 
 Tue, 28 May 2024 13:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKl+KUY1YuSQYskK8u+IzkICy9/4WQBAR7haOAUO1dKLQSlw3Iv/GIhlKGk8RvwSXZbqV+MQ==
X-Received: by 2002:a05:6808:624d:b0:3c9:6692:dae9 with SMTP id
 5614622812f47-3d1a745c373mr12545664b6e.43.1716929285888; 
 Tue, 28 May 2024 13:48:05 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac162f02d6sm47533456d6.90.2024.05.28.13.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:48:05 -0700 (PDT)
Date: Tue, 28 May 2024 15:48:02 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <yesu3ijfhimhzmo5l2i36nilbwe2akhf7frkn4bgamv7ltrvgg@mpueny45zvuf>
References: <ZlXEgl7tgdWMNvoB@shell.armlinux.org.uk>
 <E1sBvK6-00EHyp-8R@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sBvK6-00EHyp-8R@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: include
 linux/io.h rather than asm/io.h
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

On Tue, May 28, 2024 at 12:48:58PM GMT, Russell King (Oracle) wrote:
> Include linux/io.h instead of asm/io.h since linux/ includes are
> preferred.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
> index d0c7c2320d8d..d413d76a8936 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c

Any reason you didn't wanna treat the other examples of this similarly?

    ahalaney@x1gen2nano ~/git/linux-next (git)-[tags/next-20240528] % git grep "asm/io.h" drivers/net/ethernet/stmicro/stmmac/
    drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:#include <asm/io.h>
    drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c:#include <asm/io.h>
    drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c:#include <asm/io.h>
    drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c:#include <asm/io.h>
    drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:#include <asm/io.h>
    ahalaney@x1gen2nano ~/git/linux-next (git)-[tags/next-20240528] % 

Thanks for the series,
Andrew

> @@ -15,7 +15,7 @@
>  #include <linux/crc32.h>
>  #include <linux/slab.h>
>  #include <linux/ethtool.h>
> -#include <asm/io.h>
> +#include <linux/io.h>
>  #include "stmmac.h"
>  #include "stmmac_pcs.h"
>  #include "dwmac1000.h"
> -- 
> 2.30.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
