Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3AA44FD2
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 23:23:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28602C7A848;
	Tue, 25 Feb 2025 22:23:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAED6C7A824
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740522182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CH6R1sRzoxk/zUj3ZtopK4VmGCk3VSDBS0lfMMrku4I=;
 b=HT53tQ8P5wAi5PDUhM50ERNZH9NA718Bke0z5QlMq/kb1xOdBK0jQwB6Fy4GFWOJyW/35D
 R+sAJBIsH2prz6BwhoyRkqwWV14cyfV46OczKlNOUhDxXuI8/bvub6YFIIk/wAsgJalYDW
 rryooHLAHJ4YhGBpikYbDwzuXXOZe3M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-xpwQHhb6P_6e_yD960qTxg-1; Tue,
 25 Feb 2025 17:22:57 -0500
X-MC-Unique: xpwQHhb6P_6e_yD960qTxg-1
X-Mimecast-MFC-AGG-ID: xpwQHhb6P_6e_yD960qTxg_1740522171
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0277818D95E0; Tue, 25 Feb 2025 22:22:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.79])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2CB631800357; Tue, 25 Feb 2025 22:22:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 25 Feb 2025 17:20:52 -0500
MIME-Version: 1.0
Message-Id: <20250225-memory-drm-misc-next-v1-11-9d0e8761107a@redhat.com>
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
In-Reply-To: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
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
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740522045; l=4241;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=VFSuHepnxZoSShTFjm4YohjW2HXTZolH4g28Xw0ynNs=;
 b=xiZV8EMfZ5miDBHBnqwjMdewqD2zKa22IfVa9PC4bQSOdgJnL3WWzgYHVtbMto4V4f+506Ys9
 UoHhl7v4372DFpdff/bjSqVoZg+52n2/DXSVo9lkSmWoFeNXzSGd4/5
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 11/12] drm/vc4: move to
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
VGhpcyBhbHNvIGZpeGVzIHRoZSBjb21waWxhdGlvbiBlcnJvci4KCnYzOiBEbyBub3QgY29udmVy
dCAiaGQiIHJlc291cmNlIHRvIGZvbGxvdyB0aGUgcmVzdCBvZiB0aGUKcmVmYWN0b3IuIChNYXhp
bWUpCgp2NDogZml4IGNvbXBpbGVyIGVycm9yCgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPgpDYzogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBp
LmNvbT4KQ2M6IE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+ClJldmlld2VkLWJ5OiBN
YXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEFudXNoYSBT
cml2YXRzYSA8YXNyaXZhdHNAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9oZG1pLmMgfCA1MyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9oZG1pLmMKaW5kZXggZTg3OGVkZGM5YzNmNjY5ZjI5YjA5OGQ4OTJiYWE0NjM0NDY2
MTdlZi4uZDIwZTVjNTNiYTc1ZDQzYTZmNDc4Y2Y3YWI4MzdhMDg3OGY2OGFiMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92
YzQvdmM0X2hkbWkuYwpAQCAtMjkyNiwxNSArMjkyNiwxNiBAQCBzdGF0aWMgaW50IHZjNV9oZG1p
X2luaXRfcmVzb3VyY2VzKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCiAJc3RydWN0IHJlc291cmNl
ICpyZXM7CiAJaW50IHJldDsKIAotCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUo
cGRldiwgSU9SRVNPVVJDRV9NRU0sICJoZG1pIik7Ci0JaWYgKCFyZXMpCi0JCXJldHVybiAtRU5P
REVWOwotCi0JdmM0X2hkbWktPmhkbWljb3JlX3JlZ3MgPSBkZXZtX2lvcmVtYXAoZGV2LCByZXMt
PnN0YXJ0LAotCQkJCQkgICAgICAgcmVzb3VyY2Vfc2l6ZShyZXMpKTsKKwl2YzRfaGRtaS0+aGRt
aWNvcmVfcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUocGRldiwK
KwkJCQkJCQkJCSJoZG1pIik7CiAJaWYgKCF2YzRfaGRtaS0+aGRtaWNvcmVfcmVncykKIAkJcmV0
dXJuIC1FTk9NRU07CiAKKwkvKiBUaGlzIGlzIHNoYXJlZCBiZXR3ZWVuIGJvdGggSERNSSBjb250
cm9sbGVycy4gQ2Fubm90CisJICogY2xhaW0gZm9yIGJvdGggaW5zdGFuY2VzLiBMZXRzIG5vdCBj
b252ZXJ0IHRvIHVzaW5nCisJICogZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFt
ZSgpIGxpa2UKKwkgKiB0aGUgcmVzdAorCSAqLwogCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJj
ZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJoZCIpOwogCWlmICghcmVzKQogCQlyZXR1
cm4gLUVOT0RFVjsKQEAgLTI5NDMsNTEgKzI5NDQsMzMgQEAgc3RhdGljIGludCB2YzVfaGRtaV9p
bml0X3Jlc291cmNlcyhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAogCWlmICghdmM0X2hkbWktPmhk
X3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNl
X2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgImNlYyIpOwotCWlmICghcmVzKQotCQlyZXR1
cm4gLUVOT0RFVjsKLQotCXZjNF9oZG1pLT5jZWNfcmVncyA9IGRldm1faW9yZW1hcChkZXYsIHJl
cy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7CisJdmM0X2hkbWktPmNlY19yZWdzID0gZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LAorCQkJCQkJCQkgICAiY2Vj
Iik7CiAJaWYgKCF2YzRfaGRtaS0+Y2VjX3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcmVz
ID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgImNz
YyIpOwotCWlmICghcmVzKQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCXZjNF9oZG1pLT5jc2NfcmVn
cyA9IGRldm1faW9yZW1hcChkZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7CisJ
dmM0X2hkbWktPmNzY19yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFt
ZShwZGV2LAorCQkJCQkJCQkgICAiY3NjIik7CiAJaWYgKCF2YzRfaGRtaS0+Y3NjX3JlZ3MpCiAJ
CXJldHVybiAtRU5PTUVNOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShw
ZGV2LCBJT1JFU09VUkNFX01FTSwgImR2cCIpOwotCWlmICghcmVzKQotCQlyZXR1cm4gLUVOT0RF
VjsKLQotCXZjNF9oZG1pLT5kdnBfcmVncyA9IGRldm1faW9yZW1hcChkZXYsIHJlcy0+c3RhcnQs
IHJlc291cmNlX3NpemUocmVzKSk7CisJdmM0X2hkbWktPmR2cF9yZWdzID0gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LAorCQkJCQkJCQkgICAiZHZwIik7CiAJaWYg
KCF2YzRfaGRtaS0+ZHZwX3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcmVzID0gcGxhdGZv
cm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgInBoeSIpOwotCWlm
ICghcmVzKQotCQlyZXR1cm4gLUVOT0RFVjsKKwl2YzRfaGRtaS0+cGh5X3JlZ3MgPSBkZXZtX3Bs
YXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsCisJCQkJCQkJCSAgICJwaHkiKTsK
IAotCXZjNF9oZG1pLT5waHlfcmVncyA9IGRldm1faW9yZW1hcChkZXYsIHJlcy0+c3RhcnQsIHJl
c291cmNlX3NpemUocmVzKSk7CiAJaWYgKCF2YzRfaGRtaS0+cGh5X3JlZ3MpCiAJCXJldHVybiAt
RU5PTUVNOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JF
U09VUkNFX01FTSwgInBhY2tldCIpOwotCWlmICghcmVzKQotCQlyZXR1cm4gLUVOT0RFVjsKLQot
CXZjNF9oZG1pLT5yYW1fcmVncyA9IGRldm1faW9yZW1hcChkZXYsIHJlcy0+c3RhcnQsIHJlc291
cmNlX3NpemUocmVzKSk7CisJdmM0X2hkbWktPnJhbV9yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LAorCQkJCQkJCQkgICAicGFja2V0Iik7CiAJaWYgKCF2
YzRfaGRtaS0+cmFtX3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcmVzID0gcGxhdGZvcm1f
Z2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgInJtIik7Ci0JaWYgKCFy
ZXMpCi0JCXJldHVybiAtRU5PREVWOwotCi0JdmM0X2hkbWktPnJtX3JlZ3MgPSBkZXZtX2lvcmVt
YXAoZGV2LCByZXMtPnN0YXJ0LCByZXNvdXJjZV9zaXplKHJlcykpOworCXZjNF9oZG1pLT5ybV9y
ZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAicm0iKTsK
IAlpZiAoIXZjNF9oZG1pLT5ybV9yZWdzKQogCQlyZXR1cm4gLUVOT01FTTsKIAoKLS0gCjIuNDgu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
