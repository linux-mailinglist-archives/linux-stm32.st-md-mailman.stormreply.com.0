Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C56DAA83C77
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 10:19:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BB6CC7A82B;
	Thu, 10 Apr 2025 08:19:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 155CAC7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 08:19:25 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so6900295ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744273164; x=1744877964;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHyb6lhohF2wzP2TRq2BN9NjbPL3ptwOR5h1WfQqLIY=;
 b=d67+idmrE6/h5aKx9sHC0DDPrzS4eP7EeL1S221LV+ZLTvEu2EZ5enTWdsDFe9lT87
 yPbrFcMumVw/Ir1Y0c6hgM4SSMiSiD3seu9TJDgkBAlMWpOyQxXFGglX9bJTYYu4pEBR
 e6bKG1sd0yDvY5HinU+3DI9jD0cJ1dKFvLFPGmw00aIhWzCVT2SlcaBww7f7lM7sMGrX
 rjgJEl4BIkRX5IS0VAaf0XB11NCBH0JSI3eN7P389/aUwHoKvnChTH5GJvtS1uFW2RqR
 xj3Uz0zhNQVU1a2LFaw9q1pgYrDTUZHdI+byL2WEqH7wW7Eyj/j5itiWD0KxCCIznyUT
 iGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744273164; x=1744877964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHyb6lhohF2wzP2TRq2BN9NjbPL3ptwOR5h1WfQqLIY=;
 b=XCkinGxGUHmL6PwsccMgJDjXFew3gQDjftmV30Qlf3kpOw/6uX8be/GXXDbAKGJ0g1
 CRKrkHvaaz6tI6hHnQ+OdTKtgutwI5AG7M6YD7p70pMF8qRVfLuRBUSvkptUig2AVA2E
 zP3mNkEm3r4mkKPn/PPaLgMbTtfrfYNUNN3kSvVQ3RDd0V0fz+rsxBvjHr/02T7WDIPS
 5c2ODSZoRc4mAStNVyLRo5R84VmccEZZh+2U+ajwM6RmjP8LZ4Z4WPKUDXUqWP4y0lch
 8S5/8UEFqQQ9MjXLehwujr5ZXDVD0Wa7jlVrVJ+zkHwSyerJDt/iY1K/5YHBQYvjBjT0
 1nSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURgcZ4y8VtNlSMPY8wQH0tT/wc6MrBJf0DhW8rYL9VZ3ZuHv256iqNe3kBXhM+SqHoAruJvAI2reWg1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzWlgy0/Qidkz4WMa91DZBeI30hg6Uf+nToZYFwobgs9CKwiGv
 lZci6PVMv58/x8G4ctwE3B2//b/zq8OEIftQ77H1B+icKVG4Uwjt
X-Gm-Gg: ASbGncs+mjNimX+9EkvOWbfcgtQYDXuZW5spDiqkcyD/P8p8+4WqAoLX/ceAXFgjN9n
 fNR7txZleNo1+6xS8Ga3YovFyqchbK2MURyuejPDod7hCVNoBk5NxINEaELfgru0dzGjkkRUeGX
 DkOhDw9QJacrsCNhBU76nGSNvg4rjVqZvkzKkdHXjy4auyDlZ2u4CD+0PJdR27vZWzNv5HroxZW
 MJIdp9ihProbQ8Pd61/ulmTxDkZEs2KRFymfZAHVRYW2E1d+443z+g3xxFkn71X2dQhW/9C7EgT
 r9s1TWVY3lgaY3RuFy6kNsb0QVmV2/KyGQ==
X-Google-Smtp-Source: AGHT+IH17ATIoN+yDWaOFwQRSqTSShuXuEFiLJbcGJtyBxMLgeMII6OtBGNiFxLsRBJFPmmRKIiE9A==
X-Received: by 2002:a17:903:22c5:b0:224:24d5:f20a with SMTP id
 d9443c01a7336-22be03f19cbmr22298095ad.48.1744273164355; 
 Thu, 10 Apr 2025 01:19:24 -0700 (PDT)
Received: from localhost ([144.24.43.60]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1d2afa9sm2669045b3a.22.2025.04.10.01.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 01:19:24 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:19:12 +0800
From: Furong Xu <0x1207@gmail.com>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Message-ID: <20250410161912.0000168a@gmail.com>
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
> +static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> +			     __le16 perfect_match, bool is_double)
> +{
> +	void __iomem *ioaddr = hw->pcsr;
> +	u32 value;
> +
> +	writel(hash, ioaddr + VLAN_HASH_TABLE);
> +
> +	value = readl(ioaddr + VLAN_TAG);
> +
> +	if (hash) {
> +		value |= VLAN_VTHM | VLAN_ETV;
> +		if (is_double) {
> +			value |= VLAN_EDVLP;
> +			value |= VLAN_ESVL;
> +			value |= VLAN_DOVLTC;

I can confirm that 802.1ad (QinQ) has been broken on stmmac for years,
and it will be so nice if this refactoring includes some fixes for QinQ

> +		}
> +
> +		writel(value, ioaddr + VLAN_TAG);
> +	} else if (perfect_match) {
> +		u32 value = VLAN_ETV;
> +
> +		if (is_double) {
> +			value |= VLAN_EDVLP;
> +			value |= VLAN_ESVL;
> +			value |= VLAN_DOVLTC;
> +		}
> +
> +		writel(value | perfect_match, ioaddr + VLAN_TAG);
> +	} else {
> +		value &= ~(VLAN_VTHM | VLAN_ETV);
> +		value &= ~(VLAN_EDVLP | VLAN_ESVL);
> +		value &= ~VLAN_DOVLTC;
> +		value &= ~VLAN_VID;
> +
> +		writel(value, ioaddr + VLAN_TAG);
> +	}
> +}
> +
> +static void vlan_enable(struct mac_device_info *hw, u32 type)
> +{
> +	void __iomem *ioaddr = hw->pcsr;
> +	u32 value;
> +
> +	value = readl(ioaddr + VLAN_INCL);
> +	value |= VLAN_VLTI;
> +	value |= VLAN_CSVL; /* Only use SVLAN */
> +	value &= ~VLAN_VLC;
> +	value |= (type << VLAN_VLC_SHIFT) & VLAN_VLC;
> +	writel(value, ioaddr + VLAN_INCL);
> +}
> +
> +static void vlan_rx_hw(struct mac_device_info *hw,
> +		       struct dma_desc *rx_desc, struct sk_buff *skb)
> +{
> +	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
> +		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
> +
> +		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);

So, as the comment above, ETH_P_8021AD or ETH_P_8021Q shall be set selectively
depend on the frame type.

> +	}
> +}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
