Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D934A9CC
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 15:35:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D365C57B78;
	Fri, 26 Mar 2021 14:35:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D73EC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 14:35:03 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso5031937wmi.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3l551s5G/pAF2wkYmEGgkPl5576caUaplD4n6kxekE=;
 b=MTRryAA06req0yLkcmh0+vjQXJlDARQPhUrLZiiD0V629oE/6wzOWZ4olgS2tVfZKf
 GhzFt96jl+vOy4dKSROxDJg+OomuFS/6kPkB3gqlJTX8kgMhkWvvN4x7+adh72SDEc/i
 IosIat3qSscvWHtAqM73Ekp8IVStGN4NAGzEz7KDN1334y2kC2zYNpgaPgVkDUn5Z4zS
 6EXicNQ7KUdBgCnq4Gp/0HoxagX+ru0hgRtEBWGPJkv6Nznmd+N3/tbTSDfW5sLA6z3l
 OPe14PbUR8UxjVTR6cRUeQgETo+jq7AQD1kdVih5tXqhS2khRSfAQQcwId4Z1SJWolSD
 il7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3l551s5G/pAF2wkYmEGgkPl5576caUaplD4n6kxekE=;
 b=dfUm1peW/vRMTVvWJnxTyUdPP0ysy1gzHMJPED4F0Ohnkb1U7N4ny9GEZ+9YwM8clQ
 /TtKOjGZEedRBIUi0epPmoBhBcvafIEyd8Q7DlJlr3H1zrWHdmw/rOvZOsDA7Jp+ptNa
 aIQEysQoRmcLiAU99eHBNumZXdNitEr1GREkwD+qaCmV6B+iNqSTwfSztDTICR8fgRRR
 x4GOf0crKJPSD+KcVfykHzVKoFHKM/5avsSk9VKdCUcmQmvV02OKvMHMKUggtwTAuytV
 wtdzxAuMOwf6Jn/BbgbWW58agIi+QhuqcSJshNPSwn/2Ac3eXlLdQ37oWRcDaIpHy594
 UMkQ==
X-Gm-Message-State: AOAM531EMJ/WUuaK/a+2Edb92QIBwkUJhvOGiP2QLKr/twIZ4iP4fzHv
 eU22iy6ahO/TmIwZ08wOBqN14w==
X-Google-Smtp-Source: ABdhPJys2BqxpGOTGUAOVltyeRUwXqaB5Ir7KGDurKi6UIWqunYXDHtl6cDvVh06p/RXnXTrderF7w==
X-Received: by 2002:a1c:6543:: with SMTP id z64mr13457846wmb.50.1616769302815; 
 Fri, 26 Mar 2021 07:35:02 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:35:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 14:34:33 +0000
