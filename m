Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419A9BBB85
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D309C7A840;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8A4CC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730474448;
 bh=uJk5zksfhouWGMoFsDHDsI8Z9+bLS8yFcfshC7rakqQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GHyfIKEDrY9ML7tc9WCoIGPV47OSQFh43C05dV6KkyoR6m2vo/doP7LNAIMTbDxM9
 lchuGR8FMvGxcFHI67T8ePKCcrz/tgfjG2mAf416JOUKyR4DETOMlXjELTslVjtgxe
 Ca1GmZ3hTnK3ZM1YU0FBUErPV8Ok5XVwuw36FTOJau+K0H1D3S+G8YKlSoiliNndN1
 069IdUG0fbbInN/Lh7wR2N7uvDGxyRloossaANu+xllQPESC2rX2gEXaiEb+oE7PGe
 e4IYfiDV9psVm5fQVqzYPNM0r/9DAxrslLtSPedoPpO51e8XuJmWP44buY9i75RHAB
 AExaN4igeGs1w==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6298517E0F7A;
 Fri,  1 Nov 2024 16:20:45 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:23 -0400
MIME-Version: 1.0
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-1-75b81808717a@collabora.com>
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
In-Reply-To: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
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
Subject: [Linux-stm32] [PATCH 1/4] net: dt-bindings: dwmac: Introduce
 mediatek, mac-wol-noninverted
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

VGhlIG1lZGlhdGVrLG1hYy13b2wgcHJvcGVydHksIGFzIGRlc2NyaWJlZCwgd2FzIGludGVuZGVk
IHRvIGluZGljYXRlCnRoYXQgdGhlIE1BQyBzdXBwb3J0cyBXYWtlLU9uLUxBTiAoV09MKSBhbmQg
dGhhdCBpdCBzaG91bGQgYmUgdXNlZAppbnN0ZWFkIG9mIHRoZSBQSFkgV09MLiBIb3dldmVyLCB0
aGUgZHJpdmVyIGNvZGUgY3VycmVudGx5IGhhbmRsZXMgaXQKYmFja3dhcmRzOiBzZXR0aW5nIHVw
IFBIWSBXT0wgd2hlbiB0aGUgcHJvcGVydHkgaXMgcHJlc2VudCBhbmQgdmljZQp2ZXJzYS4KCklu
IG9yZGVyIHRvIHJlY3RpZnkgdGhlIHByb3BlcnR5J3MgaGFuZGxpbmcgd2hpbGUgc3RpbGwgbWFp
bnRhaW5pbmcKYmFja3dhcmRzIGNvbXBhdGliaWxpdHksIGludHJvZHVjZSBhIG5ldyBwcm9wZXJ0
eSB0byBpbmRpY2F0ZSB0aGF0IHRoZQptZWRpYXRlayxtYWMtd29sIHByb3BlcnR5IHNob3VsZCBi
ZSBoYW5kbGVkIGFzIGl0IGlzIGRlc2NyaWJlZCwgbm90CmludmVydGVkLCBhbmQgbWFrZSBpdCBy
ZXF1aXJlZCBmb3IgbmV3IERUcy4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFBy
YWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L21lZGlhdGVrLWR3bWFjLnlhbWwgfCAxMSArKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21lZGlhdGVrLWR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21lZGlhdGVrLWR3bWFjLnlhbWwKaW5kZXggZWQ5
ZDg0NWY2MDA4MDQ5NjRlMDAwMGRkNDM1NDg5ODY3M2ZhZmUwOC4uMGYyMGM0ZTA5ZTc5ZmY3MjJk
NTNhMzY0ODI1ZGEyOWJkNjMyM2MzMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbWVkaWF0ZWstZHdtYWMueWFtbApAQCAtMTI1LDYgKzEy
NSwxNSBAQCBwcm9wZXJ0aWVzOgogICAgICAgMy4gdGhlIGluc2lkZSBjbG9jaywgd2hpY2ggYmUg
c2VudCB0byBNQUMsIHdpbGwgYmUgaW52ZXJzZWQgaW4gUk1JSSBjYXNlIHdoZW4KICAgICAgICAg
IHRoZSByZWZlcmVuY2UgY2xvY2sgaXMgZnJvbSBNQUMuCiAKKyAgbWVkaWF0ZWssbWFjLXdvbC1u
b25pbnZlcnRlZDoKKyAgICB0eXBlOiBib29sZWFuCisgICAgZGVzY3JpcHRpb246CisgICAgICBQ
cmV2aW91c2x5IHRoZSBkcml2ZXIgcGFyc2VkIHRoZSBtZWRpYXRlayxtYWMtd29sIHByb3BlcnR5
IGJhY2t3YXJkcywKKyAgICAgIGVuYWJsaW5nIHRoZSBQSFkgV09MIHdoZW4gdGhlIHByb3BlcnR5
IHdhcyBwcmVzZW50LCBhbmQgdmljZSB2ZXJzYS4gVGhhdAorICAgICAgYmVoYXZpb3IgaXMga2Vw
dCBmb3IgYmFja3dhcmRzIGNvbXBhdGlsaXR5LCBidXQgbmV3ZXIgRFRzIHNob3VsZCBzcGVjaWZ5
CisgICAgICB0aGlzIHByb3BlcnR5IHRvIGhhdmUgdGhlIGRyaXZlciBoYW5kbGUgdGhlIG1lZGlh
dGVrLG1hYy13b2wgcHJvcGVydHkgYXMKKyAgICAgIGl0IGlzIGRlc2NyaWJlZCBpbiB0aGlzIGJp
bmRpbmcuCisKICAgbWVkaWF0ZWssbWFjLXdvbDoKICAgICB0eXBlOiBib29sZWFuCiAgICAgZGVz
Y3JpcHRpb246CkBAIC0xNDAsNiArMTQ5LDcgQEAgcmVxdWlyZWQ6CiAgIC0gY2xvY2stbmFtZXMK
ICAgLSBwaHktbW9kZQogICAtIG1lZGlhdGVrLHBlcmljZmcKKyAgLSBtZWRpYXRlayxtYWMtd29s
LW5vbmludmVydGVkCiAKIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKIApAQCAtMTgxLDQg
KzE5MSw1IEBAIGV4YW1wbGVzOgogICAgICAgICBzbnBzLHJ4cGJsID0gPDE+OwogICAgICAgICBz
bnBzLHJlc2V0LWdwaW8gPSA8JnBpbyA4NyBHUElPX0FDVElWRV9MT1c+OwogICAgICAgICBzbnBz
LHJlc2V0LWRlbGF5cy11cyA9IDwwIDEwMDAwIDEwMDAwPjsKKyAgICAgICAgbWVkaWF0ZWssbWFj
LXdvbC1ub25pbnZlcnRlZDsKICAgICB9OwoKLS0gCjIuNDcuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
