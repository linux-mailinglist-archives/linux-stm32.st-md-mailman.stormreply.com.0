Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5174223BA1
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 14:49:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC886C36B2C;
	Fri, 17 Jul 2020 12:49:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5461C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 12:49:00 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7118B207FB;
 Fri, 17 Jul 2020 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594990139;
 bh=5POnxabUMyqHA1KxDC3Te6qQKnu8fFa8/yigj7vMA2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2uJXQ1KfkRiG4WbZZf4pM/IYginKG2nTtWy/qrZp7ICtuC25ONpKgTlR0nhflNE5t
 u4nTdxiavRPloJYgVH1tyKiL+mVOXDqf9h5PcQVnPU6JCzvQPhm+Q1mFa8Ey1vj8MU
 AugpzmI4sHeoRDoyLqhcsAhurpb+Cu5GEF3pqqBM=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jwPnO-00Ccsm-0z; Fri, 17 Jul 2020 13:48:58 +0100
From: Marc Zyngier <maz@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>,
 Zenghui Yu <yuzenghui@huawei.com>
Date: Fri, 17 Jul 2020 13:48:49 +0100
Message-Id: <159499001592.546505.17916680802608483979.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716083905.287-1-yuzenghui@huawei.com>
References: <20200716083905.287-1-yuzenghui@huawei.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net,
 tglx@linutronix.de, yuzenghui@huawei.com, linux-kernel@vger.kernel.org,
 marex@denx.de, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 wanghaibin.wang@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 wanghaibin.wang@huawei.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] genirq/irqdomain: Remove redundant NULL
	pointer check on fwnode
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

On Thu, 16 Jul 2020 16:39:05 +0800, Zenghui Yu wrote:
> The is_fwnode_irqchip() helper will check if the fwnode_handle is empty.
> There is no need to perform a redundant check outside of it.

Applied to irq/irqchip-5.9, thanks!

[1/1] genirq/irqdomain: Remove redundant NULL pointer check on fwnode
      commit: 47903428b0e9db7a6251aa696fd1b2fc5de98545

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
