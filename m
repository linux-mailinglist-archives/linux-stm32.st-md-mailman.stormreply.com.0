Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A984D6C21
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Mar 2022 03:53:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA57EC628A4;
	Sat, 12 Mar 2022 02:53:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA170C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Mar 2022 02:53:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CD0561175;
 Sat, 12 Mar 2022 02:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7207C340E9;
 Sat, 12 Mar 2022 02:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647053631;
 bh=j4DQ0Z4F7/1qdMCCjWIhTypbozMGPnG0zK+BtArEHoQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=SR7gRWzScDnZdEdJWI64VUQoCr+8bsKB8DAQFbDVTrwceEiWB31cJieOyQ0K+I1zM
 ylcIs0UknxCCOAOBVqMnHuph0mGrqblHenc4h0taHAniH61AshrbrmgEwCrhxC3PdQ
 S5IxSBhjq69nF8uRFrMDL4L5iZucvIfofeDFLjSELgzhpdfJ7ic8Bt3NEyWs59EMFZ
 hKfAYdZ8n7ALVW3JQ6mhRtm9ub3Ru+/TPWM75MDfy1fk3uvgmFYHyLnsiQgi7SN2d6
 w1apSzPPFGqdAO6MynlmD1SALIVdUXn1x8o02+VsZMNOasSB1kVMADcq/2wloO3mBS
 A0AxAl8t1vLtg==
MIME-Version: 1.0
In-Reply-To: <20220225133137.813919-9-gabriel.fernandez@foss.st.com>
References: <20220225133137.813919-1-gabriel.fernandez@foss.st.com>
 <20220225133137.813919-9-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Mar 2022 18:53:48 -0800
User-Agent: alot/0.10
Message-Id: <20220312025351.C7207C340E9@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 08/13] clk: stm32mp13: add all
	STM32MP13 peripheral clocks
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

Quoting gabriel.fernandez@foss.st.com (2022-02-25 05:31:32)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> All peripheral clocks are mainly base on stm32_gate ckocks.

s/ckocks/clocks/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
