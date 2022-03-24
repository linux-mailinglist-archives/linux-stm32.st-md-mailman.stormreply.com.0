Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 459A54E6362
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Mar 2022 13:29:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3020C60497;
	Thu, 24 Mar 2022 12:29:48 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7230C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 12:29:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 39A96B82258;
 Thu, 24 Mar 2022 12:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B81C340EC;
 Thu, 24 Mar 2022 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648124986;
 bh=3DoK7n9nDP2CGFgPXTe97QnveDO+h1oyIl//9nYasVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IJq7vKfG82kt8jIdTOpib4NKU/d4K/dKlQpMN4zxXnxRbBL6g0IN7IcbjHbeaPUd9
 Dk05bOIA6Jb3wTnvL8F3mjlFPNx3AA4uKg9ttlUDvH1KyrAS9QRk4J3HW+Id1XXhyJ
 uqO7NIFLdbWR7Ks6oTXJ+nsGntmdvd0mE6NKC9OU=
Date: Thu, 24 Mar 2022 13:29:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Message-ID: <YjxkNzJMGt0f2XYF@kroah.com>
References: <20220323033255.2282930-1-bjorn.andersson@linaro.org>
 <CAH=2NtyChidtrBVBL=RNjPaYYmtTuN0N4fbMx4DRBD6hXxHguQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH=2NtyChidtrBVBL=RNjPaYYmtTuN0N4fbMx4DRBD6hXxHguQ@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 stable <stable@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable
 RGMII functional clock on resume
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

On Thu, Mar 24, 2022 at 03:08:08PM +0530, Bhupesh Sharma wrote:
> +Cc: stable tree as I think this is an important fix for stmmac
> dwmac-qcom-ethernet driver and affects ethernet functionality on QCOM
> boards which use this driver.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
