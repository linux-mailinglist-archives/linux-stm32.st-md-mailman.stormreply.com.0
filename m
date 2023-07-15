Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E59754BC7
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Jul 2023 21:42:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11DBDC6B444;
	Sat, 15 Jul 2023 19:42:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7559C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jul 2023 19:42:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F57160C19;
 Sat, 15 Jul 2023 19:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A0C433C9;
 Sat, 15 Jul 2023 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689450134;
 bh=IF+T/s5UAKjpXNvKGf6rl0oLoeiOXXICDNa+0DHTd7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=edFc2azpmIiwIOubs0XWeGPfp5Mfs7+xV6k1LA5Ij4Dm1TVcE+Z2hfp4Vzn/fDCpL
 qMlQItqeQCGPaQ9ZHr8xfdndSXOGjQVcfXyyxAzN20SODjC1xFlf2VQOT66bjkDs3n
 FRRNHhvglKf/8AF4pLj24+jvjNM/KGA+gRtu8I3C/6mvAjxtWT07YDyskMxPe4wzFL
 Riy/eV5v9DpRtzmfzXZzNUPqWGzuBX/xmNBNMzdRFUohuB4qMDsnF3DXw+SpGrmT2v
 1NnEdiiiZx/ofU6/Aztd9fZm3uQxGoVAAwo1jzkhmpGijV7n8DKYcciJjpIr7FZhOi
 TjjliWBm+ilMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Date: Sat, 15 Jul 2023 12:45:36 -0700
Message-ID: <168945033418.1736171.1897129444572615793.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174935.4063513-1-robh@kernel.org>
References: <20230714174935.4063513-1-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] remoteproc: Explicitly include correct DT
	includes
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


On Fri, 14 Jul 2023 11:49:33 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: Explicitly include correct DT includes
      commit: 3440d8da79ba983330457b2400b15e7b1b002ac3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
