Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8537B428DC
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 20:38:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47239C36B2E;
	Wed,  3 Sep 2025 18:38:39 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADAA3C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 18:38:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 91E23601A9;
 Wed,  3 Sep 2025 18:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D90C4CEF7;
 Wed,  3 Sep 2025 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756924717;
 bh=j8OqivN37U7s/3MXyiGRY0V9zEvCu9lIMomm6PVYCJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q4MvYT+4HWfKOeRmVv/QVqMHo0ZHV6viDUD5TCHmInuzXrQC9briLLdhe6nPf254m
 DJHpH8YKEbcC5AhFSqObCVrYvSw7CXSXGHTkRvroq8y6MEJckf0cuUTB+apvw+m0Tb
 fSCqoc/XeI/Ddcia7IcAxJj49Md8mgTxdJLDkT2Qz1tnDtcbqEO0MjlWT8G+fJcDXB
 7Yxy06GTC2TJ4FRJ/lKMxjkA2Ol1ouTfpGgn/wj4+/04GEopzIeRGv1rFslRQVaRWC
 W077qbNHaIattrXPS4xVpttQ82fH1ifGj5qpod/COxwqlYlLtF2HNxQvnaDG1N26sx
 j4sPqLpu04VnQ==
Date: Wed, 3 Sep 2025 19:38:32 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250903183832.GE361157@horms.kernel.org>
References: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: correctly
 populate ptp_clock_ops.getcrosststamp
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

On Wed, Sep 03, 2025 at 03:00:16PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> While reviewing code in the stmmac PTP driver, I noticed that the
> getcrosststamp() method is always populated, irrespective of whether
> it is implemented or not by the stmmac platform specific glue layer.
> 
> Where a platform specific glue layer does not implement it, the core
> stmmac driver code returns -EOPNOTSUPP. However, the PTP clock core
> code uses the presence of the method in ptp_clock_ops to determine
> whether this facility should be advertised to userspace (see
> ptp_clock_getcaps()).
> 
> Moreover, the only platform glue that implements this method is the
> Intel glue, and for it not to return -EOPNOTSUPP, the CPU has to
> support X86_FEATURE_ART.
> 
> This series updates the core stmmac code to only provide the
> getcrosststamp() method in ptp_clock_ops when the platform glue code
> provides an implementation, and then updates the Intel glue code to
> only provide its implementation when the CPU has the necessary
> X86_FEATURE_ART feature.
> 
> As I do not have an Intel card to test with, these changes are
> untested, so if anyone has such a card, please test. Thanks.

Hi Russell,

Although not strictly related to stmmac,
I am wondering if similar treatment is appropriate for:

* drivers/virtio/virtio_rtc_ptp.c:viortc_ptp_getcrosststamp
* drivers/net/ethernet/intel/ice/ice_ptp.c:ice_ptp_getcrosststamp

And if some sort of documentation of the behaviour you describe is
appropriate. Say in the Kernel doc for struct ptp_clock_info.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
