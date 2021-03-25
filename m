Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A163A348E9F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 12:12:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38244C57B5E;
	Thu, 25 Mar 2021 11:12:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22804C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 11:12:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PB8KZQ029488; Thu, 25 Mar 2021 12:12:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=selector1;
 bh=sx81ySGR8bPSutf92/n2FFZ8Gn5Yxf3a1PbQ8ivsBJk=;
 b=THaUiffSVEE09/leQ/NJbBiJbM4G1JPDHfCcK6+DhsFlXjCaGLbUaB+JK1i7rujBaId1
 kHkC6iMyqIWdE9QxaRsmFW0+Unglqba0mCW1sYkecTtcwu3RfukLTZ50xGXSZy/9ookb
 VLp5dRBvYgm8oeEyCaGwKiXz0ptn9JBiAP4R0pm9FTc93EhyV1HuRvmF6IQ+hHoQ6XlU
 P1Z34fDFKPaZEy4Y3gt+IVEEq4AIC5JIw+JamI4Ptfo3IkuH7yMzZkgOddTChf1oNLad
 KwjmowvdAf3V+6/Ni3hHS6c3Iu+L3o5loaR1H1pgbg5UIHh7uh2aZP8GkGdqWfs5qiOI zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d8tpv3wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 12:12:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7509510002A;
 Thu, 25 Mar 2021 12:12:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36D142463E6;
 Thu, 25 Mar 2021 12:12:22 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 12:12:21 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.012; Thu, 25 Mar 2021 12:12:21 +0100
From: Valentin CARON - foss <valentin.caron@foss.st.com>
To: "dillon.minfei@gmail.com" <dillon.minfei@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "rong.a.chen@intel.com" <rong.a.chen@intel.com>, "a.fatoum@pengutronix.de"
 <a.fatoum@pengutronix.de>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>,
 "vladimir.murzin@arm.com" <vladimir.murzin@arm.com>,
 "afzal.mohd.ma@gmail.com" <afzal.mohd.ma@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Erwan LE-RAY -
 foss" <erwan.leray@foss.st.com>, Erwan LE RAY <erwan.leray@st.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "lkp@intel.com" <lkp@intel.com>
Thread-Topic: [PATCH v5 9/9] dt-bindings: serial: stm32: Use 'type: object'
 instead of false for 'additionalProperties'
Thread-Index: AQHXIT7ih+t4cxLl+EWQ55a6uRUl+aqUfCqA
Date: Thu, 25 Mar 2021 11:12:21 +0000
Message-ID: <068cb7ae-9afc-606d-2579-189e46516cd5@foss.st.com>
References: <1616653162-19954-1-git-send-email-dillon.minfei@gmail.com>
 <1616653162-19954-8-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1616653162-19954-8-git-send-email-dillon.minfei@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <82932ED2BBCA05459E35290288E3E327@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_02:2021-03-24,
 2021-03-25 signatures=0
Subject: Re: [Linux-stm32] [PATCH v5 9/9] dt-bindings: serial: stm32: Use
 'type: object' instead of false for 'additionalProperties'
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

It's okay for me.

Regards,

Valentin

On 3/25/21 7:19 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
>
> To use additional properties 'bluetooth' on serial, need replace false with
> 'type: object' for 'additionalProperties' to make it as a node, else will
> run into dtbs_check warnings.
>
> 'arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800:
> 'bluetooth' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> Fixes: af1c2d81695b ("dt-bindings: serial: Convert STM32 UART to json-schema")
> Reported-by: kernel test robot <lkp@intel.com>
> Tested-by: Valentin Caron <valentin.caron@foss.st.com>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>
> v5: accroding to rob's suggestion, replace false with 'type: object'
>      of 'additionalProperties'.
>
>   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 8631678283f9..865be05083c3 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -80,7 +80,8 @@ required:
>     - interrupts
>     - clocks
>   
> -additionalProperties: false
> +additionalProperties:
> +  type: object
>   
>   examples:
>     - |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
