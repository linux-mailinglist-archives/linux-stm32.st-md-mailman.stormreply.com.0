Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C97E605FE
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 14:36:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42A78C35E01
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 12:36:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03B57C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 12:36:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65CVYTY029722; Fri, 5 Jul 2019 14:35:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=njzQHa4+h1RnF+3DEZ8qWlHR8A0NDvMIkjMuExbOY/c=;
 b=Lms/oWpARTnfFQZUGeLLSL/L5nCtc4yzZ/CJ0qPJ0hKUMsYaYecBD/8UKtYDYaRrRHBt
 l2cG1M1ivkaqS6KPtjjDZzFp7+tv6a8Btq9SpvxDUUWWQtFHndcN96Zei+cX7Pnl17za
 lCrFTCEwLRM6Et0oiVg66e+9uElel5r76m8cdY4Uqf1hXM7kKTOSeeadR5UFlCWPcO27
 5h6salTtUNpFVrgDhLmYhcR6JrRewtugTCbL+tBa0NOfUoTAiYUAbUwhsO5ZwimFvkt3
 /6jFjyql7Bun7AVz1gsL5KWi0P8RSvHJIJ0hmG6DEEBRoIdy5bImxxgwrvn5EJ49lQ2o ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf1jhdu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 14:35:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79C7D34;
 Fri,  5 Jul 2019 12:35:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40D982C7F;
 Fri,  5 Jul 2019 12:35:15 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jul
 2019 14:35:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 5 Jul 2019 14:35:14 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Olivier MOYSAN <olivier.moysan@st.com>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@siol.net"
 <jernej.skrabec@siol.net>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jsarha@ti.com" <jsarha@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Thread-Topic: [PATCH 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
Thread-Index: AQHVMO2JtZ7sVttbMk6Xu8iqEAATraa72MyA
Date: Fri, 5 Jul 2019 12:35:14 +0000
Message-ID: <ca446f4b-d918-fe6d-f6bd-4aa07efbefac@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <82CCEAE863094E428B349826FE92A781@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: display: sii902x: Change
 audio mclk binding
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

Hi Olivier,
and many thanks for your patch.
I have double checked in the sil9022/24 datasheet and you are right:

"As an option, the original MCLK signal used to strobe the I2S signals 
out from the sourcing chip can be used. If the internal PLL is used, 
then an external MCLK input is not required."

So, even if #sound-dai-cells is there, this is not mandatory to have MCLK.

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Philippe :-)


On 7/2/19 5:47 PM, Olivier Moysan wrote:
> As stated in SiL9022/24 datasheet, master clock is not required for I2S.
> Make mclk property optional in DT bindings.
> 
> Fixes: 3f18021f43a3 ("dt-bindings: display: sii902x: Add HDMI audio bindings")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>   Documentation/devicetree/bindings/display/bridge/sii902x.txt | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
> index 2df44b7d3821..6e14e087c0d0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
> @@ -26,9 +26,8 @@ Optional properties:
>   	- clocks: phandle and clock specifier for each clock listed in
>              the clock-names property
>   	- clock-names: "mclk"
> -	   Describes SII902x MCLK input. MCLK is used to produce
> -	   HDMI audio CTS values. This property is required if
> -	   "#sound-dai-cells"-property is present. This property follows
> +	   Describes SII902x MCLK input. MCLK can be used to produce
> +	   HDMI audio CTS values. This property follows
>   	   Documentation/devicetree/bindings/clock/clock-bindings.txt
>   	   consumer binding.
>   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
