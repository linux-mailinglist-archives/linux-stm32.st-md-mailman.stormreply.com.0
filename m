Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480D7FC041
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 18:26:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22BD5C6B46B;
	Tue, 28 Nov 2023 17:26:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 730E6C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 17:26:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5DAB60005;
 Tue, 28 Nov 2023 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1701192404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bng8R5x/Jmq2SVxmDJwMSiwsK4vhqKDM3h6nqdBSV2s=;
 b=AKK5qcPcfM1hiW5bzr3BhkVuOFr724YPqPa74JpMexXiVIIJB8NpxTTx5iws+jqvFTmzKe
 spY8WrOUXoem/qgXMTVJ2910ttXabpuTGG70MuZp5z5dxN99O4e0PcyVI/8CNzzDK7J3J+
 f1Zgd3K6cWN3DTLrkCj/pNHcg7nRF4dfaeQNz016qiFh4vNszeVlCdrSOvDdlNoqgYpm+P
 PD2N/3MCCql4071pAIpf1BRkJqTYm5tzprPYWkJlAj48bvJt3/Ccm5L5qbSZHuUsIAO+QB
 6lOA9DMmFQYoQQaanpr3Z9ceucEwY881QiV9dW3Fe1r0jcmn2fr9WOQ1UX6MmA==
Date: Tue, 28 Nov 2023 18:26:41 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20231128182641.7e2363c0@device.home>
In-Reply-To: <50d318fd-a82c-4756-a349-682b867c0b8b@lunn.ch>
References: <20231128094538.228039-1-maxime.chevallier@bootlin.com>
 <50d318fd-a82c-4756-a349-682b867c0b8b@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-socfpga: Don't
 access SGMII adapter when not available
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

Hi Andrew,

On Tue, 28 Nov 2023 17:37:30 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Tue, Nov 28, 2023 at 10:45:37AM +0100, Maxime Chevallier wrote:
> > The SGMII adapter isn't present on all dwmac-socfpga implementations.
> > Make sure we don't try to configure it if we don't have this adapter.  
> 
> If it does not exist, why even try to call socfpga_sgmii_config()?
> 
> It seems like this test needs moving up the call stack. socfpga_gen5_set_phy_mode():
> 
> 	if (phymode == PHY_INTERFACE_MODE_SGMII)
> 		if (dwmac->sgmii_adapter_base)
> 			socfpga_sgmii_config(dwmac, true);
> 		else
> 			return -EINVAL;

I don't have access to a platform with the SGMII adapter available, but
my understanding is that we shouldn't error-out when we don't have the
adapter, as some other component (like the lynx PCS) might be there to
handle that mode.

However you have a valid point in that we might want to check if we
have either an SGMII adapter or a PCS, and if we have none of these we
error-out. Thanks for the suggestion, I'll address that :)

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
