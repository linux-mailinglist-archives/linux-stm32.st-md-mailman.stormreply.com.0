Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFFF7D9007
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Oct 2023 09:39:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F9ACC6C855;
	Fri, 27 Oct 2023 07:39:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 599DDC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UrVb0RxnFRlTxNQClfI8ZHdeowM3uhiJ9mxX6SCrB/s=; b=bWNuWJQCcEuejHP845AFX2lFJC
 WQ+R+JY4/YiK21y5U0P/rQQ1K7AFgsItJU5KzHDh+DOfSS/APHTQLRVLFrynNOJZCgRVmm4eeNIQl
 mMNAPZguvQAV5JKkzY5whERVVfBI4zbRH/+nOlOjxXo/c+6y64IgXOZaELBJ5OaUP2WSyF316S29G
 P3KuAgnUBW9oktobYODQnCqyr0vqoITHSJq5Uka2xGpsMWPPujC/ZIH9xpfVFNG/e8CDhglqU7usB
 5/joRs1HV9raMiXpmfcjQuyXYxPVgU6rnduQRDlk2E5TIYqudckCMYJvbbmu4qveqh7zY8hOt75iO
 46BsoR6g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56172)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qwHQc-0007Yi-0Y;
 Fri, 27 Oct 2023 08:38:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qwHQa-0000Zo-5S; Fri, 27 Oct 2023 08:38:44 +0100
Date: Fri, 27 Oct 2023 08:38:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gan Yi Fang <yi.fang.gan@intel.com>
Message-ID: <ZTtpBCZuB+bjVt9D@shell.armlinux.org.uk>
References: <20231027065054.3808352-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027065054.3808352-1-yi.fang.gan@intel.com>
Cc: linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ahmad Tarmizi Noor Azura <noor.azura.ahmad.tarmizi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Looi Hong Aun <hong.aun.looi@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: add check for
 advertising linkmode request for set-eee
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

On Fri, Oct 27, 2023 at 02:50:54PM +0800, Gan Yi Fang wrote:
> From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
> 
> Add check for advertising linkmode set request with what is currently
> being supported by PHY before configuring the EEE. Unsupported setting
> will be rejected and a message will be prompted. No checking is
> required while setting the EEE to off.

Why should this functionality be specific to stmmac?

Why do we need this?

What is wrong with the checking and masking that phylib is doing?

Why should we trust the value in edata->supported provided by the user?

Sorry, but no. I see no reason that this should be done, especially
not in the stmmac driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
