Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA491284F
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 16:46:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5DD6C7128E;
	Fri, 21 Jun 2024 14:46:58 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 408C3C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 14:46:52 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ebdfe26217so19466031fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 07:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718981208; x=1719586008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yQVb2DeThksBLy1v6heanX+uAjJHYjLCnQz2w0NHRqc=;
 b=AMeL38LI+B99hP9Rgm0ArZOSmHXAlG4Vuqwscksz4TDJqY4jmBZPVuzHjyvkCDl0yd
 mMz3WeC0hLjbhE+jzpIA6hM1SSt1PNK26/2DEMQldd4Fd3pm/QhibZyyMREMSot6p+Q9
 Zf0j9QbI84Ckn+VDHEbiNj1oT0nhRdwkWL+Y1WVZJUaIyhxkuziTHtEfEbhQ9L8kxh5h
 0Jjb6rT9Q88rCNFkctugOqfcicQ1/K2JA9JqwaFnZ6S2HWv/01rNBRF2Kj+siokqTRfa
 1oXC3I4VeNGjFxhSF70BnoQumV34ZNxzXSrz46UApxfpQ0gXlz4eYGPnyuWenxPw/uiA
 vd1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRvACNSxo75XhPZqhxuuId21ClhKMMJl/o2Ys/au9iyz5JTrQw36104k5er4RjRFm3pRnlESkvWyD+16oJIoPg5O23sVZYAN8K5Iol5WebjKPcRQd5CECj
X-Gm-Message-State: AOJu0Yza32OLjlaDU8SBkSyY3zP6vlnJC+mHHvX6mj0Hobsh9yw58t1l
 XQTpebykWOPV+z3XazY5VtIClJZSQe1LUyMwUJ5dP8jLl5tKMZ7cKFy85tUzDPo=
X-Google-Smtp-Source: AGHT+IGq38opgiP7xZE8WWBgZjoQyzJzDpG1/OFl8dK88E+7vUj3ZfsPvyxa3s/qWSg4XafTCHtZvg==
X-Received: by 2002:a2e:9612:0:b0:2ec:2ccb:8efb with SMTP id
 38308e7fff4ca-2ec3cfe8a75mr51052061fa.38.1718981208123; 
 Fri, 21 Jun 2024 07:46:48 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d708f24sm2247681fa.44.2024.06.21.07.46.47
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 07:46:47 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a6eso20564421fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 07:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkXKxVprkSAQS1euFUvLXApugxJ4l7bbwhKsSWHCHKTZe9uQlFv/oLwmRObqwsJMW6vSq9XL94ALxUm5zKNk1Lze/lMTfHs/mwlpwWj3Yg2UyNLC2uYaVF
X-Received: by 2002:a05:651c:104c:b0:2ec:5073:5816 with SMTP id
 38308e7fff4ca-2ec507358edmr10687831fa.31.1718981186574; Fri, 21 Jun 2024
 07:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 21 Jun 2024 22:46:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v65T80TH9HUpny8vK2KNrE6aYQHf4x0CAUrxKWih34TdTA@mail.gmail.com>
Message-ID: <CAGb2v65T80TH9HUpny8vK2KNrE6aYQHf4x0CAUrxKWih34TdTA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
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
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 03/22] dt-bindings: thermal: allwinner,
 sun8i-a83t-ths: reference thermal-sensor schema
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgNTo0NuKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBEZXZpY2UgaXMgYSB0aGVy
bWFsIHNlbnNvciBhbmQgaXQgcmVxdWlyZXMgJyN0aGVybWFsLXNlbnNvci1jZWxscycsIHNvCj4g
cmVmZXJlbmNlIHRoZSB0aGVybWFsLXNlbnNvci55YW1sIHRvIHNpbXBsaWZ5IGl0IGFuZCBicmlu
ZyB0aGUKPiBjb21tb24gZGVmaW5pdGlvbiBvZiAnI3RoZXJtYWwtc2Vuc29yLWNlbGxzJyBwcm9w
ZXJ0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
