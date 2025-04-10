Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD12A8397C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 08:38:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60E0EC78F68;
	Thu, 10 Apr 2025 06:38:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 485FCC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 06:38:35 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ff6cf448b8so586073a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 23:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744267114; x=1744871914;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KuVL+jTm8BlM5ZpgP0Uojq+Y9nMX/V5q2TiLQtlvtmM=;
 b=fouCMeuyuUoXWJlizg+wt+x2uJdWBr6ls4VJAHJKoNpAJjLRhrMf9ehMfcRYj0dm+m
 3tnp8IzclsZ4FoeESHDLi0KCAM+dZJ4ZUAyPpu77RXG5IYreBr5aXzOUbWlOYn4KcvQR
 BDrR0EsEBcH0SrF1CTcnDIMljZv0XjaAvRtLWPg1oMgnQTNxtaLqIDQsD/TmFFApAwme
 6oY65kcNurBlUGXSecbyzaVNex1sZdbRZc87anK754U+2wa9fL4qfiz2Advbk0j53fNZ
 yvXfsmzqO2LbkM21Pc3dr6eICLKJ77oHOevuJQeSqt0Hy5MBzdgcqeMcRr38Sv/p9jyq
 C7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744267114; x=1744871914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KuVL+jTm8BlM5ZpgP0Uojq+Y9nMX/V5q2TiLQtlvtmM=;
 b=FRVi0JHJrO+jCgPLf/6a/st2UMx7RtyVjeGhCItQD2j/TLaTq3dM/sWCJAAkVKWpSj
 UMqoBUG2mVXNMsCuXAVGXxe6f7qd2u+j63NgEAbsY0iRjObm9foaNFKvFh58uNmR5Jg8
 2DAk7PrDKMmoOnRgz4fZ0V5RBSaFABFQdScaSsAQ+TNkow7ytUE8SpaHvE7BJHS7q+an
 jTpOIe0q+bhwBNSnTDBs7Axs3bteJ5wB2fASOQ3jkNEjUZwLlha/jUMI/TU+p78Q3EqZ
 WAZdzfsrZ3qOq8sdKN5bAv1mjxinyS7RkxuA2kViKDfgJGsICybGKSu6wk+uIMY7drCR
 AKQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwJbnFWYgM6cknN4AcHi9MxqHgFuqXKJBSCpihI0KWlxxGoM8NyY8xTRj2RAh9H+eR6u8w+96hxWfr+w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyekwi5ALJxYNpUy1/IS+f2o2LQNtpAXZLzr8liDeskKpl3MiFa
 PVS15lOizIB6B3yV+v5+4Y7ytWACIj0l9gEn9hCQlIKtOItqr9df
X-Gm-Gg: ASbGnctGbxuCdkYFNBlkOuIjyv4mWvV1q+FtuxTxOf+HtLlp3NCNWTNkPmrPXA6ULfo
 Nh297y4YyQaQL18HpFtsuueTNfKcUR9esdi3U3WHzQLlvTkVEI/KRBhNsDVaQNA9WhLe0lneGeJ
 IErXPCwnZFuOt7jydBUV6HsFJp+U4lZHD/VD7kd6KtcPg9ihCmSUEy8ky4V8Y8pheZjPMWSWTZV
 BPQwMGSqr1UgrLOPODqdH7kGv2A/sv+0KyEPpTiks98JWbLA7RLp0jdFB/oVPIhQhIRg2beIRSm
 YiiR3jH2kJS4jzwMwKff7c6q8br3ocgOrhRxqHlMbBB5
X-Google-Smtp-Source: AGHT+IFoLHwW+yB8ugnhtjq/Zm+3UsyrrhpRcH51GcUutNiq2TfCMkej9FiKynCN6f6ckD3TqsaTYA==
X-Received: by 2002:a17:90b:2dca:b0:2fa:17dd:6afa with SMTP id
 98e67ed59e1d1-30718b82e6bmr3115309a91.17.1744267113628; 
 Wed, 09 Apr 2025 23:38:33 -0700 (PDT)
