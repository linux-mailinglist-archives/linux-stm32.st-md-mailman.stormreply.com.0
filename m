Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9A9BBB82
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CCD9C7A846;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 203E4C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730495886;
 bh=66Ei27eT+JrfjmeRi9X6QMMDpHjXuetf/JuMi8MPyQE=;
 h=From:Date:Subject:To:Cc:From;
 b=HMCGKJ1haZqHGDbHpHOmcQo1NoHvtFO+fE66drSQMSf6rIi7bf8m/mmsTsAuwNXmj
 xMdvU4bJxCe+CNJZvWbv8xvu/gW0cN0dUWpavk8NKpBzIrn3iD+WKMYAkJNeWlnjkt
 zvUnIo/WDBC4cjSHLjmMNs6QVoSTEZ524W0XcTuPysprng3MJOYAGnD/fgUwG4SHSj
 0MWywKJP+T0YfqwQ+0golLziJkgrcSmSBMTfUIpZ0N6BHIRJkE0sCbg0cqExtm0+04
 7YO5NXMaT4hhF/N/g67qZlzNtrhlIUqmEFFPVhHEGx74hrkKfKU+ExBVtSduu/7YXB
 lQOYDmIDywC7w==
Received: from [192.168.1.230] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EF7FD17E0F9B;
 Fri,  1 Nov 2024 22:18:03 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 17:17:29 -0400
MIME-Version: 1.0
Message-Id: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGhFJWcC/x2NsQ7CMAwFf6XyjKWmqRj4FcTgJI9i0RoUU0Cq+
 u9EjHfD3UaOqnA6dRtVvNX1YQ3CoaN8E5vAWhrT0A9jCH1gfy2LZF4tySyWUfgjd7CrTTP4ql+
 ORVKMo6QjErXOs6Lp/+N82fcfkBbL9XMAAAA=
X-Change-ID: 20241101-stmmac-unbalanced-wake-single-fix-3dab334ab6eb
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Simon Horman <horms@kernel.org>, Qiang Ma <maqianga@uniontech.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH] net: stmmac: Fix unbalanced IRQ wake disable
 warning on single irq case
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

Q29tbWl0IGEyM2FhMDQwNDIxOCAoIm5ldDogc3RtbWFjOiBldGh0b29sOiBGaXhlZCBjYWxsdHJh
Y2UgY2F1c2VkIGJ5CnVuYmFsYW5jZWQgZGlzYWJsZV9pcnFfd2FrZSBjYWxscyIpIGludHJvZHVj
ZWQgY2hlY2tzIHRvIHByZXZlbnQKdW5iYWxhbmNlZCBlbmFibGUgYW5kIGRpc2FibGUgSVJRIHdh
a2UgY2FsbHMuIEhvd2V2ZXIgaXQgb25seQppbml0aWFsaXplZCB0aGUgYXV4aWxpYXJ5IHZhcmlh
YmxlIG9uIG9uZSBvZiB0aGUgcGF0aHMsCnN0bW1hY19yZXF1ZXN0X2lycV9tdWx0aV9tc2koKSwg
bWlzc2luZyB0aGUgb3RoZXIsCnN0bW1hY19yZXF1ZXN0X2lycV9zaW5nbGUoKS4KCkFkZCB0aGUg
c2FtZSBpbml0aWFsaXphdGlvbiBvbiBzdG1tYWNfcmVxdWVzdF9pcnFfc2luZ2xlKCkgdG8gcHJl
dmVudAoiVW5iYWxhbmNlZCBJUlEgPHg+IHdha2UgZGlzYWJsZSIgd2FybmluZ3MgZnJvbSBiZWlu
ZyBwcmludGVkIHRoZSBmaXJzdAp0aW1lIGRpc2FibGVfaXJxX3dha2UoKSBpcyBjYWxsZWQgb24g
cGxhdGZvcm1zIHRoYXQgcnVuIG9uIHRoYXQgY29kZQpwYXRoLgoKRml4ZXM6IGEyM2FhMDQwNDIx
OCAoIm5ldDogc3RtbWFjOiBldGh0b29sOiBGaXhlZCBjYWxsdHJhY2UgY2F1c2VkIGJ5IHVuYmFs
YW5jZWQgZGlzYWJsZV9pcnFfd2FrZSBjYWxscyIpClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYu
IFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYwppbmRleCAyMDhkYmM2OGFhZjlkNGE2NTBmMTY3YTc2ZDFlZjIy
M2Q1ZWI2YWVjLi43YmYyNzVmMTI3YzlkNzUwNDE4ZGI4YjRmZGI2ZTY1MGE1M2RjNjQ0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5j
CisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMK
QEAgLTM3ODAsNiArMzc4MCw3IEBAIHN0YXRpYyBpbnQgc3RtbWFjX3JlcXVlc3RfaXJxX3Npbmds
ZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQogCS8qIFJlcXVlc3QgdGhlIFdha2UgSVJRIGluIGNh
c2Ugb2YgYW5vdGhlciBsaW5lCiAJICogaXMgdXNlZCBmb3IgV29MCiAJICovCisJcHJpdi0+d29s
X2lycV9kaXNhYmxlZCA9IHRydWU7CiAJaWYgKHByaXYtPndvbF9pcnEgPiAwICYmIHByaXYtPndv
bF9pcnEgIT0gZGV2LT5pcnEpIHsKIAkJcmV0ID0gcmVxdWVzdF9pcnEocHJpdi0+d29sX2lycSwg
c3RtbWFjX2ludGVycnVwdCwKIAkJCQkgIElSUUZfU0hBUkVELCBkZXYtPm5hbWUsIGRldik7Cgot
LS0KYmFzZS1jb21taXQ6IGM4ODQxNmJhMDc0YTg5MTNjZjZkNjFiNzg5ZGQ4MzRiYmNhNjY4MWMK
Y2hhbmdlLWlkOiAyMDI0MTEwMS1zdG1tYWMtdW5iYWxhbmNlZC13YWtlLXNpbmdsZS1maXgtM2Rh
YjMzNGFiNmViCgpCZXN0IHJlZ2FyZHMsCi0tIApOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZy
YXByYWRvQGNvbGxhYm9yYS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
