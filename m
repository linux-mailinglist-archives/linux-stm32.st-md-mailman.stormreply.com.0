Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE44D45DE15
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Nov 2021 16:53:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DFD4C597BE;
	Thu, 25 Nov 2021 15:53:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CED02C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 15:53:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00878610F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637855628;
 bh=WQKBVuM8/HahVHD2Ha+5Ib66vd148D5kd4JIoF5YXYw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NJkIymGInuducGSTAKj/FQ8gLVkz2guOuDv+NT8zNFhcLJ4OYAtEIftb7v5XFBcgX
 JZ1x/jgUqfHXU9vVfmZSYZy+b6Vg/gw9woBsTGPEL9+Vv12wpZ6iUXQIt7lCnN8yln
 0GIaZUtswzpAGLUtFCwwUNzktWCSwsj3XmnCEx1tqK4MOe/+N6++JLBF/TshxWVyZc
 Chsh5hPgEKTETRUaPkgZ17zyJMxFNCoQWkQXk9ODLTxZam0Yr7erF/f/XmtfmW/B2s
 ky4iDsYpMMQyo5zvVp/y9/lzZbQ5joAp6UYTWD9IERHDzmy6/XjtkNkO8RQSZ0RKKq
 7BH3JvLwRkKng==
Received: by mail-ed1-f43.google.com with SMTP id x6so27326146edr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 07:53:47 -0800 (PST)
X-Gm-Message-State: AOAM531UQ7Dy84Qfor52f5OuS3l+iUn8uMl8ma7KiDNDs4KH2JyoaMtI
 63sWbPbCnpX0Mz7EyZJeFg8VL5DypRY4kR7qlw==
X-Google-Smtp-Source: ABdhPJyWuSCxWweua9Qb5oiDhlo9g8K+nlZBzMrHfDLk16MCEQQl+zFjUJxBfRZ+oWeUyMxTWfL4Uc81RcQThqCEADs=
X-Received: by 2002:a17:906:79c8:: with SMTP id
 m8mr30595476ejo.511.1637855626321; 
 Thu, 25 Nov 2021 07:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
 <20211026155911.17651-12-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026155911.17651-12-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 25 Nov 2021 23:53:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY__8Bh_Me8sDYgAM4ZQiDxkz55BZyrwNuVRqxyfK79rYkg@mail.gmail.com>
Message-ID: <CAAOTY__8Bh_Me8sDYgAM4ZQiDxkz55BZyrwNuVRqxyfK79rYkg@mail.gmail.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>,
 Nancy Lin <nancy.lin@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v12 11/16] drm/mediatek: remove unused
	define in mtk_drm_ddp_comp.c
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

