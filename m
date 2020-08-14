Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3D2448E9
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Aug 2020 13:40:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F42FC36B26;
	Fri, 14 Aug 2020 11:40:12 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E09CFC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Aug 2020 11:40:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f12so8044434wru.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Aug 2020 04:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Db0/XegKOvDRgZ77poJrd7OK4ys0Vj7FE0VspABfIc=;
 b=c3oazDInGW7hjrBIsl+zkAlUf5XdaIpPfFz3xERqVymAskbwi16DPAktyD53jA3b66
 /VOUQgRQ6z4vBQOCkHrfsvmGX69PCEy7jMg5cYGTAN/BKeMSg1aFyX6u1JgYhY/wofRP
 AjLQ2/OgQciCs1lQvFlym5gCyLc5UElaSt+nCxIIt0GrxXFIHEO19882b+DHL24RcpNs
 PlLlaG8OWAcbN1yTgVP4CABv2rSyGGMMwqzTawWPQTJwLSIGKGm+asMO19fjIT2BXKjP
 eaWwSPDyMvcL9trE/s3Hp9dQl/io/SIae6+GP2aGpowdN/RiSUqjTfZ4re4x9uCX+ZVq
 wnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Db0/XegKOvDRgZ77poJrd7OK4ys0Vj7FE0VspABfIc=;
 b=qDe9ylFkWDC1SiHiriWc7sE9p6LqSbaJcBWWNfMNUwx/Y8x4tMDV3zZ/Eq85e7oshc
 3eEeQQsSTToMhqMiQI7nN7x0l4j7fRHfc8NmOEYhbSwjiDvOVtvJp4NgQMuSbVWYMKPm
 UYI3WakFE7mbA2mJ1AuPG5BioHxhNHgr3klyDh2jMKiD2DtODvBJYRaUnCwEenJX2u2y
 6QkeaeriZjqvMmShzCwvjpwZK2lL4uoi/NInUWbvfWWTKqmyyF54IvgBQKJO860L4VCF
 A/7GeK3xsO26PE5tmn8v3pnW2+azzp9Kt+0T+hFMfb0+JKWycbl86vXaId9hTQNhmqDB
 Ah0w==
X-Gm-Message-State: AOAM531gEP76IuicO2r+i5Fr0wLPuQo+zj6RsBfwQ3JwZGRLbnRCJCwg
 Ckczfe1hcUyMCq797rvH40vmeQ==
X-Google-Smtp-Source: ABdhPJy2TwazZiHw6gMHYPOVlPScYRlKeMGm2BnOOf+FwnWaIAiGUOP2+xsysshx48ue6Viw0BB5gA==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr2302330wrm.382.1597405210454; 
 Fri, 14 Aug 2020 04:40:10 -0700 (PDT)
Received: from dell.default ([95.149.164.62])
 by smtp.gmail.com with ESMTPSA id 32sm16409129wrh.18.2020.08.14.04.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 04:40:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: davem@davemloft.net,
	kuba@kernel.org
Date: Fri, 14 Aug 2020 12:39:22 +0100
Message-Id: <20200814113933.1903438-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200814113933.1903438-1-lee.jones@linaro.org>
References: <20200814113933.1903438-1-lee.jones@linaro.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 19/30] net: fddi: skfp: fplustm: Remove
	seemingly unused variable 'ID_sccs'
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

VGhpcyB2YXJpYWJsZSBpcyBwcmVzZW50IGluIG1hbnkgc291cmNlIGZpbGVzIGFuZCBoYXMgbm90
IGJlZW4gdXNlZAphbnl3aGVyZSAoYXQgbGVhc3QgaW50ZXJuYWxseSkgc2luY2UgaXQgd2FzIGlu
dHJvZHVjZWQuCgpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhz
KToKCiBkcml2ZXJzL25ldC9mZGRpL3NrZnAvZnBsdXN0bS5jOjI1OjE5OiB3YXJuaW5nOiDigJhJ
RF9zY2Nz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1d
CgpDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+CkNjOiBKYWt1YiBL
aWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4u
c3RtMzJAZ21haWwuY29tPgpDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBz
dC5jb20+CkNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9uZXQvZmRkaS9za2ZwL2ZwbHVzdG0uYyB8IDQgLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvZmRkaS9za2ZwL2ZwbHVzdG0uYyBiL2RyaXZlcnMvbmV0L2ZkZGkvc2tmcC9mcGx1c3RtLmMK
aW5kZXggMDI5NjZkMTQxOTQ4Zi4uNGNiYjE0NWM3NGFiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
ZXQvZmRkaS9za2ZwL2ZwbHVzdG0uYworKysgYi9kcml2ZXJzL25ldC9mZGRpL3NrZnAvZnBsdXN0
bS5jCkBAIC0yMSwxMCArMjEsNiBAQAogI2luY2x1ZGUgPGxpbnV4L2JpdHJldi5oPgogI2luY2x1
ZGUgPGxpbnV4L2V0aGVyZGV2aWNlLmg+CiAKLSNpZm5kZWYJbGludAotc3RhdGljIGNvbnN0IGNo
YXIgSURfc2Njc1tdID0gIkAoIylmcGx1c3RtLmMJMS4zMiA5OS8wMi8yMyAoQykgU0sgIiA7Ci0j
ZW5kaWYKLQogI2lmbmRlZiBVTlVTRUQKICNpZmRlZiAgbGludAogI2RlZmluZSBVTlVTRUQoeCkJ
KHgpID0gKHgpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
