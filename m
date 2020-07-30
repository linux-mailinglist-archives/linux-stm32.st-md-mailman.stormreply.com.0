Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD29233B92
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 00:49:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72439C36B36;
	Thu, 30 Jul 2020 22:49:45 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F79DC36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jul 2020 22:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zIBbAfaKyv0a8khPFENs9bkRVRW75g282kFb88ll0RE=; b=yMlsUfviYgQGqrsCcQwvQ+E9+4
 n4HKPHVxV3jzQ0oWcZAvtI+PY5km7eQGTZuzRA+5HkyL3yRKEHfiB66jyo5qY/YRP4HQzz/bszsyx
 Vts7C81XDbxzeLVlXwom6UzAcjLyuwI9G5Ea6LNcZflptu7rpAUOzeSl0Icuz7PcsMCBpDF+sKey6
 Jr8XysA3pCKftO59vuP+H+1BDP4xx8gYeJDPC7/sJkSX2YPRW/S5umktLVAvBDGdw+QXbLUfWr0WX
 MDFEQBcVcSTqMtPZ/ING/CB1LVxJPdlHg/SvDtc6eOCZ+yeL+Ghku7zua54tD4t+znNRxeX8OgtmW
 8b2McVaQ==;
Received: from [2600:1700:4830:165f::19e] (port=45352)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1k1HMq-0000Lv-I2; Thu, 30 Jul 2020 18:49:40 -0400
From: David Lechner <david@lechnology.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1595358237.git.vilhelm.gray@gmail.com>
 <08b3ac7349a59ba7fa5cd438bbe78360842ccd11.1595358237.git.vilhelm.gray@gmail.com>
 <415ee9ad-255e-cee7-22a6-ffa977999691@lechnology.com>
Message-ID: <a287770b-c263-f1db-bcc4-d901d3ff3c7c@lechnology.com>
Date: Thu, 30 Jul 2020 17:49:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <415ee9ad-255e-cee7-22a6-ffa977999691@lechnology.com>
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
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/5] counter: Add character device
	interface
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

On 7/28/20 7:20 PM, David Lechner wrote:
> On 7/21/20 2:35 PM, William Breathitt Gray wrote:
>> This patch introduces a character device interface for the Counter
>> subsystem. Device data is exposed through standard character device read
>> operations. Device data is gathered when a Counter event is pushed by
>> the respective Counter device driver. Configuration is handled via ioctl
>> operations on the respective Counter character device node.
> 
> This sounds similar to triggers and buffers in the iio subsystem. And
> I can see how it might be useful in some cases. But I think it would not
> give the desired results when performance is important.
> 

By the way, I really appreciate the work you have done here. When reviewing
code, it is easy to point out what is wrong or we don't like and to not
mention all the parts that are good. And there is a lot of really good work
here already.

I've been working on this all week to try out some of my suggestions and
I'm not getting very far. This is a very difficult problem to solve!

I just wanted to mention this since I responded to this patch series
already but I am still learning and trying things. So I may have more/
different feedback in the future and I may decide some of my suggestions
are not so good. :-)

And one more thing, there was a nice talk at the Embedded Linux
Conference last month about lessons learned from designing a userspace
API for the GPIO subsystem [1]. Unfortunately, there is no video yet,
but the slides might have some helpful ideas about mistakes to avoid.

[1]: https://elinux.org/ELC_2020_Presentations

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
