Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64E3A2DE8
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 16:18:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82B4BC58D5B;
	Thu, 10 Jun 2021 14:18:53 +0000 (UTC)
Received: from out28-2.mail.aliyun.com (out28-2.mail.aliyun.com [115.124.28.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13BA9C57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:18:50 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08379667|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0470596-0.0093023-0.943638;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KQX-2FQ_1623334723; 
Received: from 192.168.101.16(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KQX-2FQ_1623334723)
 by smtp.aliyun-inc.com(10.147.42.198);
 Thu, 10 Jun 2021 22:18:44 +0800
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
To: Andrew Lunn <andrew@lunn.ch>
References: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623260110-25842-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YMGEutCet7fP1NZ9@lunn.ch>
 <405696cb-5987-0e56-87f8-5a1443eadc19@wanyeetech.com>
 <YMICTvjyEAgPMH9u@lunn.ch>
 <346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com>
Message-ID: <12f35415-532e-5514-bc97-683fb9655091@wanyeetech.com>
Date: Thu, 10 Jun 2021 22:18:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com>
Content-Language: en-US
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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
Content-Type: multipart/mixed; boundary="===============4611651240194933837=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============4611651240194933837==
Content-Type: multipart/alternative;
 boundary="------------CE0AFE0F9F3E7EE22ABC6465"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CE0AFE0F9F3E7EE22ABC6465
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 2021/6/10 下午8:27, Zhou Yanjie wrote:
>
> Hi Andrew,
>
> On 2021/6/10 下午8:15, Andrew Lunn wrote:
>>> The manual does not tell how much ps a unit is.
>>>
>>> I am confirming with Ingenic, but there is no reply
>>>
>>> at the moment. Can we follow Rockchip's approach?
>>>
>>> According to the description in "rockchip-dwmac.yaml"
>>>
>>> and the related code in "dwmac-rk.c", it seems that their
>>>
>>> delay parameter seems to be the value used by the hardware
>>>
>>> directly instead of ps.
>> We are much more strict about this now than before. You have to use
>> standard units and convert to hardware values. It also makes it a lot
>> easier for DT writers, if they have an idea what the units mean.
>>
>> Having the MAC add small delays is something you can add later,
>> without breaking backwards compatibility. So if you cannot determine
>> what the units are now, just submit the glue driver without support
>> for this feature. If anybody really needs it, they can do the needed
>> research, maybe do some measurements, and then add the code.
>
>
> *I did an experiment, when the tx delay is not set, RGMII works a
> *
>
> *little abnormally. It seems I have to wait for Ingenic's reply...*
>

Here is Ingenic's reply, the time length corresponding to a unit is 
19.5ps (19500fs).


>
>>      Andrew

--------------CE0AFE0F9F3E7EE22ABC6465
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Andrew,<br>
    </p>
    <div class="moz-cite-prefix">On 2021/6/10 下午8:27, Zhou Yanjie wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hi Andrew,<br>
      </p>
      <div class="moz-cite-prefix">On 2021/6/10 下午8:15, Andrew Lunn
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:YMICTvjyEAgPMH9u@lunn.ch">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The manual does not tell how much ps a unit is.

I am confirming with Ingenic, but there is no reply

at the moment. Can we follow Rockchip's approach?

According to the description in "rockchip-dwmac.yaml"

and the related code in "dwmac-rk.c", it seems that their

delay parameter seems to be the value used by the hardware

directly instead of ps.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">We are much more strict about this now than before. You have to use
standard units and convert to hardware values. It also makes it a lot
easier for DT writers, if they have an idea what the units mean.

Having the MAC add small delays is something you can add later,
without breaking backwards compatibility. So if you cannot determine
what the units are now, just submit the glue driver without support
for this feature. If anybody really needs it, they can do the needed
research, maybe do some measurements, and then add the code.</pre>
      </blockquote>
      <p><br>
      </p>
      <p><b>I did an experiment, when the tx delay is not set, RGMII
          works a <br>
        </b></p>
      <p><b>little abnormally. It seems I have to wait for Ingenic's
          reply...</b><br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Here is Ingenic's reply, the time length corresponding to a unit
      is 19.5ps (19500fs).<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com">
      <p> </p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:YMICTvjyEAgPMH9u@lunn.ch">
        <pre class="moz-quote-pre" wrap="">    Andrew
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------CE0AFE0F9F3E7EE22ABC6465--

--===============4611651240194933837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4611651240194933837==--
