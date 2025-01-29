Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED5A21DC4
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 14:18:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A72DAC78026;
	Wed, 29 Jan 2025 13:18:20 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56954C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 13:18:13 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-305d840926fso55994621fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 05:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1738156692; x=1738761492;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
 b=HioTASRjEHCT4s6ciwgNonik/BbRFZ7x9MfIPyFsg8Gwyl1vvYc7dTH+n11vosfbqE
 0qXYwj1g8NFpsXOrliPkirui7iqpOjSXs6WSAD4t7eYsuG3wgIG7XyZj+cFU8mipwQWP
 Dkpj50gCA3Bljx4VBLMlEkuo6DPo5l/wAFoxuJxb1oAkA9zM2mf17nrow8AdsRUB6uit
 c7VN+yXYqMl9m6MOg8ONfbcl9f27ATeC83HiFRjoQiuKUUfak34Mx4XQVk9Hc5QWdTaO
 srJccY4V5Mz/c0zPEcGCicv3rzDwgXt+/lxks7QiJfMWBsCig2ri7QJINcw9Oy/ujmJD
 6ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738156692; x=1738761492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
 b=knZXNuO1uSiedrOEzbrX77xAhT1LVIHGr57skPi3LNDdfr1rEIW9QjFqBuzTIyCsiU
 5+WMyacDli+vrILVL0+olchdrXsfOguZf87CUaRxOQP/Bi3TB0onz5GQT6LYPZ8EnBFY
 DAgdV9Cgd2lxYtTXZcTU948+ShMrAjnH4KSUM0aNXhkELO4s8RZRMD2+uo+ldvj+w8NH
 0+ArILBe6jI76BlUugql5dQaBI+Qpun72C5bMeayN7DffV0fT1rBpyp5W5FrjqbkK/k5
 nBSgQyR7lFwEiSTnYStfriV8dqVqmK3KAPHvP/DfGPF5aGt3Ks2sIfeMfspNOJKYHxaJ
 wvbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVHFbT1Bi6pCj09tKJVxkPuSg15sEc1rl6WqyMn+XvOAElL3G7FipsIVPzYYyzAg9k3a9Tk3dybP5/vw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvMFmZr9GfGvBKpXxHhZiify49ULMA4EWIDnljugZDRf4xC/7m
 IQ0BZlCrvePX3FGcVzbiAlC1mL+ViMpj8DVRfX7tONCHZJzPvtnY2PU1TRSfKst5Z3xDvWmKBut
 6oo2Sjf5cD1IPqKWMKDX47CXetELYQ6+z5nMkKA==
X-Gm-Gg: ASbGncuQuqZXQcsIQJiCnTlhQlaO7KPhWYLQHG7BLkFBPPRO0QTulpoMOFO1155H62m
 IKa+CD7IRQArfAG0zZT6Tv8hQFJB+R6RoMIDShbTWBIsUjFwETuRAI+31nLNXJDda6+mqdwQzlL
 VVslW3LTsQoShxe/IO4D3PBSJUnNGY
X-Google-Smtp-Source: AGHT+IGFRC+m+r/a8Okn6oewxCN7IKGCsP32ORqURIUMiUOfm5o7kOj6AXMqnFWDbj2MV05dJpu5VXuc2FEJhvoxCWI=
X-Received: by 2002:a2e:be9c:0:b0:307:2bc6:5eb4 with SMTP id
 38308e7fff4ca-307968bfa7bmr8911111fa.3.1738156692452; Wed, 29 Jan 2025
 05:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jan 2025 13:17:54 +0000
