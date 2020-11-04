Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9DD2A6410
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 13:18:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECF2BC36B36;
	Wed,  4 Nov 2020 12:18:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3720FC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 12:18:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CR5KF4PTTz1rx7x;
 Wed,  4 Nov 2020 13:18:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CR5KF3jN6z1qwlt;
 Wed,  4 Nov 2020 13:18:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Ddud1IjY7Ag2; Wed,  4 Nov 2020 13:18:24 +0100 (CET)
X-Auth-Info: iz22D2P82SeEHif6O+Sg62D/0/T5JIa05I5brADu+VA=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  4 Nov 2020 13:18:24 +0100 (CET)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
References: <20201103181137.443586-1-marex@denx.de>
 <3803c9f1-3a4a-6316-a8c8-9d543ae1fe89@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <24d6fe1f-c43a-fcb9-cfdf-5da0475fb6f6@denx.de>
Date: Wed, 4 Nov 2020 13:18:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <3803c9f1-3a4a-6316-a8c8-9d543ae1fe89@pengutronix.de>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add DHCOM based PicoITX
 board
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

On 11/4/20 11:53 AM, Ahmad Fatoum wrote:
> Hello Marek,

Hi,

[...]

>> +#include "stm32mp157.dtsi"
>> +#include "stm32mp15xc.dtsi"
>> +#include "stm32mp15xx-dhcom-som.dtsi"
>> +#include "stm32mp15xx-dhcom-picoitx.dtsi"
>> +
>> +/ {
>> +	model = "DH electronics STM32MP157C DHCOM PicoITX";
>> +	compatible = "dh,stm32mp157c-dhcom-picoitx", "dh,stm32mp157c-dhcom-som",
>> +		     "st,stm32mp157";
> 
> Is there a separate dt-bindings patch documenting these new compatibles?

Which ones ? The dh is in vendor-prefixes.yaml .

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
