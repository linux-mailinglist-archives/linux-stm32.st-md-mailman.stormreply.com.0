Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E0223B99
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 14:49:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C65FC36B33;
	Fri, 17 Jul 2020 12:49:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2796C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 12:48:58 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 756C9206F4;
 Fri, 17 Jul 2020 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594990137;
 bh=JgQ/oreBwGqizaX7ztymLlHDgwGeBJjpWHzJp/rYn1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ep1345fb497pj9W1qaXfXFsZHpSxVyw39mT0Nr9wzDoZ7+uj6WsTVXSRrfmF/WHU2
 6mxJaSVk5sHcIRRj4LbZUh4DL/lxZv+CkzAk/igZKq9Ef1uWYo1BWGbXvBQ61OO7Kq
 3acO4nKlY+Xi8cSsfOHrbmaGc6FmhBaY/lCfaPCQ=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jwPnM-00Ccsm-0e; Fri, 17 Jul 2020 13:48:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 17 Jul 2020 13:48:46 +0100
Message-Id: <159499001592.546505.4320591957768155894.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714173857.477422-1-masahiroy@kernel.org>
References: <20200714173857.477422-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net,
 tglx@linutronix.de, masahiroy@kernel.org, linux-kernel@vger.kernel.org,
 marex@denx.de, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] irqchip: ativic32: constify irq_domain_ops
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

On Wed, 15 Jul 2020 02:38:57 +0900, Masahiro Yamada wrote:
> This is passed to irq_domain_add_linear(), which accepts a pointer
> to a const structure.

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/ativic32: Constify irq_domain_ops
      commit: 605a2cf566e130c77fc2cc77fac37fb901fc868a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
