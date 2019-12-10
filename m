Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE93118237
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2019 09:29:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00F97C36B0B;
	Tue, 10 Dec 2019 08:29:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FBADC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 08:29:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA8MgQl024210; Tue, 10 Dec 2019 09:28:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/u1hvBc/HdsmzCgZdcSYSRr+5Y+aodFwrfclzaWfZsI=;
 b=AhGBYNHhQYTnV+NaByM56zLy55DD5vzpdVmeK6SeNXYaqcSU4cUeVgkFkdmhwquQ7myr
 MFRSo/RY+5/x5YZ3dF+ZyRLkhOvOSAZ6K/XgL5ayKTEx+hqu/Zl0CieQRkMAWQiod90O
 aAcvuK7emhbvGQzCbJ5IZI5Jw9yOkIkP2Jyi7K2q3FZBH5KlCCXdEcOE/zALMiUep5+a
 U0Pes8LzlK+mvlq9oMUWuvdjva8MQzlkRN23BLVTklyjAKBEoygHi2swNjW63ppMj7oH
 BxQ7NYstafAdGJ6hTQ+CL6wPGQgNHjOKUzK5qirIYPIsDR5X+eqw6hzUOq0IyHyz9A3g cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wraq3ugh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 09:28:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7DD010002A;
 Tue, 10 Dec 2019 09:28:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE8E221E551;
 Tue, 10 Dec 2019 09:28:20 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Dec
 2019 09:28:20 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 10 Dec 2019 09:28:20 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net"
 <linux@roeck-us.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Thread-Topic: [PATCH v3] dt-bindings: watchdog: Convert stm32 watchdog
 bindings to json-schema
Thread-Index: AQHVoR3g+vJ/hd4xOEqFJoxHHFujBqezFI8A
Date: Tue, 10 Dec 2019 08:28:20 +0000
Message-ID: <bc07ec1b-12b5-3079-1a96-44a2906a1da2@st.com>
References: <20191122101616.14351-1-benjamin.gaignard@st.com>
In-Reply-To: <20191122101616.14351-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <81F1C2245203984B9F87BD5F5A90CDAE@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: watchdog: Convert stm32
 watchdog bindings to json-schema
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


On 11/22/19 11:16 AM, Benjamin Gaignard wrote:
> Convert the STM32 watchdog binding to DT schema format using json-schema

gentle ping to reviewers,

Thanks,

Benjamin

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in version 3:
> - fix typo in clock-names enum
>    
> changes in version 2:
> - remove trailer space
> - add Christophe in the maintainers list
>
>   .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 ----------
>   .../bindings/watchdog/st,stm32-iwdg.yaml           | 55 ++++++++++++++++++++++
>   2 files changed, 55 insertions(+), 26 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>   create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
>
> diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> deleted file mode 100644
> index d8f4430b0a13..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -STM32 Independent WatchDoG (IWDG)
> ----------------------------------
> -
> -Required properties:
> -- compatible: Should be either:
> -  - "st,stm32-iwdg"
> -  - "st,stm32mp1-iwdg"
> -- reg: Physical base address and length of the registers set for the device
> -- clocks: Reference to the clock entry lsi. Additional pclk clock entry
> -  is required only for st,stm32mp1-iwdg.
> -- clock-names: Name of the clocks used.
> -  "lsi" for st,stm32-iwdg
> -  "lsi", "pclk" for st,stm32mp1-iwdg
> -
> -Optional Properties:
> -- timeout-sec: Watchdog timeout value in seconds.
> -
> -Example:
> -
> -iwdg: watchdog@40003000 {
> -	compatible = "st,stm32-iwdg";
> -	reg = <0x40003000 0x400>;
> -	clocks = <&clk_lsi>;
> -	clock-names = "lsi";
> -	timeout-sec = <32>;
> -};
> diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> new file mode 100644
> index 000000000000..928588091710
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/st,stm32-iwdg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Independent WatchDoG (IWDG) bindings
> +
> +maintainers:
> +  - Yannick Fertre <yannick.fertre@st.com>
> +  - Christophe Roullier <christophe.roullier@st.com>
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32-iwdg
> +      - st,stm32mp1-iwdg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Low speed clock
> +      - description: Optional peripheral clock
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      enum: [ lsi, pclk ]
> +    minItems: 1
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    watchdog@5a002000 {
> +      compatible = "st,stm32mp1-iwdg";
> +      reg = <0x5a002000 0x400>;
> +      clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
> +      clock-names = "pclk", "lsi";
> +      timeout-sec = <32>;
> +    };
> +
> +...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
