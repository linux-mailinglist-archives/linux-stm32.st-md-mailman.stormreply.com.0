Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819C4ACC84
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Feb 2022 00:10:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D7B8C5E2CC;
	Mon,  7 Feb 2022 23:10:05 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36DDDC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 23:10:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E373CB8172F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 23:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317DFC340F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 23:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644275402;
 bh=X55ltdzNwPy1g/p9q8Hmw02ExsfYSQ15IJvBXM3YtY0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b35MZEt7F3ub1UmW59dP/jK1FHeinkHi47vnikF6f0tn/LYxYvBlTyxSaTnh48zsw
 bj+LHNVU4kHEuS9oU7MqEOEbF9z3BTwYM0EbkbcyPMvVD/DV0DrdT35pzzpRNQcADu
 Oy4/rEvaS0eLVeS86L7tF6GhJ91h/XYPGz9RK7QGv55ktzTlvSi1Yxhv9iw5hOsyWY
 yYd5IgGp5w1C4rz4hX5sRzve4MfCRJnkiroZyRIynTp8e1riDW2zttvuWuOZbNDDn2
 0RmzMaaEUj0DTUpU/v70SKTeU4fE4cOtOBpEgY7MUx7Dg0KzrNTqszT53CTqcxcJuP
 vevjRA2C7EiJQ==
Received: by mail-ej1-f53.google.com with SMTP id k25so46264561ejp.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Feb 2022 15:10:02 -0800 (PST)
X-Gm-Message-State: AOAM530Pahl6NVWCYLBIAc5Js1GztEe7JonR8XvvP34WeFG1Qjwm+n0v
 TbkEw1jxBsRRUyiPAK1CLMxfq01UeRfWrGpBUg==
X-Google-Smtp-Source: ABdhPJzHug39pCeEURXinndAsC1Ag6qOi9HiunS1b6JUbZ+czMiULQBPsCGdREFSWexfLvxwtF92P+X+IxVE5/XVA1I=
X-Received: by 2002:a17:906:c10f:: with SMTP id
 do15mr1461761ejc.638.1644275400392; 
 Mon, 07 Feb 2022 15:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <20220126071932.32615-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20220126071932.32615-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 8 Feb 2022 07:09:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8zd6QDs3om8-oGaLJuw9OjTmak_cqbkUpVjyqCUV_LLQ@mail.gmail.com>
