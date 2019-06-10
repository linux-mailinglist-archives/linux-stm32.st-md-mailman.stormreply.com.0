Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4283B878
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 17:47:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CC82C65054
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 15:47:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75D57C65053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 15:47:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5AFfYgf026022; Mon, 10 Jun 2019 17:47:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LgERwqK45s8WxfYNJ2p/eCQHczqBFZZAr61TGRo2H+4=;
 b=gWnTJIR+98UCSxymsNwMRkgV+9V4yBZI5+4O8squ/S1WPag/BNss5IcSulDOH8T/qMqy
 q5rRWgjZh1+axSfpm4jGFsbHUXiEKvFm5yX1fVKRlgcGeUpMJ1UiBH3GQvUc006KNBYZ
 aaQBMZ5CoapQhFeAG4Xy6KLHH7l+oOyLUCEOe/V+gwEP4isq8+XLC7bW/5by5lGiK/x3
 XouigYxflqzytqopMhVNGFhEgQPEP7iffCr4OeoYE1zREws/pzQJfakAvhXlF3eR6ezU
 fzZSs6CeFFZkIWOMuauXgOa/ZhjVDilHLoY4vc8Z7eatw46qhvqsNEfDqCLJJMojWq9G AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t0256a973-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 10 Jun 2019 17:47:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B078D34;
 Mon, 10 Jun 2019 15:47:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E94F4F1D;
 Mon, 10 Jun 2019 15:47:30 +0000 (GMT)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 17:47:30 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 10 Jun 2019 17:47:30 +0200
From: Erwan LE RAY <erwan.leray@st.com>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "Kevin
 Hilman" <khilman@baylibre.com>
Thread-Topic: [PATCH] ARM: debug: stm32: add UART early console configuration
Thread-Index: AQHU73OP100nvdfkikCtYg1KY+YHZqY1DV8AgC1naoCAMtJmgA==
Date: Mon, 10 Jun 2019 15:47:30 +0000
Message-ID: <ff48768c-83e3-55dc-16a0-bd0af4133c7c@st.com>
References: <1554883239-12051-1-git-send-email-erwan.leray@st.com>
 <CAJiuCcd9884Kn2MAtLMzZpdSa-=xpCDKRLQSVC6NmRNC+YFtaA@mail.gmail.com>
 <deebc332-277b-76b9-421f-7f67c6bdacc8@st.com>
In-Reply-To: <deebc332-277b-76b9-421f-7f67c6bdacc8@st.com>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <70F78C8ABFDF92458A8685FA5F79E676@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-10_07:, , signatures=0
Cc: Fabrice GASNIER <fabrice.gasnier@st.com>,
 Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Clement Peron <clement.peron@devialet.com>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gerald
 BAEZA <gerald.baeza@st.com>, Simon Horman <horms+renesas@verge.net.au>,
 Bich HEMON <bich.hemon@st.com>, Biju Das <biju.das@bp.renesas.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: debug: stm32: add UART early console
	configuration
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

Hi Olof, Arnd and Kevin,

Gentle reminder on my feedback request.

Best regards, Erwan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
