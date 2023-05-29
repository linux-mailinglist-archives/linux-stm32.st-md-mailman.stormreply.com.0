Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018D714777
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 11:54:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA4E0C6A615;
	Mon, 29 May 2023 09:54:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E0D2C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 09:54:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 70C14854DA;
 Mon, 29 May 2023 11:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685354092;
 bh=lQTEdnWjjTtx4sq9do2rOkRe9c+JTLk6uao+OPCngtU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hHs4DxvURTENKVsIoE1/nRIsH5tkkSHGGjXt9G8nXaKvwSUY9+UQIEKtc2euMtWx7
 SXlTjvzrDPurWIppeTWFcMCzrV/rMQVa/yvK7ZhbLD3kxai2H9hwOd5aL3EF9YRnRk
 i5MgSlfq2KEJlRrt33ZsMqX3Z6yv4wfblwohXVizZ2BtAYImKGZI4iJv4SqRh8JLjz
 vjtKZodLjh1JvAMtB92dBUquylBDCwIFTzuRLbZ0r4VYqDeuLe6ay3D25YdDSTIkwb
 YRSbLxeFFcTWPdCsz0Jp6YwdeOpPDDk75yeAEbFWa/F1ElpaSMJgc9Zt6pC9J8OJ9K
 /zg7UfGbliK1Q==
Message-ID: <ee1c8e43-3954-c6c3-fec8-e8b29aaa5e72@denx.de>
Date: Mon, 29 May 2023 11:51:56 +0200
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
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
 <20230529091359.71987-4-raphael.gallais-pou@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230529091359.71987-4-raphael.gallais-pou@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/4] ARM: dts: stm32: fix dsi warnings
 on stm32mp15 boards
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

On 5/29/23 11:13, Raphael Gallais-Pou wrote:
> Fixes DSI related warnings:
> 
>   * "#size-cells" and "#address-cells" wrongly used
>   * Changed 'panel-dsi@0' to 'panel@0' according to dsi-controller.yaml
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
