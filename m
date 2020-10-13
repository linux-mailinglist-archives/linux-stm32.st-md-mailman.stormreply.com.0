Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC828D43C
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Oct 2020 21:08:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2185C3FADE;
	Tue, 13 Oct 2020 19:08:54 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FB8CC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jZT/uATnG2o72Hv+NB/ghQjoMMH5tGI4CdsZ0nvbYXk=; b=kTfO6894m4jP1mJIN/flhtoo/a
 g1XiQfEPqz80vbKG6Ek+ynL5NI+k2zab9L+m8isH4nWfGnfXzd1KDmtpQKzFX8Acl+xH8BYq5i9yW
 lgf6u9u9o1EhfQBL89Ysofjg/8Q9a0P+obRGTgPbKEJPkD5KswaytWNV6uppa+cEaSND3zWnWsGRT
 vYzUvOwI9NcxfPHNqYMEF8BEKRPb79I1MWzDmSudVLkNA5aHpfn5VNemgra9u2omslowqwLxsyWp9
 wf2QDnIFcu5sI7dU764T4K1bRqqPoAHZ4X9CdfclQzFkEtvSquFuchm8/OA8LiIKI3HiSp9B5183C
 gpGLHsog==;
Received: from [2600:1700:4830:165f::19e] (port=47662)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kSPfD-0001IG-Hd; Tue, 13 Oct 2020 15:08:47 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <54190f9875b81b6aa5483a7710b084053a44abb8.1601170670.git.vilhelm.gray@gmail.com>
 <20201008080909.GA31561@amd> <20201008122845.GA3314@shinobu>
 <d06d5e47-5776-85ee-0dc5-8b624e36d83d@lechnology.com>
 <20201013185851.GB32722@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <09949c56-19da-1937-418b-99a1a9260c4c@lechnology.com>
Date: Tue, 13 Oct 2020 14:08:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013185851.GB32722@shinobu>
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
 linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
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

On 10/13/20 1:58 PM, William Breathitt Gray wrote:
> On Mon, Oct 12, 2020 at 12:04:10PM -0500, David Lechner wrote:
>> On 10/8/20 7:28 AM, William Breathitt Gray wrote:
>>> On Thu, Oct 08, 2020 at 10:09:09AM +0200, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>> +        int main(void)
>>>>> +        {
>>>>> +                struct pollfd pfd = { .events = POLLIN };
>>>>> +                struct counter_event event_data[2];
>>>>> +
>>>>> +                pfd.fd = open("/dev/counter0", O_RDWR);
>>>>> +
>>>>> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches);
>>>>> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches + 1);
>>>>> +                ioctl(pfd.fd, COUNTER_LOAD_WATCHES_IOCTL);
>>>>> +
>>>>> +                for (;;) {
>>>>> +                        poll(&pfd, 1, -1);
>>>>
>>>> Why do poll, when you are doing blocking read?
>>>>
>>>>> +                        read(pfd.fd, event_data,  sizeof(event_data));
>>>>
>>>> Does your new chrdev always guarantee returning complete buffer?
>>>>
>>>> If so, should it behave like that?
>>>>
>>>> Best regards,
>>>> 									Pavel
>>>> -- 
>>>> (english) http://www.livejournal.com/~pavelmachek
>>>> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>>>
>>> I suppose you're right: a poll() should be redundant now with this
>>> version of the character device implementation because buffers will
>>> always return complete; so a blocking read() should achieve the same
>>> behavior that a poll() with read() would.
>>>
>>> I'll give some more time for additional feedback to come in for this
>>> version of the patchset, and then likely remove support for poll() in
>>> the v6 submission.
>>>
>>> William Breathitt Gray
>>>
>>
>> I hope that you mean that you will just remove it from the example
>> and not from the chardev. Otherwise it won't be possible to
>> integrate this with an event loop.
> 
> Would you elaborate a bit further on this? My thought process is that
> because users must set the Counter Events they want to watch, and only
> those Counter Events show up in the character device node, a blocking
> read() would effectively behave the same as poll() with read(); if none
> of the Counter Events occur, the read() just blocks until one does, thus
> making the use of a poll() call redundant.
> 
> William Breathitt Gray
> 

If the counter device was the only file descriptor being read, then yes
it wouldn't matter. But if we are using this in combination with other
file descriptors, then it is common to poll all of the file descriptors
using a single syscall to see which one is ready to read rather than
doing a non-blocking read on all of the file descriptors, which would
result in many unnecessary syscalls.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
