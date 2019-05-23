Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DC27A10
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 12:11:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 893ADC0CD32
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 10:11:50 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (unknown [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBC52C0CD31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 10:11:48 +0000 (UTC)
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com
 [10.12.135.161])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3A084C019A;
 Thu, 23 May 2019 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1558606292; bh=ZEbZqunZ+rIwViZDW6o7vFr9VUdu0pDj0hPGxzIu6ek=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=cBUJrPawSJA6R+HhDp/hN/3hxkJdWLBnHIrnV6/L4PpYSXb+SRaYhDxUzgq6nHulc
 k/WbOxllU3Dxi482kElOyiEjTjrBVnIcMZG56vzkxqxRiB6o18bW6y3x+0K+eYRm4W
 PJqZGaeLrTLn9a3Dhb/1EpC3jT5dTmXy/l3upXuxJrezlwHEM2dUvLIsWSeYlm6AzK
 ye+r51OCFeMIALLzS58nZWsUHFoJeZSZJ8U9LXv84RpWfIhqoSTspL4OKXgRLoFj+v
 JRbInyMmArtFabkdmNFACrIHy7TeK5muPFxZBILN27ZNYQ330Pxel6nTNA/GOUmtpU
 Oy9oIkMw7uyHg==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C811FA009E;
 Thu, 23 May 2019 10:11:42 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 23 May 2019 03:11:42 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Thu, 23 May 2019 12:11:40 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland
 <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, "Chen-Yu
 Tsai" <wens@csie.org>
Thread-Topic: [PATCH 6/8] dt-bindings: net: stmmac: Convert the binding to a
 schemas
Thread-Index: AQHVEU4TH/U8rGF20keiHF2VDmX4vKZ4fKug
Date: Thu, 23 May 2019 10:11:39 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.19.176]
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?iso-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 6/8] dt-bindings: net: stmmac: Convert the
 binding to a schemas
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

From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, May 23, 2019 at 10:56:49

> Switch the STMMAC / Synopsys DesignWare MAC controller binding to a YAML
> schema to enable the DT validation.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

How exactly can I see the final results of this ? Do you have any link ? 
(I'm no expert in YAML at all).

Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