Received: from localhost ([144.24.43.60]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cb554bsm22850725ad.199.2025.04.09.23.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 23:38:33 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:38:21 +0800
From: Furong Xu <0x1207@gmail.com>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Message-ID: <20250410143821.000002c0@gmail.com>
In-Reply-To: <20250408081354.25881-2-boon.khai.ng@altera.com>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-2-boon.khai.ng@altera.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Tien Sung Ang <tien.sung.ang@altera.com>,
 Alexei Starovoitov <ast@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 linux-kernel@vger.kernel.org, "David S .
 Miller" <davem@davemloft.net>, Mun Yew Tham <mun.yew.tham@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] net: stmmac: Refactor
 VLAN implementation
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

On Tue,  8 Apr 2025 16:13:53 +0800, Boon Khai Ng <boon.khai.ng@altera.com> wrote:

> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  40 ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 295 +-----------------
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  13 -
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  87 ------
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |   8 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  61 ++--
>  .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 294 +++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_vlan.h |  63 ++++
>  10 files changed, 401 insertions(+), 463 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h
> 
[...]
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 31bdbab9a46c..0a57c5e7497d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -9,6 +9,7 @@
>  #include "stmmac_fpe.h"
>  #include "stmmac_ptp.h"
>  #include "stmmac_est.h"
> +#include "stmmac_vlan.h"
>  #include "dwmac4_descs.h"
>  #include "dwxgmac2.h"
>  
> @@ -120,6 +121,7 @@ static const struct stmmac_hwif_entry {
>  	const void *tc;
>  	const void *mmc;
>  	const void *est;
> +	const void *vlan;
>  	int (*setup)(struct stmmac_priv *priv);
>  	int (*quirks)(struct stmmac_priv *priv);
>  } stmmac_hw[] = {
> @@ -197,6 +199,7 @@ static const struct stmmac_hwif_entry {
>  		.desc = &dwmac4_desc_ops,
>  		.dma = &dwmac4_dma_ops,
>  		.mac = &dwmac410_ops,
> +		.vlan = &dwmac_vlan_ops,

Rename dwmac_vlan_ops to dwmac4_vlan_ops will be better,
just like dwmac4_desc_ops/dwmac4_dma_ops

[...]
> +const struct stmmac_vlan_ops dwmac_vlan_ops = {
> +	.update_vlan_hash = vlan_update_hash,
> +	.enable_vlan = vlan_enable,
> +	.add_hw_vlan_rx_fltr = vlan_add_hw_rx_fltr,
> +	.del_hw_vlan_rx_fltr = vlan_del_hw_rx_fltr,
> +	.restore_hw_vlan_rx_fltr = vlan_restore_hw_rx_fltr,
> +	.rx_hw_vlan = vlan_rx_hw,
> +	.set_hw_vlan_mode = vlan_set_hw_mode,
> +};
> +
> +const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
> +	.update_vlan_hash = vlan_update_hash,
> +	.enable_vlan = vlan_enable,
> +};

dwxlgmac2_vlan_ops looks redundant here, another new struct contains
totally identical members.

stmmac_do_void_callback()/stmmac_do_callback() handles NULL function
pointers so good, we can leave the un-implemented functions as NULL.

Are you trying to avoid something undefined here?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h
> new file mode 100644
> index 000000000000..29e7be83161e
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025, Altera Corporation
> + * stmmac VLAN(802.1Q) handling
> + */
> +
> +#ifndef __STMMAC_VLAN_H__
> +#define __STMMAC_VLAN_H__
> +
> +#include <linux/bitfield.h>
> +
> +#define VLAN_TAG			0x00000050
> +#define VLAN_TAG_DATA			0x00000054
> +#define VLAN_HASH_TABLE			0x00000058
> +#define VLAN_INCL			0x00000060
> +
> +#define HW_FEATURE3			0x00000128
> +
> +/* MAC VLAN */
> +#define VLAN_EDVLP			BIT(26)
> +#define VLAN_VTHM			BIT(25)
> +#define VLAN_DOVLTC			BIT(20)
> +#define VLAN_ESVL			BIT(18)
> +#define VLAN_ETV			BIT(16)
> +#define VLAN_VID			GENMASK(15, 0)
> +#define VLAN_VLTI			BIT(20)
> +#define VLAN_CSVL			BIT(19)
> +#define VLAN_VLC			GENMASK(17, 16)
> +#define VLAN_VLC_SHIFT			16
> +#define VLAN_VLHT			GENMASK(15, 0)
> +
> +/* MAC VLAN Tag */
> +#define VLAN_TAG_VID			GENMASK(15, 0)
> +#define VLAN_TAG_ETV			BIT(16)
> +
> +/* MAC VLAN Tag Control */
> +#define VLAN_TAG_CTRL_OB		BIT(0)
> +#define VLAN_TAG_CTRL_CT		BIT(1)
> +#define VLAN_TAG_CTRL_OFS_MASK		GENMASK(6, 2)
> +#define VLAN_TAG_CTRL_OFS_SHIFT		2
> +#define VLAN_TAG_CTRL_EVLS_MASK		GENMASK(22, 21)
> +#define VLAN_TAG_CTRL_EVLS_SHIFT	21
> +#define VLAN_TAG_CTRL_EVLRXS		BIT(24)
> +
> +#define VLAN_TAG_STRIP_NONE		FIELD_PREP(VLAN_TAG_CTRL_EVLS_MASK, 0x0)
> +#define VLAN_TAG_STRIP_PASS		FIELD_PREP(VLAN_TAG_CTRL_EVLS_MASK, 0x1)
> +#define VLAN_TAG_STRIP_FAIL		FIELD_PREP(VLAN_TAG_CTRL_EVLS_MASK, 0x2)
> +#define VLAN_TAG_STRIP_ALL		FIELD_PREP(VLAN_TAG_CTRL_EVLS_MASK, 0x3)
> +
> +/* MAC VLAN Tag Data/Filter */
> +#define VLAN_TAG_DATA_VID		GENMASK(15, 0)
> +#define VLAN_TAG_DATA_VEN		BIT(16)
> +#define VLAN_TAG_DATA_ETV		BIT(17)
> +
> +/* MAC VLAN HW FEAT */
> +#define VLAN_HW_FEAT_NRVF		GENMASK(2, 0)
> +
> +extern const struct stmmac_vlan_ops dwmac_vlan_ops;
> +extern const struct stmmac_vlan_ops dwxlgmac2_vlan_ops;
> +
> +u32 stmmac_get_num_vlan(void __iomem *ioaddr);
> +
> +#endif /* __STMMAC_VLAN_H__ */

It is a good practice to only keep inside the header those definitions
which are truly exported by stmmac_vlan.c towards external callers.
That means those #defines which are only used within stmmac_vlan.c
shouldn't be here, but inside stmmac_vlan.c file.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
