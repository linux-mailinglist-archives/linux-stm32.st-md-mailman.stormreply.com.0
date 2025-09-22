Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84473B8FE73
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:06:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 447A5C3F92E;
	Mon, 22 Sep 2025 10:06:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0550C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:06:24 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-46cbdf513d7so10208945e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758535584; x=1759140384;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
 b=Kk/eApNyMa9hic+EZI+5wIL5LnS/N4be61Xomlc42/jPEuNAs5Cu/e1ZcrkM835BxE
 oG+lAQ3CeP0tRCzniWTOseJuTscUlbDMWuJAUrpRcY1XvWG4J2RfHoVkTDrRKkQ0fRcv
 4EU3iAsKva0N6RruoLw/gOqt2QWuN1OvAbN3Sc9CxxmG9fy5U0nGMlzg8AlP8zVPGXss
 cdIx+pS7m0E2Jl0D3IXsz2iHmg5KEd2fdT9XZ/56XNnvZvuE9/evXVASoLIF4FlUwKWh
 9LfsTh+/9LTzp4XmPNvOA+Hdyk90O4uqD7HePRLfsL4T5SjIpyyQY1pnw0z8oHYLfviV
 6gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758535584; x=1759140384;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
 b=Iauykm1eej/yd9QOh6mhzECuv6cZfHeyxWP6Yi7vhPafkxi48WxnJdgSqowvuQx5OA
 c3cYdV5CMt68QLnsDKKPNK/+Fi8DllMb1LdzzeFiIX8iEwLmKhSsKErRQAn+gTg/LWRC
 oXOb/MR9F3c1t1sX35xYx1PxfGofEhRzdlT2R323ABaUFeF7Y8x9Fo8tZOwA0RtppIQT
 hEyB3lVKOEnUdVJZ2DYZ11wb3Fmit/TNdmM3C2UYnLdhF21GcmhGk9Y1/3uOk87UfBxZ
 nZMEGbEu8j9/5B/ShilFOCsBd/NYGOXMjhdRXZW/uwJiWFre7tYzEDblHx0USwlL2GXm
 XKdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzqVwUYGMNTfnRRj32FS3g1QJwFZ0V4ILfyMGUQ4HuhNgLqMvMx/UNiTmpqnv5a4gInBs9YpGF9DFMyg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywwg1PJQV/hP0zEzzWBRMsFhIVVSUiUjlYVQTdF1wADsFuUzqEe
 gzqkMyU9fPJ/0c6s5wKBJveiK/T9DLyrAEnT9Z7CFyVOJGM12UXRCRJ2
X-Gm-Gg: ASbGncvAWd8PyYk+DVz0jRNfcVjotAp3Z6OYKNviZ3E93g7UVaQICL3nlijY+jk2kXH
 RHdBi7XpxJGr2VhEpMBqph2LNViC9HL/z9iu49Fy3ZP6fXMPNBXFB5MTsXQfW/3Ba1l685+yZ37
 FuUM5SkZBo86VCo+AnFFWxpgflmmuF+H8KeGBVgIQGwCY9E4R14YfRX7tTewGb0Ah6s48RQdVFO
 S66Uw+ry+kxqkiTp7VxZT12txj7ubZsfuSq14BXUeBzdY6DuZqJ+z1myVV+cHeQQnvev8xrqj8G
 b/SH2n7B2HT8j8g1JRz+mMjGTekRDMl3O2DyMh4s+yK63o/deJHCpoirJDUtm40bQdfxQZi8duu
 EpB8cgTeoxINVKuC2wkXfuVsdxp1OM4nLv9YGWpcXC3tMy4OGhRsM9KO5rVV6yknjumaQNxhF5G
 jESEI9FRCu9uRfysOR
X-Google-Smtp-Source: AGHT+IEFVop5uEIutiUZvrQjHA2X2brCgz/PV5Qh38EHo3qZHsNUBeotqexzMz7/cMiX8mPo7ObqSg==
X-Received: by 2002:a05:600c:4686:b0:45b:73be:c707 with SMTP id
 5b1f17b1804b1-467ea00475amr104406865e9.22.1758535583703; 
 Mon, 22 Sep 2025 03:06:23 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net.
 [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f3c118cd47sm10016624f8f.29.2025.09.22.03.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:06:23 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:16 +0200
MIME-Version: 1.0
Message-Id: <20250922-b4-ddr-bindings-v7-3-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 3/7] dt-bindings: memory: factorise LPDDR
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
