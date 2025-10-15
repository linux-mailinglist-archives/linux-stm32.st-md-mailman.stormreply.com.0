Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00951BE0B52
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 22:54:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B17D1C57170;
	Wed, 15 Oct 2025 20:54:10 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F276C5716E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+y6negsGs/imAQMRkRWgBlJ91wY7jx6h3f2XOctfhN4=; b=Iqtpg+9FC4m5b8n70PZNXvaQMY
 209mCUQKjNwLOn4BXnBHq4M8JDA0SakH4v/BqfJWc+LR6AFx7U3ZsTj+BoHLJuqsli+zaUshw7vCA
 TDAmYNQaF39qZ2UPbizhCmVLSsTKrdX98YqRZazm/ehuN49QuurpHGp0S0WRakB0LwEI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1v98VL-00B4fo-En; Wed, 15 Oct 2025 22:53:51 +0200
Date: Wed, 15 Oct 2025 22:53:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <574d5b07-02c9-460d-b968-7d894c597ccc@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92Mj-0000000AmH2-1LHZ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1v92Mj-0000000AmH2-1LHZ@rmk-PC.armlinux.org.uk>
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Yu-Chun Lin <eleanor15x@gmail.com>,
 Furong Xu <0x1207@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 07/14] net: stmmac: remove RGMII
	"pcs" mode
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

On Wed, Oct 15, 2025 at 03:20:33PM +0100, Russell King (Oracle) wrote:
> Remove the RGMII "pcs" code in stmmac_check_pcs_mode() due to:
> 
> 1) This should never have been conditional on a PCS being present, as
>    when a core is synthesised using only RGMII, the PCS won't be present
>    and priv->dma_cap.pcs will be false. Only multi-interface cores which
>    have a PCS present would have detected RGMII.
> 
> 2) STMMAC_PCS_RGMII has no effect since the broken netif_carrier and
>    ethtool code was removed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
