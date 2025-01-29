Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 968FCA21D5B
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 13:59:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46CECC78026;
	Wed, 29 Jan 2025 12:59:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA818C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=iGCt+0XxcYcy2o+9UQUPdgFocwfvqqMxMPoHohs8Lr0=; b=CUztH85zaoBHrhNGD7AArJxIxQ
 bTqqhXxkfIpyFsSfW9KkbD+h9KZwEnsQ0rJilPxFAnBn8ImYlu4Kgwjp3FyNz4ZS+JCmDXRR3pldW
 CCSdXbtfElUK5J8Ei+K7RPaxW+t+4GDnM4PRoYwIYetZmMYLfW5LAK13RhKAh/XTSn0c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1td7f5-00984N-HY; Wed, 29 Jan 2025 13:59:19 +0100
Date: Wed, 29 Jan 2025 13:59:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <b4df65c8-e6e5-437f-826a-eb011aac83df@lunn.ch>
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf@epcas5p4.samsung.com>
 <20250128102558.22459-2-swathi.ks@samsung.com>
 <20250128154538.GA3539469-robh@kernel.org>
 <003001db722f$1d7e56d0$587b0470$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003001db722f$1d7e56d0$587b0470$@samsung.com>
Cc: jayati.sahu@samsung.com, edumazet@google.com, linux-fsd@tesla.com,
 alim.akhtar@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 'Rob Herring' <robh@kernel.org>, linux-samsung-soc@vger.kernel.org,
 ssiddha@tesla.com, pankaj.dubey@samsung.com, krzk@kernel.org,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ravi.patel@samsung.com,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, rcsekar@samsung.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS
 device tree bindings
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

> > > +properties:
> > > +  compatible:
> > > +    const: tesla,fsd-ethqos.yaml
> > 
> > Humm...
> 
> Hi Rob, 
> Could you help me understand if there is anything wrong here?

Is your compatible really "tesla,fsd-ethqos.yaml"? If so, i think this
file needs to be called tesla,fsd-ethqos.yaml.yaml.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
