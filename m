Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A639BBB81
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65909C7A83C;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6E1AC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 15:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730474450;
 bh=mA2I+V0jmE17nosO27KRVAzP6b9TsoO1O+RYOl7x5tc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Y6PuDibA13Tiu/mFj6sgHUpKPAIZJdUJxCO/uPujAaU2EeIKxpEmwVP5d58+fpCdn
 ay+DGk3S2NfTPu/cjgC82GD3HI9bzw8nOZsYKrMSdJaE5YdkJ6ODkw8jOFgKCEu5T5
 qm9A2r7sVWlQOq4yxmMt0rk5H3RNVjCPElM9HlaBUQkajhLnvt409XRaTFoLSKHIIl
 2xt5PXmZs0e33pxFNPOV+1/YRK9c7cFgxbt2x/G1xA1Tu+YqIlFHnukg0YvvDF0Nvz
 Z+I3MgRVghYEe5k4Ph103d5ZjUpc68IgHSUVqR2ehSTyplxKgfE2oUW9j3obfSO7YX
 ahIwVx8EyWEVA==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A6A017E0F80;
 Fri,  1 Nov 2024 16:20:48 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:24 -0400
MIME-Version: 1.0
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-2-75b81808717a@collabora.com>
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
Subject: [Linux-stm32] [PATCH 2/4] net: stmmac: dwmac-mediatek: Handle
 non-inverted mediatek, mac-wol
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

UGFyc2UgdGhlIG5ld2x5IGludHJvZHVjZWQgbWVkaWF0ZWssbWFjLXdvbC1ub25pbnZlcnRlZCBE
VCBwcm9wZXJ0eSBhbmQKdXNlIGl0IHRvIGRldGVybWluZSBob3cgdGhlIG1lZGlhdGVrLG1hYy13
b2wgcHJvcGVydHkgc2hvdWxkIGJlCmludGVycHJldGVkIGZvciBlbmFibGluZyB0aGUgTUFDIFdP
TCBvciB0aGUgUEhZIFdPTC4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYyBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMKaW5kZXggZjhjYTgxNjc1
NDA3YWRlNzg2ZjJiOWEzOGM2MzUxMWEwYjdmYjcwNS4uZjMyNTViODQxOTUzODlkNzNjNmY2NTQy
ZjUxZjk2MmI4N2E1Y2I0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jCkBAIC04NSw2ICs4NSw3IEBAIHN0cnVjdCBtZWRp
YXRla19kd21hY19wbGF0X2RhdGEgewogCWJvb2wgcm1paV9jbGtfZnJvbV9tYWM7CiAJYm9vbCBy
bWlpX3J4YzsKIAlib29sIG1hY193b2w7CisJYm9vbCBtYWNfd29sX25vbmludmVydGVkOwogfTsK
IAogc3RydWN0IG1lZGlhdGVrX2R3bWFjX3ZhcmlhbnQgewpAQCAtNDkzLDYgKzQ5NCw3IEBAIHN0
YXRpYyBpbnQgbWVkaWF0ZWtfZHdtYWNfY29uZmlnX2R0KHN0cnVjdCBtZWRpYXRla19kd21hY19w
bGF0X2RhdGEgKnBsYXQpCiAJcGxhdC0+cm1paV9yeGMgPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wo
cGxhdC0+bnAsICJtZWRpYXRlayxybWlpLXJ4YyIpOwogCXBsYXQtPnJtaWlfY2xrX2Zyb21fbWFj
ID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKHBsYXQtPm5wLCAibWVkaWF0ZWsscm1paS1jbGstZnJv
bS1tYWMiKTsKIAlwbGF0LT5tYWNfd29sID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKHBsYXQtPm5w
LCAibWVkaWF0ZWssbWFjLXdvbCIpOworCXBsYXQtPm1hY193b2xfbm9uaW52ZXJ0ZWQgPSBvZl9w
cm9wZXJ0eV9yZWFkX2Jvb2wocGxhdC0+bnAsICJtZWRpYXRlayxtYWMtd29sLW5vbmludmVydGVk
Iik7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTU4OCwxMCArNTkwLDExIEBAIHN0YXRpYyBpbnQgbWVk
aWF0ZWtfZHdtYWNfY29tbW9uX2RhdGEoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAlp
bnQgaTsKIAogCXBsYXQtPm1hY19pbnRlcmZhY2UgPSBwcml2X3BsYXQtPnBoeV9tb2RlOwotCWlm
IChwcml2X3BsYXQtPm1hY193b2wpCi0JCXBsYXQtPmZsYWdzIHw9IFNUTU1BQ19GTEFHX1VTRV9Q
SFlfV09MOwotCWVsc2UKKwlpZiAoKHByaXZfcGxhdC0+bWFjX3dvbF9ub25pbnZlcnRlZCAmJiBw
cml2X3BsYXQtPm1hY193b2wpIHx8CisJICAgICghcHJpdl9wbGF0LT5tYWNfd29sX25vbmludmVy
dGVkICYmICFwcml2X3BsYXQtPm1hY193b2wpKQogCQlwbGF0LT5mbGFncyAmPSB+U1RNTUFDX0ZM
QUdfVVNFX1BIWV9XT0w7CisJZWxzZQorCQlwbGF0LT5mbGFncyB8PSBTVE1NQUNfRkxBR19VU0Vf
UEhZX1dPTDsKIAlwbGF0LT5yaXd0X29mZiA9IDE7CiAJcGxhdC0+bWF4bXR1ID0gRVRIX0RBVEFf
TEVOOwogCXBsYXQtPmhvc3RfZG1hX3dpZHRoID0gcHJpdl9wbGF0LT52YXJpYW50LT5kbWFfYml0
X21hc2s7CgotLSAKMi40Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
