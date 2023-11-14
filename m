Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BFF7EB930
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 23:14:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76421C6B47A;
	Tue, 14 Nov 2023 22:14:07 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96038C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 22:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=QKV+COsbMm3ctH/hvmRLz2+UD4oEDJrHvUBihvmpKl0=; b=5ZscZ+b4Y6Fa5+ao0U5ZLxtWL/
 Lvg+gL3+5QOL1DpachQ++s1Iw7cMVRqFXKshdJLB1KtLBaD3enJOqz4X3Da5XUADRRBDKgywLcodR
 JwgYk/u01L9eGzQLiWbMpydD6tygpbJP08J/j351y6srY0SMbVqK7akgSjpkCRFuW9YA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1r31fN-000CJm-U0; Tue, 14 Nov 2023 23:13:53 +0100
Date: Tue, 14 Nov 2023 23:13:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <6caf2c31-70f9-4866-888c-cb6af3839845@lunn.ch>
References: <CY5PR12MB6372857133451464780FD6B7BFB2A@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR12MB6372857133451464780FD6B7BFB2A@CY5PR12MB6372.namprd12.prod.outlook.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Voon Weifeng <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix FPE events losing
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

On Tue, Nov 14, 2023 at 11:07:34AM +0000, Jianheng Zhang wrote:
> The 32-bit access of register MAC_FPE_CTRL_STS may clear the FPE status
> bits unexpectedly. Use 8-bit access for MAC_FPE_CTRL_STS control bits to
> avoid unexpected access of MAC_FPE_CTRL_STS status bits that can reduce
> the FPE handshake retries.
> 
> The bit[19:17] of register MAC_FPE_CTRL_STS are status register bits.
> Those bits are clear on read (or write of 1 when RCWE bit in
> MAC_CSR_SW_Ctrl register is set). Using 32-bit access for
> MAC_FPE_CTRL_STS control bits makes side effects that clear the status
> bits. Then the stmmac interrupt handler missing FPE event status and
> leads to FPE handshake failure and retries.

Is it possible to call the core of stmmac_fpe_irq_status() to extract
the information from these bits and then call
stmmac_fpe_event_status()?

Alternatively, can you actually set RCWE in MAC_CSR_SW_Ctrl and add a
mask to dwmac5_fpe_configure() etc so they don't write 1 to these
bits? That seems safer than assuming 8 bit reads work.

      Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
