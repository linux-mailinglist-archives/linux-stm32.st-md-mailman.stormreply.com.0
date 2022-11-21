Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09E631A99
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD0E9C65E4A;
	Mon, 21 Nov 2022 07:49:13 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86173C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:08 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id ft34so25267485ejc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9HDlc1+/DcvW68foCbGqR2wdeh+cpwxu/S6MfsBu13E=;
 b=xj9EM3zYkhGTbbAM9JInZawShpTSctQotBDNSW7ItekWMTZ9U8sy5oyMxzTcnR1Agb
 N5tEpEdJ4ODHdzHq0tvCg58Sv7C9uDZQPYaRcR0+xtfXY3teMyYoousQsqclTigemrCt
 6uUN3w4Ly3Vd7Q+9xL2WaVTIV6087sIBE1Ua9/jl/wQOAOVikUARmkF4IxH2XWBW+dGQ
 CXOhZgodqE7BTE0M9T2LIHqbOupjNELdLmRu6aGvSvS3lzTdEzhGRTBZUrNNosn6zdek
 Q5BC1l/a/1jl9f/UmIbAm87IIw9EipXGqszyOlw3xvBeXY2K7cMpQs5DQJ1JNHRlvzXd
 nOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HDlc1+/DcvW68foCbGqR2wdeh+cpwxu/S6MfsBu13E=;
 b=eA7q92x9W/CCKCPD0/rNeLw3hLoZVHjCu7l3wtByPgXMe04vhf11kXJoNf8WO5Qs/5
 nPLNKCq5qRM4FOWS0v7t6P8Dj21cuwL7f+FC08QwZp17/lSOLOJLNFAymuivBoSC4SI5
 zrVw9OW9096N7MBUsfhKVge2269AR+lKUT2CApgvgJ8dK5tAvmqNZXb78UbVER3pkK1g
 bfE81DnyVD1FDy7pRnTte/KDrNb+qfV5Q/cRM2JktgCDUqiOALcSY/kv/z37CxL40lXT
 BOekIiFYjrhSvXuLbkl3WyF+IfwQNWAd2mOiz/LufwLdbN6iKSiseTvJgJ8rEDNj0gKo
 PDkw==
X-Gm-Message-State: ANoB5pnci5EvwmcO2JBth66K6cAitz14I1QV7+F+n4XJ8SOj7iW9URwc
 SJfZdWwSR4ow5jE54G57lABqUQ==
X-Google-Smtp-Source: AA0mqf45mD5kj3zujPnEWLxQ5XlNTIKeH3Fdr1qXO7/VsrpRiIZY3/v2O8M++mNoqX30x8LccvSTMg==
X-Received: by 2002:a17:906:4a55:b0:7ad:9ada:79c6 with SMTP id
 a21-20020a1709064a5500b007ad9ada79c6mr13827861ejv.86.1668995708222; 
 Sun, 20 Nov 2022 17:55:08 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:44 +0100
Message-Id: <20221121015451.2471196-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/9] pinctrl: stm32: Remove check for
	pins-are-numbered
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

UmVtb3ZlIHRoZSBjaGVjayBmb3IgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkCkRl
dmljZVRyZWUgcHJvcGVydHkKClNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIg
PGJlcm9AYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0
bTMyLmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jIGIvZHJpdmVycy9waW5j
dHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYwppbmRleCBjYzk0NzJiMjg0MDQ3Li4xY2RkY2E1MDZh
ZDdlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jCisr
KyBiL2RyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLmMKQEAgLTE0OTksMTEgKzE0
OTksNiBAQCBpbnQgc3RtMzJfcGN0bF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCWlmICghbWF0Y2hfZGF0YSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlpZiAoIWRldmljZV9w
cm9wZXJ0eV9wcmVzZW50KGRldiwgInBpbnMtYXJlLW51bWJlcmVkIikpIHsKLQkJZGV2X2Vycihk
ZXYsICJvbmx5IHN1cHBvcnQgcGlucy1hcmUtbnVtYmVyZWQgZm9ybWF0XG4iKTsKLQkJcmV0dXJu
IC1FSU5WQUw7Ci0JfQotCiAJcGN0bCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqcGN0bCks
IEdGUF9LRVJORUwpOwogCWlmICghcGN0bCkKIAkJcmV0dXJuIC1FTk9NRU07Ci0tIAoyLjM4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
