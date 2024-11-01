Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C5B9BBB84
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FC7FC7A844;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FD5BC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 15:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730474457;
 bh=/+TZMp3OuOQDQDtXHRy7fu88xK0qHPfQkGlXJfyTdTg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WUTyXX9KAWFb3gX0LpNpPH6GX48WVZPnDO9ivRGy5nGMOGP4ZIBLd7lSW7KDolK+L
 Bjsp1W/eLD4Fgi2GLyJfQMYOtyPgbKF8cTktz18YKwOaKxQ/+KRidryUZPVwyE1E8a
 iRRyPWU23/+E2LZi+LAlUp3OuKz8tbqrDnRa8cf29cmCdM+MIpqJuGRSm6qRFyuU+K
 URN5dZ1roRwUmx+adiOtj5sv9e6/3I6p++hW/5dmseozw/mPNnL+vzyxa6GhMCMsK5
 WrqxyGzlj1z3MDGgkZPcMC6+hY0f3AYvKDQuklWwO1deJ9ggSvQx4nAWQN/jwDDfHB
 tvh8D2Bc1mCqQ==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3445217E0F85;
 Fri,  1 Nov 2024 16:20:54 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:26 -0400
MIME-Version: 1.0
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-4-75b81808717a@collabora.com>
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
Subject: [Linux-stm32] [PATCH 4/4] arm64: dts: mediatek: Add mediatek,
 mac-wol-noninverted to ethernet nodes
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

