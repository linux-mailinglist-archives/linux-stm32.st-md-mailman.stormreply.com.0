Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D447C136
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Dec 2021 15:12:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0AF1C5E2D4;
	Tue, 21 Dec 2021 14:12:22 +0000 (UTC)
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC355C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 14:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=8p7ecK45hVMn5gLDPgo9VsNqGb2KdV/HRhC09pdrmXQ=; b=auQvbmMR1lTu3+4B8lLJSfCCri
 jztKfEm+WOTER+y7KhwgBnlpRm2QYYXRlqr1SkrvZ7TFaZILqUl3Gokrjj/L1yjQUkWvGTCT5rhkw
 NMugzh36V7+wYIIucohNF+O22YE2RZkk2RZB+vd3A648gPXQSNwZw1+6ZTE+g2+EIsVQaEKlL8s7A
 3BDXMLIcpaEgLntQPQBqGN0bd7kDy9RZnkOvlpS2XQ0g28xywVGyudp9lxDjQnPrTlpKGl1B9QAAy
 iPd7Rr3ZbwWkZf1201pumlFkbn5Hqx5rY1TjHZK7mYNsX3OfullOvzRDiUIzepbsNY8PxlmAIa/gV
 QiVKHiCA==;
Received: from [78.46.152.42] (helo=sslproxy04.your-server.de)
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mzfs7-000CA8-6D; Tue, 21 Dec 2021 15:12:07 +0100
Received: from [2001:a61:2bc8:8501:9e5c:8eff:fe01:8578]
 by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mzfs6-000PVb-PF; Tue, 21 Dec 2021 15:12:06 +0100
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20211221104546.214066-1-u.kleine-koenig@pengutronix.de>
 <dadb79b2-ac21-1899-48b9-1c6723afb1b4@metafoo.de>
 <20211221113542.rl4aburbzzrgs3km@pengutronix.de>
 <65009237-7e61-21aa-60cd-b7f7e0bb2f91@metafoo.de>
 <20211221132258.472t537373vto7bz@pengutronix.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <9d5788ab-4576-08c3-e347-9348aba3804a@metafoo.de>
Date: Tue, 21 Dec 2021 15:12:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221132258.472t537373vto7bz@pengutronix.de>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26395/Tue Dec 21 10:18:41 2021)
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, linux-kernel@vger.kernel.org,
 David Lechner <david@lechnology.com>, linux-iio@vger.kernel.org,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/8] counter: Remove struct
	counter_device::priv
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/21/21 2:22 PM, Uwe Kleine-K=F6nig wrote:
> On Tue, Dec 21, 2021 at 01:04:50PM +0100, Lars-Peter Clausen wrote:
>> On 12/21/21 12:35 PM, Uwe Kleine-K=F6nig wrote:
>>> On Tue, Dec 21, 2021 at 12:12:12PM +0100, Lars-Peter Clausen wrote:
>>>> On 12/21/21 11:45 AM, Uwe Kleine-K=F6nig wrote:
>>>>> similar to patch
>>>>> https://lore.kernel.org/r/4bde7cbd9e43a5909208102094444219d3154466.16=
40072891.git.vilhelm.gray@gmail.com
>>>>> the usage of struct counter_device::priv can be replaced by
>>>>> container_of which improves type safety and code size.
>>>>>
>>>>> This series depends on above patch, converts the remaining drivers and
>>>>> finally drops struct counter_device::priv.
>>>> Not sure if this is such a good idea. struct counter_device should not=
 be
>>>> embedded in the drivers state struct in the first place.
>>> Just to mention it: My patch series didn't change this, this was already
>>> broken before.
>> I know, but this series has to be reverted when the framework is fixed.
> All drivers have to be touched. With my patch series you have to modify
> one function in each driver, without my patch you have touch nearly
> every function.
>
I'm not so sure. I don't see how you have to modify every function. =

You'd keep using priv to get a pointer to the state struct.

That said having a centralized function in each driver to get the state =

struct from the counter device doesn't hurt either.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
