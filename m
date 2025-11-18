Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7AFC6A6EC
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 16:55:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F782C62D3A;
	Tue, 18 Nov 2025 15:55:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28BE2C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 15:09:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4775638d819so32621655e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 07:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763478540; x=1764083340;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
 b=QI8nRHUxl9sV5LASbTfqdlf+uBN8AyCuh2yhDf2BwpMxZgGupyoPacX2z9VoZV+VcB
 CAgz3JjdlbmIIpFFEOxel6l4vK144BiDxAOy+hAZkifBGyabTZtNj007oA16qZlsf++l
 nlCcTTcj0HY8wtS3Lqz10Abxv/sYRS857PIFmhBV5jvmySmAm9HF6dI2CgcWjckib1jx
 pqw2E8zywdlfHKcF8lAl6wN531KH9nWGXgwV7s3f2heo8EvlURGJXMO83Dx0nuf3maBM
 puqwGnVbkg73//mHEe47AwO4SZdEHg0fInsjDjjto1G3mfJ2zyVgxrU6IfW9uCFhoesW
 zzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478540; x=1764083340;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
 b=OWGXzvyOvgr2UUnVR0vUfIMxJLkORZmJj+D4odvl1vj8pAxgJznNm+OPVB/oDYFK0W
 P6Ud3YuCXRVtrAnQ8QzXElP3PfHyl4Uv2Q2TiBZlciQdLfQuGoc4V/jHkfiH+PO1Vdg1
 N0BHVdh2CEfusqO3ebPZoQCawHdo4rPlCwSj5h3Y6Kd6u9uyLaKYcRTmjb+f7csU9lbs
 boSyjPBDFX+KwYfd7fONLxM3D2C7j9GxZZMVh5Ek/NO7lgMBAn9UVvwWbvcjBVtgEz05
 P1kRbytbpd2TFOvhAiStUH3lIfomsdn5ji6PAUsQDO/Q7OAOKc5GgeR/iXtwCMZN8/Sx
 8fDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNqxm6l6V/B5MaQ6SALJV4Jyu5oHeS0V9oCgEs+PwQ7oH4Xr6EcrVBChxfzYwFq08l+DZMu9vFHyPiFg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRkA6iYmK5F67getVkiMqvo18BEoWCLsUyzseyEyKy7SoGZOhO
 T4t7Ey1v7V7tnGT3P2/XWgQLd4Xapc2Fvb+JuhNqmJq8gloa+gpefcVF
X-Gm-Gg: ASbGncsUk2OxFG0sr5lE0u3GLCxj8PRoCHOrSPo7Jpzun2fVsQM/9y30pTE8iXn+d/7
 4UUJv8WTnw+8T3LY633X9oED8zg7Xvs33OAQcY7mwBTlAQhzOn49GXlb0W+3Z5XDHw4PaGDyh70
 nPPbPxRBp1Z+JgHvdaXhERHJrNrIkLghOh+qH2MH5VlRNRGWz/nBT0Xmgb2/Y7oRaxALLeYLanN
 yP7lb4uv3c3Zns0aIBgfBJ8Q53U7se+X788vSsWY0Mv/iiETgvfPZgLG+4wuB15jU46MDDACv4U
 5Ne3T9eGjuvwQHYV23PgSBtqi8imiLozxUu8ck1MqkMK8Nr1vj6DqYrDo4l4uFZtZ+ePOesqndz
 byQO4yPDpfDZsa70OMT2mLBpoBtWFrzn/0UJwI/scE5gtYz+jQdshFq9mTnBjMSMHUmXhJ9cC7x
 xg0594F8JCTp3ja+tvb25FFIQjMSdCQyOokhhEF4FZE5rrcysiF5her1wk9kTzjrPFGchC1SOqH
 cQxINKmw7f1QTot
X-Google-Smtp-Source: AGHT+IFLl4dTul/hQUjz6znuPzdhl9FsYr/3lANR6xEisIy2fBHrkJclICxFWj3/Vuc18YtPkkQIbw==
X-Received: by 2002:a05:600c:8b4c:b0:477:7925:f7fb with SMTP id
 5b1f17b1804b1-4778fe67aeamr162299715e9.10.1763478539426; 
 Tue, 18 Nov 2025 07:08:59 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net.
 [2a02:842a:9b20:d01:432b:dab:f195:2b25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e442c2sm382320455e9.7.2025.11.18.07.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:08:59 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:07:59 +0100
MIME-Version: 1.0
Message-Id: <20251118-b4-ddr-bindings-v9-3-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-86b30
X-Mailman-Approved-At: Tue, 18 Nov 2025 15:55:27 +0000
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 3/7] dt-bindings: memory: factorise LPDDR
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
