Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 606C5347F67
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Mar 2021 18:34:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0BCAC57B5E;
	Wed, 24 Mar 2021 17:34:09 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8FA7C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 17:34:08 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id kt15so24777782ejb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 10:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VoFNqvJqV3TdL84vFoklC/P+s5SxY+mp4X8TTiNgMtE=;
 b=p5GUKS/uwIXlF0KDHuVWCTKOILfvq6pgQeedSTtsSMFwzeuZp8AKlKbhStPy4SRDFk
 HRqJKvh8toc4XC2CDpMwgejowYDSgwwsD1NNm/IZLadO+9aHWEJEa7SnZn+Fzie+/tpY
 cHhRabnd8kARi5Sxtf813O8WVqAJ4I6376ff+ZdtFwIXyxn2TFZwAcHQP8iPkpz2DhES
 sPWg2kI28DA6L8flcNKaK7fCrqsKbgjkmeINLGfWN8W8iv4Lz10+IASi3UZhscm0Vp5a
 4LfKAQOpAmDlZWEXD41zDbsvBBjj9lvzYhyZx+Ckfdf3hiQ9fnRbMmWjK4JD9JZdNjZV
 soZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VoFNqvJqV3TdL84vFoklC/P+s5SxY+mp4X8TTiNgMtE=;
 b=LNEWaNGZQ/Eu3eGnxiP3K8d2rQTVj5Bo0ZMBhnsJGiBrN7xlePw9firQ83G/zQIj/H
 zsaujKEP31RFiEILcOc2oEI78O7e+w1k28RLisi8+iXQVhQi3TwBvIubOBPXXgpp3fwv
 nooqDx1z32g8+mMLvhcHbDfDOdhiTdHglmBShgd01xBgsMgTh3wB23gQEiaeSE+mteu8
 4Z1/tU1WpJy9euXhdNCxYWG3LrLAskPX9EE4nYirBBarp8YvRWAhLnBXTD1HvYclyovC
 Qp0V+DvtQEC4MtPmzVUGq2c9a33IfPoFb3SORdT8JPwoXIIkwnLuTqR3eLcGlKxppKTg
 ws7w==
X-Gm-Message-State: AOAM532m6zuGBNMrMnkoa1CS+R8CxII29VQZEU9m1kAJEOI698QlI11p
 uvHISx004MQBQ/V4gFm4UUvxlA==
X-Google-Smtp-Source: ABdhPJzwCa1MrVqILnw5ineqDKoBXsRVPYAznXPlfLrlyyVo9HL2XAvV+eancRBLlKNZ4hQlmcJ62g==
X-Received: by 2002:a17:906:7946:: with SMTP id
 l6mr4857686ejo.500.1616607247797; 
 Wed, 24 Mar 2021 10:34:07 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:34:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed, 24 Mar 2021 17:33:39 +0000
Message-Id: <20210324173404.66340-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Zhang Lixu <lixu.zhang@intel.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Henrik Rydberg <rydberg@bitmath.org>,
 Lopez Casado <nlopezcasad@logitech.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Vojtech Pavlik <vojtech@suse.cz>, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 message to <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, "L. Vinyard,
 Jr" <rvinyard@cs.nmsu.edu>, linaro-mm-sig@lists.linaro.org,
 Michael Haboustak <mike-@cinci.rr.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Drubin <daniel.drubin@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 00/25] Rid W=1 warnings from HID
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

VGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11
cCBXPTEKa2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSBy
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCkxlZSBKb25lcyAoMjUpOgogIEhJ
RDogaW50ZWwtaXNoLWhpZDogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAnZXJyJwogIEhJRDogaXNo
dHAtaGlkLWNsaWVudDogTW92ZSB2YXJpYWJsZSB0byB3aGVyZSBpdCdzIGFjdHVhbGx5IHVzZWQK
ICBISUQ6IGludGVsLWlzaC1oaWQ6IHBjaS1pc2g6IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgJ3Jl
dCcKICBISUQ6IGludGVsLWlzaDogU3VwcGx5IHNvbWUgbWlzc2luZyBwYXJhbSBkZXNjcmlwdGlv
bnMKICBISUQ6IGludGVsLWlzaDogRml4IGEgbmFtaW5nIGRpc3Bhcml0eSBhbmQgYSBmb3JtYXR0
aW5nIGVycm9yCiAgSElEOiB1c2JoaWQ6IFJlcGFpciBhIGZvcm1hdHRpbmcgaXNzdWUgaW4gYSBz
dHJ1Y3QgZGVzY3JpcHRpb24KICBISUQ6IGludGVsLWlzaC1oaWQ6IEZpeCBhIGxpdHRsZSBkb2Mt
cm90CiAgSElEOiB1c2JoaWQ6IGhpZC1waWRmZjogRGVtb3RlIGEgY291cGxlIGtlcm5lbC1kb2Mg
YWJ1c2VzCiAgSElEOiBoaWQtYWxwczogQ29ycmVjdCBzdHJ1Y3QgbWlzbmFtaW5nCiAgSElEOiBp
bnRlbC1pc2gtaGlkOiBGaXggcG90ZW50aWFsIGNvcHkvcGFzdGUgZXJyb3IKICBISUQ6IGhpZC1j
b3JlOiBGaXggaW5jb3JyZWN0IGZ1bmN0aW9uIG5hbWUgaW4gaGVhZGVyCiAgSElEOiBpbnRlbC1p
c2gtaGlkOiBpcGM6IENvcnJlY3QgZndfcmVzZXRfd29ya19mbigpIGZ1bmN0aW9uIG5hbWUgaW4K
ICAgIGhlYWRlcgogIEhJRDogaXNodHAtaGlkLWNsaWVudDogRml4IGluY29ycmVjdCBmdW5jdGlv
biBuYW1lIHJlcG9ydF9iYWRfcGFja2V0KCkKICBISUQ6IGhpZC1reWU6IEZpeCBpbmNvcnJlY3Qg
ZnVuY3Rpb24gbmFtZSBmb3Iga3llX3RhYmxldF9lbmFibGUoKQogIEhJRDogaGlkLXBpY29sY2Rf
Y29yZTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0JwogIEhJRDogaGlkLWxvZ2l0ZWNoLWhp
ZHBwOiBGaXggY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlciBhbmQgZGVtb3RlCiAgICBhYnVz
ZXMKICBISUQ6IGhpZC11Y2xvZ2ljLXJkZXNjOiBLZXJuZWwtZG9jIGlzIGZvciBmdW5jdGlvbnMg
YW5kIHN0cnVjdHMKICBISUQ6IGhpZC10aHJ1c3RtYXN0ZXI6IERlbW90ZSBhIGJ1bmNoIG9mIGtl
cm5lbC1kb2MgYWJ1c2VzCiAgSElEOiBoaWQtdWNsb2dpYy1wYXJhbXM6IEVuc3VyZSBmdW5jdGlv
biBuYW1lcyBhcmUgcHJlc2VudCBhbmQgY29ycmVjdAogICAgaW4ga2VybmVsLWRvYyBoZWFkZXJz
CiAgSElEOiBoaWQtc2Vuc29yLWN1c3RvbTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0Jwog
IEhJRDogd2Fjb21fc3lzOiBEZW1vdGUga2VybmVsLWRvYyBhYnVzZQogIEhJRDogaGlkLXNlbnNv
ci1odWI6IFJlbW92ZSB1bnVzZWQgc3RydWN0IG1lbWJlciAncXVpcmtzJwogIEhJRDogaGlkLXNl
bnNvci1odWI6IE1vdmUgJ2hzZGV2JyBkZXNjcmlwdGlvbiB0byBjb3JyZWN0IHN0cnVjdAogICAg
ZGVmaW5pdGlvbgogIEhJRDogaW50ZWwtaXNoLWhpZDogaXNodHAtZnctbG9hZGVyOiBGaXggYSBi
dW5jaCBvZiBmb3JtYXR0aW5nIGlzc3VlcwogIEhJRDogaXNodHAtaGlkLWNsaWVudDogRml4ICdz
dWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXQnIGNvbXBpbGVyIHdhcm5pbmcKCiBkcml2ZXJzL2hpZC9o
aWQtYWxwcy5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2hpZC9oaWQt
Y29yZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2hpZC9oaWQta3ll
LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2hpZC9oaWQtbG9naXRl
Y2gtaGlkcHAuYyAgICAgICAgICAgICB8ICA3ICstLQogZHJpdmVycy9oaWQvaGlkLXBpY29sY2Rf
Y29yZS5jICAgICAgICAgICAgICAgfCAgNSArLS0KIGRyaXZlcnMvaGlkL2hpZC1zZW5zb3ItY3Vz
dG9tLmMgICAgICAgICAgICAgIHwgIDUgKy0tCiBkcml2ZXJzL2hpZC9oaWQtc2Vuc29yLWh1Yi5j
ICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL2hpZC9oaWQtdGhydXN0bWFzdGVyLmMg
ICAgICAgICAgICAgICB8IDI0ICsrKysrLS0tLS0tCiBkcml2ZXJzL2hpZC9oaWQtdWNsb2dpYy1w
YXJhbXMuYyAgICAgICAgICAgICB8ICA4ICsrLS0KIGRyaXZlcnMvaGlkL2hpZC11Y2xvZ2ljLXJk
ZXNjLmMgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXBj
L2lwYy5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXBjL3Bj
aS1pc2guYyAgICAgIHwgIDMgKy0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAtZnct
bG9hZGVyLmMgIHwgNDUgKysrKysrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvaGlkL2ludGVsLWlz
aC1oaWQvaXNodHAtaGlkLWNsaWVudC5jIHwgMTEgKysrLS0KIGRyaXZlcnMvaGlkL2ludGVsLWlz
aC1oaWQvaXNodHAtaGlkLmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1o
aWQvaXNodHAtaGlkLmggICAgICAgIHwgIDkgKy0tLQogZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhp
ZC9pc2h0cC9idXMuYyAgICAgICAgfCAgOSArKystCiBkcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlk
L2lzaHRwL2NsaWVudC5jICAgICB8ICA1ICstLQogZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhpZC9p
c2h0cC9oYm0uYyAgICAgICAgfCAgNCArLQogZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhpZC9pc2h0
cC9pc2h0cC1kZXYuaCAgfCAgNCArLQogZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1waWRmZi5jICAg
ICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9oaWQvdXNiaGlkL3VzYmtiZC5jICAgICAgICAg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9oaWQvd2Fjb21fc3lzLmMgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogaW5jbHVkZS9saW51eC9pbnRlbC1pc2gtY2xpZW50LWlmLmggICAgICAg
ICAgfCAgOCArKystCiAyNCBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCA4MSBkZWxl
dGlvbnMoLSkKCkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3Qu
Y29tPgpDYzogQW5zc2kgSGFubnVsYSA8YW5zc2kuaGFubnVsYUBnbWFpbC5jb20+CkNjOiBCZW5q
YW1pbiBUaXNzb2lyZXMgPGJlbmphbWluLnRpc3NvaXJlc0ByZWRoYXQuY29tPgpDYzogIkJydW5v
IFByw6ltb250IiA8Ym9uYm9uc0BsaW51eC12c2VydmVyLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGFuaWVsIERydWJpbiA8ZGFuaWVs
LmRydWJpbkBpbnRlbC5jb20+CkNjOiBEYXJpbyBQYWdhbmkgPGRhcmlvLnBhZ2FuaS4xNDYrbGlu
dXhrQGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEhl
bnJpayBSeWRiZXJnIDxyeWRiZXJnQGJpdG1hdGgub3JnPgpDYzogSmlyaSBLb3NpbmEgPGppa29z
QGtlcm5lbC5vcmc+CkNjOiBKb25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3JnPgpDYzog
S2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPgpDYzogS2ltIEt1cGFy
aW5lbiA8a2ltaS5oLmt1cGFyaW5lbkBnbWFpbC5jb20+CkNjOiAiS3J6eXN6dG9mIFdpbGN6ecWE
c2tpIiA8a3dAbGludXguY29tPgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
Q2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1paW9Admdlci5rZXJuZWwub3JnCkNjOiBsaW51
eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpD
YzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtdXNi
QHZnZXIua2VybmVsLm9yZwpDYzogTG9wZXogQ2FzYWRvIDxubG9wZXpjYXNhZEBsb2dpdGVjaC5j
b20+CkNjOiAiTC4gVmlueWFyZCwgSnIiIDxydmlueWFyZEBjcy5ubXN1LmVkdT4KQ2M6IE1hc2Fr
aSBPdGEgPG1hc2FraS5vdGFAanAuYWxwcy5jb20+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1
ZWxpbi5zdG0zMkBnbWFpbC5jb20+CkNjOiBtZXNzYWdlIHRvIDx2b2p0ZWNoQHVjdy5jej4KQ2M6
IE1pY2hhZWwgSGFib3VzdGFrIDxtaWtlLUBjaW5jaS5yci5jb20+CkNjOiBSdXNoaWtlc2ggUyBL
YWRhbSA8cnVzaGlrZXNoLnMua2FkYW1AaW50ZWwuY29tPgpDYzogU3Jpbml2YXMgUGFuZHJ1dmFk
YSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+CkNjOiBTdW1pdCBTZW13YWwg
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIlV3ZSBLbGVpbmUtS8O2bmlnIiA8dXdlQGts
ZWluZS1rb2VuaWcub3JnPgpDYzogVm9qdGVjaCBQYXZsaWsgPHZvanRlY2hAc3VzZS5jej4KQ2M6
IFpoYW5nIExpeHUgPGxpeHUuemhhbmdAaW50ZWwuY29tPgotLSAKMi4yNy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