Message-ID: <CAAOTY_8zd6QDs3om8-oGaLJuw9OjTmak_cqbkUpVjyqCUV_LLQ@mail.gmail.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>,
 Nancy Lin <nancy.lin@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v15 05/12] dt-bindings: display: mediatek:
 merge: add additional prop for mt8195
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
MjAyMuW5tDHmnIgyNuaXpSDpgLHkuIkg5LiL5Y2IMzoxOeWvq+mBk++8mgo+Cj4gYWRkIE1FUkdF
IGFkZGl0aW9uYWwgcHJvcGVydGllcyBkZXNjcmlwdGlvbiBmb3IgbXQ4MTk1Ogo+IDEuIGFzeW5j
IGNsb2NrCj4gMi4gZmlmbyBzZXR0aW5nIGVuYWJsZQo+IDMuIHJlc2V0IGNvbnRyb2xsZXIKCkFw
cGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4Lmdp
dC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcKCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gUmV2
aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+
ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sICAgICAgfCAzOCArKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwKPiBpbmRleCA3YWE2OTc0
ZDUwOWQuLmZhZTEwNmNmMTc1MyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssbWVyZ2UueWFtbAo+IEBAIC0zNiw4ICszNiwyOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwg
Zm9yIGRldGFpbHMuCj4KPiAgICBjbG9ja3M6Cj4gKyAgICBtYXhJdGVtczogMgo+ICAgICAgaXRl
bXM6Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IE1FUkdFIENsb2NrCj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IE1FUkdFIEFzeW5jIENsb2NrCj4gKyAgICAgICAgICBDb250cm9sbGluZyB0aGUgc3lu
Y2hyb25vdXMgcHJvY2VzcyBiZXR3ZWVuIE1FUkdFIGFuZCBvdGhlciBkaXNwbGF5Cj4gKyAgICAg
ICAgICBmdW5jdGlvbiBibG9ja3MgY3Jvc3MgY2xvY2sgZG9tYWluLgo+ICsKPiArICBjbG9jay1u
YW1lczoKPiArICAgIG1heEl0ZW1zOiAyCj4gKyAgICBpdGVtczoKPiArICAgICAgLSBjb25zdDog
bWVyZ2UKPiArICAgICAgLSBjb25zdDogbWVyZ2VfYXN5bmMKPiArCj4gKyAgbWVkaWF0ZWssbWVy
Z2UtZmlmby1lbjoKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBUaGUgc2V0dGluZyBvZiBt
ZXJnZSBmaWZvIGlzIG1haW5seSBwcm92aWRlZCBmb3IgdGhlIGRpc3BsYXkgbGF0ZW5jeQo+ICsg
ICAgICBidWZmZXIgdG8gZW5zdXJlIHRoYXQgdGhlIGJhY2stZW5kIHBhbmVsIGRpc3BsYXkgZGF0
YSB3aWxsIG5vdCBiZQo+ICsgICAgICB1bmRlcnJ1biwgYSBsaXR0bGUgbW9yZSBkYXRhIGlzIG5l
ZWRlZCBpbiB0aGUgZmlmby4KPiArICAgICAgQWNjb3JkaW5nIHRvIHRoZSBtZXJnZSBmaWZvIHNl
dHRpbmdzLCB3aGVuIHRoZSB3YXRlciBsZXZlbCBpcyBkZXRlY3RlZAo+ICsgICAgICB0byBiZSBp
bnN1ZmZpY2llbnQsIGl0IHdpbGwgdHJpZ2dlciBSRE1BIHNlbmRpbmcgdWx0cmEgYW5kIHByZXVs
cmEKPiArICAgICAgY29tbWFuZCB0byBTTUkgdG8gc3BlZWQgdXAgdGhlIGRhdGEgcmF0ZS4KPiAr
ICAgIHR5cGU6IGJvb2xlYW4KPgo+ICAgIG1lZGlhdGVrLGdjZS1jbGllbnQtcmVnOgo+ICAgICAg
ZGVzY3JpcHRpb246IFRoZSByZWdpc3RlciBvZiBjbGllbnQgZHJpdmVyIGNhbiBiZSBjb25maWd1
cmVkIGJ5IGdjZSB3aXRoCj4gQEAgLTQ3LDYgKzY3LDExIEBAIHByb3BlcnRpZXM6Cj4gICAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5Cj4gICAg
ICBtYXhJdGVtczogMQo+Cj4gKyAgcmVzZXRzOgo+ICsgICAgZGVzY3JpcHRpb246IHJlc2V0IGNv
bnRyb2xsZXIKPiArICAgICAgU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZXNldC9yZXNldC50eHQgZm9yIGRldGFpbHMuCj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiAgcmVx
dWlyZWQ6Cj4gICAgLSBjb21wYXRpYmxlCj4gICAgLSByZWcKPiBAQCAtNjQsMyArODksMTYgQEAg
ZXhhbXBsZXM6Cj4gICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE3M19QT1dFUl9E
T01BSU5fTU0+Owo+ICAgICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfTUVSR0U+
Owo+ICAgICAgfTsKPiArCj4gKyAgICBtZXJnZTU6IGRpc3BfdnBwX21lcmdlNUAxYzExMDAwMCB7
Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJnZSI7Cj4g
KyAgICAgICAgcmVnID0gPDAgMHgxYzExMDAwMCAwIDB4MTAwMD47Cj4gKyAgICAgICAgaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDUwNyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Owo+ICsgICAgICAgIGNs
b2NrcyA9IDwmdmRvc3lzMSBDTEtfVkRPMV9WUFBfTUVSR0U0PiwKPiArICAgICAgICAgICAgICAg
ICA8JnZkb3N5czEgQ0xLX1ZETzFfTUVSR0U0X0RMX0FTWU5DPjsKPiArICAgICAgICBjbG9jay1u
YW1lcyA9ICJtZXJnZSIsIm1lcmdlX2FzeW5jIjsKPiArICAgICAgICBwb3dlci1kb21haW5zID0g
PCZzcG0gTVQ4MTk1X1BPV0VSX0RPTUFJTl9WRE9TWVMxPjsKPiArICAgICAgICBtZWRpYXRlayxn
Y2UtY2xpZW50LXJlZyA9IDwmZ2NlMSBTVUJTWVNfMWMxMVhYWFggMHgwMDAwIDB4MTAwMD47Cj4g
KyAgICAgICAgbWVkaWF0ZWssbWVyZ2UtZmlmby1lbiA9IDwxPjsKPiArICAgICAgICByZXNldHMg
PSA8JnZkb3N5czEgTVQ4MTk1X1ZET1NZUzFfU1cwX1JTVF9CX01FUkdFNF9ETF9BU1lOQz47Cj4g
KyAgICB9Owo+IC0tCj4gMi4xOC4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
