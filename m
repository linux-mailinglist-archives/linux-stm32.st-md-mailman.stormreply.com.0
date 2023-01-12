Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4326678CF
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 16:15:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13821C64109;
	Thu, 12 Jan 2023 15:15:26 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94787C640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:15:24 +0000 (UTC)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 17DAF1243;
 Thu, 12 Jan 2023 16:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1673536523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z7B4pND5e+QR5QtoQ7I5oChkxQuHHA20+0hEeYmGTgM=;
 b=u49FS3Dk9qDfluXiGp9TkmisU6Qu5EvwZeqGdovxab6dVxup2BRDNMldkVcrzwCEAfpQAO
 ZqMoR10rIPYiZXZgHEfpSBuByb641u4TLay6c3YIfCdpyyraN3BAKHkEcEFVIkadRUCeaH
 NhRHm0VW+4rqcCspn5gc2CDfsZ3V9+V77PoUo5/EbEgb2mqudJB6j2SVDvbwlriGHsQVNE
 g+ewd5Nm+se/6Xbqu+vFAXV0+H4iY4LjVWzQ14ymHNqNk0p3sf4brIiS32qqEmA3kq2MDu
 6wV/2+U3EUaZghtv6GX3t0E72N3yCT7u78d3h0OeNauAyUvteuYApMHhmZ3Iug==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:07 +0100
Message-Id: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPsjwGMC/zWNwQrCMBBEf6Xs2YVuTLX4K+Jhk25tDsawG6RQ+
 u+mgoc5PIZ5s4GJJjG4dRuofJKld25Apw7iwvkpmKbG4Hp37okcZqkta8XoBzQpolzbBgtrRYcU
 xjkE8v4yXqFJAptgUM5xOTQvtip6FEVlTuvv+Q5/KTz2/QtSEQk5kwAAAA==
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Li Yang <leoyang.li@nxp.com>
X-Mailer: b4 0.11.1
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/10] net: mdio: Continue separating
	C22 and C45
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

