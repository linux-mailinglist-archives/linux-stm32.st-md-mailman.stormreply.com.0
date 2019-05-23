Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8A27BB1
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 13:25:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01464CCAF79
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 11:25:19 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CE24CCAF78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 11:25:17 +0000 (UTC)
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
 [10.13.135.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 38AA6C0058;
 Thu, 23 May 2019 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1558610700; bh=hkQq+NagVQeRn04WiFE2kt9SOsCwDZFEIjFfIVppq1c=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BR39Y+nTIgvh+2XyRdJmKJrpSYDSa56MeY5fv4PJtO72l0XqpHkqdNbSn2TWiu9/Y
 lR6Y5eb7BMmyxH353cw5lppec09JyN/fjeqWx3bR0t+Ee1Pr36U+gzU9T8rKwGK8Wx
 3Bvy2G1w2XW08/0EfUZYLSw/spMLddLLb2TY4zEEKRQfS/pX+sj62mdHcjVKN68me2
 qE0kFtK8yvwWITl5gTN4pPUuRsibfD5WD7cBFhbNKTJETzXeIKaJugMltCvCuncWFl
 3/8gk84WFQ0yQ1aJNGURikMyuLMl/XwCLZ+VXkD99bqESql6uSn1RryDpAv6M56PUI
 mYCcDsHcxjxlg==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 08FFFA0067;
 Thu, 23 May 2019 11:25:12 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 23 May 2019 04:25:12 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Thu, 23 May 2019 13:25:10 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Thread-Topic: [PATCH 6/8] dt-bindings: net: stmmac: Convert the binding to a
 schemas
Thread-Index: AQHVEU4TH/U8rGF20keiHF2VDmX4vKZ4fKug///ujYCAACXOwA==
Date: Thu, 23 May 2019 11:25:09 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B92BA5B@DE02WEMBXB.internal.synopsys.com>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <ba1a5d8ad34a8c9ab99f504c04fbe65bde42081b.1558605170.git-series.maxime.ripard@bootlin.com>
 <78EB27739596EE489E55E81C33FEC33A0B92B864@DE02WEMBXB.internal.synopsys.com>
 <20190523110715.ckyzpec3quxr26cp@flea>
In-Reply-To: <20190523110715.ckyzpec3quxr26cp@flea>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.19.176]
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?iso-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
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
Date: Thu, May 23, 2019 at 12:07:15

> You can then run make dtbs_check, and those YAML files will be used to
> validate that any devicetree using those properties are doing it
> properly. That implies having the right node names, properties, types,
> ranges of values when relevant, and so on.

Thanks but how can one that's developing know which bindings it shall use 
? Is this not parsed/prettified and displayed in some kind of webpage ?

Just that now that the TXT is gone its kind of "strange" to look at YAML 
instead of plain text and develop/use the bindings.

Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
