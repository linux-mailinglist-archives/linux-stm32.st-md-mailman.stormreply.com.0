Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6C3BAC1B8
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 10:46:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 202B0C3F93F;
	Tue, 30 Sep 2025 08:46:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B225C3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:46:50 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so977683f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759222010; x=1759826810;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fVsl8vGcfYK8AgATkYy0L7h3lyqmmijzRq6HHy2CfXM=;
 b=hKo2INg0EZN1Q0epmas4cRIFtj6s3jRukPvJtdMbdO6ld3Oe/nSznJ0UMux5qjj3jZ
 Hfv5sQismStHGtdAeNvSK80MVOpD/NUOmGXIZxUMzsakcGS4uFpwwYg2ZNcp/c0RDH78
 +f+0yMvyX+FT8dKBAnVGNDUbZOWSUbcEiK1gJUZLDqMI3RwAsr28NNr+s+D4Bm1vTZl4
 Lh3KaXBRzptdachh3G5NekqZGtKtCIvsu6KOqZXncxSzjoN/hCEqapWBFtyOAlLW9ynH
 Z8dkU6PQ5ZszhWHK1UnoMhi3PtoahZwCTAeHz51gPszh+v1S45tXWMET/l/w2yR9dOxJ
 UUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759222010; x=1759826810;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fVsl8vGcfYK8AgATkYy0L7h3lyqmmijzRq6HHy2CfXM=;
 b=cdL/hqC5nclQ7TZsQqPaMGpTMRX/pTfQ6YlKVpHbzaFv5n9RVV3KjfBSyErOya8HGp
 fXc0TWTp9kcRUv9ufP2O4fQxtsxJi/SVe2KxQCYHHdmd2QSkk+5eD9O611ZFV2/Od1h6
 1zUi1PhzLofeDycA56hfEbGF8UYx+6O6PFnrFE09eHq6qJRJbze7+YSm7/fwEHm0vigb
 CHnth2ppEXyBkKCt+HMDHSK23aI6WdK7F1X3rPhz9p5h+nDJ+QEufUDxw09HghK75S2g
 YMxkzQSzcr7QNXQszoPaOXiQlRdMSPuIw2R00brvEL6/JS22sCzbDHFvRpROfSCxGrxy
 W5zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXopxtGFz4tvE7zBCAvuRQ0JRVTBm95bUwAdo7uR7YTvoErnDy0kWMJzlAs+JA7A2rwovywjQV5393uyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyA1rH6g7K5Ko6M6ZqQQGT/8yiJBV7u6ORICJ2Zi3V5MGTauEv1
 f7a5e8MrLOWkC1eh37vUhBTRmBLPn80i1JMErQgrIzJGJ3BjU69Fv4AT
X-Gm-Gg: ASbGncsLKK6xebgc81vOxP0ILdpjTtu5tHU1WYL8t8GT+hmrdwmeHUksaR0RgDhCHyu
 4QkXg1RSOXwpx6z5T9nvPSiVLWJSF9LHcilhqngNAwedFsSnPODf8LJg7jJxtmcGZwabgxZdTil
 To2sfTa9AKH05JzBVtHosaswVarrDnDwlkm0Y67yXfnCL9LjgDdCbXd6TNZTZ5UhZUP7joxj7Fx
 8di2ANtHXOynpY2HjSDcxA1Ln1XQfhirTlP287xh7C7eVPkU07fnqsmXON87ZF0nSkFp+8266gQ
 ABvgYHmReInBx+ioNHk4Mpo86Iwj3q1zfyOi0UbzQGL2a8FoIAZ8Nf6IP2ScAgVjnVkHv1AQe/6
 BqYBbQLKa1Nob7VC3+Y30snAhKDdkqkYS4iAbuT7kHufwrd+gGuC+orT8bpxZ5N8cukz7uTtabA
 8sF2NrU4RiUHF2B4xuiRyZJcGkCJgoXY25gsf9oT80XXrip8998N3uuaU3qTaeow==
