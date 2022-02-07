Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDDD4ACC83
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Feb 2022 00:09:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CCF9C5E2C5;
	Mon,  7 Feb 2022 23:09:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C617BC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 23:09:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A208860B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 23:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E556C340F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 23:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644275376;
 bh=fy67XNlfUJrOzDkN7wHfeOhocEh0q0yDRq3ETbbXHtg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EXKH2ArpThS7H8A8/Q2zoSm8hsUAitDcof6/lrVcHzfavkafpqgf9loCL0QYWi3CX
 XEUJ1DNiKMpoJKgWRLHkFWFJiOHQgG2Q0pK10jcne7gGNuTuYcKq+fpUAvJzEwpa99
 k262CWquj8chiseoGmptlMZNo5NnSJkPscUXcjjGidKDENTGqOQc4nBQKZvGMjPi+k
 qIwbQANtHigpXr+qAvDUKAEQzv2RcTlM9GIr4aB4LMITqp/bwxrk70Vu/ULyA3Hjxn
 kkeLEoRoGx9OFMHJ7JCveFHAkibxWBvQ/zOj49ONPiEmukM3mxRQtjg2rFLWVAVt7B
 DKXQFoaVsDymA==
Received: by mail-ed1-f46.google.com with SMTP id cn6so10805179edb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Feb 2022 15:09:36 -0800 (PST)
X-Gm-Message-State: AOAM532KT2SbRA/NjRIiXnwZZUEYeJ2k2bAwzMu2c7UBf1PbqWsvVJrz
 z7iPqF7GFYEV+d+QYF0fDUIjce7txD5kJZMiwA==
X-Google-Smtp-Source: ABdhPJyizGp1sBtLlSMdCLxQdjqEzCe7yhHi6Gz9O8lrHqMrtd/akuCjMrAOXiWfaEPJ+hbTrb2OCazxb+9h9qbXHiU=
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr1716800edo.131.1644275374664; 
 Mon, 07 Feb 2022 15:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <20220126071932.32615-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20220126071932.32615-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 8 Feb 2022 07:09:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY__SLgV_Bd-uMg8+ebbUWdpkq6SyyqfwEGguXVR9afXRJQ@mail.gmail.com>
Message-ID: <CAAOTY__SLgV_Bd-uMg8+ebbUWdpkq6SyyqfwEGguXVR9afXRJQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v15 04/12] dt-bindings: display: mediatek:
 dsc: add yaml for mt8195 SoC binding
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

IEhpLCBKYXNvbjoKCmphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4g5pa8
IDIwMjLlubQx5pyIMjbml6Ug6YCx5LiJIOS4i+WNiDM6MTnlr6vpgZPvvJoKPgo+IDEuIEFkZCBt
ZWRpYXRlayxkc2MueWFtbCB0byBkZXNjcmliZSBEU0MgbW9kdWxlIGluIGRldGFpbHMuCj4gMi4g
QWRkIG10ODE5NSBTb0MgYmluZGluZyB0byBtZWRpYXRlayxkc2MueWFtbC4KCkFwcGxpZWQgdG8g
bWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9
bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcKCj4KPiBTaWduZWQtb2ZmLWJ5
OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IC0tLQo+ICAuLi4vZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFtbCAgICAgICAgfCA3MSArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkc2MueWFtbAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNj
LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMWVjMDgz
ZWZmODI0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sCj4gQEAgLTAsMCArMSw3
MSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwjCj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0
bGU6IG1lZGlhdGVrIGRpc3BsYXkgRFNDIGNvbnRyb2xsZXIKPiArCj4gK21haW50YWluZXJzOgo+
ICsgIC0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gKyAgLSBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+ICsKPiArZGVzY3JpcHRpb246IHwK
PiArICBUaGUgRFNDIHN0YW5kYXJkIGlzIGEgc3BlY2lmaWNhdGlvbiBvZiB0aGUgYWxnb3JpdGht
cyB1c2VkIGZvcgo+ICsgIGNvbXByZXNzaW5nIGFuZCBkZWNvbXByZXNzaW5nIGltYWdlIGRpc3Bs
YXkgc3RyZWFtcywgaW5jbHVkaW5nCj4gKyAgdGhlIHNwZWNpZmljYXRpb24gb2YgdGhlIHN5bnRh
eCBhbmQgc2VtYW50aWNzIG9mIHRoZSBjb21wcmVzc2VkCj4gKyAgdmlkZW8gYml0IHN0cmVhbS4g
RFNDIGlzIGRlc2lnbmVkIGZvciByZWFsLXRpbWUgc3lzdGVtcyB3aXRoCj4gKyAgcmVhbC10aW1l
IGNvbXByZXNzaW9uLCB0cmFuc21pc3Npb24sIGRlY29tcHJlc3Npb24gYW5kIERpc3BsYXkuCj4g
Kwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBvbmVPZjoKPiArICAgICAg
LSBpdGVtczoKPiArICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1kaXNwLWRzYwo+
ICsKPiArICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBpbnRlcnJ1cHRzOgo+ICsg
ICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgY2xvY2tzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IERTQyBXcmFwcGVyIENsb2NrCj4gKwo+ICsgIHBvd2VyLWRvbWFpbnM6Cj4g
KyAgICBkZXNjcmlwdGlvbjogQSBwaGFuZGxlIGFuZCBQTSBkb21haW4gc3BlY2lmaWVyIGFzIGRl
ZmluZWQgYnkgYmluZGluZ3Mgb2YKPiArICAgICAgdGhlIHBvd2VyIGNvbnRyb2xsZXIgc3BlY2lm
aWVkIGJ5IHBoYW5kbGUuIFNlZQo+ICsgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwgZm9yIGRldGFpbHMuCj4gKwo+ICsgIG1lZGlh
dGVrLGdjZS1jbGllbnQtcmVnOgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFRoZSByZWdp
c3RlciBvZiBjbGllbnQgZHJpdmVyIGNhbiBiZSBjb25maWd1cmVkIGJ5IGdjZSB3aXRoIDQgYXJn
dW1lbnRzCj4gKyAgICAgIGRlZmluZWQgaW4gdGhpcyBwcm9wZXJ0eSwgc3VjaCBhcyBwaGFuZGxl
IG9mIGdjZSwgc3Vic3lzIGlkLAo+ICsgICAgICByZWdpc3RlciBvZmZzZXQgYW5kIHNpemUuCj4g
KyAgICAgIEVhY2ggc3Vic3lzIGlkIGlzIG1hcHBpbmcgdG8gYSBiYXNlIGFkZHJlc3Mgb2YgZGlz
cGxheSBmdW5jdGlvbiBibG9ja3MKPiArICAgICAgcmVnaXN0ZXIgd2hpY2ggaXMgZGVmaW5lZCBp
biB0aGUgZ2NlIGhlYWRlcgo+ICsgICAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2djZS88Y2hpcD4t
Z2NlLmguCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFu
ZGxlLWFycmF5Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21w
YXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGludGVycnVwdHMKPiArICAtIHBvd2VyLWRvbWFpbnMK
PiArICAtIGNsb2Nrcwo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtl
eGFtcGxlczoKPiArICAtIHwKPiArCj4gKyAgICBkc2MwOiBkaXNwX2RzY193cmFwQDFjMDA5MDAw
IHsKPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1kaXNwLWRzYyI7Cj4g
KyAgICAgICAgcmVnID0gPDAgMHgxYzAwOTAwMCAwIDB4MTAwMD47Cj4gKyAgICAgICAgaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDY0NSBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Owo+ICsgICAgICAgIHBv
d2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZET1NZUzA+Owo+ICsgICAg
ICAgIGNsb2NrcyA9IDwmdmRvc3lzMCBDTEtfVkRPMF9EU0NfV1JBUDA+Owo+ICsgICAgICAgIG1l
ZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZnY2UxIFNVQlNZU18xYzAwWFhYWCAweDkwMDAgMHgx
MDAwPjsKPiArICAgIH07Cj4gLS0KPiAyLjE4LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
