Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E92C5F620
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 22:35:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90EC3C58D7A;
	Fri, 14 Nov 2025 21:35:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22350C58D79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 21:35:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B06F043D42;
 Fri, 14 Nov 2025 21:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615DFC4CEF1;
 Fri, 14 Nov 2025 21:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763156141;
 bh=7+gBsjbSf8GGUjKAhjC9BjsZi2tNC9506bmmv93MuO0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=aa7dTlg+g4JoT9xX34DucEx0Z+AdddJdQXp3TRuzjqjFnyE4M4YPv4U6sDfQ8DaOS
 mPBVLXkF4VNf1JKgb8ADAeETueV3PJuPCTVdDGIhEXCXM1PwjsP27s9Ci5IOrzqkYv
 QNty5UnzGGK89TrFyWlCmjZpuq+Xin2YSIi/lXHdnA9eeuWV9SdXJNdeT5Gd9MbDSD
 qQoW2iBN0NyKRzBoShc+ZNsj7izl4YfPU9R/fBWkVqcSeIjdO1QwhmDaN0RU5HfRmX
 w0ATx4bBEOKtQgV6jE7HEhbXWn/qdxhmwbtQmFfMGvsib42qjUfT7N+Fiz5O4sW2ww
 u7ueHayrsqO9g==
Date: Fri, 14 Nov 2025 15:35:40 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20251114213540.GA2335845@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b945e463-52ec-417c-8e6a-599c35a6727d@foss.st.com>
Cc: imx@lists.linux.dev, s32@nxp.com, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, Frank.li@nxp.com, cassel@kernel.org,
 ghennadi.procopciuc@oss.nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 kwilczynski@kernel.org, robh@kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, larisa.grigore@nxp.com,
 Ionut.Vicovan@nxp.com, Mingkai Hu <mingkai.hu@nxp.com>, bogdan.hamciuc@nxp.com,
 Ghennadi.Procopciuc@nxp.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>,
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

On Fri, Nov 14, 2025 at 11:05:45AM +0100, Christian Bruel wrote:
> > > The implication is that *every* user of dw_pcie_suspend_noirq() would
> > > have to check for the link being up.  There are only three existing
> > > callers:
> > > 
> > >    imx_pcie_suspend_noirq()
> > >    ls_pcie_suspend_noirq()
> > >    stm32_pcie_suspend_noirq()
> > > 
> > > but none of them checks for the link being up.
> 
> stm32 supports L1.1, so we bail out before pme_turn_off() in
> dw_pcie_suspend_noirq()

I think you're referring to this code::

  dw_pcie_suspend_noirq()
  {
        /*
         * If L1SS is supported, then do not put the link into L2 as some
         * devices such as NVMe expect low resume latency.
         */
        if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
                return 0;

        if (pci->pp.ops->pme_turn_off) {
                pci->pp.ops->pme_turn_off(&pci->pp);
        } else {
                ret = dw_pcie_pme_turn_off(pci);
                if (ret)
                        return ret;
        }

I think this is bogus.  For starters, the code doesn't match the
comment.  The comment talks about "L1SS being supported", but the code
checks for L1 (not L1SS).  And it checks whether L1 is *enabled* (in
Link Control), not whether it's *supported* (in Link Capabilities).

And it's up to the user whether L1 is enabled.  Users can disable L1
by building the kernel with PCIEASPM_PERFORMANCE, booting with
"pcie_aspm.policy=performance", or using sysfs.

It doesn't make sense to me to decide anything about PME_Turn_Off
based on PCI_EXP_LNKCTL_ASPM_L1.

We've had this conversation before, e.g.,
https://lore.kernel.org/linux-pci/?q=b%3Adw_pcie_suspend_noirq+b%3ANVMe+f%3Ahelgaas,
and Richard actually posted a patch to remove this code [2], but I
hesitated because I didn't think we had a good explanation for why it
was there in the first place and it was now OK to remove it.

But I think I was wrong and we should just remove this code and debug
whatever breaks.

> > If no devices are attached to the bus, then there is no need to
> > broadcast PME_Turn_Off and wait for L2/L3. I've just sent out a
> > series that fixes it [1].  Hopefully, this will allow Vincent to
> > use dw_pcie_{suspend/resume}_noirq() APIs.
> >
> > - Mani
> > 
> > [1] https://lore.kernel.org/linux-pci/20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com/
> 
> dw_pcie_suspend_noirq() path tested OK on stm32mp2.
> 
> Regards
> 
> Christian

[2] https://lore.kernel.org/linux-pci/20250924194457.GA2131297@bhelgaas/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
