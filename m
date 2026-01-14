Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8727ED2122B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 21:13:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33629C8F273;
	Wed, 14 Jan 2026 20:13:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21F99C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 20:13:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 915826001D;
 Wed, 14 Jan 2026 20:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D89CC4CEF7;
 Wed, 14 Jan 2026 20:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768421629;
 bh=MMH8BxTdLCMG6H0k3fKrVpip0aGLgha/EOhPfRlgxMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c5mIULR/ygIzxL+Pxuty2E8BhuVMHRvwCUrYsJBWxe4NzUKKOvLAHR7O5T55F/bwX
 8Sao0YehpAnrOtH3Cv93t6hj77ccJbds7h9behm5sB/bF4j1EXJT+XINv2x1ke5C+i
 nBTDVTjP+ljthpD5TzWKEMWc32UsTKRs+aTvOb3d3kUOm1miZ8lNpyqikqvMgP3BDW
 WLIgmTjHA+HTTrPt2NMj093kfu2BQb33BcNhJChO49A8CRrFYcvFATIckjUkyHgWo8
 duYni3PcbrLxP3ol8/+Vqc3h2JQtvSwo/amvWEl164C/evEW3b51EsRId7Yoax4GR6
 0YROdUiZQvKJA==
Date: Wed, 14 Jan 2026 21:13:34 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <aWf47s1oY-bjCDSA@fedora>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-4-den@valinux.co.jp>
 <aWatVUFdyYz+JaMI@lizhi-Precision-Tower-5810>
 <mz3ahnech7yn66hcv7hqllir6rz6qpjd6m2aj3feh2gqfsvpwk@oobwtkb6o2jx>
 <aWe0KJnZNHqSUAKg@lizhi-Precision-Tower-5810>
 <m47oybaq4u2noqqd77czzgwwnmmquhvarjnxgijlhb5neulznt@dts3icronu6u>
 <aWfyDHZCoh1t6/vP@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWfyDHZCoh1t6/vP@lizhi-Precision-Tower-5810>
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, minghuan.Lian@nxp.com,
 Koichiro Den <den@valinux.co.jp>, festevam@gmail.com,
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
 linux-renesas-soc@vger.kernel.org, thierry.reding@gmail.com,
 mhiramat@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v7 3/6] PCI: dwc: Allow glue drivers to
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

On Wed, Jan 14, 2026 at 02:44:12PM -0500, Frank Li wrote:
> > > > > Add
> > > > > 	DWC_EPC_DEFAULT, into every epc_features.
> > > >
> > > > One corner case is that pci-layerscape-ep.c builds the pci_epc_features
> > >
> > > It is our old platform. I checked code, it should be wrong. features should
> > > report EPC hardware capibility.
> >
> > I'm not really sure whether commit cc255eb0bfbe ("PCI: layerscape: Modify
> > the way of getting capability with different PEX") was wrong.
> > Do you have a patch in mind?
> 
> I think it's wrong. And it doesn't impact your patch. Just leave it as it.
> we can add submap support later if need.

Adding a macro:
#define DWC_EPC_COMMON_FEATURES .dynamic_inbound_mapping = true

And including it in all the DWC glue drivers' epc_features sounds
fine to me.

Frank does have a point that if some glue driver ever has some random
errata or bad integration, it will be simpler for a single glue driver
to override the defaults.


The commit that adds subrange mapping support would then just
change the macro to something like:

#define DWC_EPC_COMMON_FEATURES .dynamic_inbound_mapping = true, \
				.subrange_mapping = true


Kind regards,
Niklas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
