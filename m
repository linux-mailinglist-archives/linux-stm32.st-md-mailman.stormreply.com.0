Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A053D18017
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 11:27:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07C6EC8F283;
	Tue, 13 Jan 2026 10:27:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C423EC8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 10:27:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 615B74075A;
 Tue, 13 Jan 2026 10:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FB0C116C6;
 Tue, 13 Jan 2026 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768300073;
 bh=C8UgsS+YrsZDchnel7CNOtadN1mg/ONjw32g4J6+OCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KHVExecNeP0XkZg6xghaAQoJqr/q0z3GdC0x9jlfMNdwId0ErGseOxuOiGwv29fD7
 AvHvAxAYhEhEwlTtZ/HzVBPzak/DCiPS0cy2tK74aPn60U+CPG+/5TqEOYVmIpPOB+
 t0lfLQrTlza7crImIQKqJobRsLqGMk0r+g0eXbY9SIXRxX+hMLbFEU7eN5Xkq1qwjt
 tqZncLDnAqJDaSQnuMYsFLITR5wWfSPuJ4e3LtNOMwEMkXQnDUSM9mD8VFTfDQepbM
 3idXM1YFBgiHX990n6orktQZK0baqsg7qxAQ9euVwMmyZF8sanjixl845BLKqFX5sj
 jWW9lS8W7E+tQ==
Date: Tue, 13 Jan 2026 11:27:40 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWYeHNoPEl9T-Qo-@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-5-den@valinux.co.jp>
 <aWYbTt6UjlXb9Uk-@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWYbTt6UjlXb9Uk-@ryzen>
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
Subject: Re: [Linux-stm32] [PATCH v6 4/5] PCI: dwc: ep: Support BAR subrange
 inbound mapping via Address Match Mode iATU
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

On Tue, Jan 13, 2026 at 11:15:42AM +0100, Niklas Cassel wrote:
> On Tue, Jan 13, 2026 at 11:37:14AM +0900, Koichiro Den wrote:
> > @@ -626,11 +831,22 @@ static const struct pci_epc_features*
> >  dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
> >  {
> >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > +	struct pci_epc_features *features;
> >  
> >  	if (!ep->ops->get_features)
> >  		return NULL;
> >  
> > -	return ep->ops->get_features(ep);
> > +	features = ep->ops->get_features(ep);
> > +	if (!features)
> > +		return NULL;
> > +
> > +	/* All DWC-based glue drivers support dynamic inbound mapping */
> > +	features->dynamic_inbound_mapping = true;
> 
> I think you should create a separate patch, before this patch, that simply
> sets:
> features->dynamic_inbound_mapping = true;
> 
> Since that is technically a different feature, independent of this
> feature, so it deserves its own patch.

The commit message for that separate patch should mention that the reason
why there are no code changes when exposing/enabling support for the
dynamic_inbound_mapping feature, is because the actual code changes to the
the DWC driver already in commit 4284c88fff0e ("PCI: designware-ep: Allow
pci_epc_set_bar() update inbound map address").


Kind regards,
Niklas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
