Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F4AAFD49
	for <lists+linux-stm32@lfdr.de>; Thu,  8 May 2025 16:38:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA142C7A821;
	Thu,  8 May 2025 14:38:28 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B835EC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 14:38:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5fbed53b421so1681393a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 May 2025 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746715107; x=1747319907;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
 b=gR7Qq64pqPPsI9LEsOabHb2XtW3mxHA1lToLcaNhTZ+zsHwfZfB4RdYf4KpN4PxH63
 D9ikF+FjE5zR1xVg4dLLDQ5s3UBVueIDsK2txMckprb7bp9dnsxx7ZSwao5N+r6YyVt8
 u9P7DRDbWLPXt+rzScCaNBKOPX84HQ88NqibrvY1LoNMUYG9Nx2+8BsVkGdvFpTbUuX6
 7dNwX2KR23n7SxXS2RLcCUsKh8O/M/xCItzInRa7w38dec+DaTmdBwcQGc1tzUxvHtuf
 thbxJnrGoK1DtVdiMdRJ//QVCUTYPNg1H0eZStcIt160K02AAsxETFpMWiNHF5CfwGuY
 OBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746715107; x=1747319907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
 b=A/X+Tgt7ZN62jedMVnhCQpDFr3W46g2WgDz5yTQt6+rroVNNElCZcY0TztVYFSTWcq
 Jbr9z4bsvls/TklKI401bllT3QEeEFhCGhotTX/5GMyRZGV0MIE5h6mTVJMTIFC9gPAt
 n/gMr9jl4XcNRJLdX9WkRo0W7bw8NE5tYJRFFj+FWbV3s9hj2OvQaECYsVflliAtBGvP
 eCpk0PAva/2GAvHnxtJs8iqQ6/ghN5eT2me/ncI1nDqNRUC/VJ8NEb/+XMD9qCgKy40a
 oanqV1DC2fowsXwyEPwsangPzq1Z/vx27KolKt5pLOlThZoeUpsjbPeGdprKvAcyZNLu
 7L+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbKkE7p3WLW7tJlcNAKQjZFI74yzfeI4ZQ7Cjt7eiNkuFvsJDrZ3SZxPgWs2UtzYQxJujITM9bYy5+5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzxFtLfMVJucI9cIMomy92Zo5eVcs7Kf0wRWqs4hEoby//p5oj+
 X6jIkwX490QAeUb3iIuqQP2erJnqXTJE3+KdHq5N94KS+Od2os/E
X-Gm-Gg: ASbGncs+2luNj0jt2mWBVWagW5i+hjxdpJWi+++VYOMkhRxAk3DDnWLy2YaO3uNSYsi
 1lkIT6Z8AlrVQMZYq8mnfWICQpckYE/xCtXwu3afyPslKPcTvAHArZrixbmIvMVabEArTTCMIAA
 6UOwlDFH3hWsSHOGHYKeYPMQRUX51i4zsaZld/WVxYW17EhtGkVijufilfvXs5+RZFIfRP3JA/F
 +oEzg4e9K73NsI8yJ3fwQG3Z3qU2GR7tg17AeaqBs5EwOiyEJIvcFUO2RSN7Ps9lboKdBaxDd98
 G6kcSrDu1Yrsj8QmfAPJaCjN0emfYGbWlCaSwGbCQA4t
X-Google-Smtp-Source: AGHT+IEl8W7Z48QojZSSlNyKzo/MwD2zC8/Fy87SvOdLzrwX/FLitnj/UnwE/86blYtfAsljSHA5MA==
X-Received: by 2002:a17:907:3e8d:b0:ac7:322c:fd0c with SMTP id
 a640c23a62f3a-ad1fe946c93mr353166166b.40.1746715106657; 
 Thu, 08 May 2025 07:38:26 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1ed2f588csm334443166b.42.2025.05.08.07.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 07:38:26 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu,  8 May 2025 16:38:14 +0200
Message-ID: <20250508143818.2574558-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508143818.2574558-1-goran.radni@gmail.com>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 2/4] dt-bindings: arm: stm32: Document
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

VGhpcyBjb21taXQgZG9jdW1lbnRzIHVsdHJhLWZseS1zYmMgZGV2aWNldHJlZSBiaW5kaW5nIGJh
c2VkIG9uClNUTTMyTVAxNTcgU29DLgoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEdvcmFuIFJhxJFlbm92acSHIDxnb3Jhbi5yYWRu
aUBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9z
dG0zMi9zdG0zMi55YW1sIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3Rt
MzIvc3RtMzIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3Rt
MzIvc3RtMzIueWFtbAppbmRleCA1ZmVlMmYzOGZmMjUuLjY1YzRkY2RiZGYxZCAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIu
eWFtbApAQCAtMTg0LDYgKzE4NCwxMSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgIC0gY29uc3Q6
IHBoeXRlYyxwaHljb3JlLXN0bTMybXAxNTdjLXNvbQogICAgICAgICAgIC0gY29uc3Q6IHN0LHN0
bTMybXAxNTcKIAorICAgICAgLSBkZXNjcmlwdGlvbjogVWx0cmF0cm9uaWsgU1RNMzJNUDEgU0JD
IGJhc2VkIEJvYXJkcworICAgICAgICBpdGVtczoKKyAgICAgICAgICAtIGNvbnN0OiB1bHRyYXRy
b25payxzdG0zMm1wMTU3Yy11bHRyYS1mbHktc2JjCisgICAgICAgICAgLSBjb25zdDogc3Qsc3Rt
MzJtcDE1NworCiAgICAgICAtIGRlc2NyaXB0aW9uOiBTVCBTVE0zMk1QMjU3IGJhc2VkIEJvYXJk
cwogICAgICAgICBpdGVtczoKICAgICAgICAgICAtIGVudW06Ci0tIAoyLjQzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
