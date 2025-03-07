Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D5A56B46
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 16:09:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 855DAC78F96;
	Fri,  7 Mar 2025 15:09:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 571B9C78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 15:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=se78CTgWSMz3fwwLUHiO5oHWeH+WmhQaI4Bm8mflklg=; b=x9Anm586sYnv+cpZc9KXc48alS
 wvsfTYgeanUiP4jsGZqdyqbURpfrkFuA+oIVM3tAqrpgP/ei3SdmEjrVugVb1T4eNFuTg7gtmDO2c
 T7a4F/KTMociRYbUrWS1heoWUbcadNzERNMbOmQuq2vZKK7+3D428CHMxRBQP+2DdkVgkcLyfl4nn
 bDxMLyNlWEnP/MaPIVd8zOV8bn265VkptQ3RoAnqdCZi4l2574oRqixKb8ZQTg0H5Nd3evL2gVNUv
 PLY4iDtOB0drDRnq7p6bwDfViFApqU5L0t2R0L4fMDZJmgngG7RVHJEtQYWhWZfQTg0Pp/KV1eGrQ
 WKe7OdsQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45108)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tqZJn-0007Zx-1M;
 Fri, 07 Mar 2025 15:08:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tqZJj-0007uQ-0o;
 Fri, 07 Mar 2025 15:08:51 +0000
Date: Fri, 7 Mar 2025 15:08:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <Z8sMAyH0qsMyXmjX@shell.armlinux.org.uk>
References: <20250307011623.440792-1-inochiama@gmail.com>
 <20250307011623.440792-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250307011623.440792-3-inochiama@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chen Wang <unicorn_wang@outlook.com>, Furong Xu <0x1207@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Vladimir Oltean <olteanv@gmail.com>,
 Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/4] net: stmmac: platform:
 Group GMAC4 compatible check
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

On Fri, Mar 07, 2025 at 09:16:15AM +0800, Inochi Amaoto wrote:
> Use of_device_compatible_match to group existing compatible
> check of GMAC4 device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
