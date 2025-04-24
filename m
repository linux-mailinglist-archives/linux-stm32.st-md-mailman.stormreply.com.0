Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C921EA9A8CD
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 11:48:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B292C78F68;
	Thu, 24 Apr 2025 09:48:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28113C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 09:48:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F182368458;
 Thu, 24 Apr 2025 09:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7D7C4CEE3;
 Thu, 24 Apr 2025 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745488115;
 bh=n/inaBTjufm8fqFMcv+jCVKf3BgJPnY/qqhNvk76Af4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=im3GCitUwHN4zIlUyrDEdtPOa55IhqKlViektf9CVVeGrfS0gIZ1YWTbFqIJZESk5
 aTJIJ8V8E4qWBI6XCtKZU40ket+NFzXwm55UXwJzzkFfL0RBlwTN00+ZKY30rBOvFi
 ZqvJA/q3zLdtqAmvyHPu/wYHQwVKvBs2rLFzNNXGmtUkqPtF3mSRke07BSmeH3QgmR
 7EqRprp2dIfLIMGvpe8pjdK3e+6fgWUQsKYQagQpZouSt4yxJydzh4wH1L3wngT3nE
 1Mu6Dc0IBFlwRpG1AAO2Ebg7G8+ramLXzW90/s26lRpzH3fLO1Ud9WyNuyjwW5HUZ1
 pc/xt07Otu98Q==
Date: Thu, 24 Apr 2025 11:48:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
In-Reply-To: <20250327231146.6388-1-qasdev00@gmail.com>
Message-ID: <371o6n9s-sq4q-s071-24r5-8p22o933197r@xreary.bet>
References: <20250327231146.6388-1-qasdev00@gmail.com>
MIME-Version: 1.0
Cc: bentiss@kernel.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] HID: thrustmaster: fix memory leak in
 thrustmaster_interrupts()
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

On Thu, 27 Mar 2025, Qasim Ijaz wrote:

> In thrustmaster_interrupts(), the allocated send_buf is not 
> freed if the usb_check_int_endpoints() check fails, leading 
> to a memory leak. 
> 
> Fix this by ensuring send_buf is freed before returning in 
> the error path.
> 
> Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
