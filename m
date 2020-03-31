Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B98199BF8
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 18:45:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E63DCC36B0B;
	Tue, 31 Mar 2020 16:45:03 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4518EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:45:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sFYS5J9Nz1rqRR;
 Tue, 31 Mar 2020 18:45:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sFYS4R8qz1qqkQ;
 Tue, 31 Mar 2020 18:45:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 6hgpObiLdNkB; Tue, 31 Mar 2020 18:44:59 +0200 (CEST)
X-Auth-Info: psRQkpEs988+okZlJyNRpw83Kb11sIX32mkOCebJUTA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 31 Mar 2020 18:44:59 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20200328171144.51888-1-marex@denx.de>
 <20200328171144.51888-8-marex@denx.de>
 <0fb89d25-feb0-2eb0-9e83-d7f8c76f8b9e@st.com>
 <82dcf412-119b-0de2-0c50-f6877a82a812@pengutronix.de>
 <fcf49298-a36c-e80e-e62b-1fb9c07f0d6e@denx.de>
 <310aa3a3-09ce-42ef-d1ea-b653163d1d72@pengutronix.de>
 <97d13a84-8220-aa7f-3ee6-df474cca3882@denx.de>
 <43e88a1b-f3e4-df1d-38a6-0bb281a2f786@st.com>
 <871a5cc2-615d-b9e5-0eed-9a5a38be4f6c@denx.de>
 <69bce6d4-129e-b9ea-8fa6-f33d9047e3c3@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <9fb131ad-552e-61ad-75c2-5ebec501f356@denx.de>
Date: Tue, 31 Mar 2020 18:44:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <69bce6d4-129e-b9ea-8fa6-f33d9047e3c3@st.com>
Content-Language: en-US
Cc: Patrick DELAUNAY <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 07/22] ARM: dts: stm32: Add alternate
 pinmux for SDMMC2 pins 4-7
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

On 3/31/20 6:39 PM, Alexandre Torgue wrote:

Hi,

[...]

>>> I agree, and I prefer to keep pins groups definition in
>>> stm32mp15-pinctrl.dtsi file. IMO, it is easier for users to find them in
>>> only one file. Actually, I already had this discussions with some guys
>>> "where pins groups have to be defined ?". For me (and maybe only for
>>> me), muxing is SOC dependent, I mean SoC provides a bunch a possible
>>> pinmux for each IPs. If we got enough memory spaces (and time to waste
>>> also) we could define all possible pinmux (AFx....) for each devices and
>>> let board users chose the good one (using stm32mp15-pictrl.dtsi as a
>>> database). In board file, you select one possible pin configuration
>>> (provided by the SoC) for your device according to your schematic.
>>> However you could append pin groups in board file to update bias,
>>> slewrate ...
>>> If your concern it to embed a bunch of not used pin configuration for a
>>> board, we could use /omit-if-no-ref/ tag on pin groups.
>>
>> Can we instead define pinmux the way e.g. iMX6 does , as separate pins ,
>> instead of pinmux groups ?
>>
> 
> Sorry but what would the advantage to do so ?

You'd have per-board pinmux which would be perfect fit for that board,
without potentially affecting other boards with changes, without hacking
various things like drive-strengths in board files, and without having
the combinatorial explosion of the current single pinmux file.

-- 
Best regards,
Marek Vasut
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
