Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D6A6429DD
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 14:52:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B77BC65E62;
	Mon,  5 Dec 2022 13:52:11 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62484C6507A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 13:52:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h12so18630739wrv.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 05:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=hU8awQZE7orgladXdlo0GTxR4zpxwbwcESgIpxJ13kM=;
 b=W3u+C+W4iy5BKYadzGKEwrhnX+WHxjNavB8D/PC0lF1Fg8Pe/ekhb2jrUSCOQBbdxx
 8N2KRN/GPH3DObr5sim0ov12JwqPrWTJ1o3lzijoudRm1w8LQ45gAXxVBQHn5mnT9oTf
 OAE1WebEs4Pv5KCp7lu0pAgvuoaQ6FUeIN/KOIIuR+80p/Exr625rhjENGDee28wLqy1
 Hm3kWYHWdA7ZYksYwPb0aDiA7Q6eQ9wwdFw0jH4N2LruSG//NsoWgDUVA0wMSSstGuhk
 UVywvmbJ6IMMhvdWY7hKXisfrNCOLpkC3SVBPV6u/z26MHkxZHbGqwfmSFB18vTnhgFw
 PCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hU8awQZE7orgladXdlo0GTxR4zpxwbwcESgIpxJ13kM=;
 b=AIHJGr8FtOJmFtyPVJc+3KhI+B1rJaHJ8kFkmqQOBX42/bQ92rkPYCGN4CP8nStWZF
 dWYBjRYKpKLOOJTiH7cQ8hccUxyc9kmelxgQ9T1rd5r2ITXLFhGVg0psVh/IiYCzhrx0
 UokukeGwz89BYHiwu+zW6K0KTKwIL+4FKjHf1OxGHzPoVLUvErjBbiYxT4jZKgYL2oi6
 j1BfZY2Jb05zb5jbcHMvCKK2M9AEnJ2yoR6zujWeggjofuO5RBvFuieBrwNSJ+jMe3I8
 bmbQ1EkrjDorzVHllOQVV9PvCMw4k2yowwLnDXRWafUrKPdP+6lEDEoPOF6mTjo0J1oX
 x/6w==
X-Gm-Message-State: ANoB5pnHrV3pbUKMsar8cFf2zX3FPE2M1lXfF3RHcRZ7v3UZqITrtIOX
 IoT8AdaCThIg3+DoANNZG3rJ5g==
X-Google-Smtp-Source: AA0mqf4zO/xd3fS5xAzDq3lcKBOsM7eSke1rV0b1O0YU+j5ch0a7K+qqm+Ozk8+g6W3Ara2pPKMung==
X-Received: by 2002:adf:ea8f:0:b0:242:5afd:bc5d with SMTP id
 s15-20020adfea8f000000b002425afdbc5dmr4459827wrm.305.1670248328876; 
 Mon, 05 Dec 2022 05:52:08 -0800 (PST)
Received: from predatorhelios.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 05:52:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com, linux-gpio@vger.kernel.org
Date: Mon,  5 Dec 2022 14:51:55 +0100
Message-Id: <20221205135158.1842465-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH v4 0/3] Remove the pins-are-numbered DT
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

