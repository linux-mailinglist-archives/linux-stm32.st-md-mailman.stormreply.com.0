Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3716BAC1BB
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 10:46:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB7DC424C3;
	Tue, 30 Sep 2025 08:46:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2667EC424C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:46:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3f0308469a4so3223324f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759222014; x=1759826814;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
 b=KYaCgx4HONvpXvlYXdw/cQpE+YcHmE3JF8L0DPy1XQmtjJiWLnuNVGVOAFkIEsrE4P
 fd1Mpem6MRkf8KoJcHY6kJ0zOxyLivyx/E6vwT34XktLCH/XVbxMZbA79KKKJcyFNhIr
 P+1BIOZ9el/GxU9zBqOkOn30P4CnFCtj60oxNv+72TicAojUDj2OgYHF34PDyfMIa5AT
 a+Hi2yTjDa19+NwVV/7PWa/lclW6JiClrL7kYvCBXRuT6K9d4sVOCJUjRx3cm1AnIm9w
 PQcC7yS+MhfDq3GpxXGxIB1Z+NhxwFiTCosvvFO8MSp+Jd7aVkDiV0otTtnAiQSJ6G88
 GG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759222015; x=1759826815;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
 b=UIid4GuuLEXIBzHlp70yqDqvy/2xQc4tM9dxiJQd/Frd11OcCKol6R2s6RHGHYE+P7
 U61FGkmYpMiY2pcPh4bNE+2EoWuGoAIhrBrv2bJs16Yp/q6MAWWn14v3NRv8tqklTzcu
 aNQ9LKomMgDIqRBpnkLJLAP4uwCDTf2u4tSYqwRUJsNpG4yRhP4hmFMcMpcglPJUc6Iy
 H0+c7lt+BshiXyrlRtA79r955ex4GvJcjX4hMMTP3QxyZRlsGcttBGP5JKEAZdL+RoC6
 auNTXC1k0yCMA+1FUs4Uwfy0kRmvDLo3SKkLg8onCD0/EyOesxsvl8g/s7szwPSL5wjc
 rckA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbV787nuZ9R5qoJBMjaQdu6PrcezRMl/uGmWJ+dCmR2ETWmva3MxpBPjK6tDaDISpNQAETdOwQ+wm1KQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzdiiBte4ZSxBKE5JB2+PqwIaAEznhtDxanlpV55HkVEmLczPDE
 qBxRBDozokXEn51QmcSPBWNyPT/foR4WyffdykvsunrN8blXjl0dsoI3
X-Gm-Gg: ASbGnctrbNykx6AiuGnplNBCQYA7SQ7vKwVdUf02DuEG+CkcVqIdeRWWv2ZuLH8ak9q
 +coSxXU9itb9UeckeYATrcXcNv6rxnSfhziWZD8oOtbQDXU5Cj3aBRevaNREJXz+IqaBQzdHIUg
 f700S08Aiexzplt4IPkgiVNvhsQVM1b5KnDDf6Gr/+XLqPHEiPVcjx2qAler4vT5Ma3iId4VCQY
 RjI3U34OOnctuj1nfvaCjFPOTNv3n5D6fwJuzh1lRnqth2PDcA8Q9SSsv9ytytUEsJoL71zsTPP
 nxM0G/ojXGpnFZYj9a7+2UxPL2pwUGuEAvUlb1yqxVT8mNZnU86xKXxMfIA/woTbGwIRDyKDjjq
 9RB8iG1T5aLJjerAwJ94pnWAclSOyYidsgIdi9kiWcukRUj830owPkivk6/dKQuKTxUPiocAZLK
 KVvua4FvGlUtwr052UDxkKmJ/FpspQdgmb12w14sLtfCAH+4YrVhE=
X-Google-Smtp-Source: AGHT+IHTFPZzGx4b88SoI+qS9EQDgCRRYbI3BPB4d5PmhtBVYrKjFEQXmYR1LT+gc8Uw7C4dhTNdmA==
X-Received: by 2002:a05:6000:4010:b0:3fb:ddb3:f121 with SMTP id
 ffacd0b85a97d-40e4b1a079dmr19776194f8f.45.1759222014438; 
 Tue, 30 Sep 2025 01:46:54 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net.
 [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc88b0779sm21417757f8f.58.2025.09.30.01.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:46:54 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:46 +0200
MIME-Version: 1.0
Message-Id: <20250930-b4-ddr-bindings-v8-3-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
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
Subject: [Linux-stm32] [PATCH v8 3/7] dt-bindings: memory: factorise LPDDR
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
