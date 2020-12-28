Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED86F2E680B
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Dec 2020 17:33:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E7C1C5717E;
	Mon, 28 Dec 2020 16:33:01 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A8AFC56638
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Dec 2020 16:33:00 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhFpq-1kOjYv2tNq-00eJLS; Mon, 28 Dec 2020 17:32:59 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1ktvS2-0002GJ-5N; Mon, 28 Dec 2020 17:32:55 +0100
Received: (nullmailer pid 32604 invoked by uid 2001);
 Mon, 28 Dec 2020 16:32:53 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Dec 2020 17:32:13 +0100
Message-Id: <20201228163217.32520-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Scan-Signature: e9056562e10c809dee3344e50e145a1f
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:ztIxjkZXmzA4zIV1xgFd+DY20dZqEQMIRVMHSPYRMW3VFcqIiZw
 n9f6GRjs+5QUaQjm5RvcphCke18ZeRqeibmGi/uiyzWXTS3qJGNYbEJTzYwZZyL2xi/5G5X
 pk07IfD1zPx2OQ/t6ey+RPliD/dYCy/vL/hJgUMbQpEKtWbAii+kSAMSx2pEizt+uTt6Qug
 59hx5SzeZ4RSpArkPg95g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RQlq3c2RuHM=:OfzQvvbw4nmVmbV7Hct3WL
 kvLq1UK438l/NeFTcb9L1gMen7sj2Isbqok1YD9HEv6/3VMu5HBYcwLm0pVbKrjRIRdlUhnyz
 0uccCuUAJiOJU0sNmXI7NxnJypmSoCuvWw7zIy7fMctiYakM/rROpU2DqN4JQtMwWg+kSJZQX
 rsnx+iIRuDLY0GClkUhhZS4Jk4dCzXlpCIMdOnRyjbGONzPjp5nm+IGGoOneMutjYUYDg0v+s
 NWby0pvE0EZl8f2z8JNZpAuep5fJ8oqHWmW59sCOTyCq354LoLuSLZu1NzUJYj+IRy4SIX0K4
 fP+1t/FNaHhAFSphWcp36/4dAO4JzsqEPZDgWXttXZCukJqfDQd8oavxpSLvY+Zssh8v1N3Rn
 D7GVGANRiNTlmphvMDw6PkO7wIVTr6/ihboppxpBQtUB1YZU6ol8ISg+m0Wrdd6yVkYN807cK
 s2wYjuyqUQ==
Cc: devicetree@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH v9 0/4] leds: pwm: Make automatic labels work
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

