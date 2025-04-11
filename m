Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9EA86330
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 18:27:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E69D9C78006;
	Fri, 11 Apr 2025 16:27:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFB21C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 16:27:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AD0E268468;
 Fri, 11 Apr 2025 16:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B78C4CEE8;
 Fri, 11 Apr 2025 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744388834;
 bh=DzmZ98UHOcBa/uDcZVOeIvJFc1PO8euYkm5Q5FQwIOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PjurHYzZOQN4uXaLNZNK8RjGupHq3dHjtJ+hzR3/aZ4DOEn7KHKOeXl+L2Lbotkwr
 9TXYlia3Fy88adO9DQCwSa5bIEoon7tKKpAihh6MVe/jYjsd9mk5aufUgb0bTY9MuG
 2W3njw3FD2CMrJG16WcPZOdbYddag5vUVNsFwWn6SLY1wKT+93K5kZ+J7OxSUelHsf
 4odvMCcQ5WXabNegXRZDJuu53hCQAIKnJJ6k4sQ4JWSe5UvuIokMtZedbzM5NV3xJ6
 nqmd0n9mBEyeM+NqvYR6IuadjG5/s+A0oCPoKCpWVTn5z9G8FijAsMelN6MMHCr6Fo
 ACNVIagXKA95g==
Date: Fri, 11 Apr 2025 17:27:08 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20250411162708.GL395307@horms.kernel.org>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-2-boon.khai.ng@altera.com>
 <20250410161912.0000168a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410161912.0000168a@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 G Thomas Rohan <rohan.g.thomas@altera.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mun Yew Tham <mun.yew.tham@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bpf@vger.kernel.org,
 Tien Sung Ang <tien.sung.ang@altera.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] net: stmmac: Refactor
	VLAN implementation
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

On Thu, Apr 10, 2025 at 04:19:12PM +0800, Furong Xu wrote:
> On Tue,  8 Apr 2025 16:13:53 +0800, Boon Khai Ng <boon.khai.ng@altera.com> wrote:
> 
> > Refactor VLAN implementation by moving common code for DWMAC4 and
> > DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> > DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> > for the VLAN ID and VLAN VALID bit field.
> > 
> > Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
> >  drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  40 ---
> >  .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 295 +-----------------
> >  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  13 -
> >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  87 ------
> >  drivers/net/ethernet/stmicro/stmmac/hwif.c    |   8 +
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  61 ++--
> >  .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 294 +++++++++++++++++
> >  .../net/ethernet/stmicro/stmmac/stmmac_vlan.h |  63 ++++
> >  10 files changed, 401 insertions(+), 463 deletions(-)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.h
> > 
> [...]
> > +static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> > +			     __le16 perfect_match, bool is_double)
> > +{
> > +	void __iomem *ioaddr = hw->pcsr;
> > +	u32 value;
> > +
> > +	writel(hash, ioaddr + VLAN_HASH_TABLE);
> > +
> > +	value = readl(ioaddr + VLAN_TAG);
> > +
> > +	if (hash) {
> > +		value |= VLAN_VTHM | VLAN_ETV;
> > +		if (is_double) {
> > +			value |= VLAN_EDVLP;
> > +			value |= VLAN_ESVL;
> > +			value |= VLAN_DOVLTC;
> 
> I can confirm that 802.1ad (QinQ) has been broken on stmmac for years,
> and it will be so nice if this refactoring includes some fixes for QinQ

FWIIW, please be sure that fixes are separate patches from refactoring.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
