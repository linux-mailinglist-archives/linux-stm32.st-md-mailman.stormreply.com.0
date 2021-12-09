Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F746F25B
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Dec 2021 18:42:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73B7BC5F1EA;
	Thu,  9 Dec 2021 17:42:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A998BCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Dec 2021 17:42:50 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so4729589wmd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Dec 2021 09:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qqK9+xQ9ZbtBELQAT0EXm6TWiIt+xXrrL7fOffh/Mk=;
 b=swxVRUXimw2W0nql09GwFWrzunSGiTpyC0gIyxyFYN1Dsy7gNq0X9WTTLgh1neZcAH
 nCIp+9n2+NnAzbizapTLdyXdPG5ce9MoU1foUmZ78cIFbjc79sHxnAm/FdcRjXPJeyC2
 DstUVGwBpbzLQ3xHjAPNFYmqEfE7n6kszR2ht/lK3d+vScLmwSmN/hkeAOQqPUGuXr1Z
 1JSlb472zlPiw1XUQfrdTYUfcHyFDhiOSVNNxLLIBA4HDPicyTHdZesrRrQLIzvAZo45
 ne1Tc+AgGVWd2+aZ6kYaWZyIey1BDbrsekOUdcn0cHfMeAj3C9A+disu6qQixs77gWOv
 IF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qqK9+xQ9ZbtBELQAT0EXm6TWiIt+xXrrL7fOffh/Mk=;
 b=LLj+iERNegwUGBWXIFKl8fkhyAVJ8d6ro/JKmPD/Qo9+dFAhqfvsgRGhqd2RUmfXxh
 OU7ITwHF33ZeCfA7apql8Se0zzi1/bLb17uW8W4BsSs72HDJ09AP6t/Xjhnm5DF0ZHdN
 bjGqaB0104Vz5OgPtWbkvoqWU60wRKYnPxIEh6BlbEBMNh90k1xgcqqcEI+InqvKBTIZ
 sOLBjkPzNlpL5IaLuu18Suhv7jkxOYRS41jHMNsv37/Dqbi5brskwBrPtSE7k/2Anyty
 J9zLAAvINu5oRogRBgs6BMS+pPG7Q4uwXqF6XsUPKHagdAn3h6yiiS7NsQa8A1pysFYT
 EaaA==
X-Gm-Message-State: AOAM531lNvUY0ZEXjULUTq/t59g92FDC6Y/thcguSwRnfHhR8h09rxrr
 FRwpxGbIuTXBF3zRX6Ms1mYk1w==
X-Google-Smtp-Source: ABdhPJwCv+vjl+oQsw4enZewe0eQ0mMvqsRmRIJqksr/2N4WKMc8gdbQp9dYk7yOUjrpWsd/GzTzyg==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr8895294wmi.134.1639071770161; 
 Thu, 09 Dec 2021 09:42:50 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id w4sm308666wrs.88.2021.12.09.09.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 09:42:49 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: gregkh@linuxfoundation.org
Date: Thu,  9 Dec 2021 17:42:35 +0000
Message-Id: <20211209174235.14049-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211209174235.14049-1-srinivas.kandagatla@linaro.org>
References: <20211209174235.14049-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Thierry Reding <treding@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [Linux-stm32] [PATCH 4/4] dt-bindings: nvmem: Add missing 'reg'
	property
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

RnJvbTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCldpdGggJ3VuZXZhbHVhdGVkUHJv
cGVydGllcycgc3VwcG9ydCBpbXBsZW1lbnRlZCwgdGhlIGZvbGxvd2luZyB3YXJuaW5ncwphcmUg
Z2VuZXJhdGVkIGluIHRoZSBudm1lbSBleGFtcGxlczoKCkRvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9zdCxzdG0zMi1yb21lbS5leGFtcGxlLmR0LnlhbWw6IGVmdXNlQDFm
ZmY3ODAwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ3JlZycgd2Fz
IHVuZXhwZWN0ZWQpCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9ybWVt
LmV4YW1wbGUuZHQueWFtbDogbnZyYW1AMTAwMDAwMDA6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMg
YXJlIG5vdCBhbGxvd2VkICgncmVnJyB3YXMgdW5leHBlY3RlZCkKRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL252bWVtL2JyY20sbnZyYW0uZXhhbXBsZS5kdC55YW1sOiBudnJhbUAx
ZWZmMDAwMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdyZWcnIHdh
cyB1bmV4cGVjdGVkKQoKQWRkIHRoZSBtaXNzaW5nICdyZWcnIHByb3BlcnR5IGRlZmluaXRpb24u
CgpDYzogU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3Jn
PgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgpDYzogQWxl
eGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KQ2M6IFNhZW56IEp1bGllbm5lIDxuc2FlbnpqdWxp
ZW5uZUBzdXNlLmRlPgpDYzogRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5z
dC5jb20+CkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCkNjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFi
cmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgpSZXZpZXdlZC1ieTogVGhpZXJyeSBSZWRpbmcgPHRy
ZWRpbmdAbnZpZGlhLmNvbT4KU2lnbmVkLW9mZi1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jp
bml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9icmNtLG52cmFtLnlhbWwgICAgIHwgMyArKysKIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9ybWVtLnlhbWwgICAgICAgICAgIHwgMyArKysK
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9zdCxzdG0zMi1yb21lbS55
YW1sIHwgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2JyY20sbnZyYW0ueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9icmNtLG52cmFtLnlh
bWwKaW5kZXggNThmZjZiMGJkYjFhLi44YzNmMGNkMjI4MjEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9icmNtLG52cmFtLnlhbWwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2JyY20sbnZyYW0ueWFtbApAQCAt
MjQsNiArMjQsOSBAQCBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgogICAgIGNvbnN0OiBicmNt
LG52cmFtCiAKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKIHVuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UKIAogZXhhbXBsZXM6CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vcm1lbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL3JtZW0ueWFtbAppbmRleCAxZDg1YTBhMzA4NDYuLmE0YTc1NWRjZmM0MyAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3JtZW0u
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vcm1lbS55
YW1sCkBAIC0xOSw2ICsxOSw5IEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgLSByYXNwYmVycnlw
aSxib290bG9hZGVyLWNvbmZpZwogICAgICAgLSBjb25zdDogbnZtZW0tcm1lbQogCisgIHJlZzoK
KyAgICBtYXhJdGVtczogMQorCiAgIG5vLW1hcDoKICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy9mbGFnCiAgICAgZGVzY3JpcHRpb246CmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0ueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9zdCxzdG0zMi1yb21lbS55
YW1sCmluZGV4IGE0OGM4ZmE1NmJjZS4uNDQ4YTI2NzhkYzYyIDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0ueWFtbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0u
eWFtbApAQCAtMjQsNiArMjQsOSBAQCBwcm9wZXJ0aWVzOgogICAgICAgLSBzdCxzdG0zMmY0LW90
cAogICAgICAgLSBzdCxzdG0zMm1wMTUtYnNlYwogCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQor
CiBwYXR0ZXJuUHJvcGVydGllczoKICAgIl4uKkBbMC05YS1mXSskIjoKICAgICB0eXBlOiBvYmpl
Y3QKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
