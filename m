Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF18B4A9BD
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 12:12:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC159C3FACA;
	Tue,  9 Sep 2025 10:12:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF979C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 10:12:30 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45b9a856dc2so34095735e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Sep 2025 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757412750; x=1758017550;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
 b=b3HPDpWrciwLx4fDckGlqnwAS471fipAh85nPrIP1R57nCDYTL1p4UazZ+8pp4JJ3k
 NZ5D88Mx3o0TI/GRtQPOrtD33lrPtdx1gDiTX6BHgh6SVt67EFlBMFGWWvvlwoU2fUop
 XolUgXmDRqBrufwk5vGscdSfrpWghIV/l1RqvGtptf6MirgtkHaxdubtu20kXhwm1Nzw
 NLxbjXqy5zRo15qPUoUq5vD0T+9WYP8rCdNvdDBd/ospqt3rwsofKnlfpvIAeMhEaWzc
 y250j7xP5oEh1xQLmWPEIVUEs81dzSOMBhnvf6hTLXJnStk+DtONKfBsyCoIbkR3HBeP
 Fh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757412750; x=1758017550;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
 b=JLbNQQ4Nv4KvfnIyepezMPuX75wkvMLIli3/yjcMJr13HWkdnH8JL3+XCmNrqbpIPY
 KmGkGBBX9ZoA0BRzf55OQXC8iHXKhEizAL+cQEdCXNIjfi5urp7NQbKrNQMREGQU7ONL
 TZEljdltF0rwY845ZnBc3xJr00dlC6jq1YHJfgE72hsnfW1ibezV3ZegEwtUcbGZwsdS
 030ZNYLuCA/e1aWyYzEuLL46IGjFqvLQ9m7z+rEOAF2nKfvw+uliKX0bbvxe3h+GVXLq
 c21K92FN9jTh2Z1KD7zZ+qsrhhskJfx5Lq0AYr7O8GOXJHmKPRgr8I3PKXbKYNCCy6my
 gNxQ==
X-Gm-Message-State: AOJu0YzwDzgyLRERmqvo+zNPQfgukUthrVfXYaDClSV91TsKN3f8/PEN
 HFk5eIcClOuVd/lGHc4/fnw1Bjv9LMa5idgV1tTcK2EhGp6SZgwfTag+
X-Gm-Gg: ASbGncu0JntB1qrkAF9cfQQ7SUgCq8VxnbtJODAq9ZM+t9ryO93L56HtHc6sL++zYbJ
 IEti+KP+Ye3zwaH35KXyBgtw6ntKmto5VUBliXx+0hOejLq5lOj5+49WhB+ZQhdLxYX7O0ytJrI
 UojPqvbHW9MqiAWkYLq7hcDs/goLIG6q3CnBuWNnnPhu1jiERw0NFD27p8JTsYZ+p+1W77IzFX0
 9Zh2HcKOn5MfqS7O1680ahXXD+bnzTEhZP7rbN1nFIuFu4PPlxDhZPv49/xZhKxTtDrpelZtMje
 uQRVY8ROXEP9LTSBpmaChsQ0efwLLjWOjQ+20hkQ/QbFEH42uEDafuFtS/4S/xfcEdTql+JE5cp
 LWACBCgXZhCPbmpJ4VX9zVrBzNUK/55w46+cuBbPXM1SWvhr/ruF4s8dA79JneHeZGEUr29q45+
 eqcM3lqgLqhsLJyULxLGZaqVwHBw==
