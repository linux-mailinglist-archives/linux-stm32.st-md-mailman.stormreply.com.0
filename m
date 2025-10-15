Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E2BBDFB0F
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 18:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5FC8C57169;
	Wed, 15 Oct 2025 16:37:46 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 526F1C56604
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=EmNyMES08hLl/lZo50ZMyOt0uk2s5aoOzzYmrsTy+X0=; b=3p/AB+nXcfar0/n95hcIl0eb3B
 sdzT8OKBtQ98To+XFs5Bbtrk+fIwpTM08JgleTkl1NPK6b6w6fZnN6c79KulRIU3jX4kegbCAct57
 VfTnzyW73zdlmfO1jyJbP3T1oAejXdtoubxWxQpPgm9uFOmnvr7qRN9CgJHbKnhbzwAQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1v94VJ-00B3LR-0W; Wed, 15 Oct 2025 18:37:33 +0200
Date: Wed, 15 Oct 2025 18:37:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor@kernel.org>,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 02/10] dt-bindings: pincfg-node: Add
 properties 'skew-delay-{in, out}put'
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

> I don't recall the reason for this way of defining things, but one reason
> could be that the skew-delay incurred by two inverters is very
> dependent on the production node of the silicon, and can be
> nanoseconds or picoseconds, these days mostly picoseconds.
> Example: Documentation/devicetree/bindings/net/adi,adin.yaml


I'm missing the big picture here, and i don't see an example of these
properties being used. However, since you reference an old networking
example, for RGMII delays....

adi,rx-internal-delay-ps should be deprecated, we now have the generic
rx-internal-delay-ps. The point about using -ps is however still
valid.

However, i would not like to see pinctl DT properties used in place of
rx-internal-delay-ps. How the Ethernet MAC driver implements
rx-internal-delay-ps is left open, so calling a pinctl API to set the
skew is fine by me. And if the real use case has nothing to do with
networking, then i don't care.

	    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
