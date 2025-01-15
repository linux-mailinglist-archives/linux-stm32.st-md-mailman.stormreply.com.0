Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0FA11701
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 03:07:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81345C78F64;
	Wed, 15 Jan 2025 02:07:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A9EBC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 02:06:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC4615C5A83;
 Wed, 15 Jan 2025 02:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3A2C4CEDD;
 Wed, 15 Jan 2025 02:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736906812;
 bh=Is2DEKJqxrZolAAhs79aRj+JZ1MAa+Qb4ZhMoIVs3d8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gZyofTVxT+u0L1znLIHaVN7i/eistrx0gCPsPi/UxOgGoHuAjcBiP6ME2pKBxTacu
 zFM1j6uCI7pcHUql7guwQmcGIuNSL3tQcbl9j2CbHRJ61+aODAhHOJ7cU6sOx1zv/i
 q+gJCXt/eCmA/hOWlACdyak6CaezRoe/2rLWeDI5jIvDIsbLB+2AsJtOqMYiLRx0CA
 3KdE7YelM4LW+HUdQwrvQl2ep73dZ22N2wBND0ITlX4VnZTu8usyuK037Q3acaCgWq
 mDse7By8hi98ni1zoNYA7Ug/AO/THF1IxXS8zkiBQbtnpcAgYLKZXh2euq5Il7jQoC
 GmtnMio6JkIMg==
Date: Tue, 14 Jan 2025 18:06:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20250114180650.4ba50ea4@kernel.org>
In-Reply-To: <1376b2b3-90c4-4f06-b05c-10b9e5d1535e@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-2-3423889935f7@linaro.org>
 <0eaff868-f67f-4e8a-ade8-4bdf98d9d094@ti.com>
 <1376b2b3-90c4-4f06-b05c-10b9e5d1535e@linaro.org>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, MD Danish Anwar <danishanwar@ti.com>,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: ti: icssg-prueth: Use
 syscon_regmap_lookup_by_phandle_args
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

On Mon, 13 Jan 2025 12:04:35 +0100 Krzysztof Kozlowski wrote:
> > The patch only touches `drivers/net/ethernet/ti/am65-cpsw-nuss.c`
> > however the subject suggests the patch is related to "icssg-prueth".
> > 
> > I suppose the subject should be changed to "am65-cpsw-nuss" instead of
> > "icssg-prueth"  
> 
> Indeed, copy paste.

Will fix when applying.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
