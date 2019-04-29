Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9ACF0EE
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 09:10:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6E8EC35E09
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 07:10:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66096C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 21:14:49 +0000 (UTC)
Received: from localhost (odyssey.drury.edu [64.22.249.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95338215EA;
 Mon, 29 Apr 2019 21:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556572487;
 bh=XX0aTJglLKQg7dsZbY4eNn1vqzsBT3b0Sj+xLrzx0yk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxHibykQtphUqTaLCrPFMVUnoPuwdK1iYO2VrtH44UQZDBpPNEIgM+EQM+ho0ajOH
 U7bQco5v19ubB1D43u2lfNBs8KvFl6/Tbwn+o5UIMte+7mdc6Euc/IXTI8nadeZc+Z
 9qxqwwsQIbuhid6oF/FqEvGGNc8TC6PpId9D37hU=
Date: Mon, 29 Apr 2019 16:14:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <20190429211446.GA145057@google.com>
References: <2e1f9a57-6d08-d017-24da-3e6b97fa2449@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e1f9a57-6d08-d017-24da-3e6b97fa2449@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 30 Apr 2019 07:10:11 +0000
Cc: David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Jose Abreu <joabreu@synopsys.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Alex Deucher <alexander.deucher@amd.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Benson Leung <bleung@chromium.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Oded Gabbay <oded.gabbay@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:8169 10/100/1000 GIGABIT ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 0/9] PCI: add help pci_dev_id
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

On Wed, Apr 24, 2019 at 09:10:21PM +0200, Heiner Kallweit wrote:
> In several places in the kernel we find PCI_DEVID used like this:
> PCI_DEVID(dev->bus->number, dev->devfn) Therefore create a helper
> for it.
> 
> v2:
> - apply the change to all affected places in the kernel
> 
> Heiner Kallweit (9):
>   PCI: add helper pci_dev_id
>   PCI: use helper pci_dev_id
>   r8169: use new helper pci_dev_id
>   powerpc/powernv/npu: use helper pci_dev_id
>   drm/amdkfd: use helper pci_dev_id
>   iommu/amd: use helper pci_dev_id
>   iommu/vt-d: use helper pci_dev_id
>   stmmac: pci: use helper pci_dev_id
>   platform/chrome: chromeos_laptop: use helper pci_dev_id
> 
>  arch/powerpc/platforms/powernv/npu-dma.c         | 14 ++++++--------
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c        |  3 +--
>  drivers/iommu/amd_iommu.c                        |  2 +-
>  drivers/iommu/intel-iommu.c                      |  2 +-
>  drivers/iommu/intel_irq_remapping.c              |  2 +-
>  drivers/net/ethernet/realtek/r8169.c             |  3 +--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c |  2 +-
>  drivers/pci/msi.c                                |  6 +++---
>  drivers/pci/search.c                             | 10 +++-------
>  drivers/platform/chrome/chromeos_laptop.c        |  2 +-
>  include/linux/pci.h                              |  5 +++++
>  11 files changed, 24 insertions(+), 27 deletions(-)

Applied with acks/reviewed-by from Benson, Joerg, Christian, Alexey, and
David to pci/misc for v5.2, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
