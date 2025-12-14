Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBA6CBC0D5
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Dec 2025 23:15:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4B1FC58D77;
	Sun, 14 Dec 2025 22:15:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE431C1A97B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Dec 2025 22:15:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2286C42DD1;
 Sun, 14 Dec 2025 22:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9315C4CEF1;
 Sun, 14 Dec 2025 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765750553;
 bh=eoWq0R056rv6qFunXhkW+ex9LyETDs54864ThvZUEN0=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=sIYVbP79jyu36bP2/ttcG9+TnIZASIbsMOfDQlGt67dlHV5o3hlT6W4jlWsk2iGWS
 /90+fX6H6VbzZOvk+vvCLijEwlCkQ2leZan8z9L6MizQ3HNSR13QmN8FdAwtaDhwrW
 AoKjELjgs9maUHNjiJ+PM1yamiYUrkxITT4ig2wgxYDbn0CaTW5lb7RPgSyczSACif
 bZ+gwMwKgYAX3S08OEvIMDtiC385cpJkO76aQ4Hb158rQHM/3ja022s/Z7RCvYleuZ
 Ty5MSoqaBfhOqDRznL/5rIXZCaLMnjRa8s7iIsvykLso8PsEoW64bfqUQ05AoE8D6V
 nmYV1PtNApxAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D17A8D5B16E;
 Sun, 14 Dec 2025 22:15:52 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 14 Dec 2025 23:15:36 +0100
Message-Id: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAg3P2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNL3ZTy3MTk+NzSnJLM+MyiQl3LFIs0MwMTM6PkZEMloK6CotS0zAq
 widFKQW7OSrG1tQC+VpqgZgAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765750551; l=4064;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=eoWq0R056rv6qFunXhkW+ex9LyETDs54864ThvZUEN0=;
 b=2gQIU5wXxSZN34/wa2M1NFfbZH0jsb3PuTqiNgL/E7P0BbaWTcjdieFbbA7UU7kR4LeCpMq6i
 XH6Jmr1v0jWAEEMu9tEhHckAVlKp6UMi8B3z0/Ksqx3lOIILWxGtVh4
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 0/4] Support multi-channel IRQs in stmmac
 platform drivers
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

