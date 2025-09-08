Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F084AB49A1A
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Sep 2025 21:39:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CDCBC3F95F;
	Mon,  8 Sep 2025 19:39:41 +0000 (UTC)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B044BC3F95B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Sep 2025 19:39:39 +0000 (UTC)
Received: from [192.168.2.102] (213.87.154.55) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 8 Sep
 2025 22:39:36 +0300
Message-ID: <877641ca-aadb-4510-9ed7-cc23cf666653@omp.ru>
Date: Mon, 8 Sep 2025 22:39:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
 <c3183a23-21da-435d-b599-7003ae7ba79b@lunn.ch>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <c3183a23-21da-435d-b599-7003ae7ba79b@lunn.ch>
X-Originating-IP: [213.87.154.55]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/08/2025 18:59:50
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196103 [Sep 08 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1; 127.0.0.199:7.1.2; www.kernel.org:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.154.55
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/08/2025 19:03:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/8/2025 5:23:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
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

On 9/8/25 7:47 PM, Andrew Lunn wrote:

>> In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
>> and if stmmac_config_sub_second_increment() fails to set it to some non-0
>> value, the following div_u64() call would cause a kernel oops (because of
>> the divide error exception).  Let's check sec_inc for 0 before dividing by
>> it and just return -EINVAL if so...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Fixes: df103170854e ("net: stmmac: Avoid sometimes uninitialized Clang warnings")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>> The patch is against the master branch of Linus Torvalds' linux.git repo.
> 
> Wrong tree. Please see:
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

   Well, formerly being a reviewer for the Renesas drivers (before Greg KH
threw me out of MAINTAINERS last year), I kinda know this! :-)
   The real problem is that I've lost the ability to pull from git.kernel.org
(first using git:// protocol and later using https:// as well)... Sometimes
the ability used to return (along with Facebook/LinkedIn -- which are actually
blocked in .ru) but that hasn't happened for more than a week now. I can now
pull from Linus' tree at github. I strongly suspect some interaction between
the .ru blocking and the Anubis program that is now used on git.kernel.org --
I've also lost access to lore.kernel.org (sometimes it works -- but not now)
and also elixir.bootlin.com, both of which seem to use the darn Anubis as
well... :-(

> This also needs reviewing by somebody who know the STMMAC
> hardware. There is a comment:
> 
> 	/* For GMAC3.x, 4.x versions, in "fine adjustement mode" set sub-second
                                               ^ Look, a typo! :-)

> 	 * increment to twice the number of nanoseconds of a clock cycle.
> 	 * The calculation of the default_addend value by the caller will set it
> 	 * to mid-range = 2^31 when the remainder of this division is zero,
> 	 * which will make the accumulator overflow once every 2 ptp_clock
> 	 * cycles, adding twice the number of nanoseconds of a clock cycle :
> 	 * 2000000000ULL / ptp_clock.
> 
> So i'm wondering if the subsecond adjustment is sufficient, the
> sec_inc might be zero, and rather than returning an error, the
> hardware just needs programming differently?

   Sorry, I don't readily see how the data var in config_sub_second_increment()
can wrap to 0. I agree that a look of a more knowledgeable person would be good
though... :-)

>     Andrew

[...]

MBR, Sergey

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
