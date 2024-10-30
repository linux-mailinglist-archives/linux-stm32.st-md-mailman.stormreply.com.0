Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52E9B5986
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 02:47:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D4E7C78020;
	Wed, 30 Oct 2024 01:47:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BDE7C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 01:47:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE1015C56BC;
 Wed, 30 Oct 2024 01:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4A2C4CECD;
 Wed, 30 Oct 2024 01:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730252854;
 bh=yY/c+Ers7lzRZ2/3Cil0sCo9++1VJGqVZ3Deuce2yLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VSKPNlsAp8xtYZqJ+lL3YeYwf9h/KFmuUS0SrU0Kd242zkRGAHj2tZolSWx5TqYYy
 4nMY2czlPWVQ7utq52nGSF20rvImvjjAqmR+9w2LTQC0Jd/gfxj3NZ9GkeXjHBfZFb
 493wcFo0ZPkd83UmmFKOxxYlg8TrGNdnH1pelNWwl/0f/1aPmchj9yj4oJh5/10lRP
 oV7fTfv0EkNj5fjXslkR1HT9ZdVhkfAtoO+CBBc9i2tnpqDenWV0yzF5Ev0csWkAzl
 2DhqaGvlKXAJGKFu1dSBT59LPjrL7SLpRWY+1G37QnNyRq8Ix79lrwXLYqfkDisGmN
 WjR19ra5keh9A==
Date: Tue, 29 Oct 2024 18:47:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Message-ID: <20241029184732.2e3ef7b7@kernel.org>
In-Reply-To: <20241025-th1520-gmac-v5-2-38d0a48406ff@tenstorrent.com>
References: <20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com>
 <20241025-th1520-gmac-v5-2-38d0a48406ff@tenstorrent.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Drew Fustini <drew@pdp7.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/2] net: stmmac: Add glue
 layer for T-HEAD TH1520 SoC
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

On Fri, 25 Oct 2024 10:39:09 -0700 Drew Fustini wrote:
> +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 phyif;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		phyif = PHY_INTF_MII_GMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		phyif = PHY_INTF_RGMII;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	};

unnecessary semicolon

> +
> +	writel(phyif, dwmac->apb_base + GMAC_INTF_CTRL);
> +	return 0;
> +}
> +
> +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 txclk_dir;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		txclk_dir = TXCLK_DIR_INPUT;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		txclk_dir = TXCLK_DIR_OUTPUT;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	};

unnecessary semicolon
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
