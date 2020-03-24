Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B268D190602
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 08:05:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67446C36B0B;
	Tue, 24 Mar 2020 07:05:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66CFEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 07:05:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O6w7UW031495; Tue, 24 Mar 2020 08:04:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=7wFcBKQjS8GhVVGG87TFgIBhk0ZNc73e9zHBQoR6jPY=;
 b=H+KIEHyRnN+J5BtxQqblKuhxxdXZRxg8buLFoEaG1of1OIxaFRRjzifDhHv4j0dllHti
 J4EP0mjdblnV1wdlHVKmcLKYIorYddmi4mRYNaQfbYgYXTDEl5WZh7XSdAts4eK2TIGo
 McPZzs5N073ymvfOtiH1iRCxlxNQBJqcZEyxj238yO8QAe24rhIgX9iO2iv44IPWLgnQ
 7O5VAgMFvfs3boxtLTORHZA1rvl9BPaZMxozdM6gTgRXufBnd+sxFjADdLZZ5NzWLow4
 Zfe4kFzEOaeFAcv/dnWUPOt96kfZiqHMxKzGjuFXwqi1sVF3JwmeewCcyEg7ak2NFA/g DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xdx06x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 08:04:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CEB4100050;
 Tue, 24 Mar 2020 08:04:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F10752123A8;
 Tue, 24 Mar 2020 08:04:49 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 08:04:49 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 08:04:49 +0100
From: Christophe ROULLIER <christophe.roullier@st.com>
To: "davem@davemloft.net" <davem@davemloft.net>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "alexandru.ardelean@analog.com" <alexandru.ardelean@analog.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Thread-Topic: [PATCHv2 0/2] Convert stm32 dwmac to DT schema
Thread-Index: AQHV/G8jyopfPfKg2U20W1fFmsf4ZahXS1cA
Date: Tue, 24 Mar 2020 07:04:49 +0000
Message-ID: <ceaf3163-7387-aa2a-6905-9d4faf92fc93@st.com>
References: <20200317151706.25810-1-christophe.roullier@st.com>
In-Reply-To: <20200317151706.25810-1-christophe.roullier@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <9BE064A5AA0DF74DB1E0A60AD74FCA3B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_01:2020-03-23,
 2020-03-24 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCHv2 0/2] Convert stm32 dwmac to DT schema
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

Gentle reminder

Thanks in advance.
Christophe.

On 17/03/2020 16:17, Christophe Roullier wrote:
> Convert stm32 dwmac to DT schema
>
> Christophe Roullier (2):
>    dt-bindings: net: dwmac: increase 'maxItems' for 'clocks',
>      'clock-names' properties
>    dt-bindings: net: dwmac: Convert stm32 dwmac to DT schema
>
> v1->v2:
> update from Rob (solve checkpatch errors with trailing WS,
> rename "Example", Wrap lines)
>
>   .../devicetree/bindings/net/snps,dwmac.yaml   |   8 +-
>   .../devicetree/bindings/net/stm32-dwmac.txt   |  44 -----
>   .../devicetree/bindings/net/stm32-dwmac.yaml  | 160 ++++++++++++++++++
>   3 files changed, 167 insertions(+), 45 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/net/stm32-dwmac.txt
>   create mode 100644 Documentation/devicetree/bindings/net/stm32-dwmac.yaml
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
