Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E27A07071
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 09:57:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBCECC78F67;
	Thu,  9 Jan 2025 08:57:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 787BBC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 08:57:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4505E5C5A20;
 Thu,  9 Jan 2025 08:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1EFC4CED2;
 Thu,  9 Jan 2025 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736413069;
 bh=x2GsenrQunaqAI/1HgLji0dzukFaaJQHfX1V156HY20=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=lAluccdx3ImOki5Oe/C412QGvfef+Zz6uvtIFQ3muUweTtuTgqIqm1wDkSK26ksTZ
 r0vqQHWy7aaGzbNizzyT67+jp0b9uGfVthe2EA9OU8FaXrTlg0xTwqPf3tqO3ldkjr
 WMTNmd7qM2NLTFqjEJcXlf0WcIrSqXjKTf2KRhTn8RLULfmk+3i30yC2kV7VcshIPK
 F3uxLVRdE7u4l9xwXCTJ04pMD447Vqktp1GFCfKhE1Rh29d/CrXRdGIV+mv/uf6nU7
 dBPWQ8MsBMFk/EkEg8hFWrWkINGbC3n51aqemlAQzqQwL8XQ5gzFt0e30chTDbrBZS
 GRctYh4jGbf8A==
Date: Thu, 9 Jan 2025 09:57:46 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Karol Przybylski <karprzy7@gmail.com>
In-Reply-To: <20241205222221.3094702-1-karprzy7@gmail.com>
Message-ID: <0r15030s-6r63-p644-rn4q-393s3p694p1p@xreary.bet>
References: <20241205222221.3094702-1-karprzy7@gmail.com>
MIME-Version: 1.0
Cc: bentiss@kernel.org, syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCHv2] HID: hid-thrustmaster: Fix warning in
 thrustmaster_probe by adding endpoint check
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

On Thu, 5 Dec 2024, Karol Przybylski wrote:

> syzbot has found a type mismatch between a USB pipe and the transfer
> endpoint, which is triggered by the hid-thrustmaster driver[1].
> There is a number of similar, already fixed issues [2].
> In this case as in others, implementing check for endpoint type fixes the issue.
> 
> [1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
> [2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622
> 
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
