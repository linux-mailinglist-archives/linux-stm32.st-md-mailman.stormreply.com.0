Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8A1C1D98A
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 23:38:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3B15C62D5E;
	Wed, 29 Oct 2025 22:38:15 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82760C62D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 22:38:14 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-592f5736693so388735e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761777494; x=1762382294;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzhhJeyhuNotVzEFbkuilK+xDg5eMa2kqkHmG2gliAs=;
 b=e48w/LqGH9JbD96DDwQrF+Q8OTzYnDHRPW71PeX3uDdNn4ZuXQaNyMOUaycNQFQvtp
 7mwns7qdDA/k/1ZooAwwn4h1bfnyLB3QeS/33tGGJH0mPQoz0wybtmN5aApz1/LY3+/X
 0e8NSR5qNIZyn1izWIWc54O/TAOL0H2t1qlrjCFc+ZkMbhdRjvt0zJn3NNiGojqCfx1n
 tPPfZdgq+uiMKGIv0b3Uy23dVorCzAtmgT8MOXRG6yDGtOc5XgijVOW2C9CivFzz6qw/
 hnHqT4ibBU+vHthf538/ipe6lyDHZGszgZExXVKVF+2Jsuk9i+oFdyF8zy+179DGz/5f
 NFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761777494; x=1762382294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LzhhJeyhuNotVzEFbkuilK+xDg5eMa2kqkHmG2gliAs=;
 b=KXBUsQ+bDehK77hmHYdnS0J80nUMEdSImf02f+TKdH1uKekc8p9aBubriL+mlFdvko
 ixiHQasfDOkd+7wYONUgh/Lj56Vr2mmtX66qsod4dx9lo+k5j0G/ktgV+SPEJ4nLD4EM
 o/6LWUJJ96BZDLQcim46ysSvQxqScSF3IIwD1771QIxDOSMNSwRkub+zhiqLNvTagRDX
 O0mv0qLQHyb+f3Ln6mk8SLoC1WkUVIz9pywgfcedQZDI8JFq/AoAxU7/Met0XSklzY+7
 dEmSo8tdmeLHs59aQHq1vvGwfDQMd5aYuwlscgFZkIVyz5UsBj7VR21T6fCzwOpxSnsn
 aZ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd9yVjtCCbfh7WQ8WekoYeMkscn5bSZJhR7oYbBlWiNxwp/BYktrFxQ213v57klTJWMOwxL+t27wrrcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxB9ZgW+qEbj8WxoA+kmzTFEO7yA/5SFlTGqlj5VOjWQBKhMSDH
 UkgtE1xQHkXiqLllSxomlCKTrdy3DDDG1JJqrfcD220N7I3PMVHnlo++q9djuM02GpVRopB5+RU
 CXYvUOpo3lXdORVkMssUwc+TIHLssew407S26kFX59w==
X-Gm-Gg: ASbGnctVs5uEGb3ITn7A3TuD1Hd2J6Dc/NgI9TlK10jnSk0U4lCC1DlrD0HTjuUUZVP
 xTOcfzZh0Wgi0GnKBGt3lNAnqufmXBF6bpidqSoasrzzvsIbhI//jO4D89MjEU7I/VoHWyyS0Yw
 bMqZxbJBCWbXCrCXCP7pgeM1jC3KKgh4ftx8ysX2ZWm2/srLxsOuigQDVCzFx1KqN76hst0ZPKl
 uNEsgDc98XGbRgVC+c9NwxiuhOnpYmodBWpTTMBAPGFcjDy1KsNmF/+qOA/iKJXdq0zxoM=
X-Google-Smtp-Source: AGHT+IGSUDEU3GIah9012vj+4Pg6s5GLROpJXSNa8R5tFKJQLl26wMkX/AWwD8Tr3hAmRNfydWUkSQRxKrXdGT5PldQ=
X-Received: by 2002:a05:6512:3c96:b0:58b:8f:2cf3 with SMTP id
 2adb3069b0e04-594128696femr1551857e87.21.1761777493571; Wed, 29 Oct 2025
 15:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251029014252.178-1-vulab@iscas.ac.cn>
In-Reply-To: <20251029014252.178-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 23:38:01 +0100
X-Gm-Features: AWmQ_bkwwJG8Z6hmew0Xb94qZ2C3iHp-j72hqofQeN8YiL8UtJjm3k_2tYVG6MQ
Message-ID: <CACRpkdanWwXSAu4oH9LnnTJ0mxB+7sorUKj_juFrRebhdL1WKQ@mail.gmail.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: fix hwspinlock resource
	leak in probe function
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

T24gV2VkLCBPY3QgMjksIDIwMjUgYXQgMjo0M+KAr0FNIEhhb3RpYW4gWmhhbmcgPHZ1bGFiQGlz
Y2FzLmFjLmNuPiB3cm90ZToKCj4gSW4gc3RtMzJfcGN0bF9wcm9iZSgpLCBod3NwaW5fbG9ja19y
ZXF1ZXN0X3NwZWNpZmljKCkgaXMgY2FsbGVkIHRvCj4gcmVxdWVzdCBhIGh3c3BpbmxvY2ssIGJ1
dCB0aGUgYWNxdWlyZWQgbG9jayBpcyBub3QgZnJlZWQgb24gbXVsdGlwbGUKPiBlcnJvciBwYXRo
cyBhZnRlciB0aGlzIGNhbGwuIFRoaXMgY2F1c2VzIHJlc291cmNlIGxlYWthZ2Ugd2hlbiB0aGUK
PiBmdW5jdGlvbiBmYWlscyB0byBpbml0aWFsaXplIHByb3Blcmx5Lgo+Cj4gVXNlIGRldm1faHdz
cGluX2xvY2tfcmVxdWVzdF9zcGVjaWZpYygpIGluc3RlYWQgb2YKPiBod3NwaW5fbG9ja19yZXF1
ZXN0X3NwZWNpZmljKCkgdG8gYXV0b21hdGljYWxseSBtYW5hZ2UgdGhlIGh3c3BpbmxvY2sKPiBy
ZXNvdXJjZSBsaWZlY3ljbGUuCj4KPiBGaXhlczogOTdjZmI2Y2QzNGYyICgicGluY3RybDogc3Rt
MzI6IHByb3RlY3QgY29uZmlndXJhdGlvbiByZWdpc3RlcnMgd2l0aCBhIGh3c3BpbmxvY2siKQo+
IFNpZ25lZC1vZmYtYnk6IEhhb3RpYW4gWmhhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgoKUGF0Y2gg
YXBwbGllZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
