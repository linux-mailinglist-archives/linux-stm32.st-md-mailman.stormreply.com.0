Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DFA352B2
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 01:21:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F260C7A824;
	Fri, 14 Feb 2025 00:21:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F9F5C7A820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 00:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739492491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMrchSDjVXlMnzWa5wmPToNTzllJYTex21+BPUGzEBM=;
 b=id7qcXliovyFS6KGPSX8RpVuDkLDzeM1LKeqgBbG77ASXSoaIJOrq/268ZNPEu/7JKespc
 T4pUbocd71d5Y/X4+7pS23JS2i0viCJboQzbYFChS+sCXaf16wOVAt/9NRe0YKaHhwDdzA
 J/oDK7cVKpjCclZ+oKLNpQL7/7Ns3ps=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-bCj-zEa8MpmrH9j3CmeMMA-1; Thu,
 13 Feb 2025 19:21:29 -0500
X-MC-Unique: bCj-zEa8MpmrH9j3CmeMMA-1
X-Mimecast-MFC-AGG-ID: bCj-zEa8MpmrH9j3CmeMMA_1739492483
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6A42618E6952; Fri, 14 Feb 2025 00:21:23 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4D02619373C4; Fri, 14 Feb 2025 00:21:14 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 19:19:24 -0500
MIME-Version: 1.0
Message-Id: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
References: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
In-Reply-To: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739492356; l=4256;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=qNRQxkfMur7BPqwRSoUD0Y1xSb+mBLR8VcBDJdlCxGw=;
 b=ijXOEGX0OJP9agRtmiVCHuzM1ADlEbiLLq8nwfqtGrIMhF6NnUgGf9xdYkRygezmigyj/NY28
 dpk6p9JnRIbCdyD82YA5mRuUqWeRxMu9++9Uw5H3KYi2vCPipmO/YvS
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
VGhpcyBhbHNvIGZpeGVzIHRoZSBjb21waWxhdGlvbiBlcnJvci4KCnYzOiBEbyBub3QgY29udmVy
dCAiaGQiIHJlc291cmNlIHRvIGZvbGxvdyB0aGUgcmVzdCBvZiB0aGUKcmVmYWN0b3IuIChNYXhp
bWUpCgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogRGF2ZSBTdGV2
ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT4KQ2M6IE1hw61yYSBDYW5hbCA8
bWNhbmFsQGlnYWxpYS5jb20+ClNpZ25lZC1vZmYtYnk6IEFudXNoYSBTcml2YXRzYSA8YXNyaXZh
dHNAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgfCA1NCAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMK
aW5kZXggNDdkOWFkYTk4NDMwNjM0Y2ZkOGMxZTIxYzJhNGQwMGQ1MDFiYWI3ZS4uYWFjYzdhM2Fh
MDA3YTY2YzIyZjY4MTU4Mzc3ZjAyNWFkY2JiNGRmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwpA
QCAtMjk1MSwxOCArMjk1MSwxOCBAQCBzdGF0aWMgaW50IHZjNV9oZG1pX2luaXRfcmVzb3VyY2Vz
KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCiB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
diA9IHZjNF9oZG1pLT5wZGV2OwogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Ci0J
c3RydWN0IHJlc291cmNlICpyZXM7CiAJaW50IHJldDsKIAotCXJlcyA9IHBsYXRmb3JtX2dldF9y
ZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJoZG1pIik7Ci0JaWYgKCFyZXMp
Ci0JCXJldHVybiAtRU5PREVWOwotCi0JdmM0X2hkbWktPmhkbWljb3JlX3JlZ3MgPSBkZXZtX2lv
cmVtYXAoZGV2LCByZXMtPnN0YXJ0LAotCQkJCQkgICAgICAgcmVzb3VyY2Vfc2l6ZShyZXMpKTsK
Kwl2YzRfaGRtaS0+aGRtaWNvcmVfcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJj
ZV9ieW5hbWUocGRldiwKKwkJCQkJCQkJCSJoZG1pIik7CiAJaWYgKCF2YzRfaGRtaS0+aGRtaWNv
cmVfcmVncykKIAkJcmV0dXJuIC1FTk9NRU07CiAKKwkvKiBUaGlzIGlzIHNoYXJlZCBiZXR3ZWVu
IGJvdGggSERNSSBjb250cm9sbGVycy4gQ2Fubm90CisJICogY2xhaW0gZm9yIGJvdGggaW5zdGFu
Y2VzLiBMZXRzIG5vdCBjb252ZXJ0IHRvIHVzaW5nCisJICogZGV2bV9wbGF0Zm9ybV9pb3JlbWFw
X3Jlc291cmNlX2J5bmFtZSgpIGxpa2UKKwkgKiB0aGUgcmVzdAorCSAqLwogCXJlcyA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJoZCIpOwogCWlm
ICghcmVzKQogCQlyZXR1cm4gLUVOT0RFVjsKQEAgLTI5NzEsNTEgKzI5NzEsMzMgQEAgc3RhdGlj
IGludCB2YzVfaGRtaV9pbml0X3Jlc291cmNlcyhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAogCWlm
ICghdmM0X2hkbWktPmhkX3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcmVzID0gcGxhdGZv
cm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgImNlYyIpOwotCWlm
ICghcmVzKQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCXZjNF9oZG1pLT5jZWNfcmVncyA9IGRldm1f
aW9yZW1hcChkZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7CisJdmM0X2hkbWkt
PmNlY19yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LAor
CQkJCQkJCQkgICAiY2VjIik7CiAJaWYgKCF2YzRfaGRtaS0+Y2VjX3JlZ3MpCiAJCXJldHVybiAt
RU5PTUVNOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JF
U09VUkNFX01FTSwgImNzYyIpOwotCWlmICghcmVzKQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCXZj
NF9oZG1pLT5jc2NfcmVncyA9IGRldm1faW9yZW1hcChkZXYsIHJlcy0+c3RhcnQsIHJlc291cmNl
X3NpemUocmVzKSk7CisJdmM0X2hkbWktPmNzY19yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFw
X3Jlc291cmNlX2J5bmFtZShwZGV2LAorCQkJCQkJCQkgICAiY3NjIik7CiAJaWYgKCF2YzRfaGRt
aS0+Y3NjX3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jl
c291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgImR2cCIpOwotCWlmICghcmVzKQot
CQlyZXR1cm4gLUVOT0RFVjsKLQotCXZjNF9oZG1pLT5kdnBfcmVncyA9IGRldm1faW9yZW1hcChk
ZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7CisJdmM0X2hkbWktPmR2cF9yZWdz
ID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LAorCQkJCQkJCQkg
ICAiZHZwIik7CiAJaWYgKCF2YzRfaGRtaS0+ZHZwX3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwog
Ci0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01F
TSwgInBoeSIpOwotCWlmICghcmVzKQotCQlyZXR1cm4gLUVOT0RFVjsKKwl2YzRfaGRtaS0+cGh5
X3JlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsCisJCQkJ
CQkJCSAgICJwaHkiKTsKIAotCXZjNF9oZG1pLT5waHlfcmVncyA9IGRldm1faW9yZW1hcChkZXYs
IHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7CiAJaWYgKCF2YzRfaGRtaS0+cGh5X3Jl
Z3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5
bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgInBhY2tldCIpOwotCWlmICghcmVzKQotCQlyZXR1
cm4gLUVOT0RFVjsKLQotCXZjNF9oZG1pLT5yYW1fcmVncyA9IGRldm1faW9yZW1hcChkZXYsIHJl
cy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7CisJdmM0X2hkbWktPnJhbV9yZWdzID0gZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LAorCQkJCQkJCQkgICAicGFj
a2V0Iik7CiAJaWYgKCF2YzRfaGRtaS0+cmFtX3JlZ3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0J
cmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwg
InJtIik7Ci0JaWYgKCFyZXMpCi0JCXJldHVybiAtRU5PREVWOwotCi0JdmM0X2hkbWktPnJtX3Jl
Z3MgPSBkZXZtX2lvcmVtYXAoZGV2LCByZXMtPnN0YXJ0LCByZXNvdXJjZV9zaXplKHJlcykpOwor
CXZjNF9oZG1pLT5ybV9yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFt
ZShwZGV2LCAicm0iKTsKIAlpZiAoIXZjNF9oZG1pLT5ybV9yZWdzKQogCQlyZXR1cm4gLUVOT01F
TTsKIAoKLS0gCjIuNDcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
