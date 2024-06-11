Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E39033F3
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 09:40:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0AD0C78004;
	Tue, 11 Jun 2024 07:40:56 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96671C78003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 07:40:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA0A620014;
 Tue, 11 Jun 2024 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1718091655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5owhW0aHxqtWSeBDnEPBf5XAJzmMgnDRGVbxbD2efk=;
 b=XahVT1YGIW8Xos7jF9WPfgrfyyu963Ak4SqkoT20MmsSeup/NaY9GA3iHJ1rOyqyfgHtfN
 WABwCpInGx0rT5PCVMivFKHun34ywFc0LULVswhe/bsLBcr5hzDto7MIHuyuHq9gY5HVGE
 PM1o0t0yAGwdvvJ6nZ1gM6ats0oaFSp9AAMKRv1obr+fJJf3jF+I6AYUWh/Ur9WEso7eH0
 /ChDShDg0MRM5TgEq0nqs4fhykllf0a+uFz0V5NlPYECbyZ061xtc+Hwy0zokR6bIdHcJF
 H01SguCr9944nNHj5VwgA44KBs2I4tAMCHawYME/Fe9a29Mv01PbUfEGVDjoiQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 11 Jun 2024 09:41:37 +0200
Message-ID: <13858564.5d5uVuNtuT@fw-rgant>
In-Reply-To: <E1sGgCS-00Facz-4s@rmk-PC.armlinux.org.uk>
References: <ZmcQTuR5IKRp0pgy@shell.armlinux.org.uk>
 <E1sGgCS-00Facz-4s@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] Re: [PATCH net-next 3/5] net: stmmac: dwmac-rzn1:
 provide select_pcs() implementation
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

On lundi 10 juin 2024 16:40:44 UTC+2 Russell King (Oracle) wrote:
> Provide a .select_pcs() implementation which returns the phylink PCS
> that was created in the .pcs_init() method.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Tested-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
