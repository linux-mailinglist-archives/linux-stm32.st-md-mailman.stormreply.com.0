Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284319A8DE
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 11:49:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D69BBC36B0B;
	Wed,  1 Apr 2020 09:49:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F188C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 09:49:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0319mro0030891; Wed, 1 Apr 2020 11:49:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=OxCsrs2Z8qSU8tHehwSe7HoIcLyBN+97Ma4z/koHBpE=;
 b=eZuZ711drjOuybzFjIgHBZxOpy1+oiZZWsV08Kw97SXpl5T1y59RSAP0rXaRynfTDo6C
 MCixDvNSB203SM5+C3lUR/DqYpop6a1B2C7yt1QZuk2TD9LA51YpLUIrH1+m8mQypUD0
 TzzKCJ3rrOdG6AUrFalKNwnxx1nV1ZRkIdJtF9eToz6JI7oGow8THwu8uX+K4I15L0zC
 vmpbdbdYIch0ctS1W+Slom3NME3ialPrLpoG0nVyOOkx9e8B6iT9uIO44VGctA+5Jb9U
 R6V/PfrNlz3SHTXQEIneeotGFHrrx/kJrWMODGOZdtXG/BuXJbJIxDXE/AuUMPPSsthV kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbmmapq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 11:49:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 142F9100034;
 Wed,  1 Apr 2020 11:49:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 05D5821F684;
 Wed,  1 Apr 2020 11:49:20 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr
 2020 11:49:16 +0200
To: Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
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
 <9fb131ad-552e-61ad-75c2-5ebec501f356@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <9ec743e5-5141-017b-eb11-4986c0ab4af8@st.com>
Date: Wed, 1 Apr 2020 11:49:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9fb131ad-552e-61ad-75c2-5ebec501f356@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 3/31/20 6:44 PM, Marek Vasut wrote:
> On 3/31/20 6:39 PM, Alexandre Torgue wrote:
> 
> Hi,
> 
> [...]
> 
>>>> I agree, and I prefer to keep pins groups definition in
>>>> stm32mp15-pinctrl.dtsi file. IMO, it is easier for users to find them in
>>>> only one file. Actually, I already had this discussions with some guys
>>>> "where pins groups have to be defined ?". For me (and maybe only for
>>>> me), muxing is SOC dependent, I mean SoC provides a bunch a possible
>>>> pinmux for each IPs. If we got enough memory spaces (and time to waste
>>>> also) we could define all possible pinmux (AFx....) for each devices and
>>>> let board users chose the good one (using stm32mp15-pictrl.dtsi as a
>>>> database). In board file, you select one possible pin configuration
>>>> (provided by the SoC) for your device according to your schematic.
>>>> However you could append pin groups in board file to update bias,
>>>> slewrate ...
>>>> If your concern it to embed a bunch of not used pin configuration for a
>>>> board, we could use /omit-if-no-ref/ tag on pin groups.
>>>
>>> Can we instead define pinmux the way e.g. iMX6 does , as separate pins ,
>>> instead of pinmux groups ?
>>>
>>
>> Sorry but what would the advantage to do so ?
> 
> You'd have per-board pinmux which would be perfect fit for that board,
> without potentially affecting other boards with changes, without hacking
> various things like drive-strengths in board files, and without having
> the combinatorial explosion of the current single pinmux file.
> 

It is something that we could analysis. Let's follow the way we 
currently use. I'll let u know, when I have a better view on your 
proposition.

thanks
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
