Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD9943AAD
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Aug 2024 02:18:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F505C6DD96;
	Thu,  1 Aug 2024 00:18:03 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A92E2C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2024 00:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=AuM3/GrAXMsIi+A6go0Z7DzaZf+OKFjJLl1R8WuyiaQ=; b=b3H4//d9d9Sj9u8/iuUX6VS8hJ
 itlx2ImLOk1GIbcKJysTVZN8bH/N5E8cd0RMt/WLQ0iJ9tjJfuuWT5yAJPd7kIdFGKJajB0vQeOaG
 LYN5nVREqSuvMjHn4Y5qidUDtq4bnAAilU8lsPp8kHwn18fk3gOrVAV6B7whjF1BYodo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sZJVq-003isF-Os; Thu, 01 Aug 2024 02:17:46 +0200
Date: Thu, 1 Aug 2024 02:17:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <62872c29-0032-4ad8-b771-d57469950c75@lunn.ch>
References: <20240730091648.72322-1-swathi.ks@samsung.com>
 <CGME20240730092907epcas5p1b81eaf13a57535e32e11709602aeee06@epcas5p1.samsung.com>
 <20240730091648.72322-4-swathi.ks@samsung.com>
 <1090d2c2-196f-4635-90a0-c73ded00cead@lunn.ch>
 <00b301dae303$d065caf0$713160d0$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00b301dae303$d065caf0$713160d0$@samsung.com>
Cc: jayati.sahu@samsung.com, edumazet@google.com, linux-fsd@tesla.com,
 alim.akhtar@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com,
 pankaj.dubey@samsung.com, krzk@kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, ravi.patel@samsung.com, richardcochran@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 rcsekar@samsung.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v4 3/4] arm64: dts: fsd: Add Ethernet
 support for FSYS0 Block of FSD SoC
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

> > What is the interface connected to? A switch?
> 
> Hi Andrew, 
> Thanks for the quick review. AFAIK, this has been discussed earlier. I am
> providing the links to the same here for quick reference. 
> 
> [1] https://lkml.org/lkml/2024/7/29/419
> [2] https://lkml.org/lkml/2024/6/6/817
> [3] https://lkml.org/lkml/2024/6/6/507
> [4] https://lkml.org/lkml/2023/8/14/1341
> 
> Please let us know if you have any further queries on this.

Ah, O.K.

It would make sense to add to the commit message something like:

The Ethernet interface is connected to a switch, which Linux is not
managing.

Part of the purpose of the commit message is to answer questions
reviewers might have. This is one such question.

	  Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
