Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC988C3388
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 21:35:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18D78C6907A;
	Sat, 11 May 2024 19:35:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DBD8C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lsQ8EpucrahipxmgY9adADlLATQwl/fTTCozc+pV+Mc=; b=dF1iqCJ1xq3Hf/aoU+Cx4L1fDX
 ht2/fkiW9ktP0BLH54c3SotDfOGyC7Hf2Cm91OaW8EMW5wkkio3pCcj1FMhaUXTLGwtZBHszRF58J
 1921BIsQi5KXuzDb7d2wcQZ2Yh2WLAA66JGBOTzxEWDGM9fvrCGbZCRAKV3WX7vyCZdg1sdPODPkT
 89U2aSmOpILc0TNg7fZJ4/4iyG232WVwybvim4WqDzk32neRoUop0TSTVqSmVb1VyNG0BFIv8cuY1
 BMeV/TDEc/YYQOCRuViGlnoXKRaUt/l9pYAN7gISbtKAUs+WY6NFeFJVKhDJHdrLbuvXkuAVMuoC2
 A9KhGZUg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39530)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s5sUn-0000BS-2T;
 Sat, 11 May 2024 20:35:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s5sUo-0004VS-E4; Sat, 11 May 2024 20:35:02 +0100
Date: Sat, 11 May 2024 20:35:02 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <Zj/IZkGRXhFCyMBM@shell.armlinux.org.uk>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <4ede8911-827d-4fad-b327-52c9aa7ed957@lunn.ch>
 <Zj+nBpQn1cqTMJxQ@shell.armlinux.org.uk>
 <63c3efa6-94a2-40c7-b47d-876ff330d261@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63c3efa6-94a2-40c7-b47d-876ff330d261@lunn.ch>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

On Sat, May 11, 2024 at 07:19:07PM +0200, Andrew Lunn wrote:
> It might be because it is a PCI device, and they are trying to avoid
> DT? Maybe because they have not figured out how to add DT properties
> to a PCI device. It is possible.

swnodes.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
