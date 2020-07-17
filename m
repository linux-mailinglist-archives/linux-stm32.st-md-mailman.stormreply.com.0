Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FF223B98
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jul 2020 14:49:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F8FAC36B30;
	Fri, 17 Jul 2020 12:49:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1547AC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 12:48:58 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C61E8207F5;
 Fri, 17 Jul 2020 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594990136;
 bh=px+ZOr5vGWOD2WY1nkEe6GE/wiHxQX4NyNmrfPIeG7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iu1cvXPAlzooZ6RFLUKS78s8jwgqZAVrA9BXFIpWJcw6EZk29M3soHUxoO9YF+xom
 D1Ol+o6cPd9LLJw7IXEVrnGoJn+zLuPKJoDYv87UVtj66Ld5C2ctFO/x4YfxsH1r75
 jVHgRBdYRlt/EZ1YztBPKtyHMPJHD7Bcrh4N2rDA=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jwPnL-00Ccsm-AZ; Fri, 17 Jul 2020 13:48:55 +0100
From: Marc Zyngier <maz@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>,
 John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Date: Fri, 17 Jul 2020 13:48:45 +0100
Message-Id: <159499001592.546505.10441967473975319808.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710231824.60699-1-john.stultz@linaro.org>
References: <20200710231824.60699-1-john.stultz@linaro.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net,
 tglx@linutronix.de, john.stultz@linaro.org, linux-kernel@vger.kernel.org,
 marex@denx.de, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joro@8bytes.org, agross@kernel.org, tkjos@google.com,
 iommu@lists.linux-foundation.org, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org, mkshah@codeaurora.org, ilina@codeaurora.org,
 linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
 saravanak@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: marex@denx.de, Maulik Shah <mkshah@codeaurora.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Lina Iyer <ilina@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Todd Kjos <tkjos@google.com>
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Allow for qcom-pdc to be loadable
	as a module
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

On Fri, 10 Jul 2020 23:18:21 +0000, John Stultz wrote:
> This patch series provides exports and config tweaks to allow
> the qcom-pdc driver to be able to be configured as a permement
> modules (particularlly useful for the Android Generic Kernel
> Image efforts).
> 
> This was part of a larger patch series, to enable qcom_scm
> driver to be a module as well, but I've split it out as there
> are some outstanding objections I still need to address with
> the follow-on patches, and wanted to see if progress could be
> made on this subset of the series in the meantime.
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/3] irqdomain: Export irq_domain_update_bus_token
      commit: ce8cefa53c06cd98607125c52c91e74373a893a0
[2/3] genirq: Export irq_chip_retrigger_hierarchy and irq_chip_set_vcpu_affinity_parent
      commit: 96703f046c42f8ab15e735953cbfee572c717e2d
[3/3] irqchip/qcom-pdc: Allow QCOM_PDC to be loadable as a permanent module
      commit: 5ef7f1bbf9f56c5380c4d876655920cac92008e5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