X-Google-Smtp-Source: AGHT+IEtJ8wCuXdfIRpbS1GqIUUwZYEUFHZ7uVwR4/jyRcbOv5MLRiubr67nXFdjDm1kpxBCCCy3hA==
X-Received: by 2002:a05:600c:1ca8:b0:45d:e285:c4ec with SMTP id
 5b1f17b1804b1-45de285c69bmr86525185e9.4.1757412750223; 
 Tue, 09 Sep 2025 03:12:30 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net.
 [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e8879cesm483992105e9.12.2025.09.09.03.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:12:29 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:14 +0200
MIME-Version: 1.0
Message-Id: <20250909-b4-ddrperfm-upstream-v6-7-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.15-dev-dfb17
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-perf-users@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 07/20] dt-bindings: memory: factorise LPDDR
 channel binding into SDRAM channel
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

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
TFBERFIsIEREUiBhbmQgc28gU0RSQU0gY2hhbm5lbHMgZXhpc3QgYW5kIHNoYXJlIHRoZSBzYW1l
IHByb3BlcnRpZXMsIHRoZXkKaGF2ZSBhIGNvbXBhdGlibGUsIHJhbmtzLCBhbmQgYW4gaW8td2lk
dGguCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNA
Zm9zcy5zdC5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwu
b3JnPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRA
Z21haWwuY29tPgotLS0KIC4uLmxwZGRyLWNoYW5uZWwueWFtbCA9PiBqZWRlYyxzZHJhbS1jaGFu
bmVsLnlhbWx9IHwgMjMgKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGxwZGRy
LWNoYW5uZWwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5uZWwueWFtbApzaW1pbGFyaXR5IGluZGV4
IDgzJQpyZW5hbWUgZnJvbSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5
LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxscGRkci1jaGFubmVsLnlhbWwKcmVuYW1lIHRvIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVj
LHNkcmFtLWNoYW5uZWwueWFtbAppbmRleCAzNGI1YmQxNTNmNjMuLjk4OTJkYTUyMGZlNCAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9s
bGVycy9kZHIvamVkZWMsbHBkZHItY2hhbm5lbC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLHNkcmFtLWNoYW5u
ZWwueWFtbApAQCAtMSwxNiArMSwxNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCiAlWUFNTCAxLjIKIC0tLQotJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGxwZGRy
LWNoYW5uZWwueWFtbCMKKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVtb3J5
LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVsLnlhbWwjCiAkc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKIAotdGl0bGU6IExQRERS
IGNoYW5uZWwgd2l0aCBjaGlwL3JhbmsgdG9wb2xvZ3kgZGVzY3JpcHRpb24KK3RpdGxlOiBTRFJB
TSBjaGFubmVsIHdpdGggY2hpcC9yYW5rIHRvcG9sb2d5IGRlc2NyaXB0aW9uCiAKIGRlc2NyaXB0
aW9uOgotICBBbiBMUEREUiBjaGFubmVsIGlzIGEgY29tcGxldGVseSBpbmRlcGVuZGVudCBzZXQg
b2YgTFBERFIgcGlucyAoRFEsIENBLCBDUywKLSAgQ0ssIGV0Yy4pIHRoYXQgY29ubmVjdCBvbmUg
b3IgbW9yZSBMUEREUiBjaGlwcyB0byBhIGhvc3Qgc3lzdGVtLiBUaGUgbWFpbgotICBwdXJwb3Nl
IG9mIHRoaXMgbm9kZSBpcyB0byBvdmVyYWxsIExQRERSIHRvcG9sb2d5IG9mIHRoZSBzeXN0ZW0s
IGluY2x1ZGluZyB0aGUKLSAgYW1vdW50IG9mIGluZGl2aWR1YWwgTFBERFIgY2hpcHMgYW5kIHRo
ZSByYW5rcyBwZXIgY2hpcC4KKyAgQSBtZW1vcnkgY2hhbm5lbCBvZiBTRFJBTSBtZW1vcnkgbGlr
ZSBERFIgU0RSQU0gb3IgTFBERFIgU0RSQU0gaXMgYSBjb21wbGV0ZWx5CisgIGluZGVwZW5kZW50
IHNldCBvZiBwaW5zIChEUSwgQ0EsIENTLCBDSywgZXRjLikgdGhhdCBjb25uZWN0IG9uZSBvciBt
b3JlIG1lbW9yeQorICBjaGlwcyB0byBhIGhvc3Qgc3lzdGVtLiBUaGUgbWFpbiBwdXJwb3NlIG9m
IHRoaXMgbm9kZSBpcyB0byBvdmVyYWxsIG1lbW9yeQorICB0b3BvbG9neSBvZiB0aGUgc3lzdGVt
LCBpbmNsdWRpbmcgdGhlIGFtb3VudCBvZiBpbmRpdmlkdWFsIG1lbW9yeSBjaGlwcyBhbmQKKyAg
dGhlIHJhbmtzIHBlciBjaGlwLgogCiBtYWludGFpbmVyczoKICAgLSBKdWxpdXMgV2VybmVyIDxq
d2VybmVyQGNocm9taXVtLm9yZz4KQEAgLTI2LDE0ICsyNywxNCBAQCBwcm9wZXJ0aWVzOgogICBp
by13aWR0aDoKICAgICBkZXNjcmlwdGlvbjoKICAgICAgIFRoZSBudW1iZXIgb2YgRFEgcGlucyBp
biB0aGUgY2hhbm5lbC4gSWYgdGhpcyBudW1iZXIgaXMgZGlmZmVyZW50Ci0gICAgICBmcm9tIChh
IG11bHRpcGxlIG9mKSB0aGUgaW8td2lkdGggb2YgdGhlIExQRERSIGNoaXAsIHRoYXQgbWVhbnMg
dGhhdAorICAgICAgZnJvbSAoYSBtdWx0aXBsZSBvZikgdGhlIGlvLXdpZHRoIG9mIHRoZSBTRFJB
TSBjaGlwLCB0aGF0IG1lYW5zIHRoYXQKICAgICAgIG11bHRpcGxlIGluc3RhbmNlcyBvZiB0aGF0
IHR5cGUgb2YgY2hpcCBhcmUgd2lyZWQgaW4gcGFyYWxsZWwgb24gdGhpcwogICAgICAgY2hhbm5l
bCAod2l0aCB0aGUgY2hhbm5lbCdzIERRIHBpbnMgc3BsaXQgdXAgYmV0d2VlbiB0aGUgZGlmZmVy
ZW50CiAgICAgICBjaGlwcywgYW5kIHRoZSBDQSwgQ1MsIGV0Yy4gcGlucyBvZiB0aGUgZGlmZmVy
ZW50IGNoaXBzIGFsbCBzaG9ydGVkCiAgICAgICB0b2dldGhlcikuICBUaGlzIG1lYW5zIHRoYXQg
dGhlIHRvdGFsIHBoeXNpY2FsIG1lbW9yeSBjb250cm9sbGVkIGJ5IGEKICAgICAgIGNoYW5uZWwg
aXMgZXF1YWwgdG8gdGhlIHN1bSBvZiB0aGUgZGVuc2l0aWVzIG9mIGVhY2ggcmFuayBvbiB0aGUK
LSAgICAgIGNvbm5lY3RlZCBMUEREUiBjaGlwLCB0aW1lcyB0aGUgaW8td2lkdGggb2YgdGhlIGNo
YW5uZWwgZGl2aWRlZCBieQotICAgICAgdGhlIGlvLXdpZHRoIG9mIHRoZSBMUEREUiBjaGlwLgor
ICAgICAgY29ubmVjdGVkIFNEUkFNIGNoaXAsIHRpbWVzIHRoZSBpby13aWR0aCBvZiB0aGUgY2hh
bm5lbCBkaXZpZGVkIGJ5CisgICAgICB0aGUgaW8td2lkdGggb2YgdGhlIFNEUkFNIGNoaXAuCiAg
ICAgZW51bToKICAgICAgIC0gOAogICAgICAgLSAxNgpAQCAtNTEsOCArNTIsOCBAQCBwYXR0ZXJu
UHJvcGVydGllczoKICAgIl5yYW5rQFswLTldKyQiOgogICAgIHR5cGU6IG9iamVjdAogICAgIGRl
c2NyaXB0aW9uOgotICAgICAgRWFjaCBwaHlzaWNhbCBMUEREUiBjaGlwIG1heSBoYXZlIG9uZSBv
ciBtb3JlIHJhbmtzLiBSYW5rcyBhcmUKLSAgICAgIGludGVybmFsIGJ1dCBmdWxseSBpbmRlcGVu
ZGVudCBzdWItdW5pdHMgb2YgdGhlIGNoaXAuIEVhY2ggTFBERFIgYnVzCisgICAgICBFYWNoIHBo
eXNpY2FsIFNEUkFNIGNoaXAgbWF5IGhhdmUgb25lIG9yIG1vcmUgcmFua3MuIFJhbmtzIGFyZQor
ICAgICAgaW50ZXJuYWwgYnV0IGZ1bGx5IGluZGVwZW5kZW50IHN1Yi11bml0cyBvZiB0aGUgY2hp
cC4gRWFjaCBTRFJBTSBidXMKICAgICAgIHRyYW5zYWN0aW9uIG9uIHRoZSBjaGFubmVsIHRhcmdl
dHMgZXhhY3RseSBvbmUgcmFuaywgYmFzZWQgb24gdGhlCiAgICAgICBzdGF0ZSBvZiB0aGUgQ1Mg
cGlucy4gRGlmZmVyZW50IHJhbmtzIG1heSBoYXZlIGRpZmZlcmVudCBkZW5zaXRpZXMgYW5kCiAg
ICAgICB0aW1pbmcgcmVxdWlyZW1lbnRzLgoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
