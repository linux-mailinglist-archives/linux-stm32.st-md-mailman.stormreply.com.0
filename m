Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDDB422CD
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 16:00:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2FA3C3FAC9;
	Wed,  3 Sep 2025 14:00:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 097A3C3FAC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PZxPMEjPTKCPQuV5Vdll2zGdxDT5RzAvIigUnlJowmg=; b=zZtl8LDOWyf58VMvu585aBJR/d
 VIR5p/ovbKNLwNroL6S9fJBtlMxJhfGIEI2uVNVwdN7MjPX7W2IKNlVsytMjmopBwhndH9RaG2duX
 BCdVq3MiX5gsXa/PbQW1I3ABt26OQm5BAE6R3MQtyDYZ+AANiARddOCnBJm0p9srzJShLq3tPkzL1
 vIAEVlF2byC5srNZr95WIq3qwr3Rv9B8F4KNgSimXPEiR15EObk7wSaasOkihcK0IYBEvZCtN+SC9
 f7IT5GgvrxR5kduuY8Rh8mvn1/5yry/RYALtCrZSbSUWgHhj65YEunExZw7vGtROADkMNEeesLk0k
 hhDm2Lug==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48416)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uto29-000000000bj-2vxv;
 Wed, 03 Sep 2025 15:00:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uto24-000000000ag-2hTt; Wed, 03 Sep 2025 15:00:16 +0100
Date: Wed, 3 Sep 2025 15:00:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Message-ID: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: correctly populate
 ptp_clock_ops.getcrosststamp
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

Hi,

While reviewing code in the stmmac PTP driver, I noticed that the
getcrosststamp() method is always populated, irrespective of whether
it is implemented or not by the stmmac platform specific glue layer.

Where a platform specific glue layer does not implement it, the core
stmmac driver code returns -EOPNOTSUPP. However, the PTP clock core
code uses the presence of the method in ptp_clock_ops to determine
whether this facility should be advertised to userspace (see
ptp_clock_getcaps()).

Moreover, the only platform glue that implements this method is the
Intel glue, and for it not to return -EOPNOTSUPP, the CPU has to
support X86_FEATURE_ART.

This series updates the core stmmac code to only provide the
getcrosststamp() method in ptp_clock_ops when the platform glue code
provides an implementation, and then updates the Intel glue code to
only provide its implementation when the CPU has the necessary
X86_FEATURE_ART feature.

As I do not have an Intel card to test with, these changes are
untested, so if anyone has such a card, please test. Thanks.

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |  7 +++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 10 ++++------
 2 files changed, 7 insertions(+), 10 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
