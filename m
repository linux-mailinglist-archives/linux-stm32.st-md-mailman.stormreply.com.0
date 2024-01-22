Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9498836D8F
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 18:34:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63AE4C6DD6B;
	Mon, 22 Jan 2024 17:34:21 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1C2AC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GWnT5S4Q6XzDJBRpEknqgOW0ZyLDPeI6kyNoprab2vM=; b=eWTa4QXyrVBO656lSz5cMMLRyy
 R6pDqNNQj8yI9pfktmlDM2dJvaXnLVSst2pNMmm5eqxhxxmJB6x0wkoNQ+gbkAv7EUL0MdozU8Qee
 H1SFbw/Y7JnA/iHu0f0//49u9J+NQqQBDQ1snFjFX75fyr78iZfOqRF5I7QNEGvK19So=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rRyBY-005kSZ-AZ; Mon, 22 Jan 2024 18:34:12 +0100
Date: Mon, 22 Jan 2024 18:34:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <b84df52a-f144-4ec3-b81b-20d1a0176aff@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <28cca132-d5bb-4cff-ba2f-9be241a5ce83@lunn.ch>
 <TYZPR01MB55565998F43009AD351AC07EC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB55565998F43009AD351AC07EC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Praveenkumar I <ipkumar@codeaurora.org>,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 5/8] clk: qcom: support for duplicate freq
 in RCG2 freq table
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

> > > Change-Id: I97d9e1b55d8f3ee095f6f01729af527ba90e50e5
> > > Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> > > (cherry picked from commit 775e7d3b69ffc97afb5bd5a6c9c423f2f4d8a0b2)
> > > Signed-off-by: Praveenkumar I <ipkumar@codeaurora.org>
> > > 
> > > Change-Id: If10193fc79a3c1375ab73597813745ff1f4df0ad
> > > 
> > > Pick from https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/6dfb368bae130bee58e00ddf8330b55066e1c8c5
> > > 
> > > Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> > 
> > Please clean up these tags. These Change-ID tags are meaningless in
> > mainline. 775e7d3b69ffc97afb5bd5a6c9c423f2f4d8a0b2 is not in mainline
> > either. The picked from might be interesting, but please put it into
> > the body of the commit message, not mixed in with the tags.
> > 
> > Who actually wrote this patch? The first Signed-off-by: is from
> > Abhishek Sahu. But you have a From of Praveenkumar I ?
> 
> I have no idea about this. This patch is from Qualcomm vendor linux code.

O.K. Since this is direct from the vendor, who probably does not track
code authorship correctly, i would say the author in git is probably
wrong. I would set the author: to Abhishek Sahu <absahu@codeaurora.org>.

> What's more, I don't known how to deal with these commit message since I'm
> not the author and I'm not sure do I have right to edit them even though
> this is GPL code.

You should keep all the Signed-off-by, in the order they are. But the
Change-Id is meaningless, so there is no problem removing them.

	  Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
