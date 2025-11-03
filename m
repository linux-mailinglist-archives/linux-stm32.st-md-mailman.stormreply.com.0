Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC77C2D6B7
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 18:19:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C22C2C62D32;
	Mon,  3 Nov 2025 17:19:11 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CACC4C5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 17:19:10 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3717780ea70so51279401fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762190350; x=1762795150;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UfJm/0K/IK+TFySYahec6wkbZ/mH3F/d8fqO8oHuTx0=;
 b=I1jnWS0dZSpBpTGSFKLfsn1u1RC4LQmwWr3geLryqdlcz5THYG4OW3n6rPT6lzkadg
 tOBkjK7LngR0pNQC0lTg1s7bCIqcNEzHKBxk22k5e+Y8Iqcyn4rZ7A4rpWRml4PhHE5y
 rAu273GS/LiZdrWMBD0vMb0+n0ZFyjaTuyJ1KZndzMJlB2IuOjjqUfSzx3OJG308a0Cq
 fOEz4pM8ggXShbYYI7RkgMY8hQ8y2Bxm/lqkuWIdnGo913MbaiTi8JEZf8qkUZzYC+rG
 UwjhgiJWOFrNEOR6ohG1jLpvxh/pNmOynjiCOCbe5GCXArYArcIQJpWf3CVATGcqpHlC
 LmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762190350; x=1762795150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UfJm/0K/IK+TFySYahec6wkbZ/mH3F/d8fqO8oHuTx0=;
 b=xJ7NQT1nT6U9fv6b6Emn1yQlbjqnW3uX3J8tBZfKubtCkEON2hsPOzV13+WSRH39/e
 LgB8D7nRxywjD2B8b1wJo6Tj67rFUt7X9ZGlvUoS9q58I0uJCbGqWAcDpnjXFEl5gp5A
 fmDIR+A5kFe7CxBHXHaI26VMNHzReUIBiM++WkFokYKLqy+9PsVJ6VFvbc569Jg08rx1
 NS/jqP7PzMnpzLUJMCRztrMK9dO368IYPTLzFIalhqLc+EWi9tT40wbxuWRiAg1epVFn
 /p3W7XWNNl7+mbKxQPK/yguv1Z/RRNs+9v1STKq41tg/MIYmihH+Gjt3+WlQHUVVtHTD
 VTyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt6AHEzkyZSBcVraJKNd6vhFEuyS54HpRTFzohUzJnLNnabT84hAaY4fKRcDCocnro5QrSp9Wiv6psdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWnT6z+1x+2wwbklJDArnLqe7eAP59az3q1zYJB7GHeAbjsbVM
 aXHpWvO9vPNlFKMpt+S4MOsyYLsvvlZ0O1mJpxDDII+tFfemzVOssIbX4MKMl84HDEx/qzr9Drk
 jcu92TwvIzOnWPUdLrhNTfVXQ6oa4SJ8nsWLAt4tU0Q==
X-Gm-Gg: ASbGncsSZGvlhsCV+frDJgm8c4QD/UaEa3yuzycZlOISE5crSSozLJSPGZ433mY0Ydc
 4DxMgkYX5VPZzkqxsPIStdeqS5lKMVIS2gYyHw85b3eHB0b1OX1jxtjKt7EOp9gubGrv5nTfj5y
 hgp900M3RNzVNqB4f0XefXeE2v/fIzWFn/iBQ/ZLmNH5jKNMKgu4M2CufpEc7/eUGi5+E4Lfuba
 QKZi8JRBuwlZ62rz4ozc2OZef4B4yGn8vyDkyNII8amSTEhk1cWx5ie595D5e+qxZeeJwekv1nl
 m4yk632WVUPfjwCYqXfeFx/lP8M=
X-Google-Smtp-Source: AGHT+IGyFfYznWtlzK+1dscg69T3Xfj2HXDxx8skS1npII5281AQkb1LuDH6QTamNOOg1pxOfm3nDu+XQdPeX9ecORA=
X-Received: by 2002:a2e:a546:0:b0:37a:2c57:579b with SMTP id
 38308e7fff4ca-37a2c57588dmr22924761fa.7.1762190349831; Mon, 03 Nov 2025
 09:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
 <20251027-qcom-sa8255p-emac-v3-1-75767b9230ab@linaro.org>
 <20251028-wonderful-orchid-emu-25cd02@kuoka>
In-Reply-To: <20251028-wonderful-orchid-emu-25cd02@kuoka>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 18:18:58 +0100
X-Gm-Features: AWmQ_bkcWkBdzid9BUjDSUzrVzjV4d_nhcsRcb-w2ymlO8H-z-8gOwTsZnb5fIM
Message-ID: <CAMRc=Mce_1O5fRn8xCu5GRc_hFUtMgotx7ZK1EHF4xZMoWsawA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 1/8] dt-bindings: net: qcom: document
 the ethqos device for SCMI-based systems
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

T24gVHVlLCBPY3QgMjgsIDIwMjUgYXQgOToxNuKAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+ICsKPiA+ICsgIHBvd2VyLWRvbWFpbnM6Cj4gPiAr
ICAgIG1pbkl0ZW1zOiAzCj4KPiBtYXhJdGVtcyBpbnN0ZWFkCj4KPiBCdXQgdGhlIG90aGVyIHBy
b2JsZW0gaXMgdGhhdCBpdCBpcyBjb25mbGljdGluZyB3aXRoIHNucHMsZHdtYWMueWFtbAo+IHdo
aWNoIHNheXMgbWF4IDEgaXMgYWxsb3dlZC4gWW91IG5lZWQgdG8gZml4IHRoYXQsIGFsb25nIHdp
dGgKPiByZXN0cmljdGluZyBvdGhlciB1c2VycyBvZiB0aGF0IHNoYXJlZCBzY2hlbWEgdG8gbWF4
SXRlbXM6IDEuCj4KCkp1c3QgdG8gYmUgY2xlYXI6IHNucHMsZHdtYWMueWFtbCBzaG91bGQgc3Rh
eSBhczoKCnBvd2VyLWRvbWFpbnM6CiAgbWluSXRlbXM6IDEKICBtYXhJdGVtczogMwoKQnV0IGFs
bCBiaW5kaW5ncyByZWZlcmVuY2luZyBpdCwgZXhjZXB0IHRoZSBuZXcgb25lLCBzaG91bGQgbm93
IGdhaW46Cgpwb3dlci1kb21haW5zOgogIG1heEl0ZW1zOiAxCgo+Cj4gU2hvdWxkbid0IHBoeXMg
YmUgcmVxdWlyZWQ/IEhvdyBkZXZpY2UgY2FuIHdvcmsgc29tZXRpbWVzIHdpdGhvdXQgaXRzCj4g
cGh5Pwo+CgpBY3R1YWxseSBJIHdpbGwgZHJvcCBwaHlzLCB0aGUgc2VyZGVzIFBIWSBpcyBtYW5h
Z2VkIGJ5IFNDTUkuCgpCYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
