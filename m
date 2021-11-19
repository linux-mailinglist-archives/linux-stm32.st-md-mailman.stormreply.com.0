Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A7457136
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Nov 2021 15:53:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD9FCC5EC6B;
	Fri, 19 Nov 2021 14:53:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE4CCC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 14:53:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5937615E2;
 Fri, 19 Nov 2021 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637333623;
 bh=zm47Q8trJHAuUeBklzQpMUYVcMUm+1qCiv/Awmv/gQM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nqAZS4jW3TtMRGrIe53j+VFXRL349hQnkPB0dGe/x2IvkbaQg9w7gWYnyQqKYYTkl
 ygUqMEQ5fxjKuZQs4wur/aBY5vAXA4/mbkOQZqpVhBazw+DEu1JCVZHNGpjfKMp2bj
 ZshuduJo9DjtOxDHSIZZ531Af4yhDo6QHybMgS6RqLr+8za3WNTDvcLDu0VzmRXlZO
 G66kal4D+EJH9P4Pw0lVTFYqsK3Qr6RqFwZ3QnsvyD3XtX3rAFQ1uT/gJGswx/H+j5
 gqPH8NBmkjIj4pV/FAgty/oM7wn8r7zRTqMKi9fQojErxZ4QtrIDGLQaEk8WETPl/+
 8Z8bvmvga1eew==
Date: Fri, 19 Nov 2021 15:53:39 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vihas Mak <makvihas@gmail.com>
In-Reply-To: <20211113200448.GA1111164@makvihas>
Message-ID: <nycvar.YFH.7.76.2111191553330.16505@cbobk.fhfr.pm>
References: <20211113200448.GA1111164@makvihas>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Cc: alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 benjamin.tissoires@redhat.com, mcoquelin.stm32@gmail.com,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] HID: thrustmaster: fix sparse warnings
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

On Sun, 14 Nov 2021, Vihas Mak wrote:

> Changed 0 to NULL to fix following sparse warnings:
> 
>     drivers/hid/hid-thrustmaster.c:208:43: warning: Using plain integer as NULL pointer
>     drivers/hid/hid-thrustmaster.c:241:17: warning: Using plain integer as NULL pointer
>     drivers/hid/hid-thrustmaster.c:275:37: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Vihas Mak <makvihas@gmail.com>

Applied.

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