X-Gm-Features: AWEUYZktkNT_EsHcnViFnfugP1naRJeQlMuaRyszOFwlglEWr7DXeU7KaxFISbw
Message-ID: <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: imx@lists.linux.dev, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 13/14] drm/vc4: move to
	devm_platform_ioremap_resource() usage
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQW51c2hhCgpPbiBUdWUsIDI4IEphbiAyMDI1IGF0IDIyOjMzLCBBbnVzaGEgU3JpdmF0c2Eg
PGFzcml2YXRzQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gUmVwbGFjZSBwbGF0Zm9ybV9nZXRfcmVz
b3VyY2VfYnluYW1lICsgZGV2bV9pb3JlbWFwX3Jlc291cmNlCj4gd2l0aCBqdXN0IGRldm1fcGxh
dGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpCj4KPiBVc2VkIENvY2NpbmVsbGUgdG8gZG8gdGhpcyBj
aGFuZ2UuIFNtUGwgcGF0Y2g6Cj4gLy9ydWxlIHMvKGRldm1fKXBsYXRmb3JtX2dldF9yZXNvdXJj
ZV9ieW5hbWUgKwo+IC8vKGRldm1fKWlvcmVtYXAvZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291
cmNlLgo+IEBydWxlXzNACj4gaWRlbnRpZmllciByZXM7Cj4gZXhwcmVzc2lvbiBpb3JlbWFwOwo+
IGlkZW50aWZpZXIgcGRldjsKPiBjb25zdGFudCBtZW07Cj4gZXhwcmVzc2lvbiBuYW1lOwo+IEBA
Cj4gLXN0cnVjdCByZXNvdXJjZSAqcmVzOwo+IC4uLgo+IC1yZXMgPSBwbGF0Zm9ybV9nZXRfcmVz
b3VyY2VfYnluYW1lKHBkZXYsbWVtLG5hbWUpOwo+IDwuLi4KPiAtaWYgKCFyZXMpIHsKPiAtLi4u
Cj4gLX0KPiAuLi4+Cj4gLWlvcmVtYXAgPSBkZXZtX2lvcmVtYXAoLi4uKTsKPiAraW9yZW1hcCA9
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUocGRldixuYW1lKTsKPgo+IENj
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IERhdmUgU3RldmVuc29u
IDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5jb20+Cj4gQ2M6ICJNYcOtcmEgQ2FuYWwiIDxt
Y2FuYWxAaWdhbGlhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVzaGEgU3JpdmF0c2EgPGFzcml2
YXRzQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyB8
IDkgKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCj4gaW5kZXggNDdkOWFkYTk4NDMwNjM0Y2Zk
OGMxZTIxYzJhNGQwMGQ1MDFiYWI3ZS4uZTIyNzMzZjgxNTlhYTRiMjQ3YTkxNWUyNGEyMzZmNjIw
YmFlOTMyYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKPiBAQCAtMjk1MSwxNSArMjk1MSwx
MCBAQCBzdGF0aWMgaW50IHZjNV9oZG1pX2luaXRfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0sCj4gIHsKPiAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB2YzRf
aGRtaS0+cGRldjsKPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4g
LSAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKPiAgICAgICAgIGludCByZXQ7Cj4KPiAtICAg
ICAgIHJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9N
RU0sICJoZG1pIik7Cj4gLSAgICAgICBpZiAoIXJlcykKPiAtICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9ERVY7Cj4gLQo+IC0gICAgICAgdmM0X2hkbWktPmhkbWljb3JlX3JlZ3MgPSBkZXZtX2lv
cmVtYXAoZGV2LCByZXMtPnN0YXJ0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVzb3VyY2Vfc2l6ZShyZXMpKTsKPiArICAgICAgIHZjNF9oZG1pLT5o
ZG1pY29yZV9yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJoZG1pIik7CgpXaGlsc3QgSSB0b3RhbGx5IGFncmVlIHdpdGgg
dGhpcyBjaGFuZ2UsIHdoeSB3YXMgb25seSBvbmUgb2YgdGhlIDgKaW5zdGFuY2VzIG9mIHRoaXMg
cGF0dGVybiB3aXRoaW4gdGhpcyBmdW5jdGlvbiB1cGRhdGVkPyBJcyB0aGF0IGEKbGltaXRhdGlv
biBpbiB5b3VyIHNjcmlwdD8KaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2Iv
bWFzdGVyL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyNMMjk1Ny1MMzAyMAoKICBEYXZl
Cgo+ICAgICAgICAgaWYgKCF2YzRfaGRtaS0+aGRtaWNvcmVfcmVncykKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07Cj4KPgo+IC0tCj4gMi40Ny4wCj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
