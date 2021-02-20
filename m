Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EBC320650
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Feb 2021 17:56:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30BB5C5719E;
	Sat, 20 Feb 2021 16:56:21 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EA10C5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Feb 2021 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtReqm6BD8NSkzJ0Wi5T2+JHymMgDP+iJZyHo3wdEQ8=; b=N/oMDpnItwRnMQX8p1llCL4Lb5
 06fFrczrCxCE0UVxM67Cpgzfm9bDaxCs/PeleokcZqpp/AJbQd9UcecaK+k4FSk1ueB/Kv2/pZ+M5
 YjP3TiteYL8vMp0T0ACnOcQZwVlRX532BRWG4AGis9yIJj6n2QCuYKSzF5f9cZwP3TvVVIF7kz57S
 5qwMOfBCnZj1ZcQVTl11zWp7H7lUKXojAKJ0YdzrBaC4nkogK5ofzR3A4o7/39CqPuNagNnPweLYQ
 3mSmIcP80Psuxe7AuKTzSL7JwtQx2AneZr+s0sj98qFvTJw2MwqisFZ40Ee+3HwIrK9mhzwNGyazD
 ODr55F3A==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:57830 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1lDVYE-0005DO-Qy; Sat, 20 Feb 2021 11:56:14 -0500
To: Jonathan Cameron <jic23@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <355aaaaf44b36c5de1704e4074a4671abcb9699d.1613131238.git.vilhelm.gray@gmail.com>
 <20210214171340.3cc7b686@archlinux>
From: David Lechner <david@lechnology.com>
Message-ID: <2b6913ac-0802-f83e-06ba-e89d5318dbd7@lechnology.com>
Date: Sat, 20 Feb 2021 10:56:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214171340.3cc7b686@archlinux>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 12/22] counter: Rename
 counter_count_function to counter_function
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

On 2/14/21 11:13 AM, Jonathan Cameron wrote:
> On Fri, 12 Feb 2021 21:13:36 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> 
>> The phrase "Counter Count function" is verbose and unintentionally
>> implies that function is a Count extension. This patch adjusts the
>> Counter subsystem code to use the more direct "Counter function" phrase
>> to make the intent of this code clearer. The phrase "Count action" is
>> adjusted herein as well for the same reason.
>>
>> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
>> Cc: Patrick Havelange <patrick.havelange@essensium.com>
>> Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
>> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Alexandre Torgue <alexandre.torgue@st.com>
>> Cc: David Lechner <david@lechnology.com>
>> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> 
> I agree this makes sense in the counter core code, but in the drivers
> it may not be quite so obvious we are talking about a counter function
> given some of the bits of hardware do a number of other things.
> 
> I guess up to the various driver maintainers on whether they
> think the new meaning is clear enough!
> 
> Jonathan
> 

TBH, I think "counter count function" makes more sense to me.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