VGhlIHN0bW1hYyBjb3JlIHN1cHBvcnRzIHR3byBpbnRlcnJ1cHQgbW9kZXMsIGNvbnRyb2xsZWQg
YnkgdGhlCmZsYWcgU1RNTUFDX0ZMQUdfTVVMVElfTVNJX0VOLgotIFdoZW4gdGhlIGZsYWcgaXMg
c2V0LCB0aGUgZHJpdmVyIHVzZXMgbXVsdGktY2hhbm5lbCBJUlEgbW9kZSAobXVsdGktSVJRKS4K
LSBPdGhlcndpc2UsIGEgc2luZ2xlIElSUSBsaW5lIGlzIHJlcXVlc3RlZDoKCnN0YXRpYyBpbnQg
c3RtbWFjX3JlcXVlc3RfaXJxKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCnsKICAgICAgICAvKiBS
ZXF1ZXN0IHRoZSBJUlEgbGluZXMgKi8KICAgICAgICBpZiAocHJpdi0+cGxhdC0+ZmxhZ3MgJiBT
VE1NQUNfRkxBR19NVUxUSV9NU0lfRU4pCiAgICAgICAgICAgICAgICByZXQgPSBzdG1tYWNfcmVx
dWVzdF9pcnFfbXVsdGlfbXNpKGRldik7CiAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgcmV0
ID0gc3RtbWFjX3JlcXVlc3RfaXJxX3NpbmdsZShkZXYpOwp9CgpBdCBwcmVzZW50LCBvbmx5IFBD
SSBkcml2ZXJzIChJbnRlbCBhbmQgTG9vbmdzb24pIG1ha2UgdXNlIG9mIHRoZSBtdWx0aS1JUlEK
bW9kZS4gVGhpcyBjb25jZXB0IGNhbiBiZSBleHRlbmRlZCB0byBEVC1iYXNlZCBlbWJlZGRlZCBn
bHVlIGRyaXZlcnMKKGR3bWFjLXh4eC5jKS4KClRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3Ig
cmVhZGluZyBwZXItY2hhbm5lbCBJUlFzIGZyb20gdGhlIERUIG5vZGUgYW5kCnJldXNlcyB0aGUg
ZXhpc3RpbmcgU1RNTUFDX0ZMQUdfTVVMVElfTVNJX0VOIGZsYWcgdG8gZW5hYmxlIG11bHRpLUlS
UQpvcGVyYXRpb24gaW4gcGxhdGZvcm0gZHJpdmVycy4KCk5YUCBTMzJHMi9TMzJHMy9TMzJSIFNv
Q3MgaW50ZWdyYXRlIHRoZSBEV01BQyBJUCB3aXRoIG11bHRpLWNoYW5uZWwKaW50ZXJydXB0IHN1
cHBvcnQuIFRoZSBkd21hYy1zMzIuYyBkcml2ZXIgY2hhbmdlIGlzIHByb3ZpZGVkIGFzIGFuIGV4
YW1wbGUgb2YKZW5hYmxpbmcgbXVsdGktSVJRIG1vZGUgZm9yIG5vbi1QQ0kgZHJpdmVycy4KCkFu
IG9wZW4gcXVlc3Rpb24gcmVtYWluczogc2hvdWxkIHBsYXRmb3JtIGRyaXZlcnMgc3VwcG9ydCBi
b3RoIHNpbmdsZS1JUlEKYW5kIG11bHRpLUlSUSBtb2Rlcywgb3Igc2hvdWxkIG11bHRpLUlSUSBi
ZSByZXF1aXJlZCB3aXRoIHRoZSBEVCBub2RlCnNwZWNpZnlpbmcgYWxsIGNoYW5uZWwgaW50ZXJy
dXB0cz8gVGhlIGN1cnJlbnQgUkZDIGltcGxlbWVudGF0aW9uIGZvbGxvd3MKdGhlIGxhdHRlciBh
cHByb2FjaCDigJQgZHdtYWMtczMyIHJlcXVpcmVzIElSUXMgdG8gYmUgZGVmaW5lZCBmb3IgYWxs
CmNoYW5uZWxzLgoKU28sIHdoZW4gdGhlIGdsdWUgZHJpdmVyIGhhcyBzZXQgdGhlIGZsYWcsIGJ1
dCB0aGUgY29ycmVzcG9uZGluZyBEVCBub2RlCmhhcyBub3QgZXhwYW5kZWQgJ2ludGVycnVwdHMn
IHByb3BlcnR5IGFjY29yZGluZ2x5LCB0aGUgZHJpdmVyIGluaXQKZmFpbHMgd2l0aCB0aGUgZm9s
bG93aW5nIGVycm9yOgoKWzQuOTI1NDIwXSBzMzItZHdtYWMgNDAzM2MwMDAuZXRoZXJuZXQgZXRo
MDogc3RtbWFjX3JlcXVlc3RfaXJxX211bHRpX21zaTogYWxsb2MgcngtMCAgTVNJIC02IChlcnJv
cjogLTIyKQoKV2hlbiBjb3JyZWN0bHkgc2V0LCB0aGUgYXNzaWduZWQgSVJRcyBjYW4gYmUgdmlz
aWJsZQppbiAvcHJvYy9pbnRlcnJ1cHRzOgoKcm9vdEBzMzJnMzk5YWV2YjM6fiMgZ3JlcCBldGgg
L3Byb2MvaW50ZXJydXB0cwogMjk6ICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAg
ICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICBH
SUN2MyAgODkgTGV2ZWwgICAgIGV0aDA6bWFjCiAzMDogICAgICAgICAgMCAgICAgICAgICAwICAg
ICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAg
ICAgICAwICAgIEdJQ3YzICA5MSBMZXZlbCAgICAgZXRoMDpyeC0wCiAzMTogICAgICAgICAgMCAg
ICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAg
ICAgICAgMCAgICAgICAgICAwICAgIEdJQ3YzICA5MyBMZXZlbCAgICAgZXRoMDpyeC0xCiAzMjog
ICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAg
ICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgIEdJQ3YzICA5NSBMZXZlbCAgICAgZXRo
MDpyeC0yCiAzMzogICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAg
ICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgIEdJQ3YzICA5NyBM
ZXZlbCAgICAgZXRoMDpyeC0zCiAzNDogICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAg
ICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAg
IEdJQ3YzICA5OSBMZXZlbCAgICAgZXRoMDpyeC00CiAzNTogICAgICAgICAgMCAgICAgICAgICAw
ICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAg
ICAgICAgICAwICAgIEdJQ3YzICA5MCBMZXZlbCAgICAgZXRoMDp0eC0wCiAzNjogICAgICAgICAg
MCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAg
ICAgICAgICAgMCAgICAgICAgICAwICAgIEdJQ3YzICA5MiBMZXZlbCAgICAgZXRoMDp0eC0xCiAz
NzogICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAw
ICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgIEdJQ3YzICA5NCBMZXZlbCAgICAg
ZXRoMDp0eC0yCiAzODogICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAg
MCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgIEdJQ3YzICA5
NiBMZXZlbCAgICAgZXRoMDp0eC0zCiAzOTogICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAg
IDAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAw
ICAgIEdJQ3YzICA5OCBMZXZlbCAgICAgZXRoMDp0eC00CgpTaWduZWQtb2ZmLWJ5OiBKYW4gUGV0
cm91cyAoT1NTKSA8amFuLnBldHJvdXNAb3NzLm54cC5jb20+Ci0tLQpKYW4gUGV0cm91cyAoT1NT
KSAoNCk6CiAgICAgIG5ldDogc3RtbWFjOiBwbGF0Zm9ybTogcmVhZCBjaGFubmVscyBpcnEKICAg
ICAgZHQtYmluZGluZ3M6IG5ldDogbnhwLHMzMi1kd21hYzogRGVjbGFyZSBwZXItcXVldWUgaW50
ZXJydXB0cwogICAgICBhcm02NDogZHRzOiBzMzI6IHNldCBFdGhlcm5ldCBjaGFubmVsIGlycXMK
ICAgICAgc3RtbWFjOiBzMzI6IGVuYWJsZSBtdWx0aSBpcnFzIG1vZGUKCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvbnhwLHMzMi1kd21hYy55YW1sICAgICB8IDQwICsrKysrKysrKysrKysr
KysrKystLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL3MzMmcyLmR0c2kgICAgICAg
ICAgIHwgMjQgKysrKysrKysrKystLQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvczMy
ZzMuZHRzaSAgICAgICAgICAgfCAyNCArKysrKysrKysrKy0tCiBkcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zMzIuYyAgICB8ICAzICstCiAuLi4vbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wbGF0Zm9ybS5jICB8IDM4ICsrKysrKysrKysrKysrKysr
KystCiA1IGZpbGVzIGNoYW5nZWQsIDExOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
LS0tCmJhc2UtY29tbWl0OiBjYjAxNTgxNGY4YjZlZWJjYmI4ZTQ2ZTExMWQxMDg4OTJjNWU2ODIx
CmNoYW5nZS1pZDogMjAyNTEyMDktZHdtYWNfbXVsdGlfaXJxLTlkOGY2MDQ2MmNjMQoKQmVzdCBy
ZWdhcmRzLAotLSAKSmFuIFBldHJvdXMgKE9TUykgPGphbi5wZXRyb3VzQG9zcy5ueHAuY29tPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
