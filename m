Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D8F9A39D6
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 11:21:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CF54C78038;
	Fri, 18 Oct 2024 09:21:48 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CEEFC78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 09:21:42 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a9a19bf0a1dso30697266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729243302; x=1729848102;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jlTM9V5DRsPe4eqW9RQavt8mzladFi9MCIQh4OOLQfA=;
 b=JaAdcwRlfKePU8aCkW1v1OAigiXTm+WpT5rbG74O1G7KTE2wdjG4Kl+BGdN7xoV87k
 HcpELe9qN+bcKSWeFtbs71T2W9n1kyqpVOShCai6pWZkCAN852gtgfCu1Zq5aiNY5tMn
 3GET7MBui1NYk3cFk/AQxa7Joz861T/XDwEC1lLUT4skGx/deI0gykQmvA3A13N48SI0
 DkQqEkBBrGBBYho6a7BRO0I6pf52cgTBDrHbJjdmjY0ZvEsPA6uhWnFsAgDd0MXlVDGl
 qYuZ+MTvkaZew7iSQT8JbWSDxsi6VMwnLaj5W8IyHRjw8vEs+v1dlrcZ7FOLs0t1PH7Y
 +yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729243302; x=1729848102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlTM9V5DRsPe4eqW9RQavt8mzladFi9MCIQh4OOLQfA=;
 b=sR0RjfJDbX7YQpmQvJdo20RVCpKI1F9OWVyCJnYoTceRnGu0JPZaapfnOF84cKgVr4
 jM6EIhHj+gIucbmMBcvid6scdU6TFvtiAd3LYZY4i+j2k8czH6ICgLOK4wIc6OjoAJmu
 TRd6iaxbspAiaN5oKplds8K7gH6cJwU3m7Nc6FAlEI/UoBoe1uq1ETg8Cku3Dr5ME+He
 rROAbiCM4nwzKVWaOdxG7GA8QhOeiHZopyAmw3FXcu7UG4CW8GziOQoSKnqdUNH0TOW3
 wzt0TSlrnCqxSvU2lilGT6eE2APOYsd0scoBy+icH95VOS/i5p3268t5xEiTQZ7o88UD
 UHmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0JRuYVA8olIWkH9ko4pk7C4R24I6Dfuzo4Sci06Gu76M+BisIn8IXTLpin7nVCFoIDhEZQzMLjm3gNA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNGIIiaG/6vI735bFF3z7LYFExdjh2IrM8ds9QiSZtzXnDvauq
 m860ubzYA3XdQCTCaz/UTfKHzFB76XPKIw54rE/+TK81QWr6mF8h
X-Google-Smtp-Source: AGHT+IFDFLCQA1phkwKSMbXUM2S3mB35TEAVZuUbCEytPdAHoYv1Sm/TfjB25QyeBIZIHMBL+yOy2g==
X-Received: by 2002:a17:907:3d8e:b0:a9a:2523:b4fa with SMTP id
 a640c23a62f3a-a9a69a76177mr64789866b.4.1729243301360; 
 Fri, 18 Oct 2024 02:21:41 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68bf7227sm67420166b.181.2024.10.18.02.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 02:21:40 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:21:38 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241018092138.xo2zoadx2jng27rp@skbuf>
References: <cover.1729233020.git.0x1207@gmail.com>
 <a5c4bc8682a6ff108d4721e46f08dc0ac799ffcd.1729233020.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5c4bc8682a6ff108d4721e46f08dc0ac799ffcd.1729233020.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: stmmac: Introduce
 separate files for FPE implementation
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

On Fri, Oct 18, 2024 at 02:39:07PM +0800, Furong Xu wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> new file mode 100644
> index 000000000000..d4d46a07d6a7
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Furong Xu <0x1207@gmail.com>
> + * stmmac FPE(802.3 Qbu) handling
> + */
> +#include "stmmac.h"
> +
> +#define STMMAC_FPE_MM_MAX_VERIFY_RETRIES	3
> +#define STMMAC_FPE_MM_MAX_VERIFY_TIME_MS	128
> +
> +#define MAC_FPE_CTRL_STS		0x00000234
> +#define TRSP				BIT(19)
> +#define TVER				BIT(18)
> +#define RRSP				BIT(17)
> +#define RVER				BIT(16)
> +#define SRSP				BIT(2)
> +#define SVER				BIT(1)
> +#define EFPE				BIT(0)
> +
> +#define MTL_FPE_CTRL_STS		0x00000c90
> +/* Preemption Classification */
> +#define DWMAC5_PREEMPTION_CLASS		GENMASK(15, 8)
> +/* Additional Fragment Size of preempted frames */
> +#define DWMAC5_ADD_FRAG_SZ		GENMASK(1, 0)
> +
> +#define XGMAC_FPE_CTRL_STS		0x00000280
> +#define XGMAC_EFPE			BIT(0)
> +
> +/* FPE link-partner hand-shaking mPacket type */
> +enum stmmac_mpacket_type {
> +	MPACKET_VERIFY = 0,
> +	MPACKET_RESPONSE = 1,
> +};
> +
> +void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
> +void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
> +void stmmac_fpe_init(struct stmmac_priv *priv);
> +void stmmac_fpe_apply(struct stmmac_priv *priv);
> +
> +void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			  u32 num_txq, u32 num_rxq,
> +			  bool tx_enable, bool pmac_enable);
> +void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
> +			     struct stmmac_fpe_cfg *cfg,
> +			     enum stmmac_mpacket_type type);
> +int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
> +int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr);
> +void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size);
> +int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
> +				    struct netlink_ext_ack *extack, u32 pclass);
> +
> +void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> +			    u32 num_txq, u32 num_rxq,
> +			    bool tx_enable, bool pmac_enable);

2 comments about this header:

- it would be good if it contained a "#pragma once" equivalent, in case
  other headers include it (#ifndef STMMAC_FPE_H #define STMMAC_FPE_H).

- it is good practice to only keep inside the header those definitions
  which are truly exported by stmmac_fpe.c towards external callers.
  That means that the #defines which are only used within stmmac_fpe.c
  shouldn't be here, but inside that C file.

- You could remove the dependency upon the giant #include "stmmac.h" and
  just provide those definitions necessary for this header to be
  self-consistent. By self-consistent I mean that a dummy C file
  containing just #include "stmmac_fpe.h" should compile without errors.

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 7e46dca90628..3fe0a555aa9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -6,7 +6,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
-	      stmmac_xdp.o stmmac_est.o stmmac_fpe.o \
+	      stmmac_xdp.o stmmac_est.o stmmac_fpe.o dummy.o \
 	      $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dummy.c b/drivers/net/ethernet/stmicro/stmmac/dummy.c
new file mode 100644
index 000000000000..fc976afd5e40
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dummy.c
@@ -0,0 +1 @@
+#include "stmmac_fpe.h"

The current stmmac_fpe.h as you've posted it does pass the dummy test,
but I think it can be further minimized. Having headers larger than they
need to be will increase build time, little by little.

Well, those were 3 comments :(
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
