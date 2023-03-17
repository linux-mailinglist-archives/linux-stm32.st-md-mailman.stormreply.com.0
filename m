Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F196BDD55
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 01:07:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91E4EC69067;
	Fri, 17 Mar 2023 00:07:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73896C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 00:07:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3725B8213B;
 Fri, 17 Mar 2023 00:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12907C433EF;
 Fri, 17 Mar 2023 00:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679011638;
 bh=qfqozMAegKijY8JNbuj9EKz7MePhaVeyD54LoSNyvDA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZhWPY3/M3Sqi+evrt88Clwt3B9SMEDaX2TLOVy+k7nLqDt057pQc0Pbxk02rspClR
 626vz/UV35x2vMwvvCF9Qtn6hli5foqzEvZXwtxFkb91PPN2Zkq81L95WTOgddmw7H
 iHcIfXk+406ouIkKWI9q/pfGjJg0MdTGUOD7rU9YzQfV7NaIg8MBs8iWayNU6qUX+q
 wKc9kko5zNaRoPQAw9578Em3wT39m1Iw3qu1xGG2XRFx+UwskZWBKZQYNkS2KuJ2F+
 EZYT/CuLzjp6JhmwRvJuhjJqMYLNomtdp66H/StV9XEWgx+3Eoz9R+1rtUQbZHOCM/
 t1CoZWi1wh6oA==
Date: Thu, 16 Mar 2023 17:07:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230316170716.7039161d@kernel.org>
In-Reply-To: <20230314191828.914124-1-robh@kernel.org>
References: <20230314191828.914124-1-robh@kernel.org>
MIME-Version: 1.0
X-Topics: 
Cc: Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Zhao Qiang <qiang.zhao@nxp.com>, Michal Simek <michal.simek@xilinx.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Francois Romieu <romieu@fr.zoreil.com>,
 Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-can@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2] net: Use of_property_read_bool() for
 boolean properties
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

On Tue, 14 Mar 2023 14:18:27 -0500 Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to of_property_read_bool().
> 
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for net/can
> Acked-by: Kalle Valo <kvalo@kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Francois Romieu <romieu@fr.zoreil.com>
> Reviewed-by: Wei Fang <wei.fang@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, to net(?), thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