SGksIEphc29uOgoKV2hlbiBJIGFwcGx5IHRoaXMgcGF0Y2ggdG8gbWVkaWF0ZWstZHJtLW5leHQs
IEkgZ2V0IHRoaXMgZXJyb3I6CgpBcHBseWluZzogZHJtL21lZGlhdGVrOiByZW1vdmUgdW51c2Vk
IGRlZmluZSBpbiBtdGtfZHJtX2RkcF9jb21wLmMKZXJyb3I6IHBhdGNoIGZhaWxlZDogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYzo1MwoKUGxlYXNlIHJlYmFzZSB0
aGlzIHBhdGNoIG9udG8gbWVkaWF0ZWstZHJtLW5leHQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoK
amFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDEw5pyI
Mjbml6Ug6YCx5LqMIOS4i+WNiDExOjU55a+r6YGT77yaCj4KPiBSZW1vdmUgdGhlIHVuc2VkIGRl
ZmluZSBpbiBtdGtfZHJtX2RkcF9jb21wLmMKPgo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAxMCAtLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYwo+IGluZGV4IGYzZGI5NmExYjI0ZC4uODM5ZmZhZTMwMTljIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTIxLDggKzIx
LDYgQEAKPiAgI2luY2x1ZGUgIm10a19kcm1fY3J0Yy5oIgo+Cj4gICNkZWZpbmUgRElTUF9PRF9F
TiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwCj4gLSNkZWZpbmUgRElTUF9PRF9J
TlRFTiAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDA4Cj4gLSNkZWZpbmUgRElTUF9PRF9J
TlRTVEEgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDBjCj4gICNkZWZpbmUgRElTUF9PRF9D
RkcgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDIwCj4gICNkZWZpbmUgRElTUF9PRF9T
SVpFICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDMwCj4gICNkZWZpbmUgRElTUF9ESVRI
RVJfNSAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMTE0Cj4gQEAgLTM5LDggKzM3LDYgQEAK
PiAgI2RlZmluZSBESVRIRVJfRU5HSU5FX0VOICAgICAgICAgICAgICAgICAgICAgICBCSVQoMSkK
PiAgI2RlZmluZSBESVNQX0RJVEhFUl9TSVpFICAgICAgICAgICAgICAgICAgICAgICAweDAwMzAK
Pgo+IC0jZGVmaW5lIExVVF8xMEJJVF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDNm
Zgo+IC0KPiAgI2RlZmluZSBPRF9SRUxBWU1PREUgICAgICAgICAgICAgICAgICAgICAgICAgICBC
SVQoMCkKPgo+ICAjZGVmaW5lIFVGT19CWVBBU1MgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEJJVCgyKQo+IEBAIC01MywxOCArNDksMTIgQEAKPgo+ICAjZGVmaW5lIERJU1BfRElUSEVSSU5H
ICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgyKQo+ICAjZGVmaW5lIERJVEhFUl9MU0JfRVJS
X1NISUZUX1IoeCkgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCAyOCkKPiAtI2RlZmluZSBE
SVRIRVJfT1ZGTFdfQklUX1IoeCkgICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjQp
Cj4gICNkZWZpbmUgRElUSEVSX0FERF9MU0hJRlRfUih4KSAgICAgICAgICAgICAgICAgKCgoeCkg
JiAweDcpIDw8IDIwKQo+IC0jZGVmaW5lIERJVEhFUl9BRERfUlNISUZUX1IoeCkgICAgICAgICAg
ICAgICAgICgoKHgpICYgMHg3KSA8PCAxNikKPiAgI2RlZmluZSBESVRIRVJfTkVXX0JJVF9NT0RF
ICAgICAgICAgICAgICAgICAgICBCSVQoMCkKPiAgI2RlZmluZSBESVRIRVJfTFNCX0VSUl9TSElG
VF9CKHgpICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjgpCj4gLSNkZWZpbmUgRElUSEVS
X09WRkxXX0JJVF9CKHgpICAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDI0KQo+ICAj
ZGVmaW5lIERJVEhFUl9BRERfTFNISUZUX0IoeCkgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3
KSA8PCAyMCkKPiAtI2RlZmluZSBESVRIRVJfQUREX1JTSElGVF9CKHgpICAgICAgICAgICAgICAg
ICAoKCh4KSAmIDB4NykgPDwgMTYpCj4gICNkZWZpbmUgRElUSEVSX0xTQl9FUlJfU0hJRlRfRyh4
KSAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDEyKQo+IC0jZGVmaW5lIERJVEhFUl9PVkZM
V19CSVRfRyh4KSAgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCA4KQo+ICAjZGVmaW5l
IERJVEhFUl9BRERfTFNISUZUX0coeCkgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCA0
KQo+IC0jZGVmaW5lIERJVEhFUl9BRERfUlNISUZUX0coeCkgICAgICAgICAgICAgICAgICgoKHgp
ICYgMHg3KSA8PCAwKQo+Cj4gIHN0cnVjdCBtdGtfZGRwX2NvbXBfZGV2IHsKPiAgICAgICAgIHN0
cnVjdCBjbGsgKmNsazsKPiAtLQo+IDIuMTguMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
