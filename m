Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D351A20512C
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2020 13:48:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E7F4C36B0C;
	Tue, 23 Jun 2020 11:48:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 227FCC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2020 11:48:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NBd7JX024529; Tue, 23 Jun 2020 13:48:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8GLEyJF1RP/0S6eNOt0taOq5xmseUp4BDZTBqjwSORo=;
 b=HX7+MGJ0Z+CJEkGXEQ7yOlzqFwXjQFMUGKS3oq1dxNcIq4/K/g28ymBwpRySOEZxcVD0
 AZvWsOa4JUCpyWZlwP21YfoeyZ39fieNLs6QfEosgdw36Np6XdrzT60uLHZpebqIASbt
 pHSDIzRUbzNafIyqz0YJA68j0De/JpNajnDZU/VR8GpOeMuMalf0P4lmLEXqjf7i5Nst
 WgxM1OpdQe/Bi9YSN6BPdy+MNw7EdAMvB9yN/1HNBsnLf121HoPWRpfDCOFg5MGOc+hE
 sgKKWoXioMX379LTFkA7inS1qwc24UvrUbZyGZo0/R+mAosXsM2eLIh6CS0HevAWLogl xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31s7x1q2hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 13:48:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2864510002A;
 Tue, 23 Jun 2020 13:48:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 035F22BEC60;
 Tue, 23 Jun 2020 13:48:29 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 23 Jun
 2020 13:48:28 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 23 Jun 2020 13:48:28 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Hugues FRUCHET <hugues.fruchet@st.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
Thread-Topic: [PATCH v6 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Index: AQHWPyIqkpbWacV/F06UdbxSuP3c1KjmCJ6A
Date: Tue, 23 Jun 2020 11:48:28 +0000
Message-ID: <459a0e53-c8d7-b79b-3004-f0114c99cff5@st.com>
References: <20200610122500.4304-1-benjamin.gaignard@st.com>
 <20200610122500.4304-2-benjamin.gaignard@st.com>
In-Reply-To: <20200610122500.4304-2-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <EC7350B716B3C5449474C6B2329F898B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_06:2020-06-23,
 2020-06-23 signatures=0
Cc: "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 1/3] dt-bindings: media: stm32-dcmi:
 Add DCMI min frequency property
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



On 6/10/20 2:24 PM, Benjamin Gaignard wrote:
> Document st,stm32-dcmi-min-frequency property which is used to
> request CPUs minimum frequency when streaming frames.
Gentle for reviewers on this bindings.

Thanks,
Benjamin
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 3fe778cb5cc3..05ca85a2411a 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -44,6 +44,13 @@ properties:
>         bindings defined in
>         Documentation/devicetree/bindings/media/video-interfaces.txt.
>   
> +  st,stm32-dcmi-min-frequency:
> +    description: DCMI minimum CPUs frequency requirement (in KHz).
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +      - default: 0
> +
>   required:
>     - compatible
>     - reg
> @@ -71,6 +78,7 @@ examples:
>           clock-names = "mclk";
>           dmas = <&dmamux1 75 0x400 0x0d>;
>           dma-names = "tx";
> +        st,stm32-dcmi-min-frequency = <650000>;
>   
>           port {
>                dcmi_0: endpoint {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