SGVpIGhlaSwKCnRoZXNlIGFyZSB0aGUgbm90IHlldCB0YWtlbiBwYXRjaGVzIGZyb20gYSBzZXJp
ZXMgd2hpY2ggb3JpZ2luYWxseSBmaXhlZAphIG1pbm9yIGlzc3VlIGluIHRoZSBsZWRzIHB3bSBk
cml2ZXIsIHRoZW4gbWlncmF0ZWQgdGhlIGxlZHMgcHdtIGR0cwpkb2NzIHRvIHlhbWwgKGJ5IHJl
cXVlc3QpLCBhbmQgdGhlbiBmaXhlZCBhbGwgdGhlIGR0cyBmaWxlcyB0cmlnZ2VyaW5nCndhcm5p
bmdzIG9uIHRob3NlIG5ldyBiaW5kaW5ncy4gIFRoZSByZW1haW5pbmcgZm91ciBwYXRjaGVzIG5v
dyBvbmx5IGZpeApkdHMgd2FybmluZ3MsIHRoZSBiYXNlIGZpeCBhbmQgdGhlIHlhbWwgY29udmVy
c2lvbiBpcyBhbHJlYWR5IG1lcmdlZCB0bwptYXN0ZXIuCgpTZXJpZXMgY2hhbmdlbG9nIGJlbG93
IOKApgoKR3JlZXRzCkFsZXgKCnY5OgotIHJlYmFzZWQgc2VyaWVzIG9uIHY1LjExLXJjMQotIHJl
bW92ZWQgYWxyZWFkeSBhcHBsaWVkIHBhdGNoZXMKLSBhZGRlZCBzb21lIG1vcmUgQWNrZWQtYnkK
CnY4OgotIHJlYmFzZWQgc2VyaWVzIG9uIHJlY2VudCBwYXZlbC9mb3ItbmV4dCAocG9zdCB2NS4x
MC1yYzEpCi0gcmVtb3ZlZCBhbHJlYWR5IGFwcGxpZWQgcGF0Y2hlcwotIGFkZGVkIEFja2VkLWJ5
IG9uIHBhdGNoIDEvNQotIHVwZGF0ZWQgcGF0Y2ggMy81IGJhc2VkIG9uIGNvbW1lbnRzIGJ5IEFo
bWFkIEZhdG91bQoKdjc6Ci0gcmViYXNlZCBzZXJpZXMgb24gcmVjZW50IHBhdmVsL2Zvci1uZXh0
Ci0gc3BsaXQgdXAgYXJtIGR0cyBwYXRjaCBieSBhcm0gc3ViIGFyY2ggKHN1Z2dlc3RlZCBieSBL
cnp5c3p0b2YgS296bG93c2tpKQotIGFkZGVkIG11bHRpcGxlIFJldmlld2VkLWJ5IHRhZ3MKLSBz
bGlnaHRseSByZXdvcmRlZCBjb21taXQgbWVzc2FnZXMgKHN1Z2dlc3RlZCBieSBLcnp5c3p0b2Yg
S296bG93c2tpKQotIGFkZGVkIGFjdHVhbCBkdGJzX2NoZWNrIHdhcm5pbmdzIHRvIGNvbW1pdCBt
ZXNzYWdlcwotIGFkZGVkIFJ1c3NlbGwgS2luZyB0byBDYyBmb3IgYmluZGluZyBjb252ZXJzaW9u
IHBhdGNoIChiZWNhdXNlIGxpY2Vuc2UpCgp2NjoKLSByZWJhc2VkIHNlcmllcyBvbiByZWNlbnQg
cGF2ZWwvZm9yLW5leHQKLSBhZGRlZCBSZXZpZXdlZC1ieSBmcm9tIE1hcmVrIHRvIHBhdGNoIDEK
LSBwYXRjaCAyIGZyb20gdjUgd2FzIHBpY2tlZCBieSBQYXZlbCBhbmQgaXMgYWxyZWFkeSBpbiBo
aXMgZm9yLW5leHQKICBicmFuY2gKLSBwcmV2aW91cyBwYXRjaCAzLzMgKG5vdyAyLzcpIHdhcyBy
ZXdvcmtlZCBiYXNlZCBvbiBmZWVkYmFjayBieSBSb2IKLSBhZGRlZCBtb3JlIGR0IHBhdGNoZXMg
Zml4aW5nIHdhcm5pbmdzIGFmdGVyIGJpbmRpbmcgY29udmVyc2lvbiB0byB5YW1sCgp2NToKLSBy
ZXBsYWNlZCBwYXRjaCAxLzMgYnkgYSBuZXcgcGF0Y2ggcmVtb3ZpbmcgcGxhdGZvcm1fZGF0YSBz
dXBwb3J0IGZvcgogIHRoZSBsZWRzLXB3bSBkcml2ZXIKLSBsaXR0bGUgcmV3b3JkaW5nIG9mIGNv
bW1pdCBtZXNzYWdlIGluIHBhdGNoIDIvMwotIHVwZGF0ZWQgcGF0Y2ggMy8zIGJhc2VkIG9uIGZl
ZWRiYWNrIGJ5IFJvYiBIZXJyaW5nCi0gYWRkZWQgTWFyZWsgQmVow7puIHRvIENjLCBiZWNhdXNl
IGhlIGFsc28gd29ya3Mgb24gcmVtb3ZpbmcKICBwbGF0Zm9ybV9kYXRhIHN1cHBvcnQKLSByZWJh
c2VkIHNlcmllcyBvbiBwYXZlbC9mb3ItbmV4dAoKdjQ6Ci0gYWRkZWQgbGVkLWNsYXNzIHBhdGNo
IGhhbmRsaW5nIGZ3bm9kZSBwYXNzaW5nIGRpZmZlcmVudGx5IChwYXRjaCAxLzMpCi0gYWRhcHRl
ZCBsZWRzLXB3bSBwYXRjaCB0byBuZXcgbGVkLWNsYXNzIChwYXRjaCAyLzMpCi0gY29udGFjdGVk
IG9yaWdpbmFsIGF1dGhvciBvZiBsZWRzLXB3bSBkdCBiaW5kaW5nIG9uIGxpY2Vuc2UgaXNzdWUK
ICAocGF0Y2ggMy8zKQoKdjM6Ci0gc2VyaWVzIHJlYmFzZWQgb24gdjUuOS1yYzQKLSBjaGFuZ2Vk
IGxpY2Vuc2Ugb2YgLnlhbWwgZmlsZSB0byByZWNvbW1lbmRlZCBvbmUgKHBhdGNoIDIvMikKLSBh
ZGRlZCBBY2tlZC1ieSB0byBib3RoIHBhdGNoZXMKCnYyOgotIHNlcmllcyByZWJhc2VkIG9uIHY1
LjktcmMzCi0gYWRkZWQgdGhlIGR0LWJpbmRpbmdzIHVwZGF0ZSBwYXRjaCAoMi8yKQoKdjE6Ci0g
YmFzZWQgb24gdjUuOS1yYzIKLSBiYWNrcG9ydCBvbiB2NS40LjU5IHRlc3RlZCBhbmQgd29ya2lu
ZwoKQ2M6IGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnCkNjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCkNjOiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKCgpBbGV4
YW5kZXIgRGFobCAoNCk6CiAgZHQtYmluZGluZ3M6IG1mZDogRml4IHNjaGVtYSB3YXJuaW5ncyBm
b3IgcHdtLWxlZHMKICBBUk06IGR0czogYmVybGluOiBGaXggc2NoZW1hIHdhcm5pbmdzIGZvciBw
d20tbGVkcwogIEFSTTogZHRzOiBzdG0zMjogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxl
ZHMKICBhcm02NDogZHRzOiBtZXNvbjogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxlZHMK
CiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC55YW1sICAgfCAg
NSArKystLQogYXJjaC9hcm0vYm9vdC9kdHMvYmVybGluMmNkLWdvb2dsZS1jaHJvbWVjYXN0LmR0
cyAgIHwgIDYgKysrLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0
cyAgICAgICAgICAgfCAxMyArKysrKysrLS0tLS0tCiAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1neGwtczkwNXgta2hhZGFzLXZpbS5kdHMgfCAgNCArKy0tCiAuLi4vYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1neG0ta2hhZGFzLXZpbTIuZHRzICAgICAgfCAgNCArKy0tCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tc20xLXNlaTYxMC5kdHMgICAgfCAgOCArKysrLS0tLQogNiBm
aWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCgpiYXNlLWNv
bW1pdDogNWM4ZmU1ODNjY2U1NDJhYTBiODRhZGM5MzljZTg1MjkzZGUzNmU1ZQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
