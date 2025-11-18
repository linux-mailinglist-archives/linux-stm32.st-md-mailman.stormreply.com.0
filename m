Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FE0C6A6E3
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 16:55:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 092DBC62D20;
	Tue, 18 Nov 2025 15:55:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2FC9C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 15:08:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso20288495e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 07:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763478536; x=1764083336;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6WPvFi51hSTGug9x4SN8j0sL2LdGeBDK68HLUzdBwf0=;
 b=Peznh1yR+NsPPiXA3iRBY57cv7P+hfvEg6GXYs1ckIr9EAEbrZjEaeOZIcG9WpelSf
 lRCsktvCH2fCL0c9jM/2o2GQiBTy3OE3M3aHHJFLQXUyakipNXhCdHnBzo3i0gOwmYa5
 QBrtr+HnUpe0BuTfmpLkuOQ/CHpLn3EMbBRbM96zTYYSMgiu4hVOueAjrGEn/ZA2FuKd
 H00xahV5GQL9NDa/zY10/7S9JpCVz3a9dMYPNnA2VcsWEsiZRkyb6wcJS8RObg2TzVE8
 kCC5qTQ3pZNeugUN4nJ+C2AqwEun9YRM87/8OYRlE+UKAz9go5UuENccSbjY3w/pKWB3
 i2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478536; x=1764083336;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6WPvFi51hSTGug9x4SN8j0sL2LdGeBDK68HLUzdBwf0=;
 b=hvIuI3GfWZu5F4+q4wehWQjRMkTlp3OsTxDkoDOIzSUGNMe7mK5wf972f7HxEtzEmR
 /zsgaSNjbxehRJ2bfmlJO31QDDh0g+KowGEJgzOu32AggZWhfXi5EZIlJnYSnRlK3FkH
 vrsoIsy0uGODRisPrDcM6w+3mGjeFunUJXiaUAw286aPurY/xvm35We9LmNDUTOkSzHe
 fUWVi3kF0gl10PHGhqQEygZiKcBya4q+bW4j5vsPf6Yyn/RXuzedlgBeTRYWHUEFZT7j
 Tq5Vj21aGlivbhFsPaE4xB0FF0H4yXkmcnmN8QruZmS9i/sEl+p+f7bjp4u1HjtO9bLE
 0mAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoEzp0DjGYgnKtbu3zD5ckW8dbM+BtTQjoxM8O5BtAa3R6iko4S0NS+kJ5DHFYxRvJCa0p7Jkhs0Pypw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyyTF2di3BIsyt0HPEN8dWGxjUKGMGAGQVVhMz8uhTcYak7hN54
 1POTtKlJbavJ8kwXtFMbC/q3JTQINnggJgrquwdRYkp74xZ2nwiMJ3nE
X-Gm-Gg: ASbGnct4YMzk4IWd59cg2YLu9C/3Xwj5dpDnmoGCpFL9F+J1sxmfXKmGUqG43wLw77E
 gr/Mx5Aidz09xLWPoQ+FwdMuzU03jq0cbv03OAODavoD4Y2bh0z2Fji+Qwuy6py0raLDZBtTwuZ
 6etvO/AGS/zXldyz6k78DTFafF6d7oLPJtEGrqr9R8EG1vQJOlHu8Czs6XYlE1J20DROMcNAs3J
 wcr2OL5FRTtVrnSIvM3rMEiKt/R7aPHya5dH/sM7nHjYGjhL91t90RBNH7j4gfxwxAqmKnfgLf5
 k28iW2FsjQjJlRl/I6BNYxoaWzwIVVbQ/u9beIpZQ4bpd0r1e72bC+zCKijowWhKm4jExHmEcYG
 ss+7nkwi7+1hLxCEqaKM9TGGyV9HwJNIlr/hKu5+ZRLAP053dKwFBRXxlqls05X94ZgAmEI+c4h
 0/o29Y29rt4+0xJDe8kqupGkP65OJqS8TakKwwH+OpK/Aqs1Zr5EAVoDzxkQSlgD4TjGQ=
