Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E2983F16
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Sep 2024 09:30:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3807FC78017;
	Tue, 24 Sep 2024 07:30:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0AC6C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Sep 2024 07:30:09 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f761cfa5e6so54110411fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Sep 2024 00:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727163009; x=1727767809;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nJQRM8OcQBfhzuEe8sQ5z7UNmwmAz6ULuryZyUF/+cE=;
 b=No5fpXyk7WdS/wUTb4UqUtp5OelWvPPYuQ0sr30tECsW4xTHLY1Vbh7xyf+VTY2+iP
 arsCDFEX967dNjMEN5TOxtknMdexowijwDdvFSBEDMtNCg6rikbpvUFR1LypdxFyDPmm
 6xeXIP3bkS6GRlvRODVQjCGmk+aCkDhNpgPRwHUn6yy2PP2jXVCr5Cf/klcExb0wrqHD
 jvlwp9lkF3w0FbY6U+ynfAeXEynRxSSGysyxYpnEmt9hapTb464K6StsZJoB6tla1Uf1
 rPvzNBUpYX17RiK15HwmokUkASR/7iLjv0oRfDCxf7u5EfZoHEMyMXHvTngiHKwlyfSr
 HB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727163009; x=1727767809;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nJQRM8OcQBfhzuEe8sQ5z7UNmwmAz6ULuryZyUF/+cE=;
 b=XFvUSGZZGEb8/B95J903jyVf0U8+pgg7Co6woAF+cw+TvyJPoxwjFrKh9+cEJAtSH/
 ukvcYYFoBi2C2zEzwZGHlc4RaxG2DS18v02S+DT8/cmdgdxkraglk54J6zfGJijLhNLM
 Pp4ikKC031qJNBTzjG7uhl+QLa18/2ADzIXywY/PCCncBeeeP4gEO2Z0pMJtnkUvHVX4
 mXiqf8BX0LN9nALElzqprWA5V7dPo7hgTvzv00Cx8AmDm+mmXU8KUhmrTqkdFm1BCOh5
 CmDZCgdjH0mS/FKQUK5g1lpR0vmOHzffIofrMfjuwShfncKqEl/gRMYRCOhPOmYDawRK
 tcXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa4cAuyhnQ34Li6Q44wQd5sNgw9EMUFQ7X6esml1caxjri9LBf+g48DDI4qP7XuafLrplQDLYi7ps6KQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLM79vzSsCA7bVOWTuPYDOnSEfDIyVA6tzNt1dfkzvlO6PYPXg
 1boPfPikMyd7ZKZbApZhchgJnZKwd9a/bdlg/dJwfdk3sQyQcsjz
X-Google-Smtp-Source: AGHT+IHiSe0OiPhFl7VaoeCUi1YflblepVekNSVUxtXk0ofVtVw4xElfai2k8GkrbEMVv8ANZMNY4g==
X-Received: by 2002:a05:651c:1989:b0:2f7:5239:5d9b with SMTP id
 38308e7fff4ca-2f7cb2cfe22mr79571811fa.4.1727163008678; 
 Tue, 24 Sep 2024 00:30:08 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d282fc44sm1323081fa.26.2024.09.24.00.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 00:30:08 -0700 (PDT)
Date: Tue, 24 Sep 2024 10:30:04 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <fcu77iilcqssvcondsiwww3e2hlyfwq4ngodb4nomtqglptfwj@mphfr7hpcjsx>
References: <20240923202602.506066-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240923202602.506066-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-imx@nxp.com, horms@kernel.org,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 net] net: stmmac: dwmac4: extend
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

Hi Shenwei

On Mon, Sep 23, 2024 at 03:26:02PM -0500, Shenwei Wang wrote:
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
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Please note, you can't add the R-b tag without explicitly getting one
from the reviewer/maintainer/etc. Please read the chapter
"When to use Acked-by:, Cc:, and Co-developed-by:" in
Documentation/process/submitting-patches.rst

> ---
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
> index a1858f083eef..0d27dd71b43e 100644
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
> +				 1000, 500000); //Timeout 500ms

Please drop the comment at the end of the statement. First of all the
C++-style comments are discouraged to be used in the kernel code except
when in the block of the SPDX licence identifier, or when documenting
structs in headers. Secondly the tail-comments are discouraged either
(see Documentation/process/maintainer-tip.rst - yes, it's for
tip-tree, but the rule see informally applicable for the entire
kernel). Thirdly the comment is pointless here since the literal
500000 means exactly that.

-Serge(y)

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
