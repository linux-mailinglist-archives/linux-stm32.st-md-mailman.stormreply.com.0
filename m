Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC998C681
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 22:08:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88708C78019;
	Tue,  1 Oct 2024 20:08:43 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 155F7C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 20:08:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53993564cb1so3245497e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Oct 2024 13:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727813315; x=1728418115;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3F7/FFtWApLSUXEepnnbis6VSjR+VGvY092OXy/kqpk=;
 b=kxQ1shZ+SPup0LfAf/Q7wXKZaIbZZ+4oJqHV487BxNekkP0TOqL0WlBrTGtagkGJQx
 O7G3nMPLM1hEuynvjHd48gtR5BMqGsglbGhZE2Q90PK56LWb9pTfQbwHkVTzmg+AnucX
 nkSAIWmwcom2Wr2RvJckoYahJc4MIv4v4iCO+SFsSOoHNxOIuQhqiA4H3XEl+PGrLhIT
 uBysl/FaB5zkacHvQNG0NmmtWb+K/trZiSQDLV32BeBLByK4ZeJwYrzMIbLRxDQBL5i/
 /FZR3Bn1fS5DWtvUsOHLdlxWQ5zPvFHC6nyoYA0DJ2AmT2WsQtGX+VYjnTeXkPK3BPD+
 S0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727813315; x=1728418115;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3F7/FFtWApLSUXEepnnbis6VSjR+VGvY092OXy/kqpk=;
 b=IFQpGbmtJIg1fHZVt/VFc6JnHthvoFy3nvNqLtHAX4Lx0Ki9F3dHNINb2SI2oaToM/
 UfosdJ2FvVBr722eITjJ57YcWcaz2lnpEUAAcS8NUjm02STV0s+rgypHM+k27qXbB8UL
 ayMhxDjD8872Quq4kvkNHbSzeDFJS+Vd3kutG4U6Sa0QQGKaCSeUomW32Q+pnPhl8+SZ
 uTOGMlDfKAootW4W404z55APsSbmbWSN1ohXnBOjimnFVja65lRME5UzXEBecuOabftn
 F7aRpfGJc7xtXugjFdwjjYUPAtdp2Pp2W03RpJME1wVU6L05Pg1N5PZVdPxKO8E0immG
 qwkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWacaEymucatwKm6lROIh7E+Nj6wuGJ/wIIpkO+DI/VRVgErkxJfq7bceKzJYmCFatpt36W5GDCqXldsw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTT2BIz6p7miwtmM3CBW0xxjv61SRVStqMVgQ3Hp6ONCwhBWis
 QMjM5951ZkB5Q1GiYKvLoq0wPd6zEDMW7imkDEJdosBYCQXnMbgz
X-Google-Smtp-Source: AGHT+IFQgGFOsaorJ/fsSrIM5NkGlLHrttg96Z9/+Xv6vqBLdsR83SKhx/SA5x3kSEFm21tU85bkbQ==
X-Received: by 2002:a05:6512:3b1e:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-539a06589bemr435745e87.3.1727813314834; 
 Tue, 01 Oct 2024 13:08:34 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5398b124577sm1450666e87.158.2024.10.01.13.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 13:08:34 -0700 (PDT)
Date: Tue, 1 Oct 2024 23:08:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <wltofooowb3nl5gzfygdj3kd22glmd22hji4nlhovwct7ckrvo@j4st55j52awv>
References: <20240924205424.573913-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240924205424.573913-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-imx@nxp.com, horms@kernel.org,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 net] net: stmmac: dwmac4: extend
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

On Tue, Sep 24, 2024 at 03:54:24PM GMT, Shenwei Wang wrote:
> Increase the timeout for checking the busy bit of the VLAN Tag register
> from 10=B5s to 500ms. This change is necessary to accommodate scenarios
> where Energy Efficient Ethernet (EEE) is enabled.
> =

> Overnight testing revealed that when EEE is active, the busy bit can
> remain set for up to approximately 300ms. The new 500ms timeout provides
> a safety margin.
> =

> Fixes: ed64639bc1e0 ("net: stmmac: Add support for VLAN Rx filtering")
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Looking good now. Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
> Changes in V4:
>  - fixed the comments and R-b.
> =

> Changes in V3:
>  - re-org the error-check flow per Serge's review.
> =

> Changes in v2:
>  - replace the udelay with readl_poll_timeout per Simon's review.
> =

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c  | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac4_core.c
> index a1858f083eef..e65a65666cc1 100644
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
> +	int ret;
>  	u32 val;
> =

>  	if (index >=3D hw->num_vlan)
> @@ -487,16 +488,15 @@ static int dwmac4_write_vlan_filter(struct net_devi=
ce *dev,
> =

>  	writel(val, ioaddr + GMAC_VLAN_TAG);
> =

> -	for (i =3D 0; i < timeout; i++) {
> -		val =3D readl(ioaddr + GMAC_VLAN_TAG);
> -		if (!(val & GMAC_VLAN_TAG_CTRL_OB))
> -			return 0;
> -		udelay(1);
> +	ret =3D readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> +				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> +				 1000, 500000);
> +	if (ret) {
> +		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> +		return -EBUSY;
>  	}
> =

> -	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> -
> -	return -EBUSY;
> +	return 0;
>  }
> =

>  static int dwmac4_add_hw_vlan_rx_fltr(struct net_device *dev,
> --
> 2.34.1
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
