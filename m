Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 916727685BD
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jul 2023 15:45:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 387CCC6B470;
	Sun, 30 Jul 2023 13:45:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 036E7C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 13:44:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F68860C5C;
 Sun, 30 Jul 2023 13:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EB3C433C8;
 Sun, 30 Jul 2023 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690724698;
 bh=1D42diIQ7tPAn5Xqu6R06rKruNPy5NBp4jWplaHhaUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WwkzlD0tx8swWh8XQ7JLYbwXJqU5Q6JmI1opFSGdXjHhNKDPKstoxA+o2v7W0I3Ai
 r+Fr+EwcENDjZuhraE/SnOm6h0GZ7rkR0E4v4zUcWaROifkkp+6QAhzLNK7BZKNo1H
 PbHdYqL2BqeGiyXlPaz0Mnc7lDqqQPBn192JkjBz/AYO06l0vtg7i6c2yT97xljwNz
 TJiS4g/cHLJxCDaN1546hEV7RNQEDXFG14S2dEXhrfi2mQHV55ONRpfGWrwS1edT62
 YQF4elg2UKChSk9ajBumZm+VQi8G4oFIhKElV6WOSrEl3xbyzZGzfIsWppMyo890sN
 yuhHQiFw55H4g==
Date: Sun, 30 Jul 2023 21:44:46 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230730134446.GV151430@dragon>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/8] AMR: dts: imx6sx-nitrogen6sx: drop
 incorrect regulator clock-names
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

On Wed, Jul 26, 2023 at 09:03:15AM +0200, Krzysztof Kozlowski wrote:
> regulator-fixed does not take "clock-names" property:
> 
>   imx6sx-nitrogen6sx.dtb: regulator-wlan: Unevaluated properties are not allowed ('clock-names' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fixed the typo of 'AMR' in subject of 1/8 ~ 4/8 (Thanks Fabio!), and
applied all, thanks!

Shawn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
