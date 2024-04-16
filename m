Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F248A6ED2
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 16:47:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F5ABC6B45B;
	Tue, 16 Apr 2024 14:47:44 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A904C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 14:47:42 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-518931f8d23so3522795e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713278861; x=1713883661;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dbrXiXP1Z0BGggRg41SKIMpA/U+f24cxgl+dajAMLS8=;
 b=VwzHnbBC4FcqsV45/pQ8muvm3lJznh4bhzrpAq5UIMtJB3/XzkS3bkYVzigovfIDzs
 U+KYKFVHK6d0FJNdIOcjtL8bk0OnVAKutpMsX5eb66D2/L8P5THE2BXfjBLpSkBFqrEq
 29tDKCLuV4k1c6XgabfvDpbPf86QNCWsA1lJltrLSH4oXycqU5yaEcIC4VbABw34xh20
 szuukHxuWMDcwrgLjVR89An2xM2AMvvPRuuVjHktVi4cQHodgJUq2bzLiE7wCNzIbQB2
 Drpr5H5UYfsKvKFmsGHV5V4ipEnprVvaEoBKlp9lzE7WMRMVZN9ZdX9EyVfW3Tf4mioZ
 fBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713278861; x=1713883661;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dbrXiXP1Z0BGggRg41SKIMpA/U+f24cxgl+dajAMLS8=;
 b=CjZp7H5TdnSBs5KEuPJtJEcjoRjpgcXSCexs/vOLkBaOBNJEtyH9kIz+OwCgL07Ltr
 +Zb+230ppdZjNp1T/rta5QDeDe9w3BChTfCJxh30mXjY5JJX8y0oVAFwIsjB376Ft51r
 FbkVol55mO849eYpJkdvtLd/9xpHSRlg9gdGu7OL0xEzZQ3DZUuFuh+x0xz7qwby7jE0
 pLlbBGMxmA8dbFAOkI2P41NogzbAPqI+1iWMWLYPOyx2RYm1vTdlr0kqTqqV5HH935mW
 qLLE1eqqytf19AHCE/eqjxMOxa3BKYDl14iKGCHU6GZfL9OsBgTZsqVKAoJ0T81vJ2NL
 GzFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1oNd/FW6X9fyN9hKL4YAQCqOqbjjG4xDWshd2OiKjxohXDwmwhbbD1MZ858Dw6kLNPKEUCopskWesokTcHm/1Fg4ENiGk+HkVfcLPtCAFYX/ATvcJ6Kop
X-Gm-Message-State: AOJu0Yx4HW7cwPmz5fbWGC7NlcTxHGPJuCjs6STVHtGiN8ljA5y0+syH
 oxFRcLfKz1TF80g1OTkMr260uSZ4CfpPnh579llYOucxLMj35h+t
X-Google-Smtp-Source: AGHT+IGVhUdbPenkEaBQEHoVWuoYM/g4N2s7D3ZyC86/yvbgSIn/UZQYlQxGwuRqXOP8zkYj3k1bUg==
X-Received: by 2002:a05:6512:473:b0:516:9f1a:929d with SMTP id
 x19-20020a056512047300b005169f1a929dmr8026763lfd.1.1713278861201; 
 Tue, 16 Apr 2024 07:47:41 -0700 (PDT)
Received: from mobilestation.baikal.int (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05651203b100b00516b07d95c0sm1606425lfp.217.2024.04.16.07.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:47:40 -0700 (PDT)
Date: Tue, 16 Apr 2024 17:47:38 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <xp34tp5cjmdshefxjczltz2prqtiikagfspf4lobznzypvsyah@ihpmwfynwzhh>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-4-ab12f2c4401d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-rzn1-gmac1-v3-4-ab12f2c4401d@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/5] net: stmmac: add support
	for RZ/N1 GMAC
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

On Mon, Apr 15, 2024 at 11:18:44AM +0200, Romain Gantois wrote:
> [...]
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac-rzn1.c
> new file mode 100644
> index 0000000000000..e85524c2017cf
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 Schneider-Electric
> + *
> + * Cl=E9ment L=E9ger <clement.leger@bootlin.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/pcs-rzn1-miic.h>
> +#include <linux/phylink.h>
> +#include <linux/platform_device.h>
> +
> +#include "stmmac_platform.h"
> +#include "stmmac.h"
> +
> +static int rzn1_dwmac_pcs_init(struct stmmac_priv *priv,

> +			       struct mac_device_info *hw)

AFAICS hw is unused, and the mac_device_info instance is reached via
the priv pointer. What about dropping the unused argument then?

> +{
> +	struct device_node *np =3D priv->device->of_node;
> +	struct device_node *pcs_node;
> +	struct phylink_pcs *pcs;
> +
> +	pcs_node =3D of_parse_phandle(np, "pcs-handle", 0);
> +
> +	if (pcs_node) {
> +		pcs =3D miic_create(priv->device, pcs_node);
> +		of_node_put(pcs_node);
> +		if (IS_ERR(pcs))
> +			return PTR_ERR(pcs);
> +
> +		priv->hw->phylink_pcs =3D pcs;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rzn1_dwmac_pcs_exit(struct stmmac_priv *priv,

> +				struct mac_device_info *hw)

ditto.

-Serge(y)

> +{
> +	if (priv->hw->phylink_pcs)
> +		miic_destroy(priv->hw->phylink_pcs);
> +}
> +
> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
