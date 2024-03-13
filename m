Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8187A60B
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 11:41:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F053AC6C83C;
	Wed, 13 Mar 2024 10:41:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 540F2C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 10:41:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42DAQqtj031797; Wed, 13 Mar 2024 11:40:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-type:message-id:date:mime-version:subject:to:cc
 :references:from:in-reply-to; s=selector1; bh=P/TGwE35gwGLRt0DU7
 8yvvMNsaXojjEnz1nodaHHGRo=; b=FlyNtWwiQTVKZg2/cLDN1/hFcbnPuc9Ivb
 4yI+hA3otcD2MdMvX8Bku4d+Bp9CWCHOeTXfWCpPv6EQhpBccvma6Yz5+KQl9m0l
 JAcbXzBBYKipgoT3/g3EKAwtz4zXUBQt2fLE84YcszGVuitoqLRupOHfFgGsQqcF
 GTW/OGABVb1bdGJAy16cKoISWdjz5VcLPfbNQuEy+U7mVoakvhnomX/ySSrWhr6g
 yw+zkphqHw331oU0gf6ViykwQ/uCL4uPWpN0csQXO+xybs98rBz8dkq1wJse9YA0
 jaFuBgcnyf9wPgaxQFKPGtZD5s3bu6TtoXKvONsUYnc8+ylTiC5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrg02ssdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 11:40:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A587640048;
 Wed, 13 Mar 2024 11:40:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4C5425B742;
 Wed, 13 Mar 2024 11:39:54 +0100 (CET)
Received: from [10.201.21.128] (10.201.21.128) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Mar
 2024 11:39:53 +0100
Message-ID: <50ee6122-b160-48ea-8c44-1046b5907d7c@foss.st.com>
Date: Wed, 13 Mar 2024 11:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240307135957.303481-1-christophe.roullier@foss.st.com>
 <20240307135957.303481-3-christophe.roullier@foss.st.com>
 <578f421c-ca06-45d4-8380-8b2b423d4d47@linaro.org>
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <578f421c-ca06-45d4-8380-8b2b423d4d47@linaro.org>
X-Originating-IP: [10.201.21.128]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: net: add new property
 st, ext-phyclk in documentation for stm32
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
Content-Type: multipart/mixed; boundary="===============8720616514526828382=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8720616514526828382==
Content-Type: multipart/alternative;
	boundary="------------0X7J7dDU074IYcmfz0sxjYiU"
Content-Language: en-US

--------------0X7J7dDU074IYcmfz0sxjYiU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/8/24 09:28, Krzysztof Kozlowski wrote:
> On 07/03/2024 14:59, Christophe Roullier wrote:
>> Add property st,ext-phyclk to manage cases when PHY have no cristal/quartz
>> This property can be used with RMII phy without cristal 50Mhz and when we
>> want to select RCC clock instead of ETH_REF_CLK
>> Can be used also with RGMII phy with no cristal and we select RCC clock
>> instead of ETH_CLK125
>>
> Nothing improved here. You say you add new property (wrote it explicitly
> in the subject), but where is it? Where is the user?
>
> I think we talked about this. Rob also asked quite clear:
>
>> That is obvious from the diff. What is not obvious is why we need a new
>> property and what is the problem with the existing ones.
> How did you solve it?

Hi,

I do not understand your questions.

That I would like to do, it is property "st,ext-phyclk" was introduced 
in driver

"drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c" in 2020, and YAML 
was not updated at the time.

Goal of this patch it is to update YAML to avoid dtbs check issue if 
someone use this property :

  dtbs check issue : views/kernel/upstream/net-next/arch/arm/boot/dts/st/stm32mp157c-dk2.dtb:
ethernet@5800a000: Unevaluated properties are not allowed
('st,ext-phyclk' was unexpected)

Regards,

Christophe

>
> Best regards,
> Krzysztof
>
--------------0X7J7dDU074IYcmfz0sxjYiU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/8/24 09:28, Krzysztof Kozlowski
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:578f421c-ca06-45d4-8380-8b2b423d4d47@linaro.org">
      <pre class="moz-quote-pre" wrap="">On 07/03/2024 14:59, Christophe Roullier wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add property st,ext-phyclk to manage cases when PHY have no cristal/quartz
This property can be used with RMII phy without cristal 50Mhz and when we
want to select RCC clock instead of ETH_REF_CLK
Can be used also with RGMII phy with no cristal and we select RCC clock
instead of ETH_CLK125

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Nothing improved here. You say you add new property (wrote it explicitly
in the subject), but where is it? Where is the user?

I think we talked about this. Rob also asked quite clear:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">That is obvious from the diff. What is not obvious is why we need a new
property and what is the problem with the existing ones.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How did you solve it?</pre>
    </blockquote>
    <p>Hi,</p>
    <p>I do not understand your questions.</p>
    <p>That I would like to do, it is property "<span
      style="white-space: pre-wrap">st,ext-phyclk" was introduced in driver </span></p>
    <p><span style="white-space: pre-wrap">"drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c" in 2020, and YAML was not updated at the time.</span></p>
    <p><span style="white-space: pre-wrap">Goal of this patch it is to update YAML to avoid dtbs check issue if someone use this property :</span></p>
    <pre class="moz-quote-pre" wrap=""> dtbs check issue : views/kernel/upstream/net-next/arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: 
ethernet@5800a000: Unevaluated properties are not allowed 
('st,ext-phyclk' was unexpected) </pre>
    <p></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Christophe
</span></p>
    <blockquote type="cite"
      cite="mid:578f421c-ca06-45d4-8380-8b2b423d4d47@linaro.org">
      <pre class="moz-quote-pre" wrap="">

Best regards,
Krzysztof

</pre>
    </blockquote>
  </body>
</html>

--------------0X7J7dDU074IYcmfz0sxjYiU--

--===============8720616514526828382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8720616514526828382==--