X-Google-Smtp-Source: AGHT+IF/6kXbFEjAEd63GYihy5Q8u6mMF1GK/dF5UenuZ7Kz2Ra3089BukNPLHYwu6f1QH+eFEoqTg==
X-Received: by 2002:a05:600c:4592:b0:46e:3b58:1b40 with SMTP id
 5b1f17b1804b1-477a94acde4mr37754535e9.4.1763478535789; 
 Tue, 18 Nov 2025 07:08:55 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net.
 [2a02:842a:9b20:d01:432b:dab:f195:2b25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a97213b8sm19970405e9.1.2025.11.18.07.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:08:55 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:07:56 +0100
Message-Id: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMyLHGkC/3WNywqDMBBFf0WybsoYjY+u+h+li8QZdaDGkpTQI
 v57oyuhdHkunHMXEcgzBXHJFuEpcuDZJWhPmehG4waSjImFAqWhVUraUiJ6adkhuyHIOq9yKgh
 MryuRrKennt978XZPPHJ4zf6zH8R6W/+3Yi1B2gJRAekSbXUdJsOPczdPYmvF5uAX8Os3ye+px
 KaDXBsNR39d1y8IwXSa7gAAAA==
X-Change-ID: 20250922-b4-ddr-bindings-7161e3e0af56
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 0/7] Add DDR4 memory-controller bindings
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
ZGRyLWNoYW5uZWwgaW50byBzZHJhbS1jaGFubmVsLgoKQ2hhbmdlcyBpbiB2OToKLSBJbiB0aGUg
ZGRyNCBjb21wYXRpYmxlIHBhdHRlcm4gOgogICAgcy9kZHJYLVlZWVksQUFBQS4uLixaWi9kZHJY
LVlZWVksQUFBQS4uLi1aWi8KICAgIFRoZSBjb21tYSBiZWZvcmUgdGhlICJaWiIgcGFydCBoYXMg
YmVlbiByZXBsYWNlZCB3aXRoIGEgbWludXMuCi0gQWRkIGluZm9ybWF0aW9uIGFib3V0IGhvdyB0
aGUgY29tcGF0aWJsZSBpcyBjb25zdHJ1Y3RlZCBpbiB0aGUgcGF0Y2ggMjoKICAiZHQtYmluZGlu
Z3M6IG1lbW9yeTogaW50cm9kdWNlIEREUjQiCi0gQWRkIEtyenlzenRvZiBLb3psb3dza2kncyB0
cmFpbGVyIG9uIHBhdGNoIDEKLSBMaW5rIHRvIHY4OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUwOTMwLWI0LWRkci1iaW5kaW5ncy12OC0wLWZlNGQ4YzAxNWE1MEBnbWFpbC5jb20KCkNo
YW5nZXMgaW4gdjg6Ci0gR2xvYmFsbHkgZml4IHR5cG8vZ3JhbW1hciBpbiBTRFJBTSBwcm9wcyBi
aW5kaW5nczoKICAtIEREUjQgYmluZGluZ3MgY29tcGF0aWJsZSBkZXNjcmlwdGlvbjoKICAgIC0g
cy9scGRkclgsWVksWlpaWi9scGRkclgtWVksWlpaWi8KICAgIC0gcy9pbiBsb3dlciBjYXNlL2xv
d2VyY2FzZS8KICAgIC0gcy9zdGF0aXMvc3RhdGljLwogICAgLSBzL34vLS8KICAtIEFkZCBhbiAi
cyIgd2hlcmUgYSBwbHVyYWwgZm9ybSBpcyB1c2VkIChlLmcuIHJlZ2lzdGVycykgaW4gdGhlIERE
UjQKICAgIGJpbmRpbmcgcmV2aXNpb24taWQgZGVzY3JpcHRpb24KLSBGaXggdGhlIG51bWJlciBv
ZiBjaGFycyB0aGF0IGFuIFNQRCBjYW4gY29udGFpbiBpbiB0aGUgcGFydCBudW1iZXIKICBmaWVs
ZC4KLSBMaW5rIHRvIHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwOTIyLWI0LWRk
ci1iaW5kaW5ncy12Ny0wLWIzZGQyMGU1NGRiNkBnbWFpbC5jb20KClRoZSB2NyBpcyBhIHN1YnNl
dCBvZiB0aGUgdjYgYW5kIG90aGVyIHByaW9yIHZlcnNpb25zLCBzcGxpdCB0byBzaW1wbGlmeQp0
aGUgcmV2aWV3IGFuZCBtZXJnaW5nIHByb2Nlc3MuCgpDaGFuZ2VzIGluIHY3OgotIE5vbmUKLSBM
aW5rIHRvIHY2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MDktYjQtZGRycGVy
Zm0tdXBzdHJlYW0tdjYtNS1jZTA4MmNjODAxYjVAZ21haWwuY29tLwoKU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCkNsw6lt
ZW50IExlIEdvZmZpYyAoNyk6CiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnk6IGZhY3RvcmlzZSBM
UEREUiBwcm9wcyBpbnRvIFNEUkFNIHByb3BzCiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnk6IGlu
dHJvZHVjZSBERFI0CiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnk6IGZhY3RvcmlzZSBMUEREUiBj
aGFubmVsIGJpbmRpbmcgaW50byBTRFJBTSBjaGFubmVsCiAgICAgIGR0LWJpbmRpbmc6IG1lbW9y
eTogYWRkIEREUjQgY2hhbm5lbCBjb21wYXRpYmxlCiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnk6
IFNEUkFNIGNoYW5uZWw6IHN0YW5kYXJkaXNlIG5vZGUgbmFtZQogICAgICBhcm02NDogZHRzOiBz
dDogYWRkIExQRERSIGNoYW5uZWwgdG8gc3RtMzJtcDI1N2YtZGsgYm9hcmQKICAgICAgYXJtNjQ6
IGR0czogc3Q6IGFkZCBERFIgY2hhbm5lbCB0byBzdG0zMm1wMjU3Zi1ldjEgYm9hcmQKCiAuLi4v
bWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwgICAgICAgICB8IDM0ICsrKysr
KysrCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxscGRkci1wcm9wcy55YW1sICB8
IDc0IC0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxs
cGRkcjIueWFtbCAgICAgICB8ICAyICstCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRl
YyxscGRkcjMueWFtbCAgICAgICB8ICAyICstCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9q
ZWRlYyxscGRkcjQueWFtbCAgICAgICB8ICAyICstCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rk
ci9qZWRlYyxscGRkcjUueWFtbCAgICAgICB8ICAyICstCiAuLi5scGRkci1jaGFubmVsLnlhbWwg
PT4gamVkZWMsc2RyYW0tY2hhbm5lbC55YW1sfSB8IDQwICsrKysrKy0tLQogLi4uL21lbW9yeS1j
b250cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tcHJvcHMueWFtbCAgfCA5NCArKysrKysrKysrKysr
KysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cyAgICAg
ICAgICB8ICA3ICsrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2MS5kdHMg
ICAgICAgICB8ICA3ICsrCiAxMCBmaWxlcyBjaGFuZ2VkLCAxNzMgaW5zZXJ0aW9ucygrKSwgOTEg
ZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogZTdjMzc1YjE4MTYwMGNhZjEzNWNmZDAzZWFk
YmM0NWViNTMwZjJjYgpjaGFuZ2UtaWQ6IDIwMjUwOTIyLWI0LWRkci1iaW5kaW5ncy03MTYxZTNl
MGFmNTYKCkJlc3QgcmVnYXJkcywKLS0gIApDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNs
ZW1lbnRAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