RHVyaW5nIHRoZSByZXZpZXcgb2YgbXkgTVQ4MzY1IHN1cHBvcnQgcGF0Y2hzZXQKKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzIwMjIxMTE3MjEwMzU2LjMxNzg1NzgtMS1i
ZXJvQGJheWxpYnJlLmNvbS8pLAp0aGUgaXNzdWUgb2YgdGhlICJwaW5zLWFyZS1udW1iZXJlZCIg
RGV2aWNlVHJlZSBwcm9wZXJ0eSBoYXMgY29tZSB1cC4KClRoaXMgcHJvcGVydHkgaXMgdW5pcXVl
IHRvIE1lZGlhdGVrIE1UNjV4eCBhbmQgU1RNMzIgcGluY3RybHMsIGFuZApkb2Vzbid0IHNlZW0g
dG8gc2VydmUgYW55IHB1cnBvc2UgKGJvdGggdGhlIE1lZGlhdGVrIGFuZCBTVE0zMiBkcml2ZXJz
CnNpbXBseSByZWZ1c2UgdG8gZGVhbCB3aXRoIGEgZGV2aWNlIHVubGVzcyBwaW5zLWFyZS1udW1i
ZXJlZCBpcyBzZXQgdG8KdHJ1ZSkuCgpUaGVyZSBpcyBubyBvdGhlciB1c2Ugb2YgdGhpcyBwcm9w
ZXJ0eSBpbiB0aGUga2VybmVsIG9yIGluIG90aGVyIHByb2plY3RzCnVzaW5nIERldmljZVRyZWVz
IChjaGVja2VkIHUtYm9vdCBhbmQgRnJlZUJTRCAtLSBpbiBib3RoIG9mIHRob3NlLCB0aGUKZmxh
ZyBpcyBwcmVzZW50IGluIE1lZGlhdGVrIGFuZCBTVE0gZGV2aWNldHJlZXMsIGJ1dCBub3QgdXNl
ZCBhbnl3aGVyZSkuCgpUaGVyZSBpcyBhbHNvIG5vIGtub3duIHVzZSBpbiB1c2Vyc3BhY2UgKGlu
IGZhY3QsIGEgdXNlcmxhbmQgYXBwbGljYXRpb24KcmVseWluZyBvbiB0aGUgcHJvcGVydHkgd291
bGQgYmUgYnJva2VuIGJlY2F1c2UgaXQgd291bGQgZ2V0IHRydWUgb24KYW55IE1lZGlhdGVrIG9y
IFNUTSBjaGlwc2V0IGFuZCBmYWxzZSBvbiBhbGwgb3RoZXJzLCBldmVuIHRob3VnaCBvdGhlcgpj
aGlwc2V0cyB1c2UgbnVtYmVyZWQgcGlucykuCgpUaGlzIHBhdGNoc2V0IHJlbW92ZXMgYWxsIHVz
ZXMgb2YgcGlucy1hcmUtbnVtYmVyZWQgYW5kIG1hcmtzIHRoZQpwcm9wZXJ0eSBhcyBkZXByZWNh
dGVkLgoKdjQ6CiAgLSBUaGUgZ2VuZXJpYyBwaW5jdHJsIHJlbGF0ZWQgcGF0Y2hlcyBhcmUgbm93
IGluIHRoZSBwaW5jdHJsIHRyZWUKICAgIGZvciB2Ni4yIC0gcmVtb3ZlIHRoZW0gYW5kIHJlcG9z
dCB0aGUgcmVtYWluaW5nIGJpdHMgb2YgdGhlIHBhdGNoCiAgICBzZXQuIE5vIG90aGVyIGNoYW5n
ZXMuCgp2MzoKICAtIE5vIGZ1bmN0aW9uYWwgY2hhbmdlczsgYWRkIHJlY2VudCBSZXZpZXdlZC1C
eXMgYW5kIEFja2VkLUJ5cywKICAgIGFkZCBsaW51eC1ncGlvIHRvIENjCgp2MjoKICAtIERlcHJl
Y2F0ZSB0aGUgcHJvcGVydHkgaW5zdGVhZCBvZiByZW1vdmluZyBpdCBjb21wbGV0ZWx5IGZyb20K
ICAgIHNjaGVtYXMKICAtIHNxdWFzaCBzb21lIHJlbGF0ZWQgY29tbWl0cwoKQmVybmhhcmQgUm9z
ZW5rcsOkbnplciAoMyk6CiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IFJlbW92ZSBwaW5zLWFyZS1u
dW1iZXJlZCBwcm9wZXJ0eQogIEFSTTogZHRzOiBtZWRpYXRlazogUmVtb3ZlIHBpbnMtYXJlLW51
bWJlcmVkIHByb3BlcnR5CiAgQVJNOiBkdHM6IHN0bTMyOiBSZW1vdmUgdGhlIHBpbnMtYXJlLW51
bWJlcmVkIHByb3BlcnR5CgogYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0c2kgICAgICAgICAg
ICAgICAgfCAxIC0KIGFyY2gvYXJtL2Jvb3QvZHRzL210NzYyMy5kdHNpICAgICAgICAgICAgICAg
IHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9tdDgxMzUuZHRzaSAgICAgICAgICAgICAgICB8IDEg
LQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kgICAgICAgfCAxIC0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpICAgICAgIHwgMSAtCiBhcmNoL2Fy
bS9ib290L2R0cy9zdG0zMmg3NDMuZHRzaSAgICAgICAgICAgICB8IDEgLQogYXJjaC9hcm0vYm9v
dC9kdHMvc3RtMzJtcDEzMS5kdHNpICAgICAgICAgICAgfCAxIC0KIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTEuZHRzaSAgICAgICAgICAgIHwgMiAtLQogYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDI3MTJlLmR0c2kgICAgfCAxIC0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTY3LmR0c2kgICAgIHwgMSAtCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE3My1lbG0uZHRzaSB8IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMu
ZHRzaSAgICAgfCAxIC0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4NTE2LmR0c2kg
ICAgIHwgMSAtCiAxMyBmaWxlcyBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKCi0tIAoyLjM4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
