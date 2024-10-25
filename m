Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D599B132D
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Oct 2024 01:28:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D1F5C78021;
	Fri, 25 Oct 2024 23:28:25 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E1EEC7801C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 23:28:17 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-20c6f492d2dso27356425ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 16:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729898896; x=1730503696;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d+LonYrIZEHor693r4mdE7TdXh7oFFBiZD+b7YxVtbo=;
 b=VLfGtmoqrD5XGXWCyS3AQauOa1XT9JBenblqu5yu1M6aisXSjvg565W3xFzC60r0OF
 PffNjshtgCLpmrfvPpv7gTXhr/vxXmT2eQqv5SJb+3zURoXbazg0rgw5ql11mMiMpSES
 fMqQqmBYahfWCGcRCoccCXwDUAvzL1t2S4PZLBIZBPnz/Ofv7NQUU8+iBxOIWImAgATZ
 ApXPOTETczJH3GTg7xVmeBL0Mxoh3sfDNlHq24yBqvnqVnf3f319APlgka+qLHTTohHI
 dwueYLyh64fiPOLVmeSjPpTvxL8P0/GKY011ENuBtC94AyWrtZPo6Hw7neWWYxMlm+a9
 0XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729898896; x=1730503696;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+LonYrIZEHor693r4mdE7TdXh7oFFBiZD+b7YxVtbo=;
 b=ewwIiKY5WEH50MKIyF8dcFi+3pPgO8DLxBlFKJEl5yKeD2hwZPBZI6hIdBBS3B/HjQ
 cHq+dJFoJUcg2KMI+lqm9WeZF2MmioT7y5ywFIcLCIAtbXVtMGyzTEig57wim8GsFNZ1
 +m4jx07LVNRyVT9gtTl+1wiOlH1V61Vm/b1JJmU4e7WJUUBuMinxHD2SplqNW0AllgF/
 9WRtcT8v9mLxBfSP+vnxWLCHOXD9O2wS4PyfjXBGpiYPq7TPKTo4KPb0TR81lCUyC0Cl
 MJv0myESanl4BS07GBbUyg+ymfWhI26ulbYLkFtXQnI8xse7u0NkGC3daSFVqreC9dXp
 CBvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB9zet7eKkvYll08zx4Be9oN9qBPhLP2+gSJE3Od25acFAx7papZt36uQqoRJKwzLlelSs18eyxth2mQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwF9uo9l6qJErlv1sGq3Z/2ZQwr7nTdIzyskp7llWfbJQBEZo7a
 jYR1wixIWKsogWuwR8zCowcCOvWQMPBFJPVZ6xVhm/7QOroUIFo7
X-Google-Smtp-Source: AGHT+IHamz0WczDVCsPc6CPqKdEhjI+8PIhVIRTWBbvo/nv2cWi0cJElpgaxLC3cRQCvUjNkV4uDYQ==
X-Received: by 2002:a17:903:2450:b0:20c:a692:cf1e with SMTP id
 d9443c01a7336-210c6c6ce1bmr13188725ad.43.1729898895779; 
 Fri, 25 Oct 2024 16:28:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf6d6e7sm14383325ad.71.2024.10.25.16.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 16:28:15 -0700 (PDT)
Date: Sat, 26 Oct 2024 07:27:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <22g3v2h52xjhhwxdgnte6mhhadjfds2vlxlwz7b7t2fa7jlty2@lwyumoromg3c>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-5-inochiama@gmail.com>
 <e00a0277-c298-47ba-9fdd-8f740f7490cc@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e00a0277-c298-47ba-9fdd-8f740f7490cc@intel.com>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 4/4] net: stmmac: Add glue layer for
	Sophgo SG2044 SoC
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

On Fri, Oct 25, 2024 at 04:53:07PM +0200, Alexander Lobakin wrote:
> From: Inochi Amaoto <inochiama@gmail.com>
> Date: Fri, 25 Oct 2024 09:10:00 +0800
> 
> > Adds Sophgo dwmac driver support on the Sophgo SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 109 ++++++++++++++++++
> >  3 files changed, 121 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> 
> [...]
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > new file mode 100644
> > index 000000000000..8f37bcf86a73
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -0,0 +1,109 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Sophgo DWMAC platform driver
> > + *
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
> > + *
> 
> This empty line is redundant I guess?
> 
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/phy.h>
> > +#include <linux/regmap.h>
> 
> Here should be alphabetical order.
> 

Thanks, I forgot to reorder it when adding new include.

> > +
> > +#include "stmmac_platform.h"
> > +
> > +struct sophgo_dwmac {
> > +	struct device *dev;
> > +	struct clk *clk_tx;
> > +};
> > +
> > +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > +{
> > +	struct sophgo_dwmac *dwmac = priv;
> > +	long rate;
> > +	int ret;
> > +
> > +	rate = rgmii_clock(speed);
> > +	if (ret < 0) {
> 
> Did you mean `if (rate < 0)`?
> 

Yeah, it seems I forgot to modify it.

> > +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > +		return;
> > +	}
> > +
> > +	ret = clk_set_rate(dwmac->clk_tx, rate);
> > +	if (ret)
> > +		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> 
> Don't you want to print the error code here?
> 
> 		"failed to set tx rate %lu: %pe\n", rate, ERR_PTR(ret));
> 

Thanks, it is more clear now.

> > +}
> > +
> > +static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> > +				    struct plat_stmmacenet_data *plat_dat,
> > +				    struct stmmac_resources *stmmac_res)
> > +{
> > +	struct sophgo_dwmac *dwmac;
> > +	int ret;
> 
> Unused var.
> 
> > +
> > +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> > +	if (!dwmac)
> > +		return -ENOMEM;
> > +
> > +	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(dwmac->clk_tx))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> > +				     "failed to get tx clock\n");
> > +
> > +	dwmac->dev = &pdev->dev;
> > +	plat_dat->bsp_priv = dwmac;
> > +	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
> > +	plat_dat->fix_mac_speed = sophgo_dwmac_fix_mac_speed;
> > +	plat_dat->multicast_filter_bins = 0;
> > +	plat_dat->unicast_filter_entries = 1;
> > +
> > +	return 0;
> > +}
> 
> [...]
> 
> + see the build bot report.
> 
> Thanks,
> Olek


Thanks, I will fix it.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
