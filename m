Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E06038BF834
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2024 10:12:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D7DDC62EFE;
	Wed,  8 May 2024 08:12:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 444D2C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2024 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uRqGn1bN/Grcd+F1z4WjSaR1kcVdDX8dLEQa2ZSJ9Jc=; b=ZjFtKFxa9wt8DrsHiQAJ0YTvlM
 CB3WxxTkZNQCVro9WRZ3AEWSOU1tKi8PhFSERTQ73pDPXW/I9XhUaicOOayOCFoSYgK/QCe/tuv9w
 PRp/MygDqsMqZkkY3fVuuCy/rVGGs+WjzUNF43KT5omOMrRmU3RHjBoXWMDHrWGPxhdoad6LaLjla
 GQ+4yXoKFwjgTrhmgL4KlZqsoh5p7V63p/58qP3TMKYzBkeQJvRwQI1BlItx67TqMv9dMWYRMVSuT
 uLvFXof9NpGd/2X1bxvRVRFMhXKDHRaB4bhZnn1/I7lwanff5BGu7QOSiAV6ymZkMDv3N1+PCt3Ui
 09/I+DDg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55036)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s4cOr-0004so-17;
 Wed, 08 May 2024 09:11:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s4cOn-0001EY-HV; Wed, 08 May 2024 09:11:37 +0100
Date: Wed, 8 May 2024 09:11:37 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Message-ID: <ZjszuWWw8PPxNyKE@shell.armlinux.org.uk>
References: <20240508045257.2470698-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240508045257.2470698-1-xiaolei.wang@windriver.com>
Cc: j.zink@pengutronix.de, linux-kernel@vger.kernel.org, horms@kernel.org,
 bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 leong.ching.swee@intel.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: move the lock to struct
 plat_stmmacenet_data
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

On Wed, May 08, 2024 at 12:52:57PM +0800, Xiaolei Wang wrote:
> Reinitialize the whole est structure would also reset the mutex lock
> which is embedded in the est structure, and then trigger the following
> warning. To address this, move the lock to struct plat_stmmacenet_data.
> We also need to require the mutex lock when doing this initialization.

What is plat->lock protecting exactly? "lock" is opaque and doesn't
hint at its purpose. Does it serialise accesses to plat->est? If so,
consider naming it plat->est_lock to make its purpose and what it's
doing clear.

Please also follow netdev best practice; allow at least 24 hours to
pass _and_ for discussion to finish before posting a new version of
a patch or patch series.

Also see the "How do I indicate which tree" question at:
https://www.kernel.org/doc/html/v5.3/networking/netdev-FAQ.html

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
