Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280B28BE9B
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Oct 2020 19:04:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C3ADC3FAD5;
	Mon, 12 Oct 2020 17:04:19 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D7E4C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 17:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zJY3Dr6AnVYzWq6bCyK4S4rlKOnb0m8nFs+n4rj0aqA=; b=k/NrFvl5XJsTY+RGXOx8Q7rgV5
 6WNNASc5T2nH77d9p4WJ5StsyyoafuyjaX7OIUA/cx9AzZCWgCRdBuECQRkacLzZujA1K1NtbFU9c
 KT8ra/6X+hfinxyRa8siQlResVDcawWPR3ET4bVDjn+XY2LOmvomALeWmTn4JL19k/gC+3IkGygGh
 WGAyhJUf0R5CDBejIe3Sr7wUWTQl8qhMG11CkFDMgw3zPBV8NQ1L+CdhHkXbHHuBBNBLcUxWHtbMt
 Q02yv7CcfFESjhKZTjKfgLviYlVIbGFNkkQZefNDtOBRrc2s4OMTLDJxaB1PKao2OkQWTGL3nL+ME
 t4YRc7kQ==;
Received: from [2600:1700:4830:165f::19e] (port=46758)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kS1F6-00009H-9o; Mon, 12 Oct 2020 13:04:12 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>,
 Pavel Machek <pavel@ucw.cz>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <54190f9875b81b6aa5483a7710b084053a44abb8.1601170670.git.vilhelm.gray@gmail.com>
 <20201008080909.GA31561@amd> <20201008122845.GA3314@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <d06d5e47-5776-85ee-0dc5-8b624e36d83d@lechnology.com>
Date: Mon, 12 Oct 2020 12:04:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008122845.GA3314@shinobu>
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
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 4/5] docs: counter: Document character
	device interface
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

On 10/8/20 7:28 AM, William Breathitt Gray wrote:
> On Thu, Oct 08, 2020 at 10:09:09AM +0200, Pavel Machek wrote:
>> Hi!
>>
>>> +        int main(void)
>>> +        {
>>> +                struct pollfd pfd = { .events = POLLIN };
>>> +                struct counter_event event_data[2];
>>> +
>>> +                pfd.fd = open("/dev/counter0", O_RDWR);
>>> +
>>> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches);
>>> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches + 1);
>>> +                ioctl(pfd.fd, COUNTER_LOAD_WATCHES_IOCTL);
>>> +
>>> +                for (;;) {
>>> +                        poll(&pfd, 1, -1);
>>
>> Why do poll, when you are doing blocking read?
>>
>>> +                        read(pfd.fd, event_data,  sizeof(event_data));
>>
>> Does your new chrdev always guarantee returning complete buffer?
>>
>> If so, should it behave like that?
>>
>> Best regards,
>> 									Pavel
>> -- 
>> (english) http://www.livejournal.com/~pavelmachek
>> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
> I suppose you're right: a poll() should be redundant now with this
> version of the character device implementation because buffers will
> always return complete; so a blocking read() should achieve the same
> behavior that a poll() with read() would.
> 
> I'll give some more time for additional feedback to come in for this
> version of the patchset, and then likely remove support for poll() in
> the v6 submission.
> 
> William Breathitt Gray
> 

I hope that you mean that you will just remove it from the example
and not from the chardev. Otherwise it won't be possible to
integrate this with an event loop.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
