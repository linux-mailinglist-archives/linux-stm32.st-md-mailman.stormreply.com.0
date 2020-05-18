Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB181D7811
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 14:03:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED5C4C36B22;
	Mon, 18 May 2020 12:03:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A570EC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 12:03:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04IC2rku010157; Mon, 18 May 2020 14:02:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=tAbl2axdddZlaaXG2CNspEZUt31JN+F0gHWw9tO/rHM=;
 b=ddgt4qxdT4oWVbfbhnLDLAFXbH9hijDV73qOYcZaPn45NL3bumpy8wLhX3mQ5Ty8Rnwe
 Pw/wCLNK1hvokjk4gya24QRhEdq3qzzhUHo2amAWd+SCgiwsuoJWVOdlG/QND/4+sq3N
 5jLqzkCN4R7NsLwsozz2ISXgisXhvDnd/YfoWobYpTTwHGLE44CKN6D575ojATSSd8yh
 bAPNfjZdCpCRfQQrS/5nnimfEQtpfn25tR48a6FX/1nC32MjP6wiP6KgKjuygx7erOLx
 GvKmSrG19BHK8PrE2Aa0sR5sntD9/GrYvVY5vQspxGiw/RTUtF0Y+bIuCsta2yWpbh0n zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3125n3bm24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 14:02:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E74D810002A;
 Mon, 18 May 2020 14:02:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag4node3.st.com [10.75.127.12])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAC522BF9CF;
 Mon, 18 May 2020 14:02:47 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG4NODE3.st.com
 (10.75.127.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 14:02:47 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Mon, 18 May 2020 14:02:47 +0200
From: Christophe ROULLIER <christophe.roullier@st.com>
To: "robh@kernel.org" <robh@kernel.org>, "davem@davemloft.net"
 <davem@davemloft.net>, "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 Peppe CAVALLARO <peppe.cavallaro@st.com>
Thread-Topic: [PATCH v3 0/1] net: ethernet: stmmac: simplify phy modes
 management for stm32
Thread-Index: AQHWHHq3aaIPOA/wFEi5Ev+u/GvPiaitvfmA
Date: Mon, 18 May 2020 12:02:47 +0000
Message-ID: <3aaadf75-5399-4961-248a-c77c719155d4@st.com>
References: <20200427100038.19252-1-christophe.roullier@st.com>
In-Reply-To: <20200427100038.19252-1-christophe.roullier@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <CD3A060E2D09364A9ED8F23EAD3F016B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_05:2020-05-15,
 2020-05-18 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/1] net: ethernet: stmmac: simplify
 phy modes management for stm32
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

Hi,

Just a "gentleman ping"

Regards,

Christophe.

On 27/04/2020 12:00, Christophe Roullier wrote:
> No new feature, just to simplify stm32 part to be easier to use.
> Add by default all Ethernet clocks in DT, and activate or not in function
> of phy mode, clock frequency, if property "st,ext-phyclk" is set or not.
> Keep backward compatibility
>
> version 3:
> Add acked from Alexandre Torgue
> Rebased on top of v5.7-rc2
>
> Christophe Roullier (1):
>    net: ethernet: stmmac: simplify phy modes management for stm32
>
>   .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 74 +++++++++++--------
>   1 file changed, 44 insertions(+), 30 deletions(-)
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
