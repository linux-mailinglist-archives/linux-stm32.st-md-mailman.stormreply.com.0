Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81A784DB7
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 02:15:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB95AC6B444;
	Wed, 23 Aug 2023 00:15:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41BC0C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 00:15:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A937D6105A;
 Wed, 23 Aug 2023 00:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5563EC433C7;
 Wed, 23 Aug 2023 00:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692749726;
 bh=m3QxC+UW70yVwLmza6iDNCXkPCmq/liyu1hcsOb0IsE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hwz9Nl+1z+jtRA2DpiRq32cQoFsmVxS4DEL/2vTmJgHTaQ7TgL/1LcgbHEPoBzUz6
 YElDzl8+4g3C2NGEhHkRnIUTbvEq9ih4wJ5mbBnntSKiLoS4ab14VsZhHA8WIVKpnS
 cGY0mQUFGIpf4U1b7azz363yW3q5Y+Tw5Kal+A4Ez7orTCicEBTnx1fFEpSFHN+K/X
 8hvQwpLwoRSJcOilFv1tTQg4H1Yr7O2O8O/k5cNNEMdv55EJpgre0FYex2oL21JOY+
 IdGRw+TLiqt/YWiCPwmS9bXG+RMRAENYE302bXWOlgU2DWv302qTcNdqbvZs5/9X8v
 cjc2gqirf/nuQ==
Date: Tue, 22 Aug 2023 17:15:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <20230822171525.692bd2df@kernel.org>
In-Reply-To: <20230819023132.23082-2-rohan.g.thomas@intel.com>
References: <20230819023132.23082-1-rohan.g.thomas@intel.com>
 <20230819023132.23082-2-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/2] dt-bindings: net: snps,
 dwmac: Tx queues with coe
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

On Sat, 19 Aug 2023 10:31:31 +0800 Rohan G Thomas wrote:
> +      snps,tx-queues-with-coe:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: number of TX queues that support TX checksum offloading

Is it going to be obvious that if not present all queues support
checksum offload? I think we should document the default.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
