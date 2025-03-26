Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1EA713FA
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 10:44:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10971C78F73;
	Wed, 26 Mar 2025 09:44:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DAD1C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 09:44:36 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so8895105a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742982276; x=1743587076;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhF6R6vwCAIFOORSKjXUEJg8tNapknbDuMgOuxMh77A=;
 b=XNAgI+9qmWdY78/wv8mD6PU3m/wzWILsAokJTsXkVayK6uejWIJ96l7cm2EiWszB5b
 Fp3o36vBtbHofxqYLMrVDO7+s71O9FgZTBNpEjAGJj15qcgjvGsbSGdA7Z6C7zVstYMX
 4+nYk+kLGdiygom/Mj+wm+u8Q14ALluzSx/p183Z6mJrDgHKbnsPJBiFFM6rCBoJSBFC
 oYe3iSg8vjYU5s4QJKhz6s9/PNmpe1sFB/NJw9+PR+HKOWK6Gu0ScZRH/BMr93W39iYo
 7weTDeZ1o4oZk9tXfVI0kTzwxpp1RTgxo0kjYjVTX2fN+5hZ/pU3SjhLaA0b2EUyzO6U
 upLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742982276; x=1743587076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhF6R6vwCAIFOORSKjXUEJg8tNapknbDuMgOuxMh77A=;
 b=Ghc/65OvL6p+1N+A5Hwg45tflPrDTPMxS/B//tElYc0OZ0MwTgwNqZF792+huabTl7
 346M45UaZ/xr25P0nLJVl9Vn9cqV+2J5jUe2Pofu1aF2vldz3luSlepMiwyzP5+Y6XZa
 HcYqzItVGXTtDNZzu5Hgs6gFRTXTlTkrM6UhQrXAuOqizJL/mDXx3mPuTtzXigbOxnty
 9Gaf8fVhF8yGdE873b/g/triWqe1YPkhjwLIhS4APt0nlU9PCu6hVjfRB+44hB6IFlFB
 WSjYmd+Z5wdon7w9Awbx+Njv13GfwPKlhPXcjdzU3xxJnRfXCE6HRnG3kBjklg/ES6GB
 E3HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcKgwdzGYMqYtp+pJ5gn50+J1iUdWXCEfsvUJJM1B+rDzV3L82hfn+kf8+VvN/OZMuN5B/tYEtV07KLA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxC8+c7sdjnP3XxTEDhhNHT2y2aq+QbFcuaw7XBBK4GXWfs6nnr
 51U+wuOn547a4h9WgNNClpSQs90qwpNaL2DkvDK6RgOsHaIpJKJI
X-Gm-Gg: ASbGncvO7p4T+0esK7b3jHO/E5nhvXu1sOMJGOBrc1WzLqqacME+1DPwEgm1ynIcgRq
 xV6SQRxakqrisi6dEZ48JFj0HtD0UTTqyIwdsN6PSMVYA09UomWzTeCwKDGpHbsWCSA/WQUcqcm
 qohTDgA/gy6OhQbgfibjSV00jXcosARoAQBWtb4aOZs0ZmbHi+th5hq66xp6VaJ8BrKaDU1rcvk
 2pVAHK8+6CccGf206w38IZuVki46J+vin4FMbg610W7UPvPD4MIREOOOnaek4KguANvm0LMHn6o
 8IOLKWOrAuJwAdfDXDkKOdgOkbMO9kPPieU4c2JX/Lk6Zp4l
X-Google-Smtp-Source: AGHT+IFYQXx/dczxe9yMk/xq+gCXEaSFfjBpLvbptmHL8QgCOEYYRcX3+bVaYHpFvj4ivFc8M3ACMg==
X-Received: by 2002:a05:6402:50d2:b0:5e4:99af:b7c with SMTP id
 4fb4d7f45d1cf-5ebcd426f95mr15941899a12.9.1742982275987; 
 Wed, 26 Mar 2025 02:44:35 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf84600sm9120488a12.19.2025.03.26.02.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 02:44:35 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 26 Mar 2025 10:44:26 +0100
Message-ID: <20250326094429.2397365-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326094429.2397365-1-goran.radni@gmail.com>
References: <20250326094429.2397365-1-goran.radni@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 2/3] dt-bindings: arm: stm32: Document
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
MzIvc3RtMzIueWFtbAppbmRleCBiNmM1NmQ0Y2U2YjkuLmMxY2I1NGZmYjIxMCAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIu
eWFtbApAQCAtMTc1LDYgKzE3NSwxMSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgIC0gY29uc3Q6
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
