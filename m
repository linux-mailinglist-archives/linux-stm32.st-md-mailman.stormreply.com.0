Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390B23D7C1
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Aug 2020 09:53:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD616C36B3A;
	Thu,  6 Aug 2020 07:53:50 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87A55C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Aug 2020 07:09:32 +0000 (UTC)
Received: from mail.dh-electronics.com
 (business-24-134-97-169.pool2.vodafone-ip.de [24.134.97.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx3.securetransport.de (Postfix) with ESMTPSA id 3A4B95DC06;
 Thu,  6 Aug 2020 09:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1596697749;
 bh=Wb6zcPhCGvlCHCruU+ccem0BSMeKDqUFoWpTPWDeI8A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RW/BTaevRO/g4FFClR6bqLTECZh6hqpEW4mPowLSkrGZl0p62K5v9KV/SO/umBiJm
 L7dq5cJupJFHD3k5OwRURYPPJjbI4WyufE0rgSLvX8pQLgWVTaA9NtRGwRUD/YIOPt
 dbjFNysDj/z1Zhy9XMpNWbuDc/OCC/9TCUNnQ8ji6DbtZeY8TCMijLJcbJBytFo4Bp
 y9E+yhh2ulL65CnKvg3VZGjhskaYYrBTojF7Ox9EO8vOCI/QYRVphGc/rKP6lr2Qzm
 OuSWdJQo+pYM4GMM9ZMYRTst1XnxH7jFFqz4Lne5bD+rI7xJV949QR0Vn74sPsn3Ng
 pXqzN2z1/qy6Q==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (2001:470:76a7:2::30) by
 DHPWEX01.DH-ELECTRONICS.ORG (2001:470:76a7:2::30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.595.3; 
 Thu, 6 Aug 2020 09:09:02 +0200
Received: from DHPWEX01.DH-ELECTRONICS.ORG ([fe80::6ced:fa7f:9a9c:e579]) by
 DHPWEX01.DH-ELECTRONICS.ORG ([fe80::6ced:fa7f:9a9c:e579%6]) with mapi id
 15.02.0595.003; Thu, 6 Aug 2020 09:09:02 +0200
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH] ARM: dts: stm32: Fill GPIO line names on AV96
Thread-Index: AQHWYaO6J/6XL1V4zEuDGmQGjfuCx6kpjSow
Date: Thu, 6 Aug 2020 07:09:02 +0000
Message-ID: <ca48284998c14faf8ed17e6fa0cfac42@dh-electronics.com>
References: <20200724101610.146403-1-marex@denx.de>
In-Reply-To: <20200724101610.146403-1-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.64.3.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:53:48 +0000
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fill GPIO line names on
	AV96
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

From: Marek Vasut <marex@denx.de>
Sent: Friday, July 24, 2020 12:16 PM
> 
> Fill in the custom GPIO line names used by DH.
>
[...]
> +&gpioa {
> +       gpio-line-names = "", "", "", "",
> +                         "", "", "", "",
> +                         "", "", "", "DH-GPIO-K",
> +                         "DH-GPIO-I", "", "DH-GPIO-A", "";
> +};
> +
[...]

Hello Marek,

We have been using the GPIO names at DH electronics for some time and also
on other SOMs, but have not yet streamed them. We started with the naming
only with a capital letter "A-W" since then without problems. To avoid a
hard cut or patching for us and our customers it would be good if we could
use the same naming in the mainline kernel as well. Marek, we would be
happy if you would adopt our valued GPIO naming in your patch.

Regards,
Christoph
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
