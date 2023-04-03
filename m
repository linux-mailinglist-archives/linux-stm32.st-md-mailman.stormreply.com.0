Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEB96D3E60
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 09:48:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF246C65E70;
	Mon,  3 Apr 2023 07:48:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FBB9C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 07:48:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3336VYA2031952; Mon, 3 Apr 2023 09:48:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lbrDY8Ppljv7KIzDAhEp83EYJqZkiErv5p1W4oG7g5k=;
 b=PM/TjdUTTRv7HcYJYnvyYOweQIo3jLh3k9NJFkAB/TU53eldc3KtqlJn2GA/vcU9x4Hr
 lFX2bQ64LeKl8TT0frZPCFoMUgYmp3uaEDwqkL6JDbP9IGaMONiQbZe5kmvZ9/KdXzNG
 oZfzCJ69+8DyX5+wrFBNb+/ehOkzUqrf2DidTOTGFW4qsk4ZBp8WcMTYBUFwE2eHam3/
 DAen+x9N5TUv2ncdxTG+aCjfzpFRwtvV5fkiabI9EpKDCRizZv9rwfDkIsgfLDpERtgz
 d7oplG72nWe8hzUy12lFw7Ctz1PKmj8ZrNqVnz7nWgHi30CVRLAryy63/4E9aQjkPMhG jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ppbgm11ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 09:48:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3109010002A;
 Mon,  3 Apr 2023 09:48:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AD5B2122F3;
 Mon,  3 Apr 2023 09:48:28 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 3 Apr
 2023 09:48:27 +0200
Message-ID: <509b45f9-b6f1-d6a1-c76f-1047efc2334c@foss.st.com>
Date: Mon, 3 Apr 2023 09:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>
References: <20230323123242.3763673-1-o.rempel@pengutronix.de>
 <1a2d16c8-8c16-5fcc-7906-7b454a81922f@foss.st.com>
 <20230328110247.GE15196@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230328110247.GE15196@pengutronix.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_04,2023-03-31_01,2023-02-09_01
Cc: devicetree@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] ARM: dts: stm32: prtt1c: Add PoDL PSE
	regulator nodes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Oleksij

On 3/28/23 13:02, Oleksij Rempel wrote:
> On Tue, Mar 28, 2023 at 11:58:34AM +0200, Alexandre TORGUE wrote:
>> Hi Oleksij
>>
>> On 3/23/23 13:32, Oleksij Rempel wrote:
>>> This commit introduces Power over Data Line (PoDL) Power Source
>>> Equipment (PSE) regulator nodes to the PRTT1C devicetree. The addition
>>> of these nodes enables support for PoDL in PRTT1C devices, allowing
>>> power delivery and data transmission over a single twisted pair.
>>>
>>> The new PoDL PSE regulator nodes provide voltage capability information
>>> of the current board design, which can be used as a hint for system
>>> administrators when configuring and managing power settings. This
>>> update enhances the versatility and simplifies the power management of
>>> PRTT1C devices while ensuring compatibility with connected Powered
>>> Devices (PDs).
>>>
>>> After applying this patch, the power delivery can be controlled from
>>> user space with a patched [1] ethtool version using the following commands:
>>>     ethtool --set-pse t1l2 podl-pse-admin-control enable
>>> to enable power delivery, and
>>>     ethtool --show-pse t1l2
>>> to display the PoDL PSE settings.
>>>
>>> By integrating PoDL PSE support into the PRTT1C devicetree, users can
>>> benefit from streamlined power and data connections in their
>>> deployments, improving overall system efficiency and reducing cabling
>>> complexity.
>>>
>>> [1] https://lore.kernel.org/all/20230317093024.1051999-1-o.rempel@pengutronix.de/
>>>
>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>> ---
>>
>> Please, fix the introduction of those new yaml validation errors:
>>
>> arch/arm/boot/dts/stm32mp151a-prtt1c.dtb: ethernet-pse-1: $nodename:0:
>> 'ethernet-pse-1' does not match '^ethernet-pse(@.*)?$'
>>          From schema:
>> /Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml
>> arch/arm/boot/dts/stm32mp151a-prtt1c.dtb: ethernet-pse-2: $nodename:0:
>> 'ethernet-pse-2' does not match '^ethernet-pse(@.*)?$'
>>          From schema: /local/home/frq08678/STLINUX/kernel/my-kernel/stm32/Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml
> 
> Using ethernet-pse@1 will require to use "reg" or "ranges" properties.
> Which makes no sense in this use case. I need to fix the schema instead by
> allowing this patter with following regex: "^ethernet-pse(@.*|-[0-9a-f])*$"
> 
> Should I send schema fix together with this patch?

Yes you can. As soon as Rob or Krzysztof review it I'll apply both on 
stm32-next.

Thanks
Alex




> Regards,
> Oleksij

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
