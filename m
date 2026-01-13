Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D8D17E8A
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 11:14:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEEB2C8F283;
	Tue, 13 Jan 2026 10:14:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C31AC8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 10:14:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FBCB6000A;
 Tue, 13 Jan 2026 10:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44057C116C6;
 Tue, 13 Jan 2026 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768299276;
 bh=noH2csNYttkzJximg2DkOMRq7PSZu8QvD26YdxlPYIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DnCo48+itSv/Z28wMZQtVhh0fd455MaYSuLbQW6msp/bVpo2RGKM7v01FABDcC/+U
 6APVMBzTSQbuUc6AhL7BcTRAI4Ixf+UFQNB4/DHAQArlAsgjubbi6i5acb75Au4E4Z
 8MjbpNxoc3ojtcQwW/hR8ZT+dxKkJ/RRMJ9g2rkV08Nhf4bobolIcGJsMuW5IoG60K
 YqIaDSdymp+dxdHtZ30GCRkvvFqg2To2vhn47htFBg2/y6fikSE3Nm9wqjNn2PzWHB
 BK4d/7sUcf70yGB9PUsgJE4SbBD1cX2dV7Oe2O9HSgpZl83MYSX/dmIyJNVoc2FGPw
 PN58GnzLcopoA==
Date: Tue, 13 Jan 2026 11:14:23 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWYa_9mlWu-A2uCN@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-3-den@valinux.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113023715.3463724-3-den@valinux.co.jp>
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, marek.vasut+renesas@gmail.com,
 kishon@kernel.org, robh@kernel.org, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, hongxing.zhu@nxp.com,
 mcoquelin.stm32@gmail.com, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
 linux-omap@vger.kernel.org, rongqianfeng@vivo.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, linux-tegra@vger.kernel.org, christian.bruel@foss.st.com,
 linux.amoon@gmail.com, jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 heiko@sntech.de, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v6 2/5] PCI: dwc: Allow glue drivers to
 return mutable EPC features
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

On Tue, Jan 13, 2026 at 11:37:12AM +0900, Koichiro Den wrote:
> The DesignWare EP midlayer needs to advertise additional capabilities at
> the DWC layer (e.g. subrange_mapping) without duplicating the same bit
> in every DWC-based glue driver and without copying feature structures.
> 
> Change dw_pcie_ep_ops.get_features() to return a mutable
> struct pci_epc_features * and update all DWC-based glue drivers
> accordingly. The DWC midlayer can then adjust/augment the returned
> features while still exposing a const struct pci_epc_features * to the
> PCI EPC core.
> 
> No functional change on its own.
> 
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
