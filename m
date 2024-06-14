Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B4908A0C
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 12:35:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB44AC6C83A;
	Fri, 14 Jun 2024 10:35:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D566BC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 10:35:24 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52b78ef397bso2885559e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 03:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718361324; x=1718966124;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gi0zKyxT3hCd9nb/MhrUUh7myaChKF1I5PdBUyc2GXs=;
 b=kiYgG05PbZ2qbMOKDmT02tDyRmfiULpUw+g00iK2VzOiLAdnIhbEmM9VcwBH35/Nlj
 LFGUW5QgNx6L4Velrz40vQmVXN4xX4qc+z8rS5AxSmwzqpJSTn9X4Z2pQd9XLylFyKe3
 3+wilHomZzFaBmuSqPP06/A/kDlef0fjCOswzeJa55+wJ1HJ3vkUOYabrf5Mia+N1tJi
 3unqSHk1ziH2PKZQn7cf6F7thu1jn+Ak/nu9X4KYIL0S37bBDU4GwrfVj6i1T+OHXOCC
 +WXJYfpsdn5Eby/qeMMr06/zIioyk/hof9cCbrq8zmRYckeCc4+VFhP9RXp2IIHQgAbZ
 6aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718361324; x=1718966124;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gi0zKyxT3hCd9nb/MhrUUh7myaChKF1I5PdBUyc2GXs=;
 b=i5TPZeaYybz+Foeg6ziulef9jVbRFmN/jgh7hhTb1CW3aHkiZIQDDDGiXqHzQWufLo
 7rPjXFJ+6TqsZhxjoMRCLOZwIn1i/vWUA8U2w5TH0A20Kc5am0hr6EsX2JwXoRviSETE
 AYB20c9/TkaEn0DyAIFgXjLkOPwhTCBiLkjZEaTIQOTrkVFT+WrUqaoaBNBAP7/hxs4Y
 3ZZz51OLityN0Te1hPh4b5P3E76UT8nuuZMskoOGhDd5J7tIJF66L3YnjmTLVSNDgLvw
 iOltf5UA7NJzXAI4wnagM4Q2ClB6WkdD9GYRaP207wLri0IubjpG+mm6E3/u3H+0ypL0
 +jQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnWisKpZlOM92UZdIAcmM2JfneghlpfxIgztsFOjotTPzAiwnWpJ3+KhmJL9EX0XFGdVuDq+2QIQJgjLXxnYJOQxfS2Zgo+2nJPNsx9+Hsj4/zMAyDzU3d
X-Gm-Message-State: AOJu0Yw3DpuIQ2TzNzQC7xNBsSLf0JNQPX528oEEoSZFFVNofg9/lvIg
 CqgSDz1maGtes6EQTM3Hwyloq4CujumcD2s4qDIoO6ex9qwYZWpfkYopqs7Dpnw=
X-Google-Smtp-Source: AGHT+IF21atwqR62ijL3XLbekBscy+usmTEKarUelgvxFuWKneWXxFSinPdGquI11kE+MEGG3syk0w==
X-Received: by 2002:ac2:4649:0:b0:52c:94ad:9b26 with SMTP id
 2adb3069b0e04-52ca0464493mr1605471e87.30.1718361324088; 
 Fri, 14 Jun 2024 03:35:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2872578sm468370e87.130.2024.06.14.03.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 03:35:23 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <mobms3s3tibh6wljulwr3okof2msvewed55ukecj3bkdfbgech@blk6udpuy5ov>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Pascal Paillet <p.paillet@foss.st.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Keerthy <j-keerthy@ti.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 09/22] dt-bindings: thermal:
 qcom-spmi-adc-tm-hc: reference thermal-sensor schema
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

On Fri, Jun 14, 2024 at 11:46:08AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml          | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
