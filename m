Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D65DA219F6
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 10:34:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFB12C78F83;
	Wed, 29 Jan 2025 09:34:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52A1CC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 22:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738103519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FT+LB9XyHtC4Gj89X2CISx5zHalQ981h59ZAU2H883M=;
 b=E+keLimP4dRH6HbIWcnza+oaVjeS7X6rh6NKQUvVsu6+hXWerGYW0pZjdXhqb6cjC8cULm
 aYOlNk6fP8ffurtbrr5nZNOQXe9WXmS0+8Ig6yejl2VunSm1nvA167OjLAxEv1fou9Zru8
 l//tt/OP/jmCYno5Csp4LbWgOZ6vvu4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-s61KXQT9N4ykQm5iu3s2Lw-1; Tue,
 28 Jan 2025 17:31:56 -0500
X-MC-Unique: s61KXQT9N4ykQm5iu3s2Lw-1
X-Mimecast-MFC-AGG-ID: s61KXQT9N4ykQm5iu3s2Lw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EEF3019560B0; Tue, 28 Jan 2025 22:31:53 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.231])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D4F2818008DC; Tue, 28 Jan 2025 22:31:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 28 Jan 2025 17:29:31 -0500
MIME-Version: 1.0
Message-Id: <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738103410; l=1654;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ajXPI9xB0Rs31Rc4x9qTz/uAYXcdrRjutTTRm1keGG4=;
 b=LDffY/YSoJthJibzS51SC42ZXvZrbp2ayc7zabHlWIb3613ZhwERUpoDhV+XXcJIzmp40r+tI
 M92TihMbvZQAPKQMCFEl20B8k7s+n0MjBVXZT6Ras5dWx8LX3W0QmuA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mailman-Approved-At: Wed, 29 Jan 2025 09:34:43 +0000
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/14] drm/rockchip: move to
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

UmVwbGFjZSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UgKyBkZXZtX2lvcmVtYXBfcmVzb3VyY2UKd2l0
aCBqdXN0IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpCgpVc2VkIENvY2NpbmVsbGUg
dG8gZG8gdGhpcyBjaGFuZ2UuIFNtUGwgcGF0Y2g6CkBydWxlXzFACmlkZW50aWZpZXIgcmVzOwpl
eHByZXNzaW9uIGlvcmVtYXBfcmVzOwppZGVudGlmaWVyIHBkZXY7CkBACi1zdHJ1Y3QgcmVzb3Vy
Y2UgKnJlczsKLi4uCi1yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwuLi4pOwotaW9y
ZW1hcF9yZXMgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoLi4uKTsKK2lvcmVtYXBfcmVzID0gZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsMCk7CgpDYzogU2FuZHkgSHVhbmcgPGhq
Y0Byb2NrLWNoaXBzLmNvbT4KQ2M6IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+CkNj
OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+ClNpZ25lZC1vZmYtYnk6IEFudXNo
YSBTcml2YXRzYSA8YXNyaXZhdHNAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2Nr
Y2hpcF9kcm1fdm9wLmMKaW5kZXggNTc3NDdmMWNmZjI2ZTQ0NGVmMzU2OTk4M2Q2YTdmNzkyMmYw
M2ZmNy4uNGM2MzlmN2M4Njg5MDdmYzM1Y2UyMmYyZWY3ZTI4MWFkODVjMmQ5ZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCkBAIC0yMTg3LDcgKzIxODcs
NiBAQCBzdGF0aWMgaW50IHZvcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCWNvbnN0IHN0cnVjdCB2b3BfZGF0YSAqdm9wX2RhdGE7
CiAJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkYXRhOwogCXN0cnVjdCB2b3AgKnZvcDsK
LQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAlpbnQgcmV0LCBpcnE7CiAKIAl2b3BfZGF0YSA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwpAQCAtMjIwNyw4ICsyMjA2LDcgQEAgc3RhdGlj
IGludCB2b3BfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwg
dm9pZCAqZGF0YSkKIAogCXZvcF93aW5faW5pdCh2b3ApOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKLQl2b3AtPnJlZ3MgPSBkZXZtX2lv
cmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOworCXZvcC0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9y
ZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJSKHZvcC0+cmVncykpCiAJCXJldHVy
biBQVFJfRVJSKHZvcC0+cmVncyk7CiAJdm9wLT5sZW4gPSByZXNvdXJjZV9zaXplKHJlcyk7Cgot
LSAKMi40Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
