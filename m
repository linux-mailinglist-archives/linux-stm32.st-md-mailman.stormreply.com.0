Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AA8C21BF
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2024 12:11:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDF03C030CA;
	Fri, 10 May 2024 10:11:26 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12131CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 10:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715335884;
 bh=c1waZ+eyh/3LEv2xQyu5LjuVf0SWbog1966q3KjkEqw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xJk+hOhpaV0T+ju3F8+sGmHBtzFTyVUG4277e8N/HYwbkr3BX3CzBx/+wcN2hgGpe
 y3AQfCENjfRWsQqdzX9NFQcE6TCs0Uotjwtt9fg9LZId1pbDM11ZYIgJo4uNpzZkdY
 PnTqo9/+m/7JFxbRrFDEoqFkqIJ0VZ6crTG9McyI4maP8wggHhvKx30Wg8XTzClStG
 9FwDc0JokaW1oDrkqv4OxNLzVAO+B3GnAKvPKu5ny7tz7dWVkxfryNJjCzGuw1FWRn
 SruPRMpQcZD28dXZLjtT+UObBpWlZRpJ164RAFgDp6ZALOCqDHsItLhm9U+1Qm20Vt
 af9aDi8aR6llA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D92A3782185;
 Fri, 10 May 2024 10:11:22 +0000 (UTC)
Message-ID: <d95cafca-bc4c-4571-a6ed-b66b6f63a579@collabora.com>
Date: Fri, 10 May 2024 12:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joy Chakraborty <joychakr@google.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rafal Milecki <rafal@milecki.pl>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
References: <20240510082929.3792559-1-joychakr@google.com>
 <20240510082929.3792559-2-joychakr@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510082929.3792559-2-joychakr@google.com>
Cc: manugautam@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/1] nvmem: Change return type of reg
 read/write to ssize_t
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

Il 10/05/24 10:29, Joy Chakraborty ha scritto:
> Change return type of reg_read() and reg_write() callback to ssize_t for
> nvmem suppliers to return number of bytes read/written to the nvmem core.
> 
> Currently nvmem core assumes the amount of data read/written is equal
> to what it has requested from the supplier, this return code facilitates
> better error handling in the nvmem core.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
