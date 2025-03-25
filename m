Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB6AA6EE77
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 12:04:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C641CC78F68;
	Tue, 25 Mar 2025 11:04:31 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD239C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 11:04:30 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5dc89df7eccso9356537a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 04:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742900670; x=1743505470;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYzJH+XUDBUF/N0lAmCHUaQA8dWYRxiMlRySq6cDUpo=;
 b=KC2OzeJ9i/Bf1ETBFMWgvv0B/2W2BtyP7owkuipG40miSUM+lVyyBCo/iUG1/8+oVL
 f5PGbIp87VMKi4cOhMTs/AtEg0XWs0yuaUtcV/b4FhpYY9swlXj31eiC8IpLyFN2n8qE
 CPZkDods2To9no3PIITx5z6yKStnf83lAS6lp3OPDKaMgvTNxJncBrUldrmbq29lbggP
 yut6Hyf/o0is1khg/xRfwbYzQSmiaDaJ6ZCqZjf44oeMKH/PcSu7AC1g5X6Frw8W+ddM
 uxx25fyE8zU4q+rG5SFRU/2z5lD5gI9zeqmiOlZhc58RGNfthjbt2mL29DlxSEGtWE7N
 ih/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742900670; x=1743505470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYzJH+XUDBUF/N0lAmCHUaQA8dWYRxiMlRySq6cDUpo=;
 b=cjYgd7JzLjvkmHfAGpliAKiS/zJrCrNb7euRD70ZMWTbpPF61X/Eao5SNpIYvVnHtd
 EJlINA4+m+MTaayGBkuQ+fV0h5Oy8aNu96bdSGaiuyawx7uB4nTEaMomngPaCUvbJgmw
 kjVehq7Kp5cNOqWjB536cGq+qUYBFUW56sS/OMVlgDioD8HcDUOWGE5NzPBc+337cnlg
 3GrJWKQ9S7t+LVKKKrO8yGp8ZuPe3bCue+pL3Ik9/2gJmj+CTDVKh3tU3z0FNvVht0s0
 3fbzZ4UZp5tw//1moi9DweNlbBF3QHlIoEUXIM0AKYfbCl/TYIIRdDQS5az2aFIwkpxG
 PJeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOBBtQnRC2EuFurAg6J8IjR70eW8omNW8R5NvrM7gbVUp72D8qRkOcjbUeiK7y4tduDeA6Gg4JBFBHrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyjw/YEaz3BLGiHQNQZI4XdSZ/PmNzXgPnbnkyeMWew3f1xP8QC
 woEF0P8bj9ATPdricJ5Cf6Afgjh+Y17Qkdn3xGqiLbAIkaEUGaKN
X-Gm-Gg: ASbGncubgtrlHvid/xMLd72gXXec516Py7j2YEDBuhJ+Gct30+hcR9UMDxPhdk8s11Z
 X45kP+CwPWnXz4GPlRUR5nYqKoaswNsHv3qBSZMRIiFhjGvcCqj47aAkJEFBq6Vnodo2x+8o1vj
 wB/v9JbxjESHP1lKN1Bsruz0QCFqW0JDgd5Mfcpw/PnYIyCH6j2XGa39XtdGxLIphLXfYzAImdn
 3CKt+VzgQoh0NHdP/Dm9c3fJwLmAep0HKZbyfHKKdo4VJTKTFn5MMlTuMRUdCOkb7E5yO5VP9bw
 jzrUu2t2egkz/Cx3BE3RAoTvKzbne0HSNfJy2/x6JdVXp9sZ/3o9Mi+trikJBysM3u3Km2CBfUO
 6kzqSeHl/LROVLfe6
X-Google-Smtp-Source: AGHT+IGjYBkqXYerys/mgiL5w0LGUgClKn/t3akwJFbuIP56/P4GUrbM+dD5ttple3vDwypq/KVE0w==
X-Received: by 2002:a05:6402:354e:b0:5e5:c0e7:f455 with SMTP id
 4fb4d7f45d1cf-5ebcd42dd4cmr12337589a12.8.1742900669673; 
 Tue, 25 Mar 2025 04:04:29 -0700 (PDT)
Received: from wslxew242.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf8cc99sm7556809a12.32.2025.03.25.04.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 04:04:29 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 25 Mar 2025 12:04:06 +0100
Message-ID: <20250325110409.2323611-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325110409.2323611-1-goran.radni@gmail.com>
References: <20250325110409.2323611-1-goran.radni@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <gradenovic@ultratronik.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/3] dt-bindings: arm: stm32: Document
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
b24KU1RNMzJNUDE1NyBTb0MuCgpTaWduZWQtb2ZmLWJ5OiBHb3JhbiBSYcSRZW5vdmnEhyA8Z29y
YW4ucmFkbmlAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vc3RtMzIvc3RtMzIueWFtbCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL3N0bTMyL3N0bTMyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL3N0bTMyL3N0bTMyLnlhbWwKaW5kZXggYjZjNTZkNGNlNmI5Li5jMWNiNTRmZmIyMTAgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3Rt
MzIueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMy
L3N0bTMyLnlhbWwKQEAgLTE3NSw2ICsxNzUsMTEgQEAgcHJvcGVydGllczoKICAgICAgICAgICAt
IGNvbnN0OiBwaHl0ZWMscGh5Y29yZS1zdG0zMm1wMTU3Yy1zb20KICAgICAgICAgICAtIGNvbnN0
OiBzdCxzdG0zMm1wMTU3CiAKKyAgICAgIC0gZGVzY3JpcHRpb246IFVsdHJhdHJvbmlrIFNUTTMy
TVAxIFNCQyBiYXNlZCBCb2FyZHMKKyAgICAgICAgaXRlbXM6CisgICAgICAgICAgLSBjb25zdDog
dWx0cmF0cm9uaWssc3RtMzJtcDE1N2MtdWx0cmEtZmx5LXNiYworICAgICAgICAgIC0gY29uc3Q6
IHN0LHN0bTMybXAxNTcKKwogICAgICAgLSBkZXNjcmlwdGlvbjogU1QgU1RNMzJNUDI1NyBiYXNl
ZCBCb2FyZHMKICAgICAgICAgaXRlbXM6CiAgICAgICAgICAgLSBlbnVtOgotLSAKMi40My4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
