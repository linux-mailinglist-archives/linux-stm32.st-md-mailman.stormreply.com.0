Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5949A29AC8
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 21:10:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AD2FC78F8C;
	Wed,  5 Feb 2025 20:10:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A4B8C78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738786253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4JTcbNp+Wagg2SIneI8fYXiMNdF7Wii2BuVH7MOT/o=;
 b=WvVTljXyAxcULk7r7Al63UJt5fJIvTPU87y3GVZlRdZ+hmv2QNOUT/+C7x4gxgOhg8NFwK
 PWVbMl3ZHuUKACliuj6Aq/caKvrdEUmUk4s7VZzCvEBSLPTpjNldGZEiUbc1oaCDLUQJqP
 ryTstuWqANvdeMNfxXbzzMBQcLNp9sk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-J9TRc9eAOW-bR9FCGXQN-w-1; Wed,
 05 Feb 2025 15:10:51 -0500
X-MC-Unique: J9TRc9eAOW-bR9FCGXQN-w-1
X-Mimecast-MFC-AGG-ID: J9TRc9eAOW-bR9FCGXQN-w
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4FEF219560B9; Wed,  5 Feb 2025 20:10:46 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EAE6519560A3; Wed,  5 Feb 2025 20:10:35 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 05 Feb 2025 15:08:04 -0500
MIME-Version: 1.0
Message-Id: <20250205-mem-cocci-newapi-v1-8-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=1618;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Ic1nlkPD6Mj8TJZ8m8wZ6mlAKj2uSChvdOZ/TLjamAU=;
 b=adLjfrtU6tC9pfV0EExepCHd/cHlwcDiR8sbt1XjWIwBum8LAHOiRxCD/EMVGcFQQXziRnb29
 x8JlJrZjb8PAYAdaE1cgkvNZAkDkmELMURVlIvw+29XV+XY1nLcY9NG
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nQnk94PlWBK5kasibbdzFUwB4h89owC7mzclb_TWz1g_1738786246
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/12] drm/stm: move to
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
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsMCk7CgpDYzogWWFubmljayBGZXJ0cmUg
PHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgpDYzogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFw
aGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KQ2M6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBw
ZS5jb3JudUBmb3NzLnN0LmNvbT4KQWNrZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyYXBo
YWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbnVzaGEgU3JpdmF0
c2EgPGFzcml2YXRzQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
fCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vbHRkYy5jCmluZGV4IDU0YTczNzUzZWZmOTg5MDIwMTJjNjAxMjkxNGZhOGM2NDgyYWZm
YmQuLmJhMzE1YzY2YTA0ZDcyNzU4YjlkM2NmY2Q4NDI0MzI4NzdmNjZkM2EgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRk
Yy5jCkBAIC0xOTAwLDcgKzE5MDAsNiBAQCBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZGV2KQogCXN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsOwogCXN0cnVjdCBkcm1fY3J0YyAqY3J0
YzsKIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsKLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsK
IAlpbnQgaXJxLCBpLCBuYl9lbmRwb2ludHM7CiAJaW50IHJldCA9IC1FTk9ERVY7CiAKQEAgLTE5
NjYsOCArMTk2NSw3IEBAIGludCBsdGRjX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpCiAJ
CXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0Yyk7CiAJfQogCi0JcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKLQlsZGV2LT5yZWdzID0gZGV2bV9p
b3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsKKwlsZGV2LT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwogCWlmIChJU19FUlIobGRldi0+cmVncykpIHsKIAkJ
RFJNX0VSUk9SKCJVbmFibGUgdG8gZ2V0IGx0ZGMgcmVnaXN0ZXJzXG4iKTsKIAkJcmV0ID0gUFRS
X0VSUihsZGV2LT5yZWdzKTsKCi0tIAoyLjQ3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
