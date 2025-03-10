Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4895CA5B969
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Mar 2025 07:53:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6849C78F97;
	Tue, 11 Mar 2025 06:53:54 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F55CC7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 15:48:12 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5e614da8615so897a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741621692; x=1742226492;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AE1sTeqM+1AGfrmmwn3FDyVaoKa/iwOIi7NTDRnQcf0=;
 b=RAWTUhu2f0Fqb8syQzzuJ/D3ynF5S2lAcrcBUDDYPYLrETcvHQ5BAeFVCzZnKlYNa6
 WuEsNBNExQRpFYujNnERk/UWnBouXqKws236K8VMWb8i+U4NwIGepb4reWvCq3nXj3BT
 vQ1KBLGBOxNUpVJl55kxKFLVt31kRUyT5/UhGKZiWR3D1IjeB6FHQKJYjYidYZUQALtf
 ItmzHZIvO5Tk8/fBtAay/QyEzMuY90HIr9lPGm4wwvwx4Iq9BcQEtRPT3WBi7hZUNe9S
 9IFvYHJ4/CsD9/qF9UaAQK90N8ZKNV1xXbtClXHt1L2Cn1xYhp+9/WenVkFfKNEz5hNl
 p9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741621692; x=1742226492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AE1sTeqM+1AGfrmmwn3FDyVaoKa/iwOIi7NTDRnQcf0=;
 b=v4orWb7LodwZhkCVtoal0SuaiKFFGZMUZJnAsPI5yBDCnf51dRDbuWy5nyvHTCmGTv
 rgmAyinV1mCoD3rb4KfKXDDfOR0/zgac8238gqvqB0mhbFz5jF/lkfurSTZewBt/y6TU
 oO6Aj7ulJSKi4WETyPK52hEta26TstHmUYBsxHb+fJi1NcYKzLpi+FvoEEBJ0zgQPTqN
 GAEioBjZLz0xD4numd3gHhg6+G6ahC2+ArvgYXiaSLyH2S+UXCMdxFK/CyI2h9yDUVFp
 ar1QsqAhocSmi2VGKaUx2OXICZI47/e+8JYFVAnyVSqy5ibomQs0PYXhVDnlJjpfXHTM
 Np3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0S2H5k8VDOA+gvlmat7cGfA5vpAlSYiqpyP5o3r3rduBpeAg0bY8RLZw/bmTrRskzk408MKJZi5YDPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzKIiVTs4eHpg10pPg6L43G/OOXAFrXJkb2f5DV/XwCXhM4iCbL
 CNKnbLcOKaeMKHGkikzfrmdDISjLmF9UmTMI+eCrVPeLkpENwEUf
X-Gm-Gg: ASbGnctOekaxMmGqQXb8LkFusb86bYbSOSq10pEaIR0izC7DY8OqyP79DwgV8OApZbH
 s7SwaQHzCZEzcvj6cWEWwhpTeDJz8JnoE8RVhpgd29Ex1rDEbinScE7am/LbTpVEBwTVVqwm3G2
 HyChQpdPslOOR9weVTQsz8bFIefoLlC+pXcYl262GnpuBJrL7d6JySqflr3KQbm/3BAtXFfsWwN
 B4/LyfDES9PV8GZXfbJZNVLMHUK+I9LsdZFOY69EJoEN7Oh2n6tmMtIM/iDd++yPgE/ysBEBHgN
 dunIYXH6CGwrcVuwznpA/uViZeNLBaOebnW6RgylhT1R1cAF1nGwdjLjajw=
X-Google-Smtp-Source: AGHT+IEn29ZIrELth1vqpMB17cSDSf9zSUtKS9md/Y6FhQ/FeXOR6GLoNZVchkEQaWPlzFBlIxy9Lw==
X-Received: by 2002:a05:6402:3513:b0:5db:e88c:914f with SMTP id
 4fb4d7f45d1cf-5e614f1f459mr10527894a12.4.1741621691847; 
 Mon, 10 Mar 2025 08:48:11 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c766d0e0sm7252732a12.64.2025.03.10.08.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 08:48:11 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 10 Mar 2025 16:48:00 +0100
Message-ID: <20250310154804.326943-4-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310154804.326943-1-goran.radni@gmail.com>
References: <20250310154804.326943-1-goran.radni@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Mar 2025 06:53:53 +0000
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <gradenovic@ultratronik.de>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] dt-bindings: arm: stm32: Document
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
bmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCmluZGV4IGI2YzU2ZDRjZTZiOS4uMmNmYzA4NDMwYTg3
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMy
L3N0bTMyLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9z
dG0zMi9zdG0zMi55YW1sCkBAIC0xNzUsNiArMTc1LDExIEBAIHByb3BlcnRpZXM6CiAgICAgICAg
ICAgLSBjb25zdDogcGh5dGVjLHBoeWNvcmUtc3RtMzJtcDE1N2Mtc29tCiAgICAgICAgICAgLSBj
b25zdDogc3Qsc3RtMzJtcDE1NwogCisgICAgICAtIGRlc2NyaXB0aW9uOiBVbHRyYXRyb25payBT
VE0zMk1QMSBTQkMgYmFzZWQgQm9hcmRzCisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIC0gY29u
c3Q6IHV4LHN0bTMybXAxNTdjLXVsdHJhLWZseS1zYmMKKyAgICAgICAgICAtIGNvbnN0OiBzdCxz
dG0zMm1wMTU3CisKICAgICAgIC0gZGVzY3JpcHRpb246IFNUIFNUTTMyTVAyNTcgYmFzZWQgQm9h
cmRzCiAgICAgICAgIGl0ZW1zOgogICAgICAgICAgIC0gZW51bToKLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