Message-Id: <20210326143458.508959-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
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
Subject: [Linux-stm32] [RESEND 00/25] Rid W=1 warnings from HID
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
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCltSRVNFTkRdIGNvbnRhaW5zIG5v
IGZ1bmN0aW9uYWwgY2hhbmdlcy4gIE9ubHkgMTggb2YgMjUgcGF0Y2hlcwphY3R1YWxseSBtYWRl
IGl0IHRvIHRoZSBsaXN0IGR1cmluZyB0aGUgZmlyc3QgYXR0ZW1wdC4KCkxlZSBKb25lcyAoMjUp
OgogIEhJRDogaW50ZWwtaXNoLWhpZDogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAnZXJyJwogIEhJ
RDogaXNodHAtaGlkLWNsaWVudDogTW92ZSB2YXJpYWJsZSB0byB3aGVyZSBpdCdzIGFjdHVhbGx5
IHVzZWQKICBISUQ6IGludGVsLWlzaC1oaWQ6IHBjaS1pc2g6IFJlbW92ZSB1bnVzZWQgdmFyaWFi
bGUgJ3JldCcKICBISUQ6IGludGVsLWlzaDogU3VwcGx5IHNvbWUgbWlzc2luZyBwYXJhbSBkZXNj
cmlwdGlvbnMKICBISUQ6IGludGVsLWlzaDogRml4IGEgbmFtaW5nIGRpc3Bhcml0eSBhbmQgYSBm
b3JtYXR0aW5nIGVycm9yCiAgSElEOiB1c2JoaWQ6IFJlcGFpciBhIGZvcm1hdHRpbmcgaXNzdWUg
aW4gYSBzdHJ1Y3QgZGVzY3JpcHRpb24KICBISUQ6IGludGVsLWlzaC1oaWQ6IEZpeCBhIGxpdHRs
ZSBkb2Mtcm90CiAgSElEOiB1c2JoaWQ6IGhpZC1waWRmZjogRGVtb3RlIGEgY291cGxlIGtlcm5l
bC1kb2MgYWJ1c2VzCiAgSElEOiBoaWQtYWxwczogQ29ycmVjdCBzdHJ1Y3QgbWlzbmFtaW5nCiAg
SElEOiBpbnRlbC1pc2gtaGlkOiBGaXggcG90ZW50aWFsIGNvcHkvcGFzdGUgZXJyb3IKICBISUQ6
IGhpZC1jb3JlOiBGaXggaW5jb3JyZWN0IGZ1bmN0aW9uIG5hbWUgaW4gaGVhZGVyCiAgSElEOiBp
bnRlbC1pc2gtaGlkOiBpcGM6IENvcnJlY3QgZndfcmVzZXRfd29ya19mbigpIGZ1bmN0aW9uIG5h
bWUgaW4KICAgIGhlYWRlcgogIEhJRDogaXNodHAtaGlkLWNsaWVudDogRml4IGluY29ycmVjdCBm
dW5jdGlvbiBuYW1lIHJlcG9ydF9iYWRfcGFja2V0KCkKICBISUQ6IGhpZC1reWU6IEZpeCBpbmNv
cnJlY3QgZnVuY3Rpb24gbmFtZSBmb3Iga3llX3RhYmxldF9lbmFibGUoKQogIEhJRDogaGlkLXBp
Y29sY2RfY29yZTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0JwogIEhJRDogaGlkLWxvZ2l0
ZWNoLWhpZHBwOiBGaXggY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlciBhbmQgZGVtb3RlCiAg
ICBhYnVzZXMKICBISUQ6IGhpZC11Y2xvZ2ljLXJkZXNjOiBLZXJuZWwtZG9jIGlzIGZvciBmdW5j
dGlvbnMgYW5kIHN0cnVjdHMKICBISUQ6IGhpZC10aHJ1c3RtYXN0ZXI6IERlbW90ZSBhIGJ1bmNo
IG9mIGtlcm5lbC1kb2MgYWJ1c2VzCiAgSElEOiBoaWQtdWNsb2dpYy1wYXJhbXM6IEVuc3VyZSBm
dW5jdGlvbiBuYW1lcyBhcmUgcHJlc2VudCBhbmQgY29ycmVjdAogICAgaW4ga2VybmVsLWRvYyBo
ZWFkZXJzCiAgSElEOiBoaWQtc2Vuc29yLWN1c3RvbTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAn
cmV0JwogIEhJRDogd2Fjb21fc3lzOiBEZW1vdGUga2VybmVsLWRvYyBhYnVzZQogIEhJRDogaGlk
LXNlbnNvci1odWI6IFJlbW92ZSB1bnVzZWQgc3RydWN0IG1lbWJlciAncXVpcmtzJwogIEhJRDog
aGlkLXNlbnNvci1odWI6IE1vdmUgJ2hzZGV2JyBkZXNjcmlwdGlvbiB0byBjb3JyZWN0IHN0cnVj
dAogICAgZGVmaW5pdGlvbgogIEhJRDogaW50ZWwtaXNoLWhpZDogaXNodHAtZnctbG9hZGVyOiBG
aXggYSBidW5jaCBvZiBmb3JtYXR0aW5nIGlzc3VlcwogIEhJRDogaXNodHAtaGlkLWNsaWVudDog
Rml4ICdzdWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXQnIGNvbXBpbGVyIHdhcm5pbmcKCiBkcml2ZXJz
L2hpZC9oaWQtYWxwcy5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2hp
ZC9oaWQtY29yZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2hpZC9o
aWQta3llLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2hpZC9oaWQt
bG9naXRlY2gtaGlkcHAuYyAgICAgICAgICAgICB8ICA3ICstLQogZHJpdmVycy9oaWQvaGlkLXBp
Y29sY2RfY29yZS5jICAgICAgICAgICAgICAgfCAgNSArLS0KIGRyaXZlcnMvaGlkL2hpZC1zZW5z
b3ItY3VzdG9tLmMgICAgICAgICAgICAgIHwgIDUgKy0tCiBkcml2ZXJzL2hpZC9oaWQtc2Vuc29y
LWh1Yi5jICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL2hpZC9oaWQtdGhydXN0bWFz
dGVyLmMgICAgICAgICAgICAgICB8IDI0ICsrKysrLS0tLS0tCiBkcml2ZXJzL2hpZC9oaWQtdWNs
b2dpYy1wYXJhbXMuYyAgICAgICAgICAgICB8ICA4ICsrLS0KIGRyaXZlcnMvaGlkL2hpZC11Y2xv
Z2ljLXJkZXNjLmMgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1o
aWQvaXBjL2lwYy5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQv
aXBjL3BjaS1pc2guYyAgICAgIHwgIDMgKy0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNo
dHAtZnctbG9hZGVyLmMgIHwgNDUgKysrKysrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvaGlkL2lu
dGVsLWlzaC1oaWQvaXNodHAtaGlkLWNsaWVudC5jIHwgMTEgKysrLS0KIGRyaXZlcnMvaGlkL2lu
dGVsLWlzaC1oaWQvaXNodHAtaGlkLmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvaGlkL2ludGVs
LWlzaC1oaWQvaXNodHAtaGlkLmggICAgICAgIHwgIDkgKy0tLQogZHJpdmVycy9oaWQvaW50ZWwt
aXNoLWhpZC9pc2h0cC9idXMuYyAgICAgICAgfCAgOSArKystCiBkcml2ZXJzL2hpZC9pbnRlbC1p
c2gtaGlkL2lzaHRwL2NsaWVudC5jICAgICB8ICA1ICstLQogZHJpdmVycy9oaWQvaW50ZWwtaXNo
LWhpZC9pc2h0cC9oYm0uYyAgICAgICAgfCAgNCArLQogZHJpdmVycy9oaWQvaW50ZWwtaXNoLWhp
ZC9pc2h0cC9pc2h0cC1kZXYuaCAgfCAgNCArLQogZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1waWRm
Zi5jICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9oaWQvdXNiaGlkL3VzYmtiZC5jICAg
ICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9oaWQvd2Fjb21fc3lzLmMgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQogaW5jbHVkZS9saW51eC9pbnRlbC1pc2gtY2xpZW50LWlmLmgg
ICAgICAgICAgfCAgOCArKystCiAyNCBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCA4
MSBkZWxldGlvbnMoLSkKCkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZv
c3Muc3QuY29tPgpDYzogQW5zc2kgSGFubnVsYSA8YW5zc2kuaGFubnVsYUBnbWFpbC5jb20+CkNj
OiBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbmphbWluLnRpc3NvaXJlc0ByZWRoYXQuY29tPgpDYzog
IkJydW5vIFByw6ltb250IiA8Ym9uYm9uc0BsaW51eC12c2VydmVyLm9yZz4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGFuaWVsIERydWJpbiA8
ZGFuaWVsLmRydWJpbkBpbnRlbC5jb20+CkNjOiBEYXJpbyBQYWdhbmkgPGRhcmlvLnBhZ2FuaS4x
NDYrbGludXhrQGdtYWlsLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IEhlbnJpayBSeWRiZXJnIDxyeWRiZXJnQGJpdG1hdGgub3JnPgpDYzogSmlyaSBLb3NpbmEg
PGppa29zQGtlcm5lbC5vcmc+CkNjOiBKb25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3Jn
PgpDYzogS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPgpDYzogS2lt
IEt1cGFyaW5lbiA8a2ltaS5oLmt1cGFyaW5lbkBnbWFpbC5jb20+CkNjOiAiS3J6eXN6dG9mIFdp
bGN6ecWEc2tpIiA8a3dAbGludXguY29tPgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1paW9Admdlci5rZXJuZWwub3JnCkNj
OiBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVs
Lm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGlu
dXgtdXNiQHZnZXIua2VybmVsLm9yZwpDYzogTG9wZXogQ2FzYWRvIDxubG9wZXpjYXNhZEBsb2dp
dGVjaC5jb20+CkNjOiAiTC4gVmlueWFyZCwgSnIiIDxydmlueWFyZEBjcy5ubXN1LmVkdT4KQ2M6
IE1hc2FraSBPdGEgPG1hc2FraS5vdGFAanAuYWxwcy5jb20+CkNjOiBNYXhpbWUgQ29xdWVsaW4g
PG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+CkNjOiBtZXNzYWdlIHRvIDx2b2p0ZWNoQHVjdy5j
ej4KQ2M6IE1pY2hhZWwgSGFib3VzdGFrIDxtaWtlLUBjaW5jaS5yci5jb20+CkNjOiBSdXNoaWtl
c2ggUyBLYWRhbSA8cnVzaGlrZXNoLnMua2FkYW1AaW50ZWwuY29tPgpDYzogU3Jpbml2YXMgUGFu
ZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+CkNjOiBTdW1pdCBT
ZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIlV3ZSBLbGVpbmUtS8O2bmlnIiA8
dXdlQGtsZWluZS1rb2VuaWcub3JnPgpDYzogVm9qdGVjaCBQYXZsaWsgPHZvanRlY2hAc3VzZS5j
ej4KQ2M6IFpoYW5nIExpeHUgPGxpeHUuemhhbmdAaW50ZWwuY29tPgotLSAKMi4yNy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
