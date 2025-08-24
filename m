Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B04B8B337F9
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 09:39:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E3E9C36B1F;
	Mon, 25 Aug 2025 07:39:36 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 932AEC36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Aug 2025 19:04:49 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-55ce52718abso291759e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Aug 2025 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756062289; x=1756667089;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yqEEUlIDSc/+3KFB8fDmfBaOKciQCNwulQzIyyj/3k=;
 b=BseSgZuwyCdoLKnxvOFBY61y3k3i4AK6CPSDl3Rcn31a3ZubkwPkf3/Bh+or1TxpRN
 drbaUTraPftUc65zJxitRTfnPLr0LRhpwtN7Wb7OJvC1lJn4OdrfNO/p+LXdotqgNWhh
 1gz16I2fZkAfiD7FpS5W3Lmev9GIDvBnq/e570PqqgbdY7hDh6OSUOc2U8E25/eW90zy
 cn0MWvQYZHzsMnXsiirGZxx9A8HbbMhc5rpSRqI/edOZmYKdxnrp9gTTUGPVn0cisxXG
 KY3l9wFCVgOwPDzqVOY46MUtskj5KVXsVvOXPWdztuJiBjXLRCa1n87TfUK0vlUKVNtM
 0jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756062289; x=1756667089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6yqEEUlIDSc/+3KFB8fDmfBaOKciQCNwulQzIyyj/3k=;
 b=LAoUpp7E+yI7Id7F5dPWHzuifyqhCuAMBPqyPCmN+Xn1muO7yZGUq2mwC5YJusegv3
 5YcJWQ0b/XN8+D+jTEH+2Qa/wN5ZPrsejiw9M7NKXIgyZDIntcBqW0adFxAuJmFcSEDk
 NmnaudgvFhSGahfD483jESA8RVTCvvXgj7inqsYJ5C9kyvt6erG4yAah17v6XSpDUi+2
 SRyaNkleCHyxJ9if2Djl+r+I0DfJZCco85wAdSKNry5on266eDjrEGNViHf+43Vaqixa
 6h4gp8cyFxs6jpwl5Cc+JLX8sNYW07gEK9FIJpsQFkXRJRuExIbdy4sxDN6Nch99MAYW
 ugNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY+Bdp3giADXplhpxqcjPlaPPeKuASBHj7ncKgUi9hEN2kLH7LWGSYFmqZDQ3evS9bHqab5+x1vmCdgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLtAPEBzoXMf6c4lFTMMcmRYf5S4LL5NzepezKirMiYuR2g/79
 kbDjdAQfFRihpmq+qgCyapIiBEAiUviQ8Zcar6EsMiRu2I97LpmK7ubYL3zjmyyGsrQ=
X-Gm-Gg: ASbGncvXXPsKvW9CGzn/5asr/aswgNJU7Wwzc0DdguDDapWlMug5W3hvmWO6hjGOUKj
 Owpcx1dij3hDXFjWYnbhhRFvbHx/SM3XPOdFYbuaUoG/aDPwKJ8Rzl/TgBpsS4afsvzqKy69rMU
 7/d0XCPFVgVAexqp77E0aBJdodMF5SgbsuKpXfV7QvSt6/og5a5LRbh5SeJgrPV8FAWql2huGp7
 5O0oI7JyfxTW1tjkegseLMTO2i8XVz5BIrhHRsrMVpnA1fo30ypkOe+i5c3KXRc/GSim3OnIGwo
 dixMUfvot+lEzgNwoQr2KclZOwWgXdXcBUnSi3la758JX+Sn0www0rqd/Qmiamyd/WHVphIfw1K
 zvj2D2r3NA/y/Bi455T5pQwdVRslY4JgStb0gtLnMUP3Uf3dAP9n/P6VBJkcIBa60K9gXVCzwtb
 bf
X-Google-Smtp-Source: AGHT+IFyrm2w79r4qu/FnmHu4qBJdoxQ8tpCUb7HA7mtPlKxjeyzi9xJQ9J7AuBmZ4uek0zzq2ON9Q==
X-Received: by 2002:a05:6512:a85:b0:553:24b4:6492 with SMTP id
 2adb3069b0e04-55f0cd6ef0bmr1246189e87.5.1756062288277; 
 Sun, 24 Aug 2025 12:04:48 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi.
 [88.112.128.43]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bb4esm1204996e87.75.2025.08.24.12.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 12:04:47 -0700 (PDT)
Message-ID: <fb733991-857c-4a5b-ba20-d8bd557a4339@linaro.org>
Date: Sun, 24 Aug 2025 22:04:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar
 <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andy Walls <awalls@md.metrocast.net>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-19-eb140ddd6a9d@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250802-media-private-data-v1-19-eb140ddd6a9d@ideasonboard.com>
X-Mailman-Approved-At: Mon, 25 Aug 2025 07:39:35 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 19/65] media: camss: Replace .open() file
 operation with v4l2_fh_open()
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

Hi Jacopo, Laurent,

thank you for the nice clean-up.

On 8/2/25 12:22, Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The custom video_open() function in the camss driver open-codes the
> v4l2_fh_open() helper, with an additional mutex that protects the whole
> function. Given that the function does not modify any data guarded by
> the lock, there's no need for using the mutex and the function can be
> replaced by v4l2_fh_open().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
