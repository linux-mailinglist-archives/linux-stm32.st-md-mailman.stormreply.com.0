Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5189C386ED
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 01:05:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DFCCC57B68;
	Thu,  6 Nov 2025 00:05:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E9D5C1A981
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 00:05:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1AD53439ED;
 Thu,  6 Nov 2025 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF74BC4CEF5;
 Thu,  6 Nov 2025 00:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762387533;
 bh=y/ZAYxCD+K0ben97/l/TcgYvp1v3jhspO1xwcEPug+I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=e2Tj1pIej2SBYovVy9liByuimeqmIgSHUlUPqS3qaqe4q1iQ9iUL0nhZsrG4m3usd
 TLFBN360oIQrAifta/POgM8nU9YvTGyaHgCVDft5m4cy43QE1vYw/YdF+dZo+bIjl0
 CUXOZDan9dkcWVK3bS/p+7bK1hZr0ZQTseFeYxpmD31C4aLVggm/7YTH/BiywhkoC0
 9U6yPAVKUEutUFhQ+wtekf21eqJo8Td4ohrhml9TPiMC7JhLiKqcv/KyPJlgsJeRer
 FIWkYxgQHYt7a+iYBVzuSklb8MjOvQCVrEiJzZU+hOSiEt/puGzZcLaiO6lSxo1Kg7
 wfCItHHp/YtYA==
Date: Wed, 5 Nov 2025 18:05:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Message-ID: <20251106000531.GA1930429@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
Cc: imx@lists.linux.dev, s32@nxp.com, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, Frank.li@nxp.com, cassel@kernel.org,
 ghennadi.procopciuc@oss.nxp.com, Christian Bruel <christian.bruel@foss.st.com>,
 kwilczynski@kernel.org, robh@kernel.org, larisa.grigore@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, Ionut.Vicovan@nxp.com,
 Mingkai Hu <mingkai.hu@nxp.com>, bogdan.hamciuc@nxp.com,
 Ghennadi.Procopciuc@nxp.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>, mani@kernel.org,
 ciprianmarian.costea@nxp.com, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, chester62515@gmail.com,
 Roy Zang <roy.zang@nxp.com>, mbrugger@suse.com,
 Minghuan Lian <minghuan.Lian@nxp.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 3/4 v3] PCI: s32g: Add initial PCIe
	support (RC)
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

[+cc imx6, layerscape, stm32 maintainers for possible suspend bug]

On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > > Add initial support of the PCIe controller for S32G Soc family. Only
> > > host mode is supported.

> > > +static void s32g_init_pcie_controller(struct s32g_pcie *s32g_pp)
> > > +{
> > > ...
> > > +     /*
> > > +      * Make sure we use the coherency defaults (just in case the settings
> > > +      * have been changed from their reset values)
> > > +      */
> > > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> >
> > This seems sketchy and no other driver uses memblock_start_of_DRAM().
> > Shouldn't a physical memory address like this come from devicetree
> > somehow?
> 
> I was using DT but has been asked to not use it and was proposed to
> use memblock_start_of_DRAM() instead

Can you point me to that conversation?

> > > +     s32g_pp->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> > > +     if (IS_ERR(s32g_pp->ctrl_base))
> > > +             return PTR_ERR(s32g_pp->ctrl_base);
> >
> > This looks like the first DWC driver that uses a "ctrl" resource.  Is
> > this something unique to s32g, or do other drivers have something
> > similar but use a different name?
> 
> AFAICT this seems to be s32g specific in the RM

It does look like there's very little consistency in reg-names across
drivers, so I guess it's fine.

> > > +static int s32g_pcie_suspend_noirq(struct device *dev)
> > > +{
> > > +     struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> > > +     struct dw_pcie *pci = &s32g_pp->pci;
> > > +
> > > +     if (!dw_pcie_link_up(pci))
> > > +             return 0;
> >
> > Does something bad happen if you omit the link up check and the link
> > is not up when we get here?  The check is racy (the link could go down
> > between dw_pcie_link_up() and dw_pcie_suspend_noirq()), so it's not
> > completely reliable.
> >
> > If you have to check, please add a comment about why this driver needs
> > it when no other driver does.
> 
> dw_pcie_suspend_noirq returns an error and the suspend fails

The implication is that *every* user of dw_pcie_suspend_noirq() would
have to check for the link being up.  There are only three existing
callers:

  imx_pcie_suspend_noirq()
  ls_pcie_suspend_noirq()
  stm32_pcie_suspend_noirq()

but none of them checks for the link being up.

> I will add a comment
> /*
>  * If the link is not up, there is nothing to suspend and resume

Sometimes true, but still racy as I mentioned, and doesn't explain why
s32g is different from imx, ls, and stm32.

> > > +     return dw_pcie_suspend_noirq(pci);
> > > +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
