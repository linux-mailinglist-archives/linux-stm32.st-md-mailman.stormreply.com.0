Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0375028D
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 11:12:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4072EC6B459;
	Wed, 12 Jul 2023 09:12:11 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1F97C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=aQra3Uq/mkNc3te3ij718BXDMrPqbP8wZ5ecEv6aL4k=; 
 b=SIGrgma6Kq5y2QQwAagG/1vXkByFdmBj98YZy8r2KaSM66jDgH/fKCNjxzQfoMxyg1EKK2zLFbs
 7GQQiTnRXBzRY4oIbnTbUDxo0D9AeK5M32rjCgxg2gpywg6EQqYT401JRObGezIWEJY4md1kyaD3f
 B/nxt8uwDa/qSBY7OXUHkIU2c+HI4R64MVqh80oJywklq7ToWne4JxWuzNvb2qYxDb43PKjQPt236
 +dG1H3ZeLU/g9+1K0IDhEmosWD3olRaD8RuTQnttK8gQ+2/LP/u8FtdKD2m4IGB6yqyEQAG2+Tat2
 ZLN3A3MQ/EZqIZB8P3VQOFSNy3NsAToBtBJQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qJVtF-000EK2-De; Wed, 12 Jul 2023 11:12:05 +0200
Received: from [2a06:4004:10df:0:6cc7:3173:9f32:f330] (helo=smtpclient.apple)
 by sslproxy02.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qJVtE-00048P-N4; Wed, 12 Jul 2023 11:12:04 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <92f7f4cd-c9cc-8a1a-74c7-39eed955cd6a@pengutronix.de>
Date: Wed, 12 Jul 2023 11:11:53 +0200
Message-Id: <92C36A18-F359-497E-8267-03E5C62811F6@geanix.com>
References: <20230712062954.2194505-1-sean@geanix.com>
 <20230712062954.2194505-7-sean@geanix.com>
 <92f7f4cd-c9cc-8a1a-74c7-39eed955cd6a@pengutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26967/Wed Jul 12 09:28:32 2023)
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, dantuguf14105@gmail.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 7/8] dt-bindings: arm: stm32: add extra
 SiP compatible for oct, stm32mp157c-osd32-red
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



> On 12 Jul 2023, at 10.38, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
> Hello Sean,
> 
> On 12.07.23 08:29, Sean Nyekjaer wrote:
>> Add binding support for the Octavo OSD32MP1-RED development board.
>> 
>> General features:
>> - STM32MP157C
>> - 512MB DDR3
>> - CAN-FD
>> - HDMI
>> - USB-C OTG
>> - UART
>> 
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Just a heads up: The LXA TAC, another OSD32MP1 board has been merged into
> stm32-next yesterday, so applying your series onto that tree may result
> in conflicts. You may want to rebase for v4.
> 
> Cheers,
> Ahmad

Thanks, will do :)

Can I get you to look at 4/8, 5/8 and 6/8 in this series? Will they break anything for LXA TAC?

/Sean

> 
> 
>> ---
>> Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>> index 13e34241145b..55e45db1af26 100644
>> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>> @@ -143,7 +143,8 @@ properties:
>>       - description: Octavo OSD32MP15x System-in-Package based boards
>>         items:
>>           - enum:
>> -              - lxa,stm32mp157c-mc1 # Linux Automation MC-1
>> +              - lxa,stm32mp157c-mc1       # Linux Automation MC-1
>> +              - oct,stm32mp157c-osd32-red # Octavo OSD32MP1 RED board
>>           - const: oct,stm32mp15xx-osd32
>>           - enum:
>>               - st,stm32mp157
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
