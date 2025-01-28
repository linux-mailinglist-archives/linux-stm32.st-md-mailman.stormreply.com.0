Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55457A219F9
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 10:34:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52E94C78F94;
	Wed, 29 Jan 2025 09:34:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDCADC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 22:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738103584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4eOh+r5POEBIZHTbq+nHznMj04j4TeTNMfqN9ncpUe8=;
 b=TmReNdwUnlXVUYaOomhXJofQlv/4kXM4WOtNmDUwFq7VvT/EyXZTuon+z9FhqoSFBxMRtG
 kIwng5sKSl+lLrvAk6QxuTDsPZb8UEk3/JKOMOL0DTN8l9qDzGKoiWnBUveiLzrh9dN/GX
 qcRN73ASIHl1PHN0co+lK1bvcCf4WVo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-QsCovgILObm7uaxqcrUA9w-1; Tue,
 28 Jan 2025 17:33:03 -0500
X-MC-Unique: QsCovgILObm7uaxqcrUA9w-1
X-Mimecast-MFC-AGG-ID: QsCovgILObm7uaxqcrUA9w
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C4F37180188A; Tue, 28 Jan 2025 22:33:01 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.231])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6E29418008C0; Tue, 28 Jan 2025 22:32:50 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 28 Jan 2025 17:29:37 -0500
MIME-Version: 1.0
Message-Id: <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738103410; l=1689;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=4vxmIMCntNkLYWUXI5TlhVdnqmm2AsRbVZgcmO441nM=;
 b=5O8Ivj3HJZboc/7qkLN9ieN1tdgZ+256U7GLYJr170ZR/+aEj1nNMDOzAkFeg5anubD5oaxWF
 sGYOK3IPQARAgRjIsuLaaVG0kGOTrTsEWSIShMKxlngxbxGfGebRp+0
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
Subject: [Linux-stm32] [PATCH 13/14] drm/vc4: move to
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
QAotc3RydWN0IHJlc291cmNlICpyZXM7Ci4uLgotcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNl
X2J5bmFtZShwZGV2LG1lbSxuYW1lKTsKPC4uLgotaWYgKCFyZXMpIHsKLS4uLgotfQouLi4+Ci1p
b3JlbWFwID0gZGV2bV9pb3JlbWFwKC4uLik7Citpb3JlbWFwID0gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LG5hbWUpOwoKQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBh
cmRAa2VybmVsLm9yZz4KQ2M6IERhdmUgU3RldmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVy
cnlwaS5jb20+CkNjOiAiTWHDrXJhIENhbmFsIiA8bWNhbmFsQGlnYWxpYS5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFudXNoYSBTcml2YXRzYSA8YXNyaXZhdHNAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgfCA5ICsrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKaW5kZXgg
NDdkOWFkYTk4NDMwNjM0Y2ZkOGMxZTIxYzJhNGQwMGQ1MDFiYWI3ZS4uZTIyNzMzZjgxNTlhYTRi
MjQ3YTkxNWUyNGEyMzZmNjIwYmFlOTMyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zj
NC92YzRfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwpAQCAtMjk1
MSwxNSArMjk1MSwxMCBAQCBzdGF0aWMgaW50IHZjNV9oZG1pX2luaXRfcmVzb3VyY2VzKHN0cnVj
dCBkcm1fZGV2aWNlICpkcm0sCiB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHZj
NF9oZG1pLT5wZGV2OwogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Ci0Jc3RydWN0
IHJlc291cmNlICpyZXM7CiAJaW50IHJldDsKIAotCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJj
ZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJoZG1pIik7Ci0JaWYgKCFyZXMpCi0JCXJl
dHVybiAtRU5PREVWOwotCi0JdmM0X2hkbWktPmhkbWljb3JlX3JlZ3MgPSBkZXZtX2lvcmVtYXAo
ZGV2LCByZXMtPnN0YXJ0LAotCQkJCQkgICAgICAgcmVzb3VyY2Vfc2l6ZShyZXMpKTsKKwl2YzRf
aGRtaS0+aGRtaWNvcmVfcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5h
bWUocGRldiwKKwkJCQkJCQkJCSJoZG1pIik7CiAJaWYgKCF2YzRfaGRtaS0+aGRtaWNvcmVfcmVn
cykKIAkJcmV0dXJuIC1FTk9NRU07CiAKCi0tIAoyLjQ3LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
