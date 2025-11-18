Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C97F5C6A6EF
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 16:55:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 525FBC62D44;
	Tue, 18 Nov 2025 15:55:29 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37F9BC628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 15:09:01 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42b39d51dcfso3153356f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763478541; x=1764083341;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
 b=dRvD4e5+X2PYRhy11hvy3dQB84Vkx9nicD+CsX37zhwnoBU8Ltgt6dtkkyMzjwxys6
 Qc7FLdtnWHHsbdtiMpNkNB2ZbGFv51+SD2h5ibSRp6TIo/2LGzTz5c6+4g7MfNjw8/1+
 bubyTULz9xeJzY3mFtPCgMzn1cfMTFGjZWtcE+xc3mQLHaZBZPRKoHt3H+SuSKYul5qq
 7nKTceviu1FECfgAYBRh8mCIhBIbWl5uOCZz3a6hhUaRD/8thJ8t/0PRFaUQUSv2ceaI
 XaCYG6SaN0btw7GVlPltjOswvUtKEM+Ym2hV8etFbRFo0tDZjyLuNChlOnSogsDX7ewn
 Px4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478541; x=1764083341;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
 b=NIkyZ8v9tvC+3IKjdbXazd6Rc23WzVWa304Ii1QZaqUqZRRlmU8szi9toEMzLXGg75
 gl5ebZ2JSpt0H/CkxAvDn7Vb9IPRKbx0G0GrZ0bVq4t3bzT44BEdKUseRxKaykPqdCXu
 b8MI6Wd7KqACehQKiSevrbrdsxFRFy5Z0y+FoESLbrKl9XgSaTL8XZO1tSo9AczTO7QE
 GUumkrROpM/Dwk0DLHY3d2ppr9c6fOL/7ViavSl4CCnrzfXMwPFUQwYNC+R7uUdxblqK
 RbuYmDyO+9EvuIU/zzUsoM3ammgi2hwC9C2X8B1xr+WMVXnNQWHpArJYy0Tzj9t7gRTw
 4Nvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvHKRRQw1XPCtAkIfPCH/YADCYRjeDDXrXvqhI8gWnD0ZNQ3Z0d0J+RzdQBQWVhxqOMtedMUKN4xEg7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzWWMnS0VqeiNqWnFYkYcqiVI6EXr/w/uLi+r+UNSfexGRP7KIZ
 FZgAdXz/cEm0WspmSglKqaRUFJ3DkPfkRNEsL4QvLAsk8kFHQNqRcOa7
X-Gm-Gg: ASbGncuvlyAElbLRsEYVh0kJ6X3DtapLYk9pIZOhZgWbzDK7DCtQ3Qx0AUU8rOWn9R9
 P9zZdOFzoAUvNr9feMTIEnXWCm+itcNsYc4Ng8R3LpQRsjY1dp//K29uxgFvf7YaNEB85jjZkIf
 0U+8eXYlHtwijhOlyNXtZlDjvV0T0DdstYjY2ZKlvQK2LeBJyj9C6CPRB7z2hP7LxF6E/n/WVpo
 7S/cqZH/9dzsW5W61DtPkZ0CBw5hDdvpL3nplpXbqfcwCIM1Ar5jVOTN7cyXkz0UOF9zCD7N/bL
 /W6FL4BA4v38Si2aTv1SFIVKslpeBI4JRodyMHyk3ETBIFwE+Hjk9TtHFVsMSmmT8bUEiV/KBb+
 qbr+1l0e+hYmSzScDQU7/f9PSu3nPiE8Ajhmec/rFZ6JdHUIpq/MyX7vUMnyzDQIbFaMba0Fbgd
 rTGtJXPFxnv9iu+7yE9arak+mBfUsw+/1TFvHxxdaRGMA6ESMkWjcw2oItZngnnKH3ElQ=
X-Google-Smtp-Source: AGHT+IEav3zLRv8xfizJMoA6AzANIil30gdXqV2ruo4JHsyCzceH+zoUGEb+0IQGqWiBDCnkBR0TuA==
X-Received: by 2002:a05:6000:2083:b0:42b:3867:b39c with SMTP id
 ffacd0b85a97d-42b593745c4mr15995888f8f.34.1763478540535; 
 Tue, 18 Nov 2025 07:09:00 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net.
 [2a02:842a:9b20:d01:432b:dab:f195:2b25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f174afsm31825235f8f.33.2025.11.18.07.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:09:00 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:08:00 +0100
MIME-Version: 1.0
Message-Id: <20251118-b4-ddr-bindings-v9-4-a033ac5144da@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 4/7] dt-binding: memory: add DDR4 channel
	compatible
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
QWRkIGluIHRoZSBtZW1vcnkgY2hhbm5lbCBiaW5kaW5nIHRoZSBERFI0IGNvbXBhdGlibGUgdG8g
c3VwcG9ydCBERFI0Cm1lbW9yeSBjaGFubmVsLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUg
R29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgpSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUg
R29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVsLnlhbWwgICB8IDEwICsrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVk
ZWMsc2RyYW0tY2hhbm5lbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tY2hhbm5lbC55YW1sCmluZGV4IDk4
OTJkYTUyMGZlNC4uODY2YWY0MGI2NTRkIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxzZHJhbS1jaGFubmVs
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9kZHIvamVkZWMsc2RyYW0tY2hhbm5lbC55YW1sCkBAIC0xOSw2ICsxOSw3IEBAIG1h
aW50YWluZXJzOgogcHJvcGVydGllczoKICAgY29tcGF0aWJsZToKICAgICBlbnVtOgorICAgICAg
LSBqZWRlYyxkZHI0LWNoYW5uZWwKICAgICAgIC0gamVkZWMsbHBkZHIyLWNoYW5uZWwKICAgICAg
IC0gamVkZWMsbHBkZHIzLWNoYW5uZWwKICAgICAgIC0gamVkZWMsbHBkZHI0LWNoYW5uZWwKQEAg
LTYxLDYgKzYyLDE1IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgICAgLSByZWcKIAogYWxsT2Y6
CisgIC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAgICAg
ICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IGplZGVjLGRkcjQtY2hhbm5lbAorICAg
IHRoZW46CisgICAgICBwYXR0ZXJuUHJvcGVydGllczoKKyAgICAgICAgIl5yYW5rQFswLTldKyQi
OgorICAgICAgICAgICRyZWY6IC9zY2hlbWFzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMs
ZGRyNC55YW1sIwogICAtIGlmOgogICAgICAgcHJvcGVydGllczoKICAgICAgICAgY29tcGF0aWJs
ZToKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
