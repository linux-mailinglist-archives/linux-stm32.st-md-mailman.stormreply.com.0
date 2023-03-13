Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F826B7154
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 09:44:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2683BC6904C;
	Mon, 13 Mar 2023 08:44:30 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C38DCC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 08:44:28 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3916C6603084;
 Mon, 13 Mar 2023 08:44:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678697068;
 bh=7sp5OBBrmpEeatddKwhM+lwytmkkMBBdKyeH5esSn5w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=URmi3h55rHOXuFaFDpXyjqFwC2AM9oj/jA/N6W3on5mk7UzK2MxULSlHGp7T77hBe
 dWYzpktDKUExA68Q7xud0dv+wpUZkc+M4SnVJ59FA/3XwHenlTs1fGyEDt+sL9AYyg
 s4sO12HOKDWiJiMNtNyv4vTa/3qyYbstAM4Ebp74pYfrAQB2MwSvedqtL3+CVW/Miq
 PE232fdSbE1cB4VSLlSnFZz8j4epOxMNgKOdOgGrJG2u4DKxey1y+zJFy8JxTNnrW9
 vePjz3sD+DWyldubvYworA66OgL1GkyFoMg9AGeIrP8E+maWaAA/OAnQ3L4qA2HuME
 feZ0B1u7L+o1A==
Message-ID: <e067d343-c47e-e2bf-4ae8-51873759d39b@collabora.com>
Date: Mon, 13 Mar 2023 09:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230310144721.1544669-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230310144721.1544669-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Use of_property_present() for
 testing DT property presence
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

Il 10/03/23 15:47, Rob Herring ha scritto:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
