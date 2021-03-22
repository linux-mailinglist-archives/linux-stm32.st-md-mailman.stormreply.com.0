Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C101C343ED1
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 12:05:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68395C57B5E;
	Mon, 22 Mar 2021 11:05:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61352C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 11:05:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MAudE4013707; Mon, 22 Mar 2021 12:05:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=selector1;
 bh=Pymfk/EgZE9Sai/go/LCUbW5Sj5kXKwBZSorsF6E/JM=;
 b=AS1MsmI1/uy4Sqoh816U7Rf3Y4jB9++nFcdz5kCsetmSk2Iey3fDSAJZWiUPA8dmOsan
 cg1qUuooc9ceCD1crogkfyUqwd7vOUTAmK4ul6KOWPoiephnLdt88q8+Uh68SLUEsmVt
 FqBo76MwbFm7NEuC0Al0+j1GsRNXc8j89xjU4BK1CbkbRAtnP1jgdK6qLJSx9xxxEK0E
 9MPtSVMMKqxiJ6cimeucoxj0T4rBVpJddbanKv+r8pCWWRAatphwWnGEcq5MXjAzC0lk
 Mv9/0lymVBMCXAur+C/5mrNwpfWb+0AsyR/6BZSByxKWhOFsmRuygl8gnSBDLHL+Lpku lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d9968xhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 12:05:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4829C10002A;
 Mon, 22 Mar 2021 12:05:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B8BF2463CD;
 Mon, 22 Mar 2021 12:05:04 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 12:05:03 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.012; Mon, 22 Mar 2021 12:05:03 +0100
From: Valentin CARON - foss <valentin.caron@foss.st.com>
To: "dillon.minfei@gmail.com" <dillon.minfei@gmail.com>, "Alexandre TORGUE -
 foss" <alexandre.torgue@foss.st.com>, "rong.a.chen@intel.com"
 <rong.a.chen@intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "a.fatoum@pengutronix.de" <a.fatoum@pengutronix.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>,
 "vladimir.murzin@arm.com" <vladimir.murzin@arm.com>,
 "afzal.mohd.ma@gmail.com" <afzal.mohd.ma@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Erwan LE-RAY -
 foss" <erwan.leray@foss.st.com>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "lkp@intel.com" <lkp@intel.com>
Thread-Topic: [Linux-stm32] [PATCH v4 9/9] dt-bindings: serial: stm32: Use
 'unevaluatedProperties' instead of 'additionalProperties'
Thread-Index: AQHXHws10grT1ARp1UKFub73w++Z4Q==
Date: Mon, 22 Mar 2021 11:05:03 +0000
Message-ID: <5f95b6ad-ddbe-8394-8599-e78f30c8b62c@foss.st.com>
References: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
 <1616205383-24114-8-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1616205383-24114-8-git-send-email-dillon.minfei@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <3C33FA9F1EEDA74F9DCE468962861821@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_04:2021-03-22,
 2021-03-22 signatures=0
Subject: Re: [Linux-stm32] [PATCH v4 9/9] dt-bindings: serial: stm32: Use
 'unevaluatedProperties' instead of 'additionalProperties'
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

Hi Dillon,

It works for me.

On 3/20/21 2:56 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
>
> To use additional properties 'bluetooth', need use unevaluatedProperties
> to fix dtbs_check warnings.
>
> 'arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800: 'bluetooth'
> does not match any of the regexes: 'pinctrl-[0-9]+'
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: af1c2d81695b ("dt-bindings: serial: Convert STM32 UART to json-schema")

You can add my:
Tested-by: Valentin Caron <valentin.caron@foss.st.com>

> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>
> v4:
> - add Reported-by and Fixes tag
> - use unevaluatedProperties: false to fix dtbs_check warrnings instead of
>    add 'bluetooth' in st,stm32-uart.yaml
>
>   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 8631678283f9..305941b1d5a0 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -80,7 +80,7 @@ required:
>     - interrupts
>     - clocks
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |

Regards,
Valentin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
