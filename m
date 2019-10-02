Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B60ABC4983
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2019 10:31:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 695D4C36B0B;
	Wed,  2 Oct 2019 08:31:29 +0000 (UTC)
Received: from smtp.cellavision.se (smtp.cellavision.se [84.19.140.14])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E90DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2019 08:02:04 +0000 (UTC)
Received: from DRCELLEX03.cellavision.se (172.16.169.12) by
 DRCELLEX03.cellavision.se (172.16.169.12) with Microsoft SMTP Server (TLS) id
 15.0.1044.25; Wed, 2 Oct 2019 10:02:03 +0200
Received: from DRCELLEX03.cellavision.se ([fe80::982a:ae4b:76e:fa98]) by
 DRCELLEX03.cellavision.se ([fe80::982a:ae4b:76e:fa98%12]) with mapi id
 15.00.1044.021; Wed, 2 Oct 2019 10:02:03 +0200
From: Hans Andersson <Hans.Andersson@CELLAVISION.SE>
To: Jose Abreu <Jose.Abreu@synopsys.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>
Thread-Topic: [PATCH] net: stmmac: Read user ID muliple times if needed.
Thread-Index: AQHVePAX5n9iUQBpykuXocq+LEgDYKdG2TOAgAAjX2A=
Date: Wed, 2 Oct 2019 08:02:02 +0000
Message-ID: <e878e0e4036a4d69b05dcee717fd7ac5@DRCELLEX03.cellavision.se>
References: <20191002070721.9916-1-haan@cellavision.se>
 <BN8PR12MB3266ED591171A79825090BE0D39C0@BN8PR12MB3266.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3266ED591171A79825090BE0D39C0@BN8PR12MB3266.namprd12.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.230.0.148]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 08:31:27 +0000
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Read user ID muliple times
	if needed.
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

We assert / de-assert the reset line, but the CPU is too fast and the IP is still 
in reset when we later try to read user ID / Synopsys ID. Another option would
be to add a delay after we reset.

-----Original Message-----
From: Jose Abreu <Jose.Abreu@synopsys.com> 
Sent: den 2 oktober 2019 09:52
To: Hans Andersson <Hans.Andersson@CELLAVISION.SE>; mcoquelin.stm32@gmail.com
Cc: peppe.cavallaro@st.com; alexandre.torgue@st.com; davem@davemloft.net; netdev@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Hans Andersson <Hans.Andersson@CELLAVISION.SE>
Subject: RE: [PATCH] net: stmmac: Read user ID muliple times if needed.

From: Hans Andersson <haan@cellavision.se>
Date: Oct/02/2019, 08:07:21 (UTC+00:00)

> When we read user ID / Synopsys ID we might still be in reset, so read 
> muliple times if needed.

We shouldn't even try to read it if IP is in reset ... 

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
