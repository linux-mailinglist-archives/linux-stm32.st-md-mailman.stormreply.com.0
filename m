Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49E706A8A
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 16:07:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F34AFC6A615;
	Wed, 17 May 2023 14:06:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05B71C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 14:06:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 59AEF8617D;
 Wed, 17 May 2023 16:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684332418;
 bh=GqIpWImF/Da9B5+OchXkE+1kRkxiInfJ9V0+u3d2r3o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fn7VgGR8QgFGf5h6+N3DjnJvonAOoi8Q7r/7SNOJPPE8o+z0PKsGnyVMHF6IhhMm7
 IRpbWN098NmKyBQhgFJBzD8T6AYhLLViQJu9OJ3iyJiOClya03MmJQ8b9qFM3b3fZK
 mljTl5GHlIqijdhlRoltvLvC881OiGPOgTu+Ub2Vgozy9WkFWemj00c6HVvdqNIh/i
 SjTCvY8qrqxUd73AqfLVMZwuQ+3ukB1pme/k+T46BL3yzq/G9lKqF6sPTimLB+tK3n
 cz/J8YfpSC9AApmL52rmII046Ej6gufpv55BewSAoPnva/qHkD4MEqBek+RLdz/3m9
 yml7tHAq9S3pw==
Message-ID: <56bcad63-a32e-63fc-1c20-15909f2788b5@denx.de>
Date: Wed, 17 May 2023 16:06:56 +0200
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
References: <20230517132214.254757-1-raphael.gallais-pou@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230517132214.254757-1-raphael.gallais-pou@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] STM32 warning cleanup
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

On 5/17/23 15:22, Raphael Gallais-Pou wrote:
> This serie aims to reduce the number of device-tree warnings of
> following boards :
> 
>    - STM32F429-DISCO
>    - STM32MP15*
> 
> Those warnings were appearing either during build or when checking
> dt-bindings and concern mostly LTDC and DSI IPs and were due to the
> following cases:
> 
>    - panel-dsi@0 nodes that needed
>    - unnecessary #address-cells and #size-cells properties
>    - residual 'reg' field on single endpoints
> 
> Raphael Gallais-Pou (3):
>    ARM: dts: stm32: fix warnings on stm32f469-disco board
>    dt-bindings: display: st,stm32-dsi: Remove unnecessary fields
>    ARM: dts: stm32: fix several DT warnings on stm32mp15
> 
>   .../devicetree/bindings/display/st,stm32-dsi.yaml      |  2 --
>   arch/arm/boot/dts/stm32f469-disco.dts                  |  4 ++--
>   arch/arm/boot/dts/stm32mp151.dtsi                      |  5 -----
>   arch/arm/boot/dts/stm32mp157.dtsi                      |  7 -------
>   .../dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    |  6 ++++--
>   .../boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  6 ++++--
>   .../stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts  |  3 +--
>   arch/arm/boot/dts/stm32mp157c-dk2.dts                  |  8 ++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts                  | 10 +++++++---
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts              |  3 +--
>   arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi     |  6 +-----
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                 |  3 +--
>   12 files changed, 29 insertions(+), 34 deletions(-)
> 

Is this a V2 series ?

If so, please do include changelog .

Also, use "git send-email -v2" to mark those patches as v2 automatically 
when sending .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
