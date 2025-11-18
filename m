Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7DFC6A6F1
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 16:55:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 918D5C62D53;
	Tue, 18 Nov 2025 15:55:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70F42C62D20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 15:09:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so26637735e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 07:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763478543; x=1764083343;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xn1amiUGhpNI5r8WdOtn7hNJ51WcbcveDFhQ+0agXLE=;
 b=MKCMJFWzhLegoZfI3iyMkwKwXMKP1KsN0r7rpqf2LptbQ2/eqUUDnCiaJdYy/n9LJh
 NyRLnljmRIRrEvm3QekJ9DkmtcFGdi5p6tt8yxaWtix9fApuODYnTlcVhjtyC1nGnKFh
 QyCUM6LGvJNtsbEmVMXI4lvVIOzCopPqGSISdkCoCCuR/c7mL9oPpYxqmxSn/QYNyoze
 1ZXSHiogH6xOz3gj3fSgcTDcGtbH/xB0y1RBoK1+rnmZxoeCuSUVyAmYFUZjxfFThc7k
 HHtnJP7Sdgzxvd5WPX5pDpCz5SB+wh7ND30pNPXwZ6cktv6UCN62dZXLc+Npv8MKeTvS
 hl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478543; x=1764083343;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xn1amiUGhpNI5r8WdOtn7hNJ51WcbcveDFhQ+0agXLE=;
 b=XjscWc303oVaVpPBZTmqkhJFRAmBMJ95YSpfole0+wYqF/q4qRlcLQ0/jSL2T1jB9J
 f/erSsfptl7ULIfeK9uLDlu6p5OVK8KxaLyO01u02lY5Htk5QEM9AvzNShYC4TPELBSD
 BrwvogfY8eggjbhMeEyJM2dAvEj7S5Jy1csZe22RDHxYN4fASIPTTrd74Pm5c3Fb8yPK
 B4jSIJwnXdfGFDwyi14+Lb5O9eIpL3n8Kg+914dKfplV2fVYaJwBptR7WyCcX10XjKTL
 oTETP2FrVFcFj4F5S2I7JK4XgT1koxDPjdj4uUOSmwYJ9MD7j64cZx/D5kiH61Dx0e6T
 n+HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAeS6covTGCux6ui7GJcYnv8XWYjxg/8FnapNjy4TYFe/mdMuuK5yOZnkG9yLAt2Ttrz3Zbrqds/keVQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzdPUlIp8I+j+SMo26J+Jf9yleXcp3cfpSX1oDm7Bx8W0PRtt63
 0UKu+U4FMnbp6TU1gyjXp3voKfHb5yRLQ8LuaVqSsBuG3GbVWhqrEj2f
X-Gm-Gg: ASbGncvNc71ncS5BueB0Qgpqr2kBMSaFtBQcUABh47I639iJ8VKZYkBwlPvf5pHJlqs
 Q/s7gfjk6bISj9f8WX8TtkE+v8SrMAV7mHfAabSdkTBGs6HTJ1sVFFFb8ipGhX3F8xsGiNPH28f
 YAAN9cjN0iFi3evrhr4vpiJMqS6CmqRgCSk8KANFzJbvqv2LKHD4wKEz2tdwY8OmdFmzR/rXCV9
 24g7/GO0fw5QqAlW6Z88F34CkU+PhDhs8H623VMa2TNtuDcHwe10FlR6XHq2hv6wil2qMoc0jP5
 fVTC0aGgk5zlxxDoQZcXOkcOIWjW+X4825Icpqz72H9cTbArFOkLq1LGGzU4zb3l/U54GVRXb6K
 m4boUW6zIWvlAkW1QuVFn+APDGNW2h+cgnqp0HXAaWjT9EAk1YzPLijjGUDBIEzNly0l4rWbs4K
 v1W2nDZUwrFQPCGArkiurAK5sh5BuWbTleB09iUZrLdlpGbBF7xMWkT1C3Dc2B22xnyfIEN2GcP
 IkPOiK9uRo6kn6E
X-Google-Smtp-Source: AGHT+IGHfWRtYZTGPPYbxiOYmTOURyjIxMB6TDIV7lM+NaODJHSbF+ffu7r1vpKDpGdS19OrhVSrbg==
X-Received: by 2002:a05:600c:a47:b0:477:79c7:8994 with SMTP id
 5b1f17b1804b1-4778fea195emr185980455e9.30.1763478542674; 
 Tue, 18 Nov 2025 07:09:02 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net.
 [2a02:842a:9b20:d01:432b:dab:f195:2b25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47799768409sm199879815e9.3.2025.11.18.07.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:09:02 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:08:02 +0100
MIME-Version: 1.0
Message-Id: <20251118-b4-ddr-bindings-v9-6-a033ac5144da@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 6/7] arm64: dts: st: add LPDDR channel to
 stm32mp257f-dk board
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
QWRkIDMyYml0cyBMUEREUjQgY2hhbm5lbCB0byB0aGUgc3RtMzJtcDI1N2YtZGsgYm9hcmQuCgpT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5z
dC5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVu
dEBnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5k
dHMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZGsuZHRzCmluZGV4IGU3MThkODg4Y2UyMS4uNTk1
NmQ3N2Y1ZmRhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdm
LWRrLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cwpA
QCAtNTUsNiArNTUsMTMgQEAgbGVkLWJsdWUgewogCQl9OwogCX07CiAKKwlscGRkcl9jaGFubmVs
OiBzZHJhbS1jaGFubmVsLTAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2Vs
bHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAiamVkZWMsbHBkZHI0LWNoYW5uZWwiOworCQlpby13
aWR0aCA9IDwzMj47CisJfTsKKwogCW1lbW9yeUA4MDAwMDAwMCB7CiAJCWRldmljZV90eXBlID0g
Im1lbW9yeSI7CiAJCXJlZyA9IDwweDAgMHg4MDAwMDAwMCAweDEgMHgwPjsKCi0tIAoyLjQzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
