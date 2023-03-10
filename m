Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E604B6B704B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 08:50:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93EF9C6B443;
	Mon, 13 Mar 2023 07:50:20 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FAF9C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678460518; x=1709996518;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FdWrrEiVvcGV5We2oP4cFNJrwxSOXnTFkXSWK6R+KRo=;
 b=m6nGaprR4P5riPaJbS4wH6175951O3zw4yZZ3vgn+zbbVm3o86tU1dqA
 E9/uzb4Hy323VL6v2d9/5qs3P4Lr2B6OHxvIbmLEkTrtkJmtIQ3PlLQ0y
 mtlutZLdyl3rC0unuGLK0WslaVv7LtPtrg4KqZdeFZY0B9JqZWVv15k1R
 mRkbgMKXar6J1zXotM/fqxYA69U3WMuD8oIraKbAXmncDXdGAhTcxKG//
 ivA62wEIjOrtHiZC4ScDEnlUihFRdCDpAZ3CcYUdejFYtX3GeKZMZpewW
 147V6//m8+bjpD09GdJFP+1Y3SoTdMILw3+egDvZyXUEH3gomOaiuf3FE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="336764008"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="336764008"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 07:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788037593"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; d="scan'208";a="788037593"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 07:01:47 -0800
Message-ID: <a23852d7-c70c-a03c-99fb-b453bdc750a1@linux.intel.com>
Date: Fri, 10 Mar 2023 16:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20230310144732.1546328-1-robh@kernel.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230310144732.1546328-1-robh@kernel.org>
X-Mailman-Approved-At: Mon, 13 Mar 2023 07:50:17 +0000
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: Use of_property_present() for
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

On 3/10/2023 3:47 PM, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   sound/soc/codecs/lpass-macro-common.c | 2 +-
>   sound/soc/generic/audio-graph-card.c  | 2 +-
>   sound/soc/generic/audio-graph-card2.c | 2 +-
>   sound/soc/mxs/mxs-sgtl5000.c          | 2 +-
>   sound/soc/samsung/i2s.c               | 2 +-
>   sound/soc/sh/fsi.c                    | 2 +-
>   sound/soc/stm/stm32_i2s.c             | 2 +-
>   sound/soc/stm/stm32_sai_sub.c         | 4 ++--
>   sound/soc/tegra/tegra_asoc_machine.c  | 2 +-
>   9 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
> index 1b9082d237c1..f54baaad54d4 100644
> --- a/sound/soc/codecs/lpass-macro-common.c
> +++ b/sound/soc/codecs/lpass-macro-common.c
> @@ -16,7 +16,7 @@ struct lpass_macro *lpass_macro_pds_init(struct device *dev)
>   	struct lpass_macro *l_pds;
>   	int ret;
>   
> -	if (!of_find_property(dev->of_node, "power-domains", NULL))
> +	if (!of_property_present(dev->of_node, "power-domains"))
>   		return NULL;
>   
>   	l_pds = devm_kzalloc(dev, sizeof(*l_pds), GFP_KERNEL);
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index 5daa824a4ffc..d788f5f23a8a 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -78,7 +78,7 @@ static int graph_get_dai_id(struct device_node *ep)
>   		 * only of_graph_parse_endpoint().
>   		 * We need to check "reg" property
>   		 */
> -		if (of_get_property(ep,   "reg", NULL))
> +		if (of_property_present(ep,   "reg"))

Bit of nit picking, but any reason, why there are multiple spaces, 
before "reg" here?

>   			return info.id;
>   
>   		node = of_get_parent(ep);
> diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
> index 06609a526b78..259544f64df9 100644
> --- a/sound/soc/generic/audio-graph-card2.c
> +++ b/sound/soc/generic/audio-graph-card2.c
> @@ -376,7 +376,7 @@ static int graph_get_dai_id(struct device_node *ep)
>   		 * only of_graph_parse_endpoint().
>   		 * We need to check "reg" property
>   		 */
> -		if (of_get_property(ep,   "reg", NULL))
> +		if (of_property_present(ep,   "reg"))

And here?


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
