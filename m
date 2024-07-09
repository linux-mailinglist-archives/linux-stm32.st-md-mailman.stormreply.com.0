Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1092BB8B
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 15:38:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2CFFC6DD66;
	Tue,  9 Jul 2024 13:31:37 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 738D0C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Zre5YSHteeLdEYtuTx/X+RGnWx775ASLQOdTxRDdE1M=; b=2f+Eujxf0jG9ADlgV4JEjThm70
 ijEtLEUs5PC2z37RnVaF0M08Hvl0ZPDHZ7WYUK7azsyd9E/0uohZwhiEnMtmvjay5hIurMagJv5ZG
 BcvftJrTYNWO2BWi3y5juufyiUQ/mBqiSNv4FVLHqS/qv0gY5OurErVfDUE9+ixx5QjY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sRAwD-002945-K6; Tue, 09 Jul 2024 15:31:21 +0200
Date: Tue, 9 Jul 2024 15:31:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <28ddf3e2-be4e-437a-b872-5ba07659e40e@lunn.ch>
References: <cover.1720512888.git.0x1207@gmail.com>
 <fc69b94aad4bbe568dcf9ef7aa73f9bac685142c.1720512888.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc69b94aad4bbe568dcf9ef7aa73f9bac685142c.1720512888.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 7/7] net: stmmac: xgmac:
 enable Frame Preemption Interrupt by default
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

On Tue, Jul 09, 2024 at 04:21:25PM +0800, Furong Xu wrote:
> Frame Preemption Interrupt is required to finish FPE handshake.
> 
> XGMAC_FPEIE is read-only reserved if FPE is not supported by HW.
> There is no harm that we always set XGMAC_FPEIE bit.

This is better, it explains what is going on, why the change is being
made. But when i see this, i think about the interrupt handler. You
don't just enable a new interrupt, you also need to handle the
interrupt. Where is that handler code?

The commit message is the place you try to answer the questions
reviewers are going to ask. So if the interrupt handler already looks
for this interrupt cause and handles it, add a statement to the commit
message explaining it.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