SSd2ZSBwaWNrZWQgdGhpcyBvbGRlciBzZXJpZXMgZnJvbSBBbmRyZXcgdXAgYW5kIHJlYmFzZWQg
aXQgb250bwp0aGUgbGF0ZXN0IG5ldC1uZXh0LgoKVGhpcyBpcyB0aGUgc2Vjb25kIHBhdGNoIHNl
dCBpbiB0aGUgc2VyaWVzIHdoaWNoIHNlcGFyYXRlcyB0aGUgQzIyCmFuZCBDNDUgTURJTyBidXMg
dHJhbnNhY3Rpb25zIGF0IHRoZSBBUEkgbGV2ZWwgdG8gdGhlIE1ESU8gYnVzIGRyaXZlcnMuCgpT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgoK77+8CgpUbzog
SGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KVG86IFJ1c3NlbGwgS2luZyA8
bGludXhAYXJtbGludXgub3JnLnVrPgpUbzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVt
bG9mdC5uZXQ+ClRvOiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+ClRvOiBKYWt1
YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgpUbzogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRo
YXQuY29tPgpUbzogUmF5IEp1aSA8cmp1aUBicm9hZGNvbS5jb20+ClRvOiBTY290dCBCcmFuZGVu
IDxzYnJhbmRlbkBicm9hZGNvbS5jb20+ClRvOiBCcm9hZGNvbSBpbnRlcm5hbCBrZXJuZWwgcmV2
aWV3IGxpc3QgPGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNvbS5jb20+ClRvOiBKb2Vs
IFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgpUbzogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5p
ZC5hdT4KVG86IEZlbGl4IEZpZXRrYXUgPG5iZEBuYmQubmFtZT4KVG86IEpvaG4gQ3Jpc3BpbiA8
am9obkBwaHJvemVuLm9yZz4KVG86IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4K
VG86IE1hcmsgTGVlIDxNYXJrLU1DLkxlZUBtZWRpYXRlay5jb20+ClRvOiBMb3JlbnpvIEJpYW5j
b25pIDxsb3JlbnpvQGtlcm5lbC5vcmc+ClRvOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5i
Z2dAZ21haWwuY29tPgpUbzogQnJ5YW4gV2hpdGVoZWFkIDxicnlhbi53aGl0ZWhlYWRAbWljcm9j
aGlwLmNvbT4KVG86IFVOR0xpbnV4RHJpdmVyQG1pY3JvY2hpcC5jb20KVG86IEdpdXNlcHBlIENh
dmFsbGFybyA8cGVwcGUuY2F2YWxsYXJvQHN0LmNvbT4KVG86IEFsZXhhbmRyZSBUb3JndWUgPGFs
ZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+ClRvOiBKb3NlIEFicmV1IDxqb2FicmV1QHN5bm9w
c3lzLmNvbT4KVG86IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4K
VG86IFZsYWRpbWlyIE9sdGVhbiA8dmxhZGltaXIub2x0ZWFuQG54cC5jb20+ClRvOiBDbGF1ZGl1
IE1hbm9pbCA8Y2xhdWRpdS5tYW5vaWxAbnhwLmNvbT4KVG86IEFsZXhhbmRyZSBCZWxsb25pIDxh
bGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KVG86IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFp
bmVsbGlAZ21haWwuY29tPgpUbzogTGkgWWFuZyA8bGVveWFuZy5saUBueHAuY29tPgpDYzogbmV0
ZGV2QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzog
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1hc3BlZWRAbGlz
dHMub3psYWJzLm9yZwpDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzog
bGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXhwcGMtZGV2
QGxpc3RzLm96bGFicy5vcmcKQ2M6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4KU2lnbmVk
LW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KCi0tLQpBbmRyZXcgTHVu
biAoMTApOgogICAgICBuZXQ6IG1kaW86IGNhdml1bTogU2VwYXJhdGUgQzIyIGFuZCBDNDUgdHJh
bnNhY3Rpb25zCiAgICAgIG5ldDogbWRpbzogaTJjOiBTZXBhcmF0ZSBDMjIgYW5kIEM0NSB0cmFu
c2FjdGlvbnMKICAgICAgbmV0OiBtZGlvOiBtdXgtYmNtLWlwcm9jOiBTZXBhcmF0ZSBDMjIgYW5k
IEM0NSB0cmFuc2FjdGlvbnMKICAgICAgbmV0OiBtZGlvOiBhc3BlZWQ6IFNlcGFyYXRlIEMyMiBh
bmQgQzQ1IHRyYW5zYWN0aW9ucwogICAgICBuZXQ6IG1kaW86IGlwcTQwMTk6IFNlcGFyYXRlIEMy
MiBhbmQgQzQ1IHRyYW5zYWN0aW9ucwogICAgICBuZXQ6IGV0aGVybmV0OiBtdGtfZXRoX3NvYzog
U2VwYXJhdGUgQzIyIGFuZCBDNDUgdHJhbnNhY3Rpb25zCiAgICAgIG5ldDogbGFuNzQzeDogU2Vw
YXJhdGUgQzIyIGFuZCBDNDUgdHJhbnNhY3Rpb25zCiAgICAgIG5ldDogc3RtbWFjOiBTZXBhcmF0
ZSBDMjIgYW5kIEM0NSB0cmFuc2FjdGlvbnMgZm9yIHhnbWFjMgogICAgICBuZXQ6IHN0bW1hYzog
U2VwYXJhdGUgQzIyIGFuZCBDNDUgdHJhbnNhY3Rpb25zIGZvciB4Z21hYwogICAgICBlbmV0Yzog
U2VwYXJhdGUgQzIyIGFuZCBDNDUgdHJhbnNhY3Rpb25zCgogZHJpdmVycy9uZXQvZHNhL29jZWxv
dC9mZWxpeF92c2M5OTU5LmMgICAgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L2ZyZWVzY2FsZS9lbmV0Yy9lbmV0Y19tZGlvLmMgIHwgMTE5ICsrKysrKy0tCiAuLi4vbmV0
L2V0aGVybmV0L2ZyZWVzY2FsZS9lbmV0Yy9lbmV0Y19wY2lfbWRpby5jICB8ICAgNiArLQogZHJp
dmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2VuZXRjL2VuZXRjX3BmLmMgICAgfCAgMTIgKy0K
IGRyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMgICAgICAgIHwgMTc4
ICsrKysrKystLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyb2NoaXAvbGFuNzQzeF9tYWlu
LmMgICAgICB8IDEwNiArKysrLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfbWRpby5jICB8IDMzMSArKysrKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvbmV0
L21kaW8vbWRpby1hc3BlZWQuYyAgICAgICAgICAgICAgICAgICAgIHwgIDQ3ICstLQogZHJpdmVy
cy9uZXQvbWRpby9tZGlvLWNhdml1bS5jICAgICAgICAgICAgICAgICAgICAgfCAxMTEgKysrKyst
LQogZHJpdmVycy9uZXQvbWRpby9tZGlvLWNhdml1bS5oICAgICAgICAgICAgICAgICAgICAgfCAg
IDkgKy0KIGRyaXZlcnMvbmV0L21kaW8vbWRpby1pMmMuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDMyICstCiBkcml2ZXJzL25ldC9tZGlvL21kaW8taXBxNDAxOS5jICAgICAgICAgICAgICAg
ICAgICB8IDE1NCArKysrKystLS0tCiBkcml2ZXJzL25ldC9tZGlvL21kaW8tbXV4LWJjbS1pcHJv
Yy5jICAgICAgICAgICAgICB8ICA1NCArKystCiBkcml2ZXJzL25ldC9tZGlvL21kaW8tb2N0ZW9u
LmMgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9uZXQvbWRpby9tZGlvLXRo
dW5kZXIuYyAgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIGluY2x1ZGUvbGludXgvZnNsL2Vu
ZXRjX21kaW8uaCAgICAgICAgICAgICAgICAgICAgIHwgIDIxICstCiAxNiBmaWxlcyBjaGFuZ2Vk
LCA3NjYgaW5zZXJ0aW9ucygrKSwgNDMyIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDBh
MDkzYjI4OTNjNzExZDgyNjIyYTlhYjI3ZGE0ZjExNzI4MjEzMzYKY2hhbmdlLWlkOiAyMDIzMDEx
Mi1uZXQtbmV4dC1jNDUtc2VwZXJhdGlvbi1wYXJ0LTItMWI4ZmJiMTQ0Njg3CgpCZXN0IHJlZ2Fy
ZHMsCi0tIApNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
