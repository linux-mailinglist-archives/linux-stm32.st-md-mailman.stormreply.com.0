Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B011A81CB
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2020 17:15:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 429CBC36B0C;
	Tue, 14 Apr 2020 15:15:10 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B344C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wb8f39hCjGcYV8+AHNSAescCyaLfOVyVKTEaqlWfHFA=; b=rXukUfJulQmi7iSIMYWiAq9QR6
 JXRXBujHbPtK1TQRqgGBlXbmwkIa5/8xprYf1whWGTnGar8OAbVX+Qel6l8H0iYPf4kpQGsFnCxYo
 F0NYB3fyVHQtiPMsP1pPBLoC+PP88zvzGx82OwcsQEXCaZWQT+LEw/Tpz5fT9Fv2a7ho=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jONH8-002fp9-VA; Tue, 14 Apr 2020 17:14:58 +0200
Date: Tue, 14 Apr 2020 17:14:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe ROULLIER <christophe.roullier@st.com>
Message-ID: <20200414151458.GA637127@lunn.ch>
References: <20200316090907.18488-1-christophe.roullier@st.com>
 <cb0a5dd3-02da-7d60-7069-a8ee080ad239@st.com>
 <ecbfd26c-8dcb-3763-c1aa-ccc4c110aefa@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecbfd26c-8dcb-3763-c1aa-ccc4c110aefa@st.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Peppe CAVALLARO <peppe.cavallaro@st.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCHv2 1/1] net: ethernet: stmmac: simplify phy
 modes management for stm32
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

On Tue, Apr 14, 2020 at 03:10:26PM +0000, Christophe ROULLIER wrote:
> Hi,
> 
> Gentle reminder

Hi Christophe

You are more likely to have success if you repost.

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
