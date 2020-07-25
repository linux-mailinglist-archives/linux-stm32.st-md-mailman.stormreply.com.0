Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72922D807
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jul 2020 16:23:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65E62C36B2E;
	Sat, 25 Jul 2020 14:23:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E6A0C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jul 2020 14:23:52 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E92CD2070C;
 Sat, 25 Jul 2020 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595687031;
 bh=htCQhDyTlNg3GTpYQ9dDkGNrL4Hm0w7jMSwSmpYWjyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qa3URvJ40Y6CThiV40vigy+cDQVXqXBxRsrjFX/LdKmq/jwb23TeUslihMKIhwB9Z
 olv1jO037m3vZWrfXjJhQbv/smXFc+PtnI5PW1b3cgaao96YWatAEmQjwhrCHb7zj6
 yQQ96EKFnlRXyqjTbH1Jy/hWNgFaxpJS5uY3reKw=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jzL5Z-00Er45-Gm; Sat, 25 Jul 2020 15:23:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>
Date: Sat, 25 Jul 2020 15:23:33 +0100
Message-Id: <159568680935.564881.4388804136193057202.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200719002853.20419-1-rdunlap@infradead.org>
References: <20200719002853.20419-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, alexandre.torgue@st.com,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, rdunlap@infradead.org,
 linux-gpio@vger.kernel.org, marex@denx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] irqchip: irq-bcm2836.h: drop a duplicated
	word
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

On Sat, 18 Jul 2020 17:28:53 -0700, Randy Dunlap wrote:
> Drop the repeated word "the" in a comment.

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip: irq-bcm2836.h: drop a duplicated word
      commit: b48489d82fcf61f229a892c7e1b559be15c95916

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