QWRkIHRoZSBuZXdseSBpbnRyb2R1Y2VkIGFuZCBub3cgcmVxdWlyZWQgbWVkaWF0ZWssbWFjLXdv
bC1ub25pbnZlcnRlZApwcm9wZXJ0eSB0byB0aGUgZHdtYWMgZXRoZXJuZXQgbm9kZXMgYW5kIGlu
dmVydCB0aGUgcHJlc2VuY2Ugb2YgdGhlCm1lZGlhdGVrLG1hYy13b2wgcHJvcGVydHkgdG8gbWFr
ZSBpdCBhbGlnbiB3aXRoIHRoZSBkZXNjcmlwdGlvbiBvbiB0aGUKYmluZGluZyBhbmQgbWFpbnRh
aW4gdGhlIGN1cnJlbnQgYmVoYXZpb3IuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBB
LiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDI3MTItZXZiLmR0cyAgICAgICAgICAgICAgICAgICB8IDIgKysKIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRzICAgICAgICAgICAgICAgICAg
fCAyICsrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODM5NS1nZW5pby0xMjAwLWV2
ay5kdHMgICAgICAgIHwgMiArLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgzOTUt
a29udHJvbi0zLTUtc2JjLWkxMjAwLmR0cyB8IDIgKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4Mzk1LXJhZHhhLW5pby0xMmwuZHRzICAgICAgICAgfCAyICstCiA1IGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210MjcxMi1ldmIuZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDI3MTItZXZiLmR0cwppbmRleCBjODRjNDdjMTM1MmZiYTQ5ZDIxOWZi
OGFjZTE3YTc0OTUzOTI3ZmRjLi4wOTc2MGEwNzg0YmZiNTk1MTFlYTY0ZmI0NGI3YWViNjYzMjZm
ODFiIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210MjcxMi1ldmIu
ZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyLWV2Yi5kdHMKQEAg
LTExNSw2ICsxMTUsOCBAQCAmZXRoIHsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xl
ZXAiOwogCXBpbmN0cmwtMCA9IDwmZXRoX2RlZmF1bHQ+OwogCXBpbmN0cmwtMSA9IDwmZXRoX3Ns
ZWVwPjsKKwltZWRpYXRlayxtYWMtd29sLW5vbmludmVydGVkOworCW1lZGlhdGVrLG1hYy13b2w7
CiAJc3RhdHVzID0gIm9rYXkiOwogCiAJbWRpbyB7CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5NS1kZW1vLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTk1LWRlbW8uZHRzCmluZGV4IDMxZDQyNGI4ZmM3Y2VkZWY2NTQ4OTM5MmViMjc5
YjdmZDIxOTRhNGEuLmY0OGJhYTBiN2RjYmI5NTgxNjUxN2I3ZTUwMWQ4N2UzOWFjNjNhMmQgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRzCisr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRzCkBAIC0xMDks
NiArMTA5LDggQEAgJmV0aCB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsK
IAlwaW5jdHJsLTAgPSA8JmV0aF9kZWZhdWx0X3BpbnM+OwogCXBpbmN0cmwtMSA9IDwmZXRoX3Ns
ZWVwX3BpbnM+OworCW1lZGlhdGVrLG1hYy13b2wtbm9uaW52ZXJ0ZWQ7CisJbWVkaWF0ZWssbWFj
LXdvbDsKIAlzdGF0dXMgPSAib2theSI7CiAKIAltZGlvIHsKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LWdlbmlvLTEyMDAtZXZrLmR0cyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LWdlbmlvLTEyMDAtZXZrLmR0cwppbmRleCA1ZjE2
ZmI4MjA1ODA1NmNmOGNmNjMxOGM5ZmMzNzM2MDFiZDZlYjYwLi4yOTBmY2RjZTFjOWY0OWM0NzU0
MDNmYTRhYTdhMDkxMTYwNWQ0YWJkIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODM5NS1nZW5pby0xMjAwLWV2ay5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgzOTUtZ2VuaW8tMTIwMC1ldmsuZHRzCkBAIC0xNzcsNyArMTc3LDcgQEAg
JmV0aCB7CiAJc25wcyxyZXNldC1ncGlvID0gPCZwaW8gOTMgR1BJT19BQ1RJVkVfSElHSD47CiAJ
c25wcyxyZXNldC1kZWxheXMtdXMgPSA8MCAxMDAwMCAxMDAwMD47CiAJbWVkaWF0ZWssdHgtZGVs
YXktcHMgPSA8MjAzMD47Ci0JbWVkaWF0ZWssbWFjLXdvbDsKKwltZWRpYXRlayxtYWMtd29sLW5v
bmludmVydGVkOwogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CiAJcGluY3Ry
bC0wID0gPCZldGhfZGVmYXVsdF9waW5zPjsKIAlwaW5jdHJsLTEgPSA8JmV0aF9zbGVlcF9waW5z
PjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LWtvbnRy
b24tMy01LXNiYy1pMTIwMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODM5
NS1rb250cm9uLTMtNS1zYmMtaTEyMDAuZHRzCmluZGV4IGUyZTc1YjhmZjkxODgwNzExYzgyZjc4
M2M3Y2NiZWY0MTI4YjdhYjQuLmViZDBkZWI0ZTllYzFkNjcxODJjNzYwMjIwM2U0ZmExYTBmYjFj
MGMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LWtvbnRy
b24tMy01LXNiYy1pMTIwMC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgzOTUta29udHJvbi0zLTUtc2JjLWkxMjAwLmR0cwpAQCAtMjcxLDYgKzI3MSw4IEBAICZldGgg
ewogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CiAJcGluY3RybC0wID0gPCZl
dGhfZGVmYXVsdF9waW5zPjsKIAlwaW5jdHJsLTEgPSA8JmV0aF9zbGVlcF9waW5zPjsKKwltZWRp
YXRlayxtYWMtd29sLW5vbmludmVydGVkOworCW1lZGlhdGVrLG1hYy13b2w7CiAJc3RhdHVzID0g
Im9rYXkiOwogCiAJbWRpbyB7CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODM5NS1yYWR4YS1uaW8tMTJsLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4Mzk1LXJhZHhhLW5pby0xMmwuZHRzCmluZGV4IDE0ZWM5NzBjNGU0OTFmYmQ2OWJmMjgw
MDYzOWFiZjcyNmQ0NzU4OWEuLmE1NDFkNGZiOTYyMWM1NWY3ODlkNTVhMWViOTg1MDMwODI3YjE1
OGIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LXJhZHhh
LW5pby0xMmwuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LXJh
ZHhhLW5pby0xMmwuZHRzCkBAIC0xNzksNyArMTc5LDcgQEAgJmV0aCB7CiAJcGluY3RybC0wID0g
PCZldGhfZGVmYXVsdF9waW5zPjsKIAlwaW5jdHJsLTEgPSA8JmV0aF9zbGVlcF9waW5zPjsKIAlt
ZWRpYXRlayx0eC1kZWxheS1wcyA9IDwyMDMwPjsKLQltZWRpYXRlayxtYWMtd29sOworCW1lZGlh
dGVrLG1hYy13b2wtbm9uaW52ZXJ0ZWQ7CiAJc25wcyxyZXNldC1ncGlvID0gPCZwaW8gOTMgR1BJ
T19BQ1RJVkVfSElHSD47CiAJc25wcyxyZXNldC1kZWxheXMtdXMgPSA8MCAyMDAwMCAxMDAwMDA+
OwogCXN0YXR1cyA9ICJva2F5IjsKCi0tIAoyLjQ3LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
