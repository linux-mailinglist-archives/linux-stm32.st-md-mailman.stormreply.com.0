Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 445A9712B23
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 18:55:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CB04C6A615;
	Fri, 26 May 2023 16:55:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC8BAC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 16:55:20 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6D0CE846EF;
 Fri, 26 May 2023 18:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685120120;
 bh=TDL/5pkk1HH5CR3koHDtyH//neQKpUvPrVWTDhNvaFo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PGNmN3NtYH5BzbQtpboTI29V3xodt+mYuEaFxTyztuaXPlp/d+mVMBnVjlnewkilF
 Q6boCsoIlCDgBZcd4u4+owZ/ctOjIRmlAqB1YgnyE9ViGCeAnbCizvXO8ShP5cp1p4
 +c1CEygRksUk75nIcE3LqDn6oBjXh71ZROTLZy6Zka6+Wc3svboRSJAINO8+69V9w1
 V83Cgum4/kh0WDtEgvt2foyCUOz8LIFYo/KImXBOBB8qH2g0KgzcXYfLh5OHdeoZaz
 ifcudq6PfV5l2iKbOdBXx29T3JLIe1GQ6RN43xJ9mOW11EknoORfEgM9S4lJ9AXjc7
 FFrn6SZareSfQ==
Message-ID: <e4973081-a0c3-dc82-7efd-ab94284c0813@denx.de>
Date: Fri, 26 May 2023 18:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-2-raphael.gallais-pou@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230517143542.284029-2-raphael.gallais-pou@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/3] ARM: dts: stm32: fix warnings on
 stm32f469-disco board
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 5/17/23 16:35, Raphael Gallais-Pou wrote:
> Several warnings appear when building and checking stm32f429 device-tree:
> 
> arch/arm/boot/dts/stm32f469-disco.dts:182.28-184.5: Warning (unit_address_vs_reg):
> /soc/display-controller@40016800/port/endpoint@0: node has a unit name, but no reg or ranges property
> 
> .../arch/arm/boot/dts/stm32f469-disco.dtb: dsi@40016c00: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
> 	From schema: .../Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> 
> Fix those.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
