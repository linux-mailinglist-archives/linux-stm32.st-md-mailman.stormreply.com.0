Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4693A9E8F46
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 10:52:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BEECC78021;
	Mon,  9 Dec 2024 09:52:27 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE039C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 09:52:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 674A5A4128D;
 Mon,  9 Dec 2024 09:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D684AC4CEE0;
 Mon,  9 Dec 2024 09:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733737938;
 bh=17cYCIB8pmf0RVDzrkvPvsOzy3tMjOSzBdNQ+E6TpP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PxB+omHlAp8wbBIiBVweI06BjBfn+YExbWhsmzSyG9Ug/M5iTZom1qyT82b0/RuYj
 MJl08rjhCilpe+8OIchsmSo+myoiDCDI3U+O5dwLZGRi0cf8ddXBjOpdZya8lygnfi
 /9BdLvYZUVV9JriJRYosDlynIhxfmAkzXruelmzoECB1RvW4XgQgYvG5sOsLkRyMuG
 xcc6k8t9IxT0MAHcj2tLSt6BdH4KUc3E+PCdl7yX190TqPlZOZFlKp7vciMXhUnEIG
 VuIhnm4rSA3+v9ygrT+MQNxQ/i4mqaety6MerE/cIw+bi+MVgonj1IqeJGqS0dqOlz
 JPenRZ/aeSRnA==
Date: Mon, 9 Dec 2024 10:52:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <bz5ybgnpkjwqde6kfq6oiyme34gthvnyz5rcfwojqq2aquwjle@aypks6sf45wi>
References: <20241205125640.1253996-1-o.rempel@pengutronix.de>
 <20241205125640.1253996-2-o.rempel@pengutronix.de>
 <20241205-immortal-sneak-8c5a348a8563@spud>
 <Z1KxZmRekrYGSdd4@pengutronix.de>
 <20241206-wrought-jailbreak-52cc4a21a713@spud>
 <Z1QAoAmXlBoixIS4@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z1QAoAmXlBoixIS4@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1 1/5] dt-bindings: net: Add TI DP83TD510
	10BaseT1L PHY
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

On Sat, Dec 07, 2024 at 09:00:32AM +0100, Oleksij Rempel wrote:
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - ethernet-phy-id2000.0181
> > > > 
> > > > There's nothing specific here, can someone remind me why the generic
> > > > binding is not enough?
> > > 
> > > The missing binding was blamed by checkpatch. Haw should I proceed with this
> > > patch?
> > 
> > Does dtbs_check complain when you use it in a dts? What you have here
> > matches against the pattern ^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$
> > so I think it won't. checkpatch might be too dumb to evaluate the regex?
> 
> dtbs_check didn't complained about it, only checkpatch.

Checkpatch is not a reason to add bindings. Missing binding would be a
reason (e.g. pointed out by dtschema), but I understand this is not the
case here, so drop the patch.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
