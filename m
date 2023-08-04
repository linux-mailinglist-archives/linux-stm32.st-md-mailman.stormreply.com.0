Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B1D7703B2
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Aug 2023 16:56:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DE00C6B466;
	Fri,  4 Aug 2023 14:56:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AAF7C6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pmti4NNUS1ApwuYq96D8Bd0UZfIiM3Ql7dHgirNSqxk=; b=L9tjcmRToHJFGAcWP5RNR9Qfbr
 98p7RiUW2tXYzTpja3e+G3DH+x4o9RKcZpSQ29M7UwNV1bzKL5uzEr+M2TlDaZXrglHk9hmzimPpn
 GvpjQ4LoQH1eo16iBaSgiJDqxjcxwAQKllqRI44MctmIaa1HpIY+vSkN5aSTWKACFLIWpPvsO7l76
 AW0bkOll2I4PE4T29AYkhYIoAz3aka8PGM16Zozi2DWuyUDL+jmwdiP5oPkL2sPvl62v+cEeahpxm
 MFPq/w15wNwp/VQbABw4ysosIpydvcPFLDIJ75Jvo7OsTVG+5RlZ4QCU3HA7UHwSjmlx93BbDFV5o
 O4sSf8cQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56838)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qRwE5-0000LY-0e;
 Fri, 04 Aug 2023 15:56:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qRwDz-00044X-52; Fri, 04 Aug 2023 15:56:19 +0100
Date: Fri, 4 Aug 2023 15:56:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <ZM0Rk4paok5cAvp5@shell.armlinux.org.uk>
References: <20230804144629.358455-1-shenwei.wang@nxp.com>
 <20230804144629.358455-3-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804144629.358455-3-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
 Frank Li <frank.li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v4 net-next 2/2] net: stmmac: dwmac-imx:
 pause the TXC clock in fixed-link
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

On Fri, Aug 04, 2023 at 09:46:29AM -0500, Shenwei Wang wrote:
> +	if (dwmac->ops->fix_soc_reset)
> +		plat_dat->fix_mac_speed = dwmac->ops->fix_mac_speed;

The if() condition looks like a typo to me.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
