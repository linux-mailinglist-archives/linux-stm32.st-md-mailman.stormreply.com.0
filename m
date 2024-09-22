Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AAE97E3EA
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 00:18:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06AADC712A1;
	Sun, 22 Sep 2024 22:18:01 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89748C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Sep 2024 22:17:53 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5365c060f47so4352424e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Sep 2024 15:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727043473; x=1727648273;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T+z+sTMVisDVFfvjkFFbu8DDWbPGrFSf17/aPoR5w2s=;
 b=ZoaaL2ueLCB8rxs8LKCiuNrM2R85FBCZ/J9JmxKae+A/FBchbH1gqPoXhZseTfdPRS
 bojdPbaTjQ3TzjWmut3cYsRz4RYGeLXG93c0+HKFArlYOh5K0XkK5exoIP4QzwyojGvA
 pHMAHIi3YJIbgXaiezQKbGny7SRGBgYVHOBNRG7eRpB2fEa9ULEJyZgFdsjSkjKzIR5n
 mQNvXzz514w7zFE2o9ja+TBsIQEr+57eWDtG1YKSIhbMatVccEQlwFpyyio1ye+URNio
 /pCWI9BZoeepggg9nr0RM1C2xWu14pMVXAWI9us0kIfJYaZh7J6a5PV0h2HcMUwr4jEi
 +0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727043473; x=1727648273;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T+z+sTMVisDVFfvjkFFbu8DDWbPGrFSf17/aPoR5w2s=;
 b=tMRSzPVXng5UBngbkw3gBiTM76IXB19FRyBWywkMYoZojV+tuRnwAr2N2NxtSZ0UhS
 iEifFlQ7396uXMBSgzzn6wN1oFqJ+9Nzx3vc+hC4yZyzhCwgeiP5/aIs/pIOXk+HIHHO
 LPPq10Yk1je8zT29F/h8LZ9r7nwZPprj3Uvlh++hcOoEiNZqr9wnp7JtGslIFk5f8X1f
 dqk6w6CtsQS4k58VAwULzNQGA8npUDdLEAK490U8dRMTDoqVhhjChCGBPD2aYQRXUHoi
 yZMiO0khhEg2kxrRQtGElZOKW6vEzm4Y7ZuznuWuD3v8hdW6gsh0lXnWvWNEWjGOl42o
 IQBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQwl36hgjIIiIXe5Glf692hjdjDE3lJFaz6wvvV2CEY2FS+6YlSSIadvQroUCiliZOriEuebJ/9OvoKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNXn5MkdTVyQjie+eaociBRTf+iOc8XGwS3NMtG0YpNhO/PACh
 hZY1rTuBL6h5wTpfxvDdQMo77oViP0VwWIpHNcP8jzLeHvC1iPgf
X-Google-Smtp-Source: AGHT+IHxU+MGElA+QsRzR7T/maHHhNlCIFzzXDBhrpK7Lmg8bAMOit3g7+vHOKt093dToxEIMGOyfQ==
X-Received: by 2002:a05:6512:158c:b0:534:36bf:b622 with SMTP id
 2adb3069b0e04-536ac34649dmr4068777e87.61.1727043472449; 
 Sun, 22 Sep 2024 15:17:52 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870966f6sm3081871e87.151.2024.09.22.15.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 15:17:51 -0700 (PDT)
Date: Mon, 23 Sep 2024 01:17:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <yzyezokrtcj5pnby4ak5lzrrnqu3y3k45kaibtklwrjn4ivzel@hwf6bgssykna>
References: <20240918193452.417115-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240918193452.417115-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-imx@nxp.com, horms@kernel.org,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net] net: stmmac: dwmac4: extend
 timeout for VLAN Tag register busy bit check
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Sep 18, 2024 at 02:34:52PM -0500, Shenwei Wang wrote:
> Increase the timeout for checking the busy bit of the VLAN Tag register
> from 10=B5s to 500ms. This change is necessary to accommodate scenarios
> where Energy Efficient Ethernet (EEE) is enabled.
> =

> Overnight testing revealed that when EEE is active, the busy bit can
> remain set for up to approximately 300ms. The new 500ms timeout provides
> a safety margin.
> =

> Fixes: ed64639bc1e0 ("net: stmmac: Add support for VLAN Rx filtering")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
> Changes in v2:
>  - replace the udelay with readl_poll_timeout per Simon's review.
> =

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac4_core.c
> index a1858f083eef..a0cfa2eaebb4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/ethtool.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include "stmmac.h"
>  #include "stmmac_pcs.h"
>  #include "dwmac4.h"
> @@ -471,7 +472,7 @@ static int dwmac4_write_vlan_filter(struct net_device=
 *dev,
>  				    u8 index, u32 data)
>  {
>  	void __iomem *ioaddr =3D (void __iomem *)dev->base_addr;
> -	int i, timeout =3D 10;
> +	int ret, timeout =3D 500000; //500ms
>  	u32 val;
> =

>  	if (index >=3D hw->num_vlan)
> @@ -487,12 +488,11 @@ static int dwmac4_write_vlan_filter(struct net_devi=
ce *dev,
> =

>  	writel(val, ioaddr + GMAC_VLAN_TAG);
> =

> -	for (i =3D 0; i < timeout; i++) {
> -		val =3D readl(ioaddr + GMAC_VLAN_TAG);
> -		if (!(val & GMAC_VLAN_TAG_CTRL_OB))
> -			return 0;
> -		udelay(1);
> -	}

> +	ret =3D readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> +				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> +				 1000, timeout);
> +	if (!ret)
> +		return 0;
> =

>  	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");

1. Just drop the timeout local variable and use the 500000 literal
directly. There is no point in such parametrization especially you
have already added the delay as is.

2. A more traditional, readable and maintainable pattern is the
error-check statement after the call. So seeing you are changing this
part of the method anyway, let's convert it to:

+	ret =3D readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
+				 !(val & GMAC_VLAN_TAG_CTRL_OB),
+				 1000, timeout);
+	if (ret) {
+		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
+		return ret;
+	}
+
+	return 0;

-Serge(y)

> =

> --
> 2.34.1
> =

> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