X-Google-Smtp-Source: AGHT+IFNKqn3I7Ak0yCQK65+PzvDoYV8kvut0/aco1wX5M8V/khPAzAoVBU1h3CVCUW6iDQw7YuIxA==
X-Received: by 2002:a05:6000:178b:b0:3b7:9c79:32bb with SMTP id
 ffacd0b85a97d-40e4ff1991bmr19424072f8f.44.1759222009713; 
 Tue, 30 Sep 2025 01:46:49 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net.
 [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5603356sm22122689f8f.30.2025.09.30.01.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:46:49 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:43 +0200
Message-Id: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPOY22gC/3WNQQ6CMBBFr0Jm7ZhSaFFX3sOwoMwAk0hLWkM0h
 Ltb2bt8L/nvb5A4Cie4FRtEXiVJ8BkupwL6qfMjo1Bm0EobddUaXY1EEZ14Ej8mbEpbcsWqG4y
 FvFoiD/I+io828yTpFeLnOFibn/3fWhtU6CoirdjU5Ox9nDt5nvswQ7vv+xcaQSS5rgAAAA==
X-Change-ID: 20250922-b4-ddr-bindings-7161e3e0af56
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
Subject: [Linux-stm32] [PATCH v8 0/7] Add DDR4 memory-controller bindings
 and factorise LPDDR and DDR bindings
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

SW50cm9kdWNlIEREUjQgYmluZGluZ3MsIHdoaWNoIGlzIHRoZSBmaXJzdCBERFIgdHlwZSB0byBi
ZSBhZGRlZC4KQXMgdGhlIEREUiBhbmQgTFBERFIgdXNlIHRoZSBzYW1lIHByb3BlcnRpZXMsIGZh
Y3RvcmlzZSB0aGVtIGluIGEKc2RyYW0tcHJvcHMgYmluZGluZ3MgZmlsZSBhbmQgcmVuYW1lIGxw
ZGRyLWNoYW5uZWwgaW50byBzZHJhbS1jaGFubmVsLgoKQ2hhbmdlcyBpbiB2ODoKLSBHbG9iYWxs
eSBmaXggdHlwby9ncmFtbWFyIGluIFNEUkFNIHByb3BzIGJpbmRpbmdzOgogIC0gRERSNCBiaW5k
aW5ncyBjb21wYXRpYmxlIGRlc2NyaXB0aW9uOgogICAgLSBzL2xwZGRyWCxZWSxaWlpaL2xwZGRy
WC1ZWSxaWlpaLwogICAgLSBzL2luIGxvd2VyIGNhc2UvbG93ZXJjYXNlLwogICAgLSBzL3N0YXRp
cy9zdGF0aWMvCiAgICAtIHMvfi8tLwogIC0gQWRkIGFuICJzIiB3aGVyZSBhIHBsdXJhbCBmb3Jt
IGlzIHVzZWQgKGUuZy4gcmVnaXN0ZXJzKSBpbiB0aGUgRERSNAogICAgYmluZGluZyByZXZpc2lv
bi1pZCBkZXNjcmlwdGlvbgotIEZpeCB0aGUgbnVtYmVyIG9mIGNoYXJzIHRoYXQgYW4gU1BEIGNh
biBjb250YWluIGluIHRoZSBwYXJ0IG51bWJlcgogIGZpZWxkLgotIExpbmsgdG8gdjc6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MjItYjQtZGRyLWJpbmRpbmdzLXY3LTAtYjNkZDIw
ZTU0ZGI2QGdtYWlsLmNvbQoKVGhlIHY3IGlzIGEgc3Vic2V0IG9mIHRoZSB2NiBhbmQgb3RoZXIg
cHJpb3IgdmVyc2lvbnMsIHNwbGl0IHRvIHNpbXBsaWZ5CnRoZSByZXZpZXcgYW5kIG1lcmdpbmcg
cHJvY2Vzcy4KCkNoYW5nZXMgaW4gdjc6Ci0gTm9uZQotIExpbmsgdG8gdjY6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI1MDkwOS1iNC1kZHJwZXJmbS11cHN0cmVhbS12Ni01LWNlMDgy
Y2M4MDFiNUBnbWFpbC5jb20vCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxl
Z29mZmljLmNsZW1lbnRAZ21haWwuY29tPgotLS0KQ2zDqW1lbnQgTGUgR29mZmljICg3KToKICAg
ICAgZHQtYmluZGluZ3M6IG1lbW9yeTogZmFjdG9yaXNlIExQRERSIHByb3BzIGludG8gU0RSQU0g
cHJvcHMKICAgICAgZHQtYmluZGluZ3M6IG1lbW9yeTogaW50cm9kdWNlIEREUjQKICAgICAgZHQt
YmluZGluZ3M6IG1lbW9yeTogZmFjdG9yaXNlIExQRERSIGNoYW5uZWwgYmluZGluZyBpbnRvIFNE
UkFNIGNoYW5uZWwKICAgICAgZHQtYmluZGluZzogbWVtb3J5OiBhZGQgRERSNCBjaGFubmVsIGNv
bXBhdGlibGUKICAgICAgZHQtYmluZGluZ3M6IG1lbW9yeTogU0RSQU0gY2hhbm5lbDogc3RhbmRh
cmRpc2Ugbm9kZSBuYW1lCiAgICAgIGFybTY0OiBkdHM6IHN0OiBhZGQgTFBERFIgY2hhbm5lbCB0
byBzdG0zMm1wMjU3Zi1kayBib2FyZAogICAgICBhcm02NDogZHRzOiBzdDogYWRkIEREUiBjaGFu
bmVsIHRvIHN0bTMybXAyNTdmLWV2MSBib2FyZAoKIC4uLi9tZW1vcnktY29udHJvbGxlcnMvZGRy
L2plZGVjLGRkcjQueWFtbCAgICAgICAgIHwgMzQgKysrKysrKysKIC4uLi9tZW1vcnktY29udHJv
bGxlcnMvZGRyL2plZGVjLGxwZGRyLXByb3BzLnlhbWwgIHwgNzQgLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLi9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGxwZGRyMi55YW1sICAgICAgIHwgIDIg
Ky0KIC4uLi9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGxwZGRyMy55YW1sICAgICAgIHwg
IDIgKy0KIC4uLi9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGxwZGRyNC55YW1sICAgICAg
IHwgIDIgKy0KIC4uLi9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGxwZGRyNS55YW1sICAg
ICAgIHwgIDIgKy0KIC4uLmxwZGRyLWNoYW5uZWwueWFtbCA9PiBqZWRlYyxzZHJhbS1jaGFubmVs
LnlhbWx9IHwgNDAgKysrKysrLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxz
ZHJhbS1wcm9wcy55YW1sICB8IDk0ICsrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZGsuZHRzICAgICAgICAgIHwgIDcgKysKIGFyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyAgICAgICAgIHwgIDcgKysKIDEwIGZp
bGVzIGNoYW5nZWQsIDE3MyBpbnNlcnRpb25zKCspLCA5MSBkZWxldGlvbnMoLSkKLS0tCmJhc2Ut
Y29tbWl0OiAzMGQ0ZWZiMmY1YTUxNWE2MGZlNmIwY2E4NTM2MmNiZWJlYTIxZTJmCmNoYW5nZS1p
ZDogMjAyNTA5MjItYjQtZGRyLWJpbmRpbmdzLTcxNjFlM2UwYWY1NgoKQmVzdCByZWdhcmRzLAot
LSAgCkNsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
