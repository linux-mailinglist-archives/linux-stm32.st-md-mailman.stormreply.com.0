Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5C9BBB87
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71BAFC7A83E;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A52EFC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730474445;
 bh=YB8pbQNj6sLlzicHNtt6ickDj4H2tEh5oQmtt87rcZk=;
 h=From:Subject:Date:To:Cc:From;
 b=Xb8gJSgbstBOSK/9BQ/qNdVRJAMkO+jB+8cY8xGLDCs/iWp4/0Sn7UETxT3IgWsXJ
 IrwntJ4vr08+VH0IObdSPJVQeF9YX/UkJxVQCPCCtOXGxR1M2iFjXOuIA7bhEuHe4J
 NzIyKzDpnZF39yCfg2dJA4xuXz00sIuRFuYhzLuGz16wQHEReMGImHkKgdDsKUvZoL
 Q9tjLb/TvlECyDQAYZAp8cPICOow74R8tuWWYleSy54+unnKIYnPJh8elBdPamYs4Q
 DRP9GhImM/TkPVAWEdVWKn+jqVIZhNQBT5eNhAnuDxPvtjChw3r2BHNK6fBYr0kr1Y
 f48CNAojyQSCQ==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8410717E0F77;
 Fri,  1 Nov 2024 16:20:42 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:22 -0400
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALbxJGcC/x3MQQrCMBAF0KuUWTuQaWNRryIuQvLVQTuRpNRC6
 d0NLt/mbVRRFJUu3UYFi1bN1iCHjuIz2AOsqZl613sRJzwhaZjx4ilE/uY3Wza1BWVGYjmf4hi
 988dhpFZ8Cu66/vvrbd9/VYDmdG4AAAA=
X-Change-ID: 20241101-mediatek-mac-wol-noninverted-198c6c404536
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] net: stmmac: dwmac-mediatek: Fix inverted
 logic for mediatek, mac-wol
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

VGhpcyBzZXJpZXMgZml4ZXMgdGhlIGludmVydGVkIGhhbmRsaW5nIG9mIHRoZSBtZWRpYXRlayxt
YWMtd29sIERUCnByb3BlcnR5IHdoaWxlIGtlZXBpbmcgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4g
SXQgZG9lcyBzbyBieSBpbnRyb2R1Y2luZwphIG5ldyBwcm9wZXJ0eSBvbiBwYXRjaCAxIGFuZCB1
cGRhdGluZyB0aGUgZHJpdmVyIHRvIGhhbmRsZSBpdCBvbiBwYXRjaAoyLiBQYXRjaCAzIGFkZHMg
dGhpcyBwcm9wZXJ0eSBvbiB0aGUgR2VuaW8gNzAwIEVWSyBEVCwgd2hlcmUgdGhpcyBpc3N1ZQp3
YXMgbm90aWNlZCwgdG8gZ2V0IFdPTCB3b3JraW5nIG9uIHRoYXQgcGxhdGZvcm0uIFBhdGNoIDQg
YWRkcyB0aGUgbmV3CnByb3BlcnR5IG9uIGFsbCBEVHMgd2l0aCB0aGUgTWVkaWFUZWsgRFdNQUMg
ZXRoZXJuZXQgbm9kZSBlbmFibGVkCmFuZCBpbnZlcnRzIHRoZSBwcmVzZW5jZSBvZiBtZWRpYXRl
ayxtYWMtd29sIHRvIG1haW50YWluIHRoZQpjdXJyZW50IGJlaGF2aW9yIGFuZCBoYXZlIGl0IG1h
dGNoIHRoZSBkZXNjcmlwdGlvbiBpbiB0aGUgYmluZGluZy4KClNpZ25lZC1vZmYtYnk6IE7DrWNv
bGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCk7DrWNvbGFz
IEYuIFIuIEEuIFByYWRvICg0KToKICAgICAgbmV0OiBkdC1iaW5kaW5nczogZHdtYWM6IEludHJv
ZHVjZSBtZWRpYXRlayxtYWMtd29sLW5vbmludmVydGVkCiAgICAgIG5ldDogc3RtbWFjOiBkd21h
Yy1tZWRpYXRlazogSGFuZGxlIG5vbi1pbnZlcnRlZCBtZWRpYXRlayxtYWMtd29sCiAgICAgIGFy
bTY0OiBkdHM6IG1lZGlhdGVrOiBtdDgzOTAtZ2VuaW8tNzAwLWV2azogRW5hYmxlIGV0aGVybmV0
IE1BQyBXT0wKICAgICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IEFkZCBtZWRpYXRlayxtYWMtd29s
LW5vbmludmVydGVkIHRvIGV0aGVybmV0IG5vZGVzCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy55YW1sICAgICB8IDExICsrKysrKysrKysrCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210MjcxMi1ldmIuZHRzICAgICAgICAgICAgICAg
ICAgIHwgIDIgKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRz
ICAgICAgICAgICAgICAgICAgfCAgMiArKwogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgzOTAtZ2VuaW8tNzAwLWV2ay5kdHMgICAgICAgICB8ICAxICsKIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4Mzk1LWdlbmlvLTEyMDAtZXZrLmR0cyAgICAgICAgfCAgMiArLQogYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgzOTUta29udHJvbi0zLTUtc2JjLWkxMjAwLmR0
cyB8ICAyICsrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODM5NS1yYWR4YS1uaW8t
MTJsLmR0cyAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLW1lZGlhdGVrLmMgICAgICAgICAgfCAgOSArKysrKystLS0KIDggZmlsZXMgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBj
ODg0MTZiYTA3NGE4OTEzY2Y2ZDYxYjc4OWRkODM0YmJjYTY2ODFjCmNoYW5nZS1pZDogMjAyNDEx
MDEtbWVkaWF0ZWstbWFjLXdvbC1ub25pbnZlcnRlZC0xOThjNmM0MDQ1MzYKCkJlc3QgcmVnYXJk
cywKLS0gCk7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
