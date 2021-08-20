Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A753F2C05
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Aug 2021 14:25:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2C38C57B60;
	Fri, 20 Aug 2021 12:25:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E7DCCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Aug 2021 12:25:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 861BD610CA;
 Fri, 20 Aug 2021 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629462334;
 bh=3R0qdMCFfXOB2+xRomxMe3m2PUAFmF2GH4U0e1OQDiQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OGUE0F55UGeE4HvD2Z0lytZXU0UYM2BemxQ8RLIX/fW1jWvydT1ano6b1bgIljkDY
 AZFqlVOKVBqO2VWx1NBZQnk1JnLObu/+WJcW1eQi3lBJ/gjDRwbe0ebDfwwM2Tsk0f
 y1UN64dUNj6X4MmXmPWRLrSAzsENemTWMd8e5j6TYWNG5uxNfemZ6k1QoCyNUojWJQ
 QMK6lOpohdFVGztVIC7ExBvxv4ixrx08T/7So5p3QRQqfAbXbc853qVmY4QjoQwJmV
 mMQDZCqHRM8r9wdvGscX8wgJz9o+Zz5gPMkUOVnvwu54EyEj8MFjUKvlTYlAKtGM2b
 kpbwvUSOSC2Ig==
Date: Fri, 20 Aug 2021 14:25:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Evgeny Novikov <novikov@ispras.ru>
In-Reply-To: <20210730165110.24667-1-novikov@ispras.ru>
Message-ID: <nycvar.YFH.7.76.2108201425170.15313@cbobk.fhfr.pm>
References: <20210730165110.24667-1-novikov@ispras.ru>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Cc: ldv-project@linuxtesting.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] HID: thrustmaster: Fix memory leaks
	in probe
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

On Fri, 30 Jul 2021, Evgeny Novikov wrote:

> When thrustmaster_probe() handles errors of usb_submit_urb() it does not
> free allocated resources and fails. The patch fixes that.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

I've applied all three fixes, thanks.

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
