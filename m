Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F279CBE4
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 11:32:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73FFEC6B46E;
	Tue, 12 Sep 2023 09:32:47 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48B56C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 09:32:46 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-500b66f8b27so9295075e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694511165; x=1695115965;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0tisjtGn5HwTnlDuYa+imw6wh2RyyzM10er9tYhq8WM=;
 b=AD/VTkpfReziFegmB/a8+4LK8O3yqPiPPeOfI6HrqxntTffeRWWUajTUX+QIMfHRsg
 Q8vKgTqRAmnqLfvUWXK0Iun/7XrNLNDoLXBNFThRBOPmoeInXi86T2yFPwzMiKcYBV9u
 hAvA4P+eUfnv6OCa4GGaMCBbnl9kS7FSAHKxsueqdJpUeyUC2fgB/K4gRyYX8sQ/ae/m
 HXyHQmt+YxRPSjeVLa5KQC/JjKBofHWqedBvK0N7rZDqnoufGOni5A/f8Lun/diS8wxT
 H4B2RCgKH12VabQPkAXsZwPQPLh8nMLwXd1anR9IXL7cJQMRxexqfl7O1lpzD/J02HDk
 iBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694511165; x=1695115965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tisjtGn5HwTnlDuYa+imw6wh2RyyzM10er9tYhq8WM=;
 b=F/VOk+KT5t+D/RWQUQWcUHfxdW3upSvO9UitEaI49o+ERTXAaUb/mrxpieL977ptmj
 47C4NKk7E9kKmXBftOfByqw7tnVck+PMjpFpiPkgG8kg2fZpjNTs/qPHyQUu1qjoTipn
 bhUwPICYs1eTWqmXAv/Uo6h4nDHbDh57fTR8K+nlwy2CSZ40NPvUikaIizuY63roMMfo
 Y8JQN2/04ZzDAW02YcnzOgxKIS+xpj+PNTmUQa78Sh9PS34E938xferpzrLRJyCRPhxx
 LNliDBzK6dtyv0aBQ3IIM73k90ldNzk9Wow2jsIjvJaTyBWRSqz5lnr7XSFrmf8iU5TZ
 Vq8A==
X-Gm-Message-State: AOJu0Yy9BC93d2mU4dLf2/wTNDQZngLdI/y3dANlhoxkFUV/Kbja6FRS
 ZIWQuxMkN7vCCX8r5/0Gwgo=
X-Google-Smtp-Source: AGHT+IFN0FGqvBqLO0ShV2AAM8xsq5NGKgI5Df4M79ZbrNaAs0NTSfr0K19fMExUSUhkJbZjrDV/ig==
X-Received: by 2002:ac2:4297:0:b0:500:b8bc:bd9a with SMTP id
 m23-20020ac24297000000b00500b8bcbd9amr8613584lfh.49.1694511164975; 
 Tue, 12 Sep 2023 02:32:44 -0700 (PDT)
Received: from mobilestation ([85.249.16.222])
 by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004fdfd4c1fcesm1663425lfh.36.2023.09.12.02.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 02:32:44 -0700 (PDT)
Date: Tue, 12 Sep 2023 12:32:40 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <u7sabfdqk7i6wlv2j4cxuyb6psjwqs2kukdkafhcpq2zc766m3@m6iqexqjrvkv>
References: <E1qfiq8-007TOe-9F@rmk-PC.armlinux.org.uk>
 <DM4PR12MB5088F83CE829184956147E6BD3F1A@DM4PR12MB5088.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5088F83CE829184956147E6BD3F1A@DM4PR12MB5088.namprd12.prod.outlook.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 John Fastabend <john.fastabend@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Fabio Estevam <festevam@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add platform
	library
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

On Tue, Sep 12, 2023 at 07:59:49AM +0000, Jose Abreu wrote:
> From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Date: Mon, Sep 11, 2023 at 16:28:40
> 
> > Add a platform library of helper functions for common traits in the
> > platform drivers. Currently, this is setting the tx clock.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---

> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
> >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.c | 29 +++++++++++++++++++
> >  .../ethernet/stmicro/stmmac/stmmac_plat_lib.h |  8 +++++
> 
> Wouldn't it be better to just call it "stmmac_lib{.c,.h}" in case we need to add
> more helpers on the future that are not only for platform-based drivers?

What is the difference between stmmac_platform.{c,h} and
stmmac_plat_lib.{c,h} files? It isn't clear really. In perspective it
may cause confusions like mixed definitions in both of these files.

Why not to use the stmmac_platform.{c,h} instead of adding one more
file? Especially seeing it already has some generic
platform/glue-drivers helpers like:
stmmac_get_platform_resources() <- especially this one.
(devm_)stmmac_probe_config_dt()
stmmac_remove_config_dt()
stmmac_pltfr_init()
stmmac_pltfr_exit()
(devm_)stmmac_pltfr_probe()
stmmac_pltfr_remove()
stmmac_pltfr_suspend()
stmmac_pltfr_resume()
stmmac_runtime_suspend()
stmmac_runtime_resume()
stmmac_pltfr_noirq_suspend()
stmmac_pltfr_noirq_resume()
All of them look like being decent to be defined in the generic
platform library methods too.

-Serge(y)

> 
> I believe it's also missing the SPDX identifiers?
> 
> Thanks,
> Jose
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
