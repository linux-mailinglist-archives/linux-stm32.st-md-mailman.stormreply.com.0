Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A33CD8FB7A9
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 17:42:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57B97C6B444;
	Tue,  4 Jun 2024 15:42:39 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24C8AC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 15:42:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 14AA9CE10B9;
 Tue,  4 Jun 2024 15:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB18C2BBFC;
 Tue,  4 Jun 2024 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1717515749;
 bh=gvxpfHQ65oWsKW/gpsh/uvOZGyM//B6SX2D/4rQ0Nsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1p0RL9O1txeF88r7BI4R3mZCPecX9o5eCeU291B62J/7N4Hkguvf1lfLd3cqQUs8P
 4Y1/0W4FQ0ElqLZ7UU0nmattnWlXk/Z10eyZip8sZHsKgLIIU/ogQGQB9n7FHaJ/iv
 fP0oOcb6nC636FrLvgUA+RegIdHHg80BK9dpAXYI=
Date: Tue, 4 Jun 2024 17:38:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joy Chakraborty <joychakr@google.com>
Message-ID: <2024060445-amaze-sitter-88da@gregkh>
References: <20240510082929.3792559-1-joychakr@google.com>
 <20240510082929.3792559-2-joychakr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510082929.3792559-2-joychakr@google.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rafal Milecki <rafal@milecki.pl>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, manugautam@google.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, May 10, 2024 at 08:29:29AM +0000, Joy Chakraborty wrote:
> Change return type of reg_read() and reg_write() callback to ssize_t for
> nvmem suppliers to return number of bytes read/written to the nvmem core.
> 
> Currently nvmem core assumes the amount of data read/written is equal
> to what it has requested from the supplier, this return code facilitates
> better error handling in the nvmem core.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

I thought this would be two patches, one to change the return type, and
the second to change the logic involved here (making it easier to notice
the logic changes.)  But it seems ok to me:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
