Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F35569BBB83
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86A60C7A842;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40561C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730474453;
 bh=imjx57/ZNDvazS8dVSDsfcbujxW4jgOS5y+0Xj27b1A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DiBWY3Br+WMtuY8iHqw8X2uxfL+66oWWU8GtKeAy2gbK9E7WgzgFDyCdlVPqXRahh
 wsLR1PzWqIEJCnRNsOLYWBKjy+/Nzvl6rIfEsqnhQO0wJ0lq1lgE6Z0HCouukObrzx
 RsqEADhTxwBQSiCVgtm7XOT3ylgGKepVoPj3r+kfbRoUJEGzAFtUIU/JtveSJly0NE
 BVL6+a3pClOQ5YD1593UGMxHnNlBj4cGaG56cOFf09Fi97SRJo8MQpJ7g1e3RpDGbB
 z1DMWorJ3JFuv0X0oPbsoAGMne1/kKUoijmm6nHL8s5XG7S1H7QrbqXZ5kncWFz6eU
 JkjolR5twN8mA==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 06B0D17E0F83;
 Fri,  1 Nov 2024 16:20:50 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:25 -0400
MIME-Version: 1.0
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-3-75b81808717a@collabora.com>
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
Subject: [Linux-stm32] [PATCH 3/4] arm64: dts: mediatek:
 mt8390-genio-700-evk: Enable ethernet MAC WOL
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

QWRkIHRoZSBtZWRpYXRlayxtYWMtd29sLW5vbmludmVydGVkIHByb3BlcnR5IHRvIHRoZSBldGhl
cm5ldCBub2RlIHRvCm1ha2UgdGhlIGRyaXZlciBwYXJzZSB0aGUgbWVkaWF0ZWssbWFjLXdvbCBw
cm9wZXJ0eSBhcyBvcmlnaW5hbGx5CmludGVuZGVkOiBlbmFibGluZyB0aGUgTUFDIFdPTC4gVGhp
cyBnZXRzIFdPTCB3b3JraW5nIG9uIHRoZSBHZW5pbyA3MDAKRVZLIGJvYXJkLgoKU2lnbmVkLW9m
Zi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgot
LS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MzkwLWdlbmlvLTcwMC1ldmsuZHRz
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODM5MC1nZW5pby03MDAtZXZrLmR0cyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MzkwLWdlbmlvLTcwMC1ldmsuZHRzCmluZGV4IDEz
ZjJlMGUzZmE4YWI2Njc5Zjg0MzY5MzIzMGI5NjYxZDMyM2E3MDUuLjgzYzEwNTE3NDU4ZDFkZjJm
MTRlNDFiYWVmZjYyOGY0NmRlZDE2MTggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MzkwLWdlbmlvLTcwMC1ldmsuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MzkwLWdlbmlvLTcwMC1ldmsuZHRzCkBAIC04OTgsNiArODk4LDcgQEAg
JmV0aCB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsKIAlwaW5jdHJsLTAg
PSA8JmV0aF9kZWZhdWx0X3BpbnM+OwogCXBpbmN0cmwtMSA9IDwmZXRoX3NsZWVwX3BpbnM+Owor
CW1lZGlhdGVrLG1hYy13b2wtbm9uaW52ZXJ0ZWQ7CiAJbWVkaWF0ZWssbWFjLXdvbDsKIAlzbnBz
LHJlc2V0LWdwaW8gPSA8JnBpbyAxNDcgR1BJT19BQ1RJVkVfSElHSD47CiAJc25wcyxyZXNldC1k
ZWxheXMtdXMgPSA8MCAxMDAwMCAxMDAwMD47CgotLSAKMi40Ny4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
