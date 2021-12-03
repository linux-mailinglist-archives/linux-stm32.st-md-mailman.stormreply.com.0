Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ACA466E4E
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 01:07:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB19C5F1DC;
	Fri,  3 Dec 2021 00:07:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00485C5F1D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 00:07:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D76C628F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 00:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A64C56748
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 00:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638490018;
 bh=hUUGmi1Kxjg4GVMJJk27j4s8CR+5/UrEzujzqqM7DVc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lODZkcZ6BvnOCz4O6iIV8krAEhmKF9YU38giD5x/tcmBjHGC3UagRE9v+yFJwvKCg
 vj6BIa+dluXsClTi/MxisQBtIOISTtvwatHIfILWRDwS17zmq05s5SQqKHNHB4nvNG
 J5JxyfEG+BRwHjpfqF4Hxj4PRPsQ/AbshzYRawqO+P4dJhXlv19pa/4EHR4XseSRsA
 B3ObZEF8xI3U7IwT6l9AUu8peIJdLqzRkud5+SUOpKyn0T+TEhwHhMaynBvaFn8xRq
 6BH/qAfQJ+saTZr6CJWlVOqGhYAWlwJ9fMb4Z8wNYSVxzyALMQZfhrwdwnNdYOdvcF
 dGzEVF5XoTayQ==
Received: by mail-ed1-f46.google.com with SMTP id v1so4660531edx.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 16:06:58 -0800 (PST)
X-Gm-Message-State: AOAM533U2YZHEVG6OKaXo/1DDvXaZAm9xKi2nrrpl1cABGAWpsQAzoPl
 ZyHsCKkELUGh2MEt+CDmzbfyuQAWYR5LKAaEDg==
X-Google-Smtp-Source: ABdhPJy/vfyFg8Uq9KjiNMxw9kzU+8NVCXfS+xyKdO85QAO1nUO0e3tnO/OopVm4P79WiTBhXyFZoO0samMN/lsdoo4=
X-Received: by 2002:a17:907:7f2a:: with SMTP id
 qf42mr19657908ejc.388.1638490017099; 
 Thu, 02 Dec 2021 16:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20211129184439.16892-1-jason-jh.lin@mediatek.com>
 <20211129184439.16892-11-jason-jh.lin@mediatek.com>
In-Reply-To: <20211129184439.16892-11-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 3 Dec 2021 08:06:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-edo+HagSJPxgFyYT2itXk4isbY=fnd=o6YO8kx0Ms=g@mail.gmail.com>
Message-ID: <CAAOTY_-edo+HagSJPxgFyYT2itXk4isbY=fnd=o6YO8kx0Ms=g@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v13 10/15] drm/mediatek: remove unused
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDEx5pyIMzDml6Ug6YCx5LqMIOS4iuWNiDI6NDTlr6vpgZPvvJoKPgo+IFJlbW92ZSB0
aGUgdW5zZWQgZGVmaW5lIGluIG10a19kcm1fZGRwX2NvbXAuYwoKQXBwbGllZCB0byBtZWRpYXRl
ay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRl
ay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBqYXNv
bi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMTAgLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcF9jb21wLmMKPiBpbmRleCAzNzA0ZTRiN2YzYzUuLjdkM2JkNjIxNGMxNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0y
MSw4ICsyMSw2IEBACj4gICNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCIKPgo+ICAjZGVmaW5lIERJ
U1BfT0RfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMAo+IC0jZGVmaW5lIERJ
U1BfT0RfSU5URU4gICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwOAo+IC0jZGVmaW5lIERJ
U1BfT0RfSU5UU1RBICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwYwo+ICAjZGVmaW5lIERJ
U1BfT0RfQ0ZHICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAyMAo+ICAjZGVmaW5lIERJ
U1BfT0RfU0laRSAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAzMAo+ICAjZGVmaW5lIERJ
U1BfRElUSEVSXzUgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDExNAo+IEBAIC0zOSwyNiAr
MzcsMTggQEAKPiAgI2RlZmluZSBESVRIRVJfRU5HSU5FX0VOICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoMSkKPiAgI2RlZmluZSBESVNQX0RJVEhFUl9TSVpFICAgICAgICAgICAgICAgICAgICAg
ICAweDAwMzAKPgo+IC0jZGVmaW5lIExVVF8xMEJJVF9NQVNLICAgICAgICAgICAgICAgICAgICAg
ICAgIDB4MDNmZgo+IC0KPiAgI2RlZmluZSBPRF9SRUxBWU1PREUgICAgICAgICAgICAgICAgICAg
ICAgICAgICBCSVQoMCkKPgo+ICAjZGVmaW5lIFVGT19CWVBBU1MgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJJVCgyKQo+Cj4gICNkZWZpbmUgRElTUF9ESVRIRVJJTkcgICAgICAgICAgICAg
ICAgICAgICAgICAgQklUKDIpCj4gICNkZWZpbmUgRElUSEVSX0xTQl9FUlJfU0hJRlRfUih4KSAg
ICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDI4KQo+IC0jZGVmaW5lIERJVEhFUl9PVkZMV19C
SVRfUih4KSAgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCAyNCkKPiAgI2RlZmluZSBE
SVRIRVJfQUREX0xTSElGVF9SKHgpICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjAp
Cj4gLSNkZWZpbmUgRElUSEVSX0FERF9SU0hJRlRfUih4KSAgICAgICAgICAgICAgICAgKCgoeCkg
JiAweDcpIDw8IDE2KQo+ICAjZGVmaW5lIERJVEhFUl9ORVdfQklUX01PREUgICAgICAgICAgICAg
ICAgICAgIEJJVCgwKQo+ICAjZGVmaW5lIERJVEhFUl9MU0JfRVJSX1NISUZUX0IoeCkgICAgICAg
ICAgICAgICgoKHgpICYgMHg3KSA8PCAyOCkKPiAtI2RlZmluZSBESVRIRVJfT1ZGTFdfQklUX0Io
eCkgICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMjQpCj4gICNkZWZpbmUgRElUSEVS
X0FERF9MU0hJRlRfQih4KSAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDIwKQo+IC0j
ZGVmaW5lIERJVEhFUl9BRERfUlNISUZUX0IoeCkgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3
KSA8PCAxNikKPiAgI2RlZmluZSBESVRIRVJfTFNCX0VSUl9TSElGVF9HKHgpICAgICAgICAgICAg
ICAoKCh4KSAmIDB4NykgPDwgMTIpCj4gLSNkZWZpbmUgRElUSEVSX09WRkxXX0JJVF9HKHgpICAg
ICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDgpCj4gICNkZWZpbmUgRElUSEVSX0FERF9M
U0hJRlRfRyh4KSAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDQpCj4gLSNkZWZpbmUg
RElUSEVSX0FERF9SU0hJRlRfRyh4KSAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDAp
Cj4KPiAgI2RlZmluZSBESVNQX1BPU1RNQVNLX0VOICAgICAgICAgICAgICAgICAgICAgICAweDAw
MDAKPiAgI2RlZmluZSBQT1NUTUFTS19FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEJJVCgwKQo+IC0tCj4gMi4xOC4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
