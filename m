Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A4AC6380
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 09:58:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DAFAC36B30;
	Wed, 28 May 2025 07:58:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EE4CC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IFyA/Ev6J4dUYbbORf9U6czVrOpgGxA4vABlRFXcEts=; b=evO/lKUw5MnJ7tsXnKrD9jnoqg
 b+PYF3g+tT3s31UjYVEVLUGD4QbVFxAfDe3jTt6zSBYs+BqcW7L4o5H/4lV7IAFO87k6z8drWy5fa
 +vScF2jVlpn9cLiY4WYiOtgEi5WgKmCMIPgwHxusoT7b3o06F4DVQjoJZe9dfpVaBHibLWbrJd6IW
 Gu1oxMalrZustOdJN5UvUSgvwrh1CdrLPzbN+K2eLneCuzGPxEUMaOW3MhnK4aFdt455xrGh5qZC7
 Zo/NTYKwb6lkek7YVLTY6lXsIjJqz+8AwcuyThkWfOmH+M4By7TooetgF5MUQQ5zdFOoTXrpTeUEt
 P7lO75mA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41916)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uKBg3-0008Nv-1S;
 Wed, 28 May 2025 08:58:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uKBfw-0002GD-2Q;
 Wed, 28 May 2025 08:58:12 +0100
Date: Wed, 28 May 2025 08:58:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
Message-ID: <aDbCFGIi09h1irho@shell.armlinux.org.uk>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
 <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
 <CAMdnO-+HwXf7c=igt2j6VHcki3cYanXpFApZDcEe7DibDz810g@mail.gmail.com>
 <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jianheng.Zhang@synopsys.com,
 edumazet@google.com, Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 linux-arm-kernel@lists.infradead.org, xiaolei.wang@windriver.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/5] net: stmmac: Add PCI
 driver support for BCM8958x
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

On Tue, May 27, 2025 at 05:04:52PM -0700, Abhishek Chauhan (ABC) wrote:
> Thanks Jitendra, I am sorry but just a follow up. 
> 
> Do we know if stmmac maintainer are identified now ?
> 
> Andrew/Russell - Can you please help us ? 

My mainline work is in abayence at the moment (apart from occasionally
replying to a few emails from time to time) as I have other commitments
at the moment. I still have my own patches from before the previous
merge window that I didn't get around to submitting.

Sorry, I'm not in a position to help right now.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
