Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 009EC908A12
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 12:35:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B617FC6C83A;
	Fri, 14 Jun 2024 10:35:37 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41945C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 10:35:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52c7f7fdd24so2594505e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718361335; x=1718966135;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
 b=JFgjiaOgZ5BZ5x0OxLNsJl6lUhaMTc/usw6LO8Ehhl1lTAtozCX8uK79LfetrrwPMi
 zKspx/va/7gWQC4Ol/mSiVFwsj+4YxP8mcZ9O46bZLGW6cMqmd74Hp+c54ZIdWGY9hQu
 ynodWTLyJnde9kdkLkteTlSIpm7jI2bqt/jVkOsO82fvLkPj6OfwlLw5maLCwSn22bWP
 ib2bLUU6XMBN7Z+442VZrwkYw70wkdzVfpFn2lp14C6IyZ7x/CCgDzKv6rQ5KRPsHQs5
 gD1NMfWQm27wcDFlat2zAjy1C1Givx4oV8xwCY3k9JBIoscAZ69csYWJO0x5AdKzGFXu
 cT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718361335; x=1718966135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
 b=IlygvAZqNWM9WyycZMApAgRuP7dcBbqy//Lh7iVyoP1SYbn5HLtLXAEnLC/VYsva0D
 I9EpPFQzjQGcCwOFc2D5V14mf2gLwmekS9ICfxTWZ/wIrLRQW4dmUcg6QuucRkCHNL8A
 2DE85ArJnDb8EJdZVD2uM+q+CKwgdRKQF9QG6v+BCnTRNpSFIE+3mQm2cxsABVtyIKch
 /K1naOwjr6gLJiI7xuvYjBflXgVyFwb8ds4aN9Rngt0gsbs+HMGl2+KtDU8sLaW13tMW
 plV987tzPv3B6XmuVmK0538C+ODZbqfPAW3tUTAO/zqg6LPlYwInlvJa/Rc5Uv9pljrN
 5eUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQTJqF/Eiq6wvsqVGkxOoTO3Te2FERh/G5RK0ZyfgOYwSoxqcO9Y3Bp+wd0eROUEVg5jYSFer3mUhqgT1UEoCQVmzheoIx7/jcGiIkC5Z558HhciQd/cFF
X-Gm-Message-State: AOJu0YzyCt5g2g2QfsqUJ3JQqLR2hf0mg9wsZvUOlavPwnpB81acDulZ
 gzwvq7lU0zOhxYyxK86jDfUMxbaE2Lh3sYHGms8CZ0XgnA9e+8U3c7+p9z7xp0A=
X-Google-Smtp-Source: AGHT+IG9296cngTsNvss2HWOM7KAlI/jj4Qy+Im6Q+mlyoACYXVlropKfCXjXHH3MK5suUqtTVw77g==
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id
 2adb3069b0e04-52ca6e999e7mr1289070e87.67.1718361335571; 
 Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2888363sm467688e87.278.2024.06.14.03.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <os5vrqh7usscb2lmvwpzcea3uu2k2gbhhbfolwgoc7mc2tdjah@pt5ckx2gbfo7>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH 10/22] dt-bindings: thermal:
 qcom-spmi-adc-tm5: reference thermal-sensor schema
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

On Fri, Jun 14, 2024 at 11:46:09AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 8 +++-----
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
