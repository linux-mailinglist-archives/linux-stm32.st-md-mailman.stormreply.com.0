Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC93632BFA
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 19:21:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FCDEC64104;
	Mon, 21 Nov 2022 18:21:33 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A7AC03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 18:21:32 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id g10so11314001plo.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 10:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8w9f4y377QtdcrkQmSKVz9YndndMyGver3VZ27R7CKA=;
 b=3omtfVMBlHwiBWSEOLuxgQqnH3bzQTxnJNc1CqHj7505Mu9sQWMu+R+dNeviBUmYON
 Nrf8mMt8T1phKqn9bnrQ8wX/SZjaMtN9aW+sqrjVXk89gHEZaLF65G5zzK2Sv1FMckQH
 bS5TNztm10AdS2d2Nz90rX0XPsE5YItnVVEOOdwnVoDy4Jm+JQDKmrIkt6A/5v14qzvM
 yyIy4/6Bs5e3cdN4m/UmybN1YXi/kUBQ7Nwl/FYRdfIjb+/1Iz3iHv0HiApd3FBpx6QI
 5ZRSNdtulQGLkZdjFQx+gvExfnafWI7bJ4nco2qjdNPx7ThYKfeph9DpZbWv6h1AjhF0
 qpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8w9f4y377QtdcrkQmSKVz9YndndMyGver3VZ27R7CKA=;
 b=gKHBmJNpSmR0N5NYHzIW1mRazwb/mBZwSGsc97USSPP3hGuDzAywdkl4Y9h3v3MsLe
 i8UBYSFzELEQbwVSDAqQvutUlObUixhpNz192q/DN0a2l/db2UDG1aPWIk9ZaUTnyHN2
 yrdpUYnc1gM9bDuIkKRMEhQaztdodqXLbkvFdOgOVse8GPrZVbNwlqcxmbjB50ri75ob
 rZAd55GJV1+bJIpKdg8JMihC4i0L9t75LVswQzhxUp/9GEYr8LRclUoodgU+BhW94EAZ
 aN3eOaVv4SViFicCAdIAkxLddtiUmDagTYaklwHCQdARSKSn34TMhCohWpB5DHOK5CoV
 5ReA==
X-Gm-Message-State: ANoB5pmKQhkwjG9rYqZabsb6g+UOHg0q9JiePdFCMn7UVnHu7G2a42hG
 4CEL+X/cbL4d3/JcWo+YN4XqhA==
X-Google-Smtp-Source: AA0mqf6lZH/t4A6UhS6locXOZ/QDeHJNF0k/f2M6v6NCSZSVyFx7Q5/JiZKp4LAXjmm2O30PPiKTmw==
X-Received: by 2002:a17:902:7d94:b0:188:f0e1:ef42 with SMTP id
 a20-20020a1709027d9400b00188f0e1ef42mr2923518plm.166.1669054891238; 
 Mon, 21 Nov 2022 10:21:31 -0800 (PST)
Received: from localhost ([75.172.139.56]) by smtp.gmail.com with ESMTPSA id
 e1-20020aa79801000000b0056bb4bbfb9bsm5335744pfl.95.2022.11.21.10.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 10:21:30 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20221121015451.2471196-7-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-7-bero@baylibre.com>
Date: Mon, 21 Nov 2022 10:21:30 -0800
Message-ID: <7hpmdg88yd.fsf@baylibre.com>
MIME-Version: 1.0
Cc: krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/9] ARM: dts: mediatek: Remove
	pins-are-numbered property
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

QmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+IHdyaXRlczoKCj4gUmVt
b3ZlIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tCj4gTWVk
aWF0ZWsgQVJNIERldmljZVRyZWVzCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmty
w6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KCkFja2VkLWJ5OiBLZXZpbiBIaWxtYW4gPGtoaWxt
YW5AYmF5bGlicmUuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
