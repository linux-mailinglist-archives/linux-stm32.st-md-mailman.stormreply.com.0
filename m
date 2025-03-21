Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84747A6B9B9
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Mar 2025 12:18:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E42C78037;
	Fri, 21 Mar 2025 11:18:34 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0B64C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Mar 2025 11:18:32 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so304382766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Mar 2025 04:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742555912; x=1743160712;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wabejZpAhNXZ4/gZ6Mz5z7QPUdV1DRKOqhima9IvQnA=;
 b=fHT4x21EFSaD3gPbRa9qZjwOHQR9d5xi0rYdnU7KN6Nw09+nnJaGVfYWeWXsyK/qvI
 h8v9wsRfRQcZ23PcoxV01VRpKJ6tBuF/2AwWPdBbWCRWhA6gbrj9KYUT3WQnk2uciacd
 Zb1Hl8wE2FWDIIpEHZ9TH3J1ILoIOwJZ+zSpegq7Z3+aCtpVYwidvUsphn4hJIDcrLja
 8JcLo2Bl/ZI945BizWtuzeMFrf5eP9fNm2mSBPZax2Ng+NwkPwdIOj/gFueCf+9QwEHY
 4W8Ywzkp7ZidazFVzKLaVswmh38u+rUxkuNVl2Jc8zFkFhhfm/KOtQW4p7XB7Oee+fvN
 4eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742555912; x=1743160712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wabejZpAhNXZ4/gZ6Mz5z7QPUdV1DRKOqhima9IvQnA=;
 b=STeAGrBrIV4iFBgxa650yis4JrZotd7kYHBoA8A/EHuahXxxqnZxHxpH6y1DWySgJT
 GldXqgXyOVetAf0F+4O2XHAlUbjqE+Mx5ubYl+L0Jt8TDz7tfvAyA1WukuGbSpKUroma
 5I/u6GG0gIkYVpiq3otOQpdtzWMf2qXLdzK41TA/Tkwuz3cB7c/OykKGf3GeYhd/esJI
 duez45q6DdblPX60ix9u7V87boGQus2JAt+/3XLSR+zSD5t/y4rn36aRk6XVfXnbVcIb
 TEMNdzTbdCiY3cEaGAV8HD62fJBIOW59Venk0iSUjHPIWvzKTTovOAto73OSEMbRiUt1
 4J8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIba0vWIeU1vpHUzbehId/lO6zruJG6lrp9ht9f/GR0gG/UELOj2U8lhzAfDHzyS49EPNaxp/QOsvyXQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUbE1ssT9Lh6cOdKiKqyjmc7bkKmRhRJcEKktoIUtRjaiwUS3w
 VabBclY1DIo29zzNILUtIG9GBLos2Zg5X0OVeFl48DpduHFn1xq8
X-Gm-Gg: ASbGncvcDcOYD6/tLrRtcswuMkX2ZQfd1l21eVsnDPx8pKUDbAl5m01Y3BpL433rBDx
 v+rHCzS2uvqLL3piRzAWtdakK0Xbkx1mW15I5pr6IvQVz9QeyTFdPMahVzjGRp8smABT8u7THtL
 aEYupyebtB+DLvOVaakFm6EUuiu0d0uZ/KNCXJmhse8fxVQFxvHAptahJp7DBoub7Z+6h4bLvqX
 AXN3xovINyB8C4JKIbSIu6a1rb5/lIw/onwU//6nzC9dZEi0gNVt9m4sMSvlZa7ZaOWxx4LJHSR
 /sDNASGkmceRJkeXRw2W/b/zwYAiOFENldwa7eZ/Cr/FCV6M
X-Google-Smtp-Source: AGHT+IHMumxU+/ISFAj+iAHmIZdUWCL4jaCPHJzJ+2s0QvWW8i+j2WLpKz/19GnwzdojwRlGDakcKQ==
X-Received: by 2002:a17:907:da0c:b0:ac3:ed4c:6a17 with SMTP id
 a640c23a62f3a-ac3f224dab8mr322426666b.24.1742555911781; 
 Fri, 21 Mar 2025 04:18:31 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd569f3sm134228866b.171.2025.03.21.04.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 04:18:31 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 21 Mar 2025 12:18:18 +0100
Message-ID: <20250321111821.361419-4-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321111821.361419-1-goran.radni@gmail.com>
References: <20250321111821.361419-1-goran.radni@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <gradenovic@ultratronik.de>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 3/4] dt-bindings: arm: stm32: Document
	Ultratronik's Fly board DT binding
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

RnJvbTogR29yYW4gUmHEkWVub3ZpxIcgPGdyYWRlbm92aWNAdWx0cmF0cm9uaWsuZGU+CgpUaGlz
IGNvbW1pdCBkb2N1bWVudHMgdWx0cmEtZmx5LXNiYyBkZXZpY2V0cmVlIGJpbmRpbmcgYmFzZWQg
b24KU1RNMzJNUDE1NyBTb0MuCgpTaWduZWQtb2ZmLWJ5OiBHb3JhbiBSYcSRZW5vdmnEhyA8Z3Jh
ZGVub3ZpY0B1bHRyYXRyb25pay5kZT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9zdG0zMi9zdG0zMi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCmluZGV4IGI2YzU2ZDRjZTZiOS4uYzFjYjU0ZmZiMjEw
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMy
L3N0bTMyLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9z
dG0zMi9zdG0zMi55YW1sCkBAIC0xNzUsNiArMTc1LDExIEBAIHByb3BlcnRpZXM6CiAgICAgICAg
ICAgLSBjb25zdDogcGh5dGVjLHBoeWNvcmUtc3RtMzJtcDE1N2Mtc29tCiAgICAgICAgICAgLSBj
b25zdDogc3Qsc3RtMzJtcDE1NwogCisgICAgICAtIGRlc2NyaXB0aW9uOiBVbHRyYXRyb25payBT
VE0zMk1QMSBTQkMgYmFzZWQgQm9hcmRzCisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIC0gY29u
c3Q6IHVsdHJhdHJvbmlrLHN0bTMybXAxNTdjLXVsdHJhLWZseS1zYmMKKyAgICAgICAgICAtIGNv
bnN0OiBzdCxzdG0zMm1wMTU3CisKICAgICAgIC0gZGVzY3JpcHRpb246IFNUIFNUTTMyTVAyNTcg
YmFzZWQgQm9hcmRzCiAgICAgICAgIGl0ZW1zOgogICAgICAgICAgIC0gZW51bToKLS0gCjIuNDMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
