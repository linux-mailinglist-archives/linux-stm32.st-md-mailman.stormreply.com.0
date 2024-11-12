Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F829C5E48
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 18:07:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C32AC78F88;
	Tue, 12 Nov 2024 17:07:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FB01C78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 17:07:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54B79E0002;
 Tue, 12 Nov 2024 17:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731431222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MNtCugG59nS9OABDLmKZagjpJ188CbPhZJNQ0/shOKY=;
 b=KF6aRyBn5/7nNXSS5Mad6+l+b+BbubgLGJZfM7VgpqTBqmHpPWlNRVneQ/d90gcj71UWiN
 vQcSemki6Sg14AxdjC6nY7uZpZWp4VcbfJSdHPfxJHViK4AcI22w/xTuXP3hzBPUIeD0ao
 ROh47wIUy58MA/IYBsb0gpI1GW5WjRBMwuKHrSKQsvikmu2vDMAEMsj8+vkHOK2IMk+1WS
 V/coLl2a4ohAaV3xmvzLYT0KbnbwQOUJ9d3Fx1nw2oai5BsAdrKmzc/OsDrLy2uU56QAVl
 gyPT5qDS9aEjQfoG92F6DTJ2A4mNIJn4eOxk3euoa5MdvohILAkFdhPrDWk+Pg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Tue, 12 Nov 2024 18:06:48 +0100
Message-ID: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Daniel Machon <daniel.machon@microchip.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/9] Support external snapshots on
	dwmac1000
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

SGksCgpUaGlzIGlzIHY0IG9uIHRoZSBzZXJpZXMgdG8gc3VwcG9ydCBleHRlcm5hbCBzbmFwc2hv
dHMgb24gZHdtYWMxMDAwLgoKVGhlIG1haW4gY2hhbmdlIHNpbmNlIHYzIGlzIHRoZSBtb3ZlIG9m
IHRoZSBmaWZvIGZsdXNoIHdhaXQgaW4gdGhlCnB0cF9jbG9ja19pbmZvIGVuYWJsZSgpIGZ1bmN0
aW9uIHdpdGhpbiB0aGUgbXV0ZXggdGhhdCBwcm90ZWN0cyB0aGUgcHRwCnJlZ2lzdGVycy4gVGhh
bmtzIEpha3ViIGFuZCBQYW9sbyBmb3Igc3BvdHRpbmcgdGhpcy4KClRoaXMgc2VyaWVzIGFsc28g
YWdncmVnYXRlcyBEYW5pZWwncyByZXZpZXdzLCBleGNlcHQgZm9yIHRoZSBwYXRjaCA0CndoaWNo
IHdhcyBtb2RpZmllZCBzaW5jZSB0aGVuLgoKVGhpcyBzZXJpZXMgaXMgYW5vdGhlciB0YWtlIG9u
IHRoZSBwcmV2aW91cyB3b3JrIFsxXSBkb25lIGJ5CkFsZXhpcyBMb3Rob3LDqSwgdGhhdCBmaXhl
cyB0aGUgc3VwcG9ydCBmb3IgZXh0ZXJuYWwgc25hcHNob3RzCnRpbWVzdGFtcGluZyBpbiBHTUFD
My1iYXNlZCBkZXZpY2VzLgoKRGV0YWlscyBvbiB3aHkgdGhpcyBpcyBuZWVkZWQgYXJlIG1lbnRp
b25uZWQgb24gdGhlIGNvdmVyIFsyXSBmcm9tIFYxLgoKWzFdOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9uZXRkZXYvMjAyMzA2MTYxMDA0MDkuMTY0NTgzLTEtYWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20vClsyXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQxMDI5MTE1NDE5
LjExNjAyMDEtMS1tYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbS8KClRoYW5rcyBBbGV4aXMg
Zm9yIGxheWluZyB0aGUgZ3JvdW5kd29yayBmb3IgdGhpcywKCkJlc3QgcmVnYXJkcywKCk1heGlt
ZQoKTGluayB0byBWMTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQxMDI5MTE1
NDE5LjExNjAyMDEtMS1tYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbS8KTGluayB0byBWMjog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQxMTA0MTcwMjUxLjIyMDIyNzAtMS1t
YXhpbWUuY2hldmFsbGllckBib290bGluLmNvbS8KTGluayB0byBWMzogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbmV0ZGV2LzIwMjQxMTA2MDkwMzMxLjU2NTE5LTEtbWF4aW1lLmNoZXZhbGxpZXJA
Ym9vdGxpbi5jb20vCgpNYXhpbWUgQ2hldmFsbGllciAoOSk6CiAgbmV0OiBzdG1tYWM6IERvbid0
IG1vZGlmeSB0aGUgZ2xvYmFsIHB0cCBvcHMgZGlyZWN0bHkKICBuZXQ6IHN0bW1hYzogVXNlIHBl
ci1odyBwdHAgY2xvY2sgb3BzCiAgbmV0OiBzdG1tYWM6IE9ubHkgdXBkYXRlIHRoZSBhdXRvLWRp
c2NvdmVyZWQgUFRQIGNsb2NrIGZlYXR1cmVzCiAgbmV0OiBzdG1tYWM6IEludHJvZHVjZSBkd21h
YzEwMDAgcHRwX2Nsb2NrX2luZm8gYW5kIG9wZXJhdGlvbnMKICBuZXQ6IHN0bW1hYzogSW50cm9k
dWNlIGR3bWFjMTAwMCB0aW1lc3RhbXBpbmcgb3BlcmF0aW9ucwogIG5ldDogc3RtbWFjOiBFbmFi
bGUgdGltZXN0YW1waW5nIGludGVycnVwdCBvbiBkd21hYzEwMDAKICBuZXQ6IHN0bW1hYzogRG9u
J3QgaW5jbHVkZSBkd21hYzQgZGVmaW5pdGlvbnMgaW4gc3RtbWFjX3B0cAogIG5ldDogc3RtbWFj
OiBDb25maWd1cmUgb25seSB0aGUgcmVsZXZhbnQgYml0cyBmb3IgdGltZXN0YW1waW5nIHNldHVw
CiAgbmV0OiBzdG1tYWM6IGR3bWFjX3NvY2ZwZ2E6IFRoaXMgcGxhdGZvcm0gaGFzIEdNQUMKCiBk
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9jb21tb24uaCAgfCAgIDQgKwogLi4u
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvY2ZwZ2EuYyAgIHwgICAxICsKIC4uLi9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMxMDAwLmggICB8ICAxMiArKysKIC4uLi9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzEwMDBfY29yZS5jICB8IDEwMSArKysrKysrKysr
KysrKysrKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2h3aWYuYyAgICB8
ICAxNSArKy0KIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfaHd0c3RhbXAuYyB8
ICAyNiArKysrLQogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmMg
IHwgIDM4ICsrKysrLS0KIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0
cC5oICB8ICAxMCArKwogOCBmaWxlcyBjaGFuZ2VkLCAxOTYgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgotLSAKMi40Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
