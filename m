Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4569C2E1D
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Nov 2024 16:18:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 132E8C78015;
	Sat,  9 Nov 2024 15:18:04 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FCE9C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Nov 2024 15:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731165476;
 bh=r8pOJtwP+l+aThisZLQEzXRJelwC83jKXvQDLp3YZ0Q=;
 h=From:Subject:Date:To:Cc:From;
 b=WjGXSk+p0nwTI4xqakbd1duOtiGya37aCquPOiYed+6/OSQ8BqGEZAH8o6aD7iBl+
 Xdz1/YI9ZTLbGCJnocIykUcRbE7i2z6aKWIWv4PHML6J9c8oN1gxKuZHmfYNFAoDeP
 8d4rDYV9LbmkrrkiQ7LERwE1LZ85bZQFcg389FNZCTsGEZm5EpGAOomwISwgyydUpo
 Xhv4Wi1fHYa4Ww2fJRQw//ifCBcvVxnkIKDbirPmRM+9rrgVgYN34/AJb1aasZPFE4
 4NN2h6lSbfIYud9pWlxwvbYtWhB7mTsMjT1HauXx7fLk/Ws/05i6XiO6IXkvfjibkP
 6B2Vp7/vyZXzg==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4806517E35FA;
 Sat,  9 Nov 2024 16:17:53 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sat, 09 Nov 2024 10:16:31 -0500
Message-Id: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM98L2cC/43NTQ6CMBCG4auYrh3TQX6qK+9hWJQyykTomJZUD
 eHuVk7g8vkW77eoSIEpqvNuUYESRxafUex3yg3W3wm4z1aFLkpEjTBRz3amB0zWwUtG8OLZJwo
 z9YAn42pX6rI61ionnoFu/N7y1zZ74DhL+GxvCX/rn+GEoKGpOoNGmwYbe3EyjraTYA9OJtWu6
 /oF5fARncwAAAA=
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.2
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-mediatek: Fix
 inverted logic for mediatek, mac-wol
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
YWMtd29sIERUCnByb3BlcnR5LiBUaGlzIHdhcyBkb25lIHdpdGggYmFja3dhcmRzIGNvbXBhdGli
aWxpdHkgaW4gdjEsIGJ1dCBiYXNlZCBvbgp0aGUgZmVlZGJhY2sgcmVjZWl2ZWQsIGFsbCBib2Fy
ZHMgc2hvdWxkIGJlIHVzaW5nIE1BQyBXT0wsIHNvIG1hbnkgb2YKdGhlbSB3ZXJlIGluY29ycmVj
dGx5IGRlc2NyaWJlZCBhbmQgZGlkbid0IGhhdmUgd29ya2luZyBXT0wgdGVzdGVkCmFueXdheS4g
U28gZm9yIHYyLCB0aGUgYXBwcm9hY2ggaXMgc2ltcGxlcjoganVzdCBmaXggdGhlIGRyaXZlciBo
YW5kbGluZwphbmQgdXBkYXRlIHRoZSBEVHMgdG8gZW5hYmxlIE1BQyBXT0wgZXZlcnl3aGVyZS4K
ClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFi
b3JhLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gRHJvcHBlZCBpbnRyb2R1Y3Rpb24gb2YgbmV3
IHByb3BlcnR5IG1lZGlhdGVrLG1hYy13b2wtbm9uaW52ZXJ0ZWQgZm9yCiAgYmFja3dhcmRzIGNv
bXBhdGliaWxpdHkKLSBTZXQgTUFDIFdPTCBmb3IgZXZlcnkgRFQKLSBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMTAxLW1lZGlhdGVrLW1hYy13b2wtbm9uaW52ZXJ0
ZWQtdjEtMC03NWI4MTgwODcxN2FAY29sbGFib3JhLmNvbQoKLS0tCk7DrWNvbGFzIEYuIFIuIEEu
IFByYWRvICgyKToKICAgICAgbmV0OiBzdG1tYWM6IGR3bWFjLW1lZGlhdGVrOiBGaXggaW52ZXJ0
ZWQgaGFuZGxpbmcgb2YgbWVkaWF0ZWssbWFjLXdvbAogICAgICBhcm02NDogZHRzOiBtZWRpYXRl
azogU2V0IG1lZGlhdGVrLG1hYy13b2wgb24gRFdNQUMgbm9kZSBmb3IgYWxsIGJvYXJkcwoKIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyLWV2Yi5kdHMgICAgICAgICAgICAgICAg
ICAgfCAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRzICAg
ICAgICAgICAgICAgICAgfCAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1
LWtvbnRyb24tMy01LXNiYy1pMTIwMC5kdHMgfCAxICsKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgICAgICAgICAgfCA0ICsrLS0KIDQgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6
IGM4ODQxNmJhMDc0YTg5MTNjZjZkNjFiNzg5ZGQ4MzRiYmNhNjY4MWMKY2hhbmdlLWlkOiAyMDI0
MTEwMS1tZWRpYXRlay1tYWMtd29sLW5vbmludmVydGVkLTE5OGM2YzQwNDUzNgoKQmVzdCByZWdh
cmRzLAotLSAKTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
