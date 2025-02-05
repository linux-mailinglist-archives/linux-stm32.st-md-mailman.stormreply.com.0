Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE46A29AD2
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 21:11:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98C24C78F91;
	Wed,  5 Feb 2025 20:11:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63146C78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 20:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738786285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SyjCwbf1S+bcTHNMqbzrT6yhS3x+rdZOVYONTdbbck=;
 b=REKngc2TzXy+9mENtNWxEIflFK2YqP0yIWa9LieKzsJVRZ7eBw5YFVqOyGxHAaeyd0D9hU
 s6Ac4r7hg/fNhL+e6hv9295IMUldDfrDz/0Pt4gTRcWVI17AZRKS5Lh5AlUF5WIj7uuvHt
 hE3ymfDq6RqWZ5mh7d0S5ty3mOIkwEE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-d9E0y7o3NraGgHUbSgJsdA-1; Wed,
 05 Feb 2025 15:11:24 -0500
X-MC-Unique: d9E0y7o3NraGgHUbSgJsdA-1
X-Mimecast-MFC-AGG-ID: d9E0y7o3NraGgHUbSgJsdA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 698681955F3F; Wed,  5 Feb 2025 20:11:18 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 101D519560A3; Wed,  5 Feb 2025 20:11:07 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 05 Feb 2025 15:08:07 -0500
MIME-Version: 1.0
Message-Id: <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=4051;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=cGR+PxRoxuebICENqHulDwycMVIkKhLPFIEGSESALX8=;
 b=xxdVwBWLuMEiypVjDD+SjdlJr+E3FmnnKe4+6mwyq3Jsp3b2JeAXfuUeFeYrD9tkleRyn4M2I
 gZ+0ny1k2KkDDtUMVDgoa4/Gelwzs4xPuw9i9ORgjvf4Shdft9gP0bC
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9IZPXl3bSKQNyduNFw-6Ldxg9WX3O-RGBPmnoFNUWE8_1738786278
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 11/12] drm/vc4: move to
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

UmVwbGFjZSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lICsgZGV2bV9pb3JlbWFwX3Jlc291
cmNlCndpdGgganVzdCBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKQoKVXNlZCBDb2Nj
aW5lbGxlIHRvIGRvIHRoaXMgY2hhbmdlLiBTbVBsIHBhdGNoOgovL3J1bGUgcy8oZGV2bV8pcGxh
dGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZSArCi8vKGRldm1fKWlvcmVtYXAvZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlLgpAcnVsZV8zQAppZGVudGlmaWVyIHJlczsKZXhwcmVzc2lvbiBp
b3JlbWFwOwppZGVudGlmaWVyIHBkZXY7CmNvbnN0YW50IG1lbTsKZXhwcmVzc2lvbiBuYW1lOwpA
QAotc3RydWN0IHJlc291cmNlICpyZXM7CjwrLi4uCi1yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2VfYnluYW1lKHBkZXYsbWVtLG5hbWUpOwo8Li4uCi1pZiAoIXJlcykgewotLi4uCi19Ci4uLj4K
LWlvcmVtYXAgPSBkZXZtX2lvcmVtYXAoLi4uKTsKK2lvcmVtYXAgPSBkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsbmFtZSk7Ci4uLis+Cgp2MjogQ2hhbmdlIHRoZSBT
bVBsIHBhdGNoIHRvIHdvcmsgb24gbXVsdGlwbGUgb2NjdXJlbmNlcyBvZgp0aGUgcGF0dGVybi4g
VGhpcyBhbHNvIGZpeGVzIHRoZSBjb21waWxhdGlvbiBlcnJvci4KCkNjOiBNYXhpbWUgUmlwYXJk
IDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2ZW5zb25A
cmFzcGJlcnJ5cGkuY29tPgpDYzogTWHDrXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT4KU2ln
bmVkLW9mZi1ieTogQW51c2hhIFNyaXZhdHNhIDxhc3JpdmF0c0ByZWRoYXQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyB8IDU1ICsrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwppbmRleCA0N2Q5YWRhOTg0MzA2MzRj
ZmQ4YzFlMjFjMmE0ZDAwZDUwMWJhYjdlLi4wNjZmMTI0NmRhYjQyMGVlODg5ODQ1YjBjNTczZDgw
Y2U3Yzg4NTk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCkBAIC0yOTUxLDcxICsyOTUxLDQ0IEBA
IHN0YXRpYyBpbnQgdmM1X2hkbWlfaW5pdF9yZXNvdXJjZXMoc3RydWN0IGRybV9kZXZpY2UgKmRy
bSwKIHsKIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdmM0X2hkbWktPnBkZXY7CiAJ
c3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsK
IAlpbnQgcmV0OwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJ
T1JFU09VUkNFX01FTSwgImhkbWkiKTsKLQlpZiAoIXJlcykKLQkJcmV0dXJuIC1FTk9ERVY7Ci0K
LQl2YzRfaGRtaS0+aGRtaWNvcmVfcmVncyA9IGRldm1faW9yZW1hcChkZXYsIHJlcy0+c3RhcnQs
Ci0JCQkJCSAgICAgICByZXNvdXJjZV9zaXplKHJlcykpOworCXZjNF9oZG1pLT5oZG1pY29yZV9y
ZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LAorCQkJCQkJ
CQkJImhkbWkiKTsKIAlpZiAoIXZjNF9oZG1pLT5oZG1pY29yZV9yZWdzKQogCQlyZXR1cm4gLUVO
T01FTTsKIAotCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNP
VVJDRV9NRU0sICJoZCIpOwotCWlmICghcmVzKQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCXZjNF9o
ZG1pLT5oZF9yZWdzID0gZGV2bV9pb3JlbWFwKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6
ZShyZXMpKTsKKwl2YzRfaGRtaS0+aGRfcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZV9ieW5hbWUocGRldiwgImhkIik7CiAJaWYgKCF2YzRfaGRtaS0+aGRfcmVncykKIAkJcmV0
dXJuIC1FTk9NRU07CiAKLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYs
IElPUkVTT1VSQ0VfTUVNLCAiY2VjIik7Ci0JaWYgKCFyZXMpCi0JCXJldHVybiAtRU5PREVWOwot
Ci0JdmM0X2hkbWktPmNlY19yZWdzID0gZGV2bV9pb3JlbWFwKGRldiwgcmVzLT5zdGFydCwgcmVz
b3VyY2Vfc2l6ZShyZXMpKTsKKwl2YzRfaGRtaS0+Y2VjX3JlZ3MgPSBkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsCisJCQkJCQkJCSAgICJjZWMiKTsKIAlpZiAoIXZj
NF9oZG1pLT5jZWNfcmVncykKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlyZXMgPSBwbGF0Zm9ybV9n
ZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAiY3NjIik7Ci0JaWYgKCFy
ZXMpCi0JCXJldHVybiAtRU5PREVWOwotCi0JdmM0X2hkbWktPmNzY19yZWdzID0gZGV2bV9pb3Jl
bWFwKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpKTsKKwl2YzRfaGRtaS0+Y3Nj
X3JlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsCisJCQkJ
CQkJCSAgICJjc2MiKTsKIAlpZiAoIXZjNF9oZG1pLT5jc2NfcmVncykKIAkJcmV0dXJuIC1FTk9N
RU07CiAKLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VS
Q0VfTUVNLCAiZHZwIik7Ci0JaWYgKCFyZXMpCi0JCXJldHVybiAtRU5PREVWOwotCi0JdmM0X2hk
bWktPmR2cF9yZWdzID0gZGV2bV9pb3JlbWFwKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6
ZShyZXMpKTsKKwl2YzRfaGRtaS0+ZHZwX3JlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVz
b3VyY2VfYnluYW1lKHBkZXYsCisJCQkJCQkJCSAgICJkdnAiKTsKIAlpZiAoIXZjNF9oZG1pLT5k
dnBfcmVncykKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAicGh5Iik7Ci0JaWYgKCFyZXMpCi0JCXJl
dHVybiAtRU5PREVWOworCXZjNF9oZG1pLT5waHlfcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1h
cF9yZXNvdXJjZV9ieW5hbWUocGRldiwKKwkJCQkJCQkJICAgInBoeSIpOwogCi0JdmM0X2hkbWkt
PnBoeV9yZWdzID0gZGV2bV9pb3JlbWFwKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShy
ZXMpKTsKIAlpZiAoIXZjNF9oZG1pLT5waHlfcmVncykKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQly
ZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAi
cGFja2V0Iik7Ci0JaWYgKCFyZXMpCi0JCXJldHVybiAtRU5PREVWOwotCi0JdmM0X2hkbWktPnJh
bV9yZWdzID0gZGV2bV9pb3JlbWFwKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMp
KTsKKwl2YzRfaGRtaS0+cmFtX3JlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2Vf
YnluYW1lKHBkZXYsCisJCQkJCQkJCSAgICJwYWNrZXQiKTsKIAlpZiAoIXZjNF9oZG1pLT5yYW1f
cmVncykKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Vf
YnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAicm0iKTsKLQlpZiAoIXJlcykKLQkJcmV0dXJu
IC1FTk9ERVY7Ci0KLQl2YzRfaGRtaS0+cm1fcmVncyA9IGRldm1faW9yZW1hcChkZXYsIHJlcy0+
c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7CisJdmM0X2hkbWktPnJtX3JlZ3MgPSBkZXZtX3Bs
YXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsICJybSIpOwogCWlmICghdmM0X2hk
bWktPnJtX3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCgotLSAKMi40Ny4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
